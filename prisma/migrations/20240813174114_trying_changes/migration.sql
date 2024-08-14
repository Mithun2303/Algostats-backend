/*
  Warnings:

  - You are about to drop the `_ProblemToUser` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_ProblemToUser" DROP CONSTRAINT "_ProblemToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_ProblemToUser" DROP CONSTRAINT "_ProblemToUser_B_fkey";

-- DropTable
DROP TABLE "_ProblemToUser";
