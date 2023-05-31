/*
  Warnings:

  - The primary key for the `pengguna` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE `pengguna` DROP PRIMARY KEY,
    MODIFY `id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- CreateTable
CREATE TABLE `UrusPendaftaran` (
    `id` VARCHAR(191) NOT NULL,
    `pendaftaranLulus` BOOLEAN NOT NULL,
    `pendaftarId` VARCHAR(191) NOT NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `UrusPendaftaran` ADD CONSTRAINT `UrusPendaftaran_pendaftarId_fkey` FOREIGN KEY (`pendaftarId`) REFERENCES `Pengguna`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
