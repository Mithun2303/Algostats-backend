import { Injectable } from '@nestjs/common';
import { HttpService } from '@nestjs/axios';
import { firstValueFrom } from 'rxjs';
@Injectable()
export default class Leetcode {
    constructor(
    private readonly httpService: HttpService,
    ){}

    async getUserProblems(id:string){
        
          const limit = 100;
          const query = `
            query recentAcSubmissions($username: String!, $limit: Int!) {
              recentAcSubmissionList(username: $username, limit: $limit) {
                id
                title
                titleSlug
                timestamp
              }
            }
          `;
      
          const variables = {
            username: id,
            limit: limit,
          };
      
          const url = 'https://leetcode.com/graphql/';
      
        //   try {
        //     let result = await firstValueFrom(
        //       this.httpService.post(url, {
        //         query: query,
        //         variables: variables,
        //       }),
        //     )
        //       let list = result.data.data.recentAcSubmissionList;
        //       list = list.filter(
        //         (element) => element.timestamp < user.lastBackupTime,
        //       );
      
        //       list.forEach(async(element) => {
        //         console.log(await this.problemDetails(element.titleSlug))
        //       });
            
        //     // console.log(await this.problemDetails(result[0].titleSlug));
        //     return result;
        //   } catch (error) {
        //     throw new HttpException(
        //       'Error fetching data from third party GraphQL API',
        //       HttpStatus.INTERNAL_SERVER_ERROR,
        //     );
        //   }
    }


}
