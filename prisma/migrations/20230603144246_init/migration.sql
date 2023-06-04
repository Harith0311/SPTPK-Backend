/*
  Warnings:

  - You are about to drop the column `kehadiranId` on the `daftarkanak` table. All the data in the column will be lost.
  - You are about to drop the column `tarikh` on the `kehadiran` table. All the data in the column will be lost.
  - Added the required column `kanakId` to the `Kehadiran` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `daftarkanak` DROP FOREIGN KEY `DaftarKanak_kehadiranId_fkey`;

-- AlterTable
ALTER TABLE `daftarkanak` DROP COLUMN `kehadiranId`;

-- AlterTable
ALTER TABLE `kehadiran` DROP COLUMN `tarikh`,
    ADD COLUMN `kanakId` VARCHAR(191) NOT NULL;

-- AddForeignKey
ALTER TABLE `Kehadiran` ADD CONSTRAINT `Kehadiran_kanakId_fkey` FOREIGN KEY (`kanakId`) REFERENCES `DaftarKanak`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
