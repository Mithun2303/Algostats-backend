import { Expose } from "class-transformer";
import { IsNotEmpty } from "class-validator";

export class classLeaderboardResponseDto{
    @Expose()
    @IsNotEmpty()
    id:string
    @Expose()
    @IsNotEmpty()
    name:string
    @Expose()
    @IsNotEmpty()
    score:number

    constructor(partial:Partial<classLeaderboardResponseDto>|Partial<Event>){
        Object.assign(this,partial)
    }
}

export class streamLeaderboardResponseDto{
    @Expose()
    @IsNotEmpty()
    id:string

    @Expose()
    @IsNotEmpty()
    score:number

    @Expose()
    batch:number

    @Expose()
    name:string

    constructor(partial:Partial<streamLeaderboardResponseDto>|Partial<Event>){
        Object.assign(this,partial)
    }
}

export class batchLeaderboardResponseDto{
    @Expose()
    @IsNotEmpty()
    id:string

    @Expose()
    @IsNotEmpty()
    score:number

    @Expose()
    stream:string

    @Expose()
    name:string
    
    constructor(partial:Partial<batchLeaderboardResponseDto>|Partial<Event>){
        Object.assign(this,partial)
    }
}

export class LeaderboardResponseDto{
    @Expose()
    @IsNotEmpty()
    id:string

    @Expose()
    @IsNotEmpty()
    score:number

    @Expose()
    name:string

    @Expose()
    stream:string
    
    @Expose()
    batch:number 
    
    @Expose()
    class:string
    
    constructor(partial:Partial<batchLeaderboardResponseDto>|Partial<Event>){
        Object.assign(this,partial)
    }
}