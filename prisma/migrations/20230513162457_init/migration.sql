-- CreateTable
CREATE TABLE `Pengguna` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `role` VARCHAR(191) NOT NULL,
    `nama` VARCHAR(191) NOT NULL,
    `emel` VARCHAR(191) NOT NULL,
    `noKP` INTEGER NOT NULL,
    `kataLaluan` VARCHAR(191) NOT NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
