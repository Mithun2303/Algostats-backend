/*
  Warnings:

  - You are about to drop the column `description` on the `Problem_Schema` table. All the data in the column will be lost.
  - Added the required column `difficulty` to the `Problem_Schema` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Difficulty" AS ENUM ('EASY', 'MEDIUM', 'HARD', 'EXPERT');

-- AlterTable
ALTER TABLE "Problem_Schema" DROP COLUMN "description",
ADD COLUMN     "difficulty" "Difficulty" NOT NULL;
