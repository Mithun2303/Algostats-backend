import { Expose } from "class-transformer";
import { IsDate, IsNotEmpty, IsString } from "class-validator";

export class TaskCreateDto{
    @IsNotEmpty()
    count:number

    @IsString()
    class:string

    @IsString()
    batch:string

    @IsString()
    stream:string

    @IsDate()
    deadline:Date
}

export class TaskCreateResponseDto{
    @Expose()
    @IsString()
    id:string

    @Expose()
    @IsString()
    count:number

    @Expose()
    @IsString()
    deadline:Date

    @Expose()
    @IsString()
    class:string

    @Expose()
    @IsString()
    stream:string

    @Expose()
    @IsString()
    batch:string


 constructor(value:Partial<TaskCreateResponseDto>|Partial<Event>){
    Object.assign(this,value)   
 }
}

