/*
  Warnings:

  - Added the required column `kodPengesahan` to the `Pengguna` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `pengguna` ADD COLUMN `kodPengesahan` VARCHAR(191) NOT NULL;
