/*
  Warnings:

  - You are about to drop the `Class_Schema` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Problem_Schema` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Topic_Problem_Schema` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Topic_Schema` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User_Problem_Schema` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User_Schema` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_Problem_SchemaToTopic_Schema` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_Problem_SchemaToUser_Schema` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Task" DROP CONSTRAINT "Task_assignedBy_fkey";

-- DropForeignKey
ALTER TABLE "Task" DROP CONSTRAINT "Task_id_fkey";

-- DropForeignKey
ALTER TABLE "Topic_Problem_Schema" DROP CONSTRAINT "Topic_Problem_Schema_problemId_fkey";

-- DropForeignKey
ALTER TABLE "Topic_Problem_Schema" DROP CONSTRAINT "Topic_Problem_Schema_topicId_fkey";

-- DropForeignKey
ALTER TABLE "User_Problem_Schema" DROP CONSTRAINT "User_Problem_Schema_problemId_fkey";

-- DropForeignKey
ALTER TABLE "User_Problem_Schema" DROP CONSTRAINT "User_Problem_Schema_userId_fkey";

-- DropForeignKey
ALTER TABLE "User_Schema" DROP CONSTRAINT "User_Schema_classId_fkey";

-- DropForeignKey
ALTER TABLE "_Problem_SchemaToTopic_Schema" DROP CONSTRAINT "_Problem_SchemaToTopic_Schema_A_fkey";

-- DropForeignKey
ALTER TABLE "_Problem_SchemaToTopic_Schema" DROP CONSTRAINT "_Problem_SchemaToTopic_Schema_B_fkey";

-- DropForeignKey
ALTER TABLE "_Problem_SchemaToUser_Schema" DROP CONSTRAINT "_Problem_SchemaToUser_Schema_A_fkey";

-- DropForeignKey
ALTER TABLE "_Problem_SchemaToUser_Schema" DROP CONSTRAINT "_Problem_SchemaToUser_Schema_B_fkey";

-- DropTable
DROP TABLE "Class_Schema";

-- DropTable
DROP TABLE "Problem_Schema";

-- DropTable
DROP TABLE "Topic_Problem_Schema";

-- DropTable
DROP TABLE "Topic_Schema";

-- DropTable
DROP TABLE "User_Problem_Schema";

-- DropTable
DROP TABLE "User_Schema";

-- DropTable
DROP TABLE "_Problem_SchemaToTopic_Schema";

-- DropTable
DROP TABLE "_Problem_SchemaToUser_Schema";

-- DropEnum
DROP TYPE "Roles";

-- CreateTable
CREATE TABLE "Class" (
    "id" TEXT NOT NULL,
    "stream" TEXT NOT NULL,
    "batch" INTEGER NOT NULL,

    CONSTRAINT "Class_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Users" (
    "id" TEXT NOT NULL,
    "email" TEXT,
    "classId" TEXT NOT NULL,
    "role" TEXT NOT NULL DEFAULT 'STUDENT',
    "linkedIn" TEXT,
    "github" TEXT,
    "leetcode" TEXT,
    "lastBackupTime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Problem" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "platform" TEXT NOT NULL DEFAULT 'Leetcode',
    "points" INTEGER NOT NULL,
    "difficulty" "Difficulty" NOT NULL,

    CONSTRAINT "Problem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_Problem" (
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "problemId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "User_Problem_pkey" PRIMARY KEY ("problemId","userId")
);

-- CreateTable
CREATE TABLE "Topic" (
    "id" TEXT NOT NULL,

    CONSTRAINT "Topic_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Topic_Problem" (
    "topicId" TEXT NOT NULL,
    "problemId" TEXT NOT NULL,

    CONSTRAINT "Topic_Problem_pkey" PRIMARY KEY ("topicId","problemId")
);

-- CreateTable
CREATE TABLE "_ProblemToTopic" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_ProblemToUsers" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ProblemToTopic_AB_unique" ON "_ProblemToTopic"("A", "B");

-- CreateIndex
CREATE INDEX "_ProblemToTopic_B_index" ON "_ProblemToTopic"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ProblemToUsers_AB_unique" ON "_ProblemToUsers"("A", "B");

-- CreateIndex
CREATE INDEX "_ProblemToUsers_B_index" ON "_ProblemToUsers"("B");

-- AddForeignKey
ALTER TABLE "Users" ADD CONSTRAINT "Users_classId_fkey" FOREIGN KEY ("classId") REFERENCES "Class"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Problem" ADD CONSTRAINT "User_Problem_problemId_fkey" FOREIGN KEY ("problemId") REFERENCES "Problem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Problem" ADD CONSTRAINT "User_Problem_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Topic_Problem" ADD CONSTRAINT "Topic_Problem_topicId_fkey" FOREIGN KEY ("topicId") REFERENCES "Topic"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Topic_Problem" ADD CONSTRAINT "Topic_Problem_problemId_fkey" FOREIGN KEY ("problemId") REFERENCES "Problem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_assignedBy_fkey" FOREIGN KEY ("assignedBy") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_id_fkey" FOREIGN KEY ("id") REFERENCES "Class"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProblemToTopic" ADD CONSTRAINT "_ProblemToTopic_A_fkey" FOREIGN KEY ("A") REFERENCES "Problem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProblemToTopic" ADD CONSTRAINT "_ProblemToTopic_B_fkey" FOREIGN KEY ("B") REFERENCES "Topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProblemToUsers" ADD CONSTRAINT "_ProblemToUsers_A_fkey" FOREIGN KEY ("A") REFERENCES "Problem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProblemToUsers" ADD CONSTRAINT "_ProblemToUsers_B_fkey" FOREIGN KEY ("B") REFERENCES "Users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
