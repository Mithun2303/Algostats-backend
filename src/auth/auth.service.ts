import { Injectable, UnauthorizedException } from '@nestjs/common';
import {
  UpdatePasswordDto,
  UpdatePrDto,
  UserLoginDto,
  UserLoginResponseDto,
  UserRegisterDto,
  UserRegisterSingleDto,
  UserResponseDto,
} from './dto/auth.dto';
import * as bcrypt from 'bcrypt';
import { DatabaseService } from 'src/database/database.service';
import { JwtService } from '@nestjs/jwt';
import { UserRole } from 'src/user/dto/user.dto';
import AllowedRoles from 'src/user/decorator/allowedRoles.decorator';
import { Prisma } from '@prisma/client';

@Injectable()
export class AuthService {
  constructor(
    private readonly databaseService: DatabaseService,
    private readonly jwt: JwtService,
  ) {}
  async verifyToken(token: string) {
    return this.jwt.verifyAsync(token);
  }

  async generateToken(email: string) {
    return this.jwt.signAsync({ email });
  }

  async login(data: UserLoginDto) {
    const user = await this.databaseService.user.findUnique({
      where: {
        email: data.email,
      },
    });
    if (!user)
      throw new UnauthorizedException('Incorrect username or password');
    const pwd_bool = await bcrypt.compare(data.password, user.password);
    if (!pwd_bool)
      throw new UnauthorizedException('Incorrect username or password');
    const token = await this.generateToken(user.email);
    return new UserLoginResponseDto({ ...user, token });
  }

  async register(
    data: UserRegisterSingleDto,
  ): Promise<Partial<UserResponseDto>> {
    const hash = await bcrypt.hash(data.id, 10);

    return await this.databaseService.user.create({
      data: {
        id: data.id,
        email: data.email,
        role: data.role,
        stream: data.stream,
        batch: data.batch,
        password: hash,
        class: data.class,
      },
    });
  }

  async registerBulk(data: UserRegisterDto[], user: UserResponseDto) {
    try {
      console.log(data, user);
      const request = await data.map(async (elt) => {
        const id = elt.id;
        const email = elt.email;
        const password = await bcrypt.hash(elt.id, 10);
        const leetcode = elt.leetcode;
        const classId = user.class;
        const stream = user.stream;
        const batch = user.batch;
        return { id, email, password, leetcode, class: classId, stream, batch };
      });
      const response = await Promise.all(request);
      console.log(response);
      await this.databaseService.user.createMany({
        data: response,
        skipDuplicates: true,
      });
    } catch (error) {
      console.log(error);
    }
  }

  async updatePr(body) {
    console.log(body);
    return await this.databaseService.user.updateMany({
      where: {
        id: {
          in: body.prs,
        },
        class: body.class,
        batch: body.batch,
        stream: body.stream,
      },
      data: {
        role: UserRole.PLACEMENT_REPRESENTATIVE,
      },
    });
  }

  async changePassword(obj:UpdatePasswordDto) {
    return this.databaseService.user.update({
      where:{
        id:obj.id
      },
      data:{
        password:await bcrypt.hash(obj.password,10)
      }
    })
  }
}
