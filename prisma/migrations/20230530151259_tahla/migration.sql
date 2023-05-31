/*
  Warnings:

  - You are about to drop the column `pendaftarId` on the `uruspendaftaran` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `uruspendaftaran` DROP FOREIGN KEY `UrusPendaftaran_pendaftarId_fkey`;

-- AlterTable
ALTER TABLE `uruspendaftaran` DROP COLUMN `pendaftarId`;
