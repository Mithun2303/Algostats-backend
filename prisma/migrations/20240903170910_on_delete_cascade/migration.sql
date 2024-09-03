/*
  Warnings:

  - You are about to drop the column `timestamp` on the `Task` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Task` table. All the data in the column will be lost.
  - The primary key for the `User_Task` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Added the required column `name` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Task" DROP CONSTRAINT "Task_userId_fkey";

-- DropForeignKey
ALTER TABLE "User_Task" DROP CONSTRAINT "User_Task_taskId_fkey";

-- DropForeignKey
ALTER TABLE "User_Task" DROP CONSTRAINT "User_Task_userId_fkey";

-- DropIndex
DROP INDEX "Task_assignedById_key";

-- AlterTable
ALTER TABLE "Task" DROP COLUMN "timestamp",
DROP COLUMN "userId";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "User_Task" DROP CONSTRAINT "User_Task_pkey",
ADD CONSTRAINT "User_Task_pkey" PRIMARY KEY ("taskId", "userId", "timestamp");

-- AddForeignKey
ALTER TABLE "User_Task" ADD CONSTRAINT "User_Task_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "Task"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Task" ADD CONSTRAINT "User_Task_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_assignedById_fkey" FOREIGN KEY ("assignedById") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
