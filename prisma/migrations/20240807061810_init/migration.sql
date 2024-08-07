/*
  Warnings:

  - Made the column `role` on table `User_Schema` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "User_Schema" ALTER COLUMN "role" SET NOT NULL,
ALTER COLUMN "role" SET DEFAULT 'STUDENT';
