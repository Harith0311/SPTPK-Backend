/*
  Warnings:

  - Added the required column `alamatKanak` to the `DaftarKanak` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `daftarkanak` ADD COLUMN `alamatKanak` VARCHAR(191) NOT NULL;
