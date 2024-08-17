import { Injectable, UnauthorizedException } from '@nestjs/common';
import {
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
    return this.jwt.signAsync({email});
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

  async register(data: UserRegisterSingleDto): Promise<Partial<UserResponseDto>> {
    const hash = await bcrypt.hash(data.password, 10);
    data.password = hash;
    return await this.databaseService.user.create({
      data,
    });
  }

  async registerBulk(data:UserRegisterDto[],user:UserResponseDto){
      console.log(data,user);
      const request = await data.map(async(elt)=>{
        const id = elt.id;
        const email = elt.email;
        const password =await bcrypt.hash(elt.id,10);
        const leetcode = elt.leetcode;
        const classId = user.class;
        const stream = user.stream;
        const batch = user.batch;
        return {id,email,password,leetcode,class:classId,stream,batch}
      })
      const response = await Promise.all(request);
      console.log(response)
    await this.databaseService.user.createMany({
      data:response
    })
  }

  async updatePr(tutorDet:UserResponseDto,prs:string[]) {
    console.log(tutorDet,prs);
    return await this.databaseService.user.updateMany({
      where:{
        id:{
          in:prs
        },
        class:tutorDet.class,
        batch:tutorDet.batch
      },
      data:{
        role:UserRole.PLACEMENT_REPRESENTATIVE
      }
    })
  }

  findOne(id: number) {
    return `This action returns a #${id} auth`;
  }
}
