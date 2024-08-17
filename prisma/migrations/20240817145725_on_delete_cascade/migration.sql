-- DropForeignKey
ALTER TABLE "User_Task" DROP CONSTRAINT "User_Task_taskId_fkey";

-- DropForeignKey
ALTER TABLE "User_Task" DROP CONSTRAINT "User_Task_userId_fkey";

-- AddForeignKey
ALTER TABLE "User_Task" ADD CONSTRAINT "User_Task_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "Task"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Task" ADD CONSTRAINT "User_Task_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
