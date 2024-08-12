import { Injectable, UnauthorizedException } from '@nestjs/common';
import { UserLoginDto, UserLoginResponseDto, UserRegisterDto, UserResponseDto } from './dto/auth.dto';
import * as bcrypt from 'bcrypt';
import { DatabaseService } from 'src/database/database.service';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class AuthService {
  constructor(
    private readonly databaseService: DatabaseService,
    private readonly jwt: JwtService,
  ) {}
  async verifyToken(token: string) {
    return this.jwt.verifyAsync(token);
  }

  async generateToken(data: UserResponseDto) {
    return this.jwt.signAsync({data});
  }


  async login(data: UserLoginDto) {
    const user = await this.databaseService.user.findUnique({
      where:{
        email:data.email
      }
    });
      if(!user) throw new UnauthorizedException('Incorrect username or password');
      const pwd_bool = await bcrypt.compare(data.password,user.password)
      if(!pwd_bool) throw new UnauthorizedException('Incorrect username or password');
      const token = await this.generateToken(user);
      return  new UserLoginResponseDto({...user,token})
  }


  async register(data: UserRegisterDto): Promise<Partial<UserResponseDto>> {
    const hash = await bcrypt.hash(data.password, 10);
    data.password = hash;
    return await this.databaseService.user.create({
      data,
    });
  }

  findAll() {
    return `This action returns all auth`;
  }

  findOne(id: number) {
    return `This action returns a #${id} auth`;
  }
}
