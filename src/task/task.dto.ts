import {IsString,IsNumber,IsNotEmpty} from 'class-validator';

export class createTaskDto{
    @IsString()
    @IsNotEmpty()
    classId:string;

    @IsString()
    @IsNotEmpty()
    assignedBy:string;

    @IsNumber()
    @IsNotEmpty()
    count:number;
}