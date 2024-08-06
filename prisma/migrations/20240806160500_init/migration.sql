-- CreateEnum
CREATE TYPE "Roles" AS ENUM ('STUDENT', 'PLACEMENT_REPRESENTATIVE', 'TUTOR', 'COURSE_COORDINATOR');

-- CreateTable
CREATE TABLE "Class_Schema" (
    "id" TEXT NOT NULL,

    CONSTRAINT "Class_Schema_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_Schema" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "classId" TEXT NOT NULL,
    "role" "Roles" NOT NULL,
    "linkedIn" TEXT NOT NULL,
    "github" TEXT NOT NULL,
    "leetcode" TEXT NOT NULL,

    CONSTRAINT "User_Schema_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Problem_Schema" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "platform" TEXT NOT NULL DEFAULT 'Leetcode',
    "description" TEXT NOT NULL,

    CONSTRAINT "Problem_Schema_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_Problem_Schema" (
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "problemId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "User_Problem_Schema_pkey" PRIMARY KEY ("problemId","userId")
);

-- CreateTable
CREATE TABLE "Topic_Schema" (
    "id" TEXT NOT NULL,

    CONSTRAINT "Topic_Schema_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Topic_Problem_Schema" (
    "topicId" TEXT NOT NULL,
    "problemId" TEXT NOT NULL,

    CONSTRAINT "Topic_Problem_Schema_pkey" PRIMARY KEY ("topicId","problemId")
);

-- CreateTable
CREATE TABLE "Task" (
    "id" TEXT NOT NULL,
    "classId" TEXT NOT NULL,
    "count" INTEGER NOT NULL,
    "assignedBy" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Task_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_Problem_SchemaToTopic_Schema" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Problem_SchemaToUser_Schema" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_Problem_SchemaToTopic_Schema_AB_unique" ON "_Problem_SchemaToTopic_Schema"("A", "B");

-- CreateIndex
CREATE INDEX "_Problem_SchemaToTopic_Schema_B_index" ON "_Problem_SchemaToTopic_Schema"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Problem_SchemaToUser_Schema_AB_unique" ON "_Problem_SchemaToUser_Schema"("A", "B");

-- CreateIndex
CREATE INDEX "_Problem_SchemaToUser_Schema_B_index" ON "_Problem_SchemaToUser_Schema"("B");

-- AddForeignKey
ALTER TABLE "User_Schema" ADD CONSTRAINT "User_Schema_classId_fkey" FOREIGN KEY ("classId") REFERENCES "Class_Schema"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Problem_Schema" ADD CONSTRAINT "User_Problem_Schema_problemId_fkey" FOREIGN KEY ("problemId") REFERENCES "Problem_Schema"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Problem_Schema" ADD CONSTRAINT "User_Problem_Schema_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User_Schema"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Topic_Problem_Schema" ADD CONSTRAINT "Topic_Problem_Schema_topicId_fkey" FOREIGN KEY ("topicId") REFERENCES "Topic_Schema"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Topic_Problem_Schema" ADD CONSTRAINT "Topic_Problem_Schema_problemId_fkey" FOREIGN KEY ("problemId") REFERENCES "Problem_Schema"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_assignedBy_fkey" FOREIGN KEY ("assignedBy") REFERENCES "User_Schema"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_id_fkey" FOREIGN KEY ("id") REFERENCES "Class_Schema"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Problem_SchemaToTopic_Schema" ADD CONSTRAINT "_Problem_SchemaToTopic_Schema_A_fkey" FOREIGN KEY ("A") REFERENCES "Problem_Schema"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Problem_SchemaToTopic_Schema" ADD CONSTRAINT "_Problem_SchemaToTopic_Schema_B_fkey" FOREIGN KEY ("B") REFERENCES "Topic_Schema"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Problem_SchemaToUser_Schema" ADD CONSTRAINT "_Problem_SchemaToUser_Schema_A_fkey" FOREIGN KEY ("A") REFERENCES "Problem_Schema"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Problem_SchemaToUser_Schema" ADD CONSTRAINT "_Problem_SchemaToUser_Schema_B_fkey" FOREIGN KEY ("B") REFERENCES "User_Schema"("id") ON DELETE CASCADE ON UPDATE CASCADE;
