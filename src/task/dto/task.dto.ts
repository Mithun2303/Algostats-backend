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