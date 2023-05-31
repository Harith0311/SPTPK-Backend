/*
  Warnings:

  - A unique constraint covering the columns `[emel]` on the table `Pengguna` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[noKP]` on the table `Pengguna` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `Pengguna_emel_key` ON `Pengguna`(`emel`);

-- CreateIndex
CREATE UNIQUE INDEX `Pengguna_noKP_key` ON `Pengguna`(`noKP`);
