// {
//     id: '1124206452',
//     title: 'Linked List Cycle',
//     titleSlug: 'linked-list-cycle',
//     timestamp: '1703073697'
//   },

import { IsNotEmpty, IsString } from "class-validator";

export class RecentAcSubmissionList{
    @IsString()
    @IsNotEmpty()
    id:string

    @IsString()
    @IsNotEmpty()
    title:string

    @IsString()
    @IsNotEmpty()
    titleSlug:string
    
    @IsString()
    @IsNotEmpty()
    timeStamp:string
}