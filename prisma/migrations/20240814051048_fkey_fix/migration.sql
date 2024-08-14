/*
  Warnings:

  - You are about to drop the column `updated_at` on the `User_Problem` table. All the data in the column will be lost.
  - You are about to drop the `_ProblemToUser` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_ProblemToUser" DROP CONSTRAINT "_ProblemToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_ProblemToUser" DROP CONSTRAINT "_ProblemToUser_B_fkey";

-- AlterTable
ALTER TABLE "User_Problem" DROP COLUMN "updated_at";

-- DropTable
DROP TABLE "_ProblemToUser";
