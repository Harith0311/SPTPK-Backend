/*
  Warnings:

  - Added the required column `kesukaran` to the `Aktiviti` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tahun` to the `Aktiviti` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `aktiviti` ADD COLUMN `kesukaran` VARCHAR(191) NOT NULL,
    ADD COLUMN `tahun` VARCHAR(191) NOT NULL;
