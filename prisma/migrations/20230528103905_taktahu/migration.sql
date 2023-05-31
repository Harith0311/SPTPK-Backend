/*
  Warnings:

  - You are about to drop the `pendaftaran` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `pendaftaranId` to the `DaftarBapa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pendaftaranId` to the `DaftarIbu` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pendaftaranId` to the `DaftarKanak` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `daftarbapa` ADD COLUMN `pendaftaranId` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `daftaribu` ADD COLUMN `pendaftaranId` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `daftarkanak` ADD COLUMN `pendaftaranId` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `uruspendaftaran` MODIFY `pendaftaranLulus` BOOLEAN NULL;

-- DropTable
DROP TABLE `pendaftaran`;

-- AddForeignKey
ALTER TABLE `DaftarKanak` ADD CONSTRAINT `DaftarKanak_pendaftaranId_fkey` FOREIGN KEY (`pendaftaranId`) REFERENCES `UrusPendaftaran`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DaftarBapa` ADD CONSTRAINT `DaftarBapa_pendaftaranId_fkey` FOREIGN KEY (`pendaftaranId`) REFERENCES `UrusPendaftaran`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DaftarIbu` ADD CONSTRAINT `DaftarIbu_pendaftaranId_fkey` FOREIGN KEY (`pendaftaranId`) REFERENCES `UrusPendaftaran`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
