/*
  Warnings:

  - A unique constraint covering the columns `[pendaftaranId]` on the table `DaftarBapa` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[pendaftaranId]` on the table `DaftarIbu` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[pendaftaranId]` on the table `DaftarKanak` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `DaftarBapa_pendaftaranId_key` ON `DaftarBapa`(`pendaftaranId`);

-- CreateIndex
CREATE UNIQUE INDEX `DaftarIbu_pendaftaranId_key` ON `DaftarIbu`(`pendaftaranId`);

-- CreateIndex
CREATE UNIQUE INDEX `DaftarKanak_pendaftaranId_key` ON `DaftarKanak`(`pendaftaranId`);
