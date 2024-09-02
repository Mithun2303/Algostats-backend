import { Injectable } from "@nestjs/common";
import { DatabaseService } from "src/database/database.service";
import { ProblemService } from "./problem.service";

@Injectable()
export class recetlySolvedService {
  constructor(
    private readonly databaseService: DatabaseService,
    private readonly problemService:ProblemService
  ) {}

    async getrecentlySolved(id:string ,limit : number){

    }


}