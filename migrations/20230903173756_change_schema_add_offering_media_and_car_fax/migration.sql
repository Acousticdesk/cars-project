/*
  Warnings:

  - The primary key for the `Offering` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `authorId` on the `Offering` table. All the data in the column will be lost.
  - You are about to drop the column `content` on the `Offering` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `Offering` table. All the data in the column will be lost.
  - You are about to drop the column `published` on the `Offering` table. All the data in the column will be lost.
  - You are about to drop the column `title` on the `Offering` table. All the data in the column will be lost.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `email` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `User` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[user_email]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `offering_description` to the `Offering` table without a default value. This is not possible if the table is not empty.
  - Added the required column `offering_title` to the `Offering` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updated_at` to the `Offering` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_email` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Offering" DROP CONSTRAINT "Offering_authorId_fkey";

-- DropIndex
DROP INDEX "User_email_key";

-- AlterTable
ALTER TABLE "Offering" DROP CONSTRAINT "Offering_pkey",
DROP COLUMN "authorId",
DROP COLUMN "content",
DROP COLUMN "id",
DROP COLUMN "published",
DROP COLUMN "title",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "offering_description" TEXT NOT NULL,
ADD COLUMN     "offering_id" SERIAL NOT NULL,
ADD COLUMN     "offering_title" TEXT NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "user_id" INTEGER,
ADD CONSTRAINT "Offering_pkey" PRIMARY KEY ("offering_id");

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
DROP COLUMN "email",
DROP COLUMN "id",
DROP COLUMN "name",
ADD COLUMN     "user_email" TEXT NOT NULL,
ADD COLUMN     "user_id" SERIAL NOT NULL,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("user_id");

-- CreateTable
CREATE TABLE "CarFax" (
    "carfax_id" SERIAL NOT NULL,
    "carfax_path" TEXT NOT NULL,

    CONSTRAINT "CarFax_pkey" PRIMARY KEY ("carfax_id")
);

-- CreateTable
CREATE TABLE "OfferingMedia" (
    "offering_media_id" SERIAL NOT NULL,
    "offering_media_path" TEXT NOT NULL,

    CONSTRAINT "OfferingMedia_pkey" PRIMARY KEY ("offering_media_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_user_email_key" ON "User"("user_email");
