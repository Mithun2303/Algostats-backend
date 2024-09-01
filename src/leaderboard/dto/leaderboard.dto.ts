import { Expose } from "class-transformer";
import { IsNotEmpty } from "class-validator";

export class classLeaderboardResponseDto{
    @Expose()
    @IsNotEmpty()
    id:string

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
    stream:string
    
    @Expose()
    batch:number
    
    constructor(partial:Partial<batchLeaderboardResponseDto>|Partial<Event>){
        Object.assign(this,partial)
    }
}