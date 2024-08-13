/*
  Warnings:

  - You are about to drop the column `assignedBy` on the `Task` table. All the data in the column will be lost.
  - You are about to drop the column `classId` on the `Task` table. All the data in the column will be lost.
  - You are about to drop the `Class` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Users` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_ProblemToUsers` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[assignedById]` on the table `Task` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userId` to the `Task` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Task" DROP CONSTRAINT "Task_assignedBy_fkey";

-- DropForeignKey
ALTER TABLE "Task" DROP CONSTRAINT "Task_id_fkey";

-- DropForeignKey
ALTER TABLE "User_Problem" DROP CONSTRAINT "User_Problem_userId_fkey";

-- DropForeignKey
ALTER TABLE "Users" DROP CONSTRAINT "Users_classId_fkey";

-- DropForeignKey
ALTER TABLE "_ProblemToUsers" DROP CONSTRAINT "_ProblemToUsers_A_fkey";

-- DropForeignKey
ALTER TABLE "_ProblemToUsers" DROP CONSTRAINT "_ProblemToUsers_B_fkey";

-- AlterTable
ALTER TABLE "Task" DROP COLUMN "assignedBy",
DROP COLUMN "classId",
ADD COLUMN     "assignedById" TEXT,
ADD COLUMN     "userId" TEXT NOT NULL;

-- DropTable
DROP TABLE "Class";

-- DropTable
DROP TABLE "Users";

-- DropTable
DROP TABLE "_ProblemToUsers";

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" TEXT NOT NULL DEFAULT 'STUDENT',
    "linkedIn" TEXT,
    "github" TEXT,
    "leetcode" TEXT,
    "class" TEXT NOT NULL,
    "stream" TEXT NOT NULL,
    "batch" TEXT NOT NULL,
    "lastBackupTime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_Task" (
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "taskId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_Task_pkey" PRIMARY KEY ("taskId","userId")
);

-- CreateTable
CREATE TABLE "_ProblemToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ProblemToUser_AB_unique" ON "_ProblemToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_ProblemToUser_B_index" ON "_ProblemToUser"("B");

-- CreateIndex
CREATE UNIQUE INDEX "Task_assignedById_key" ON "Task"("assignedById");

-- AddForeignKey
ALTER TABLE "User_Task" ADD CONSTRAINT "User_Task_taskId_fkey" FOREIGN KEY ("taskId") REFERENCES "Task"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Task" ADD CONSTRAINT "User_Task_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Problem" ADD CONSTRAINT "User_Problem_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProblemToUser" ADD CONSTRAINT "_ProblemToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Problem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProblemToUser" ADD CONSTRAINT "_ProblemToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
