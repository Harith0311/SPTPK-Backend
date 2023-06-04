/*
  Warnings:

  - You are about to alter the column `hadir` on the `kehadiran` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `TinyInt`.
  - Added the required column `kehadiranId` to the `DaftarKanak` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `daftarkanak` ADD COLUMN `kehadiranId` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `kehadiran` MODIFY `hadir` BOOLEAN NOT NULL;

-- AddForeignKey
ALTER TABLE `DaftarKanak` ADD CONSTRAINT `DaftarKanak_kehadiranId_fkey` FOREIGN KEY (`kehadiranId`) REFERENCES `Kehadiran`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
