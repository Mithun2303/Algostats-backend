-- CreateTable
CREATE TABLE "Placement_Class" (
    "id" TEXT NOT NULL,
    "classId" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "description" TEXT,
    "created_by" TEXT NOT NULL,

    CONSTRAINT "Placement_Class_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Placement_Class" ADD CONSTRAINT "Placement_Class_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
