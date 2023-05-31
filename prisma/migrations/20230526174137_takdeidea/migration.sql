/*
  Warnings:

  - You are about to drop the column `role` on the `pengguna` table. All the data in the column will be lost.
  - Added the required column `peranan` to the `Pengguna` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `pengguna` DROP COLUMN `role`,
    ADD COLUMN `peranan` VARCHAR(191) NOT NULL;
