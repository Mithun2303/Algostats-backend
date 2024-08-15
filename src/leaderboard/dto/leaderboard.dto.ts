import { Expose } from "@nestjs/class-transformer";
import { isNumber, IsString } from "class-validator";
import { UserProblemResponseDto } from "src/user/dto/user.dto";

export enum UserRole {
    STUDENT='STUDENT',
    PLACEMENT_REPRESENTATIVE='PLACEMENT_REPRESENTATIVE',
    TUTOR='TUTOR',
    COURSE_COORDINATOR='COURSE_COORDINATOR',
    PLACEMENT_COORDINATOR='PLACEMENT_COORDINATOR',
}

export class LeaderboardResponseDto {
    @Expose()
    @IsString()
    userId:string

    @Expose()
    points:number

    constructor(userId: string, points: number) {
        this.userId = userId;
        this.points = points;
    }
}