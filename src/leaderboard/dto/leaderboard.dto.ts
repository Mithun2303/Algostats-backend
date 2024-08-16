import { Expose } from "class-transformer";

export class LeaderboardResponseDto{
    @Expose()
    id:string

    @Expose()
    score:number

    constructor(partial:Partial<LeaderboardResponseDto>|Partial<Event>){
        Object.assign(this,partial)
    }
}