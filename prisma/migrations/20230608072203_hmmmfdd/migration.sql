/*
  Warnings:

  - You are about to drop the column `umur` on the `daftarkanak` table. All the data in the column will be lost.
  - You are about to drop the `kekosongan` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `kelas` to the `AktivitiHariIni` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `aktivitihariini` ADD COLUMN `kelas` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `daftarkanak` DROP COLUMN `umur`;

-- DropTable
DROP TABLE `kekosongan`;
