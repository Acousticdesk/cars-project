/*
  Warnings:

  - You are about to drop the `CarFax` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Offering` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `OfferingMedia` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "CarFax";

-- DropTable
DROP TABLE "Offering";

-- DropTable
DROP TABLE "OfferingMedia";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "user" (
    "user_id" SERIAL NOT NULL,
    "user_email" TEXT NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "offering" (
    "offering_id" SERIAL NOT NULL,
    "offering_title" TEXT NOT NULL,
    "offering_description" TEXT NOT NULL,
    "user_id" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "offering_pkey" PRIMARY KEY ("offering_id")
);

-- CreateTable
CREATE TABLE "carfax" (
    "carfax_id" SERIAL NOT NULL,
    "carfax_path" TEXT NOT NULL,

    CONSTRAINT "carfax_pkey" PRIMARY KEY ("carfax_id")
);

-- CreateTable
CREATE TABLE "offering_media" (
    "offering_media_id" SERIAL NOT NULL,
    "offering_media_path" TEXT NOT NULL,

    CONSTRAINT "offering_media_pkey" PRIMARY KEY ("offering_media_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_user_email_key" ON "user"("user_email");
