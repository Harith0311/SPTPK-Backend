/*
  Warnings:

  - Added the required column `kelas` to the `UrusPendaftaran` table without a default value. This is not possible if the table is not empty.
  - Added the required column `kodPengesahan` to the `UrusPendaftaran` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `daftarkanak` ADD COLUMN `kelas` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `uruspendaftaran` ADD COLUMN `kelas` VARCHAR(191) NOT NULL,
    ADD COLUMN `kodPengesahan` VARCHAR(191) NOT NULL;
