/*
  Warnings:

  - You are about to drop the `Listing` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Listing" DROP CONSTRAINT "Listing_authorId_fkey";

-- DropTable
DROP TABLE "Listing";

-- CreateTable
CREATE TABLE "Offering" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT,
    "published" BOOLEAN DEFAULT false,
    "authorId" INTEGER,

    CONSTRAINT "Offering_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Offering" ADD CONSTRAINT "Offering_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
