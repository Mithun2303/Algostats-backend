-- CreateTable
CREATE TABLE "_ProblemToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ProblemToUser_AB_unique" ON "_ProblemToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_ProblemToUser_B_index" ON "_ProblemToUser"("B");

-- AddForeignKey
ALTER TABLE "_ProblemToUser" ADD CONSTRAINT "_ProblemToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Problem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProblemToUser" ADD CONSTRAINT "_ProblemToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
