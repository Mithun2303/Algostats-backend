import {Module} from '@nestjs/common';
import {TaskController} from './task.controller';
import {TaskService} from './task.service';
import { DatabaseModule } from 'src/database/database.module';
import { UserSchemaModule } from 'src/user_schema/user_schema.module';

@Module({
    imports: [DatabaseModule,UserSchemaModule],
    controllers: [TaskController],
    providers: [TaskService],
})
export class TaskModule{}