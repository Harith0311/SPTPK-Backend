/*
  Warnings:

  - A unique constraint covering the columns `[kodPengesahan]` on the table `Pengguna` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `Pengguna_kodPengesahan_key` ON `Pengguna`(`kodPengesahan`);
