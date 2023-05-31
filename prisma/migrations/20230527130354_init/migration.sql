/*
  Warnings:

  - A unique constraint covering the columns `[noKP]` on the table `DaftarBapa` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[noKP]` on the table `DaftarIbu` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[sijilLahir]` on the table `DaftarKanak` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `nama` to the `DaftarBapa` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nama` to the `DaftarIbu` table without a default value. This is not possible if the table is not empty.
  - Added the required column `namaKanak` to the `DaftarKanak` table without a default value. This is not possible if the table is not empty.
  - Added the required column `umur` to the `DaftarKanak` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `daftarbapa` ADD COLUMN `nama` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `daftaribu` ADD COLUMN `nama` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `daftarkanak` ADD COLUMN `namaKanak` VARCHAR(191) NOT NULL,
    ADD COLUMN `umur` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `DaftarBapa_noKP_key` ON `DaftarBapa`(`noKP`);

-- CreateIndex
CREATE UNIQUE INDEX `DaftarIbu_noKP_key` ON `DaftarIbu`(`noKP`);

-- CreateIndex
CREATE UNIQUE INDEX `DaftarKanak_sijilLahir_key` ON `DaftarKanak`(`sijilLahir`);
