-- DropForeignKey
ALTER TABLE "Topic_Problem" DROP CONSTRAINT "Topic_Problem_topicId_fkey";

-- DropForeignKey
ALTER TABLE "User_Problem" DROP CONSTRAINT "User_Problem_problemId_fkey";

-- DropForeignKey
ALTER TABLE "User_Problem" DROP CONSTRAINT "User_Problem_userId_fkey";

-- AddForeignKey
ALTER TABLE "User_Problem" ADD CONSTRAINT "User_Problem_problemId_fkey" FOREIGN KEY ("problemId") REFERENCES "Problem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Problem" ADD CONSTRAINT "User_Problem_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Topic_Problem" ADD CONSTRAINT "Topic_Problem_topicId_fkey" FOREIGN KEY ("topicId") REFERENCES "Topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;
