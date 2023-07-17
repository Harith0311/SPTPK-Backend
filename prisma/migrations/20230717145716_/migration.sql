-- CreateTable
CREATE TABLE `pengguna` (
    `id` VARCHAR(191) NOT NULL,
    `peranan` VARCHAR(191) NOT NULL,
    `nama` VARCHAR(191) NOT NULL,
    `emel` VARCHAR(191) NOT NULL,
    `noKP` VARCHAR(191) NOT NULL,
    `kataLaluan` VARCHAR(191) NOT NULL,
    `kodPengesahan` VARCHAR(191) NOT NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,

    UNIQUE INDEX `pengguna_emel_key`(`emel`),
    UNIQUE INDEX `pengguna_noKP_key`(`noKP`),
    UNIQUE INDEX `pengguna_kodPengesahan_key`(`kodPengesahan`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `urus_pendaftaran` (
    `id` VARCHAR(191) NOT NULL,
    `pendaftaranLulus` BOOLEAN NULL,
    `kodPengesahan` VARCHAR(191) NULL,
    `kelas` VARCHAR(191) NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `daftar_kanak` (
    `id` VARCHAR(191) NOT NULL,
    `namaKanak` VARCHAR(191) NOT NULL,
    `sijilLahir` VARCHAR(191) NOT NULL,
    `bangsa` VARCHAR(191) NOT NULL,
    `tarikhLahir` VARCHAR(191) NOT NULL,
    `tempatLahir` VARCHAR(191) NOT NULL,
    `jantina` VARCHAR(191) NOT NULL,
    `alamatKanak` VARCHAR(191) NOT NULL,
    `namaPenjaga` VARCHAR(191) NOT NULL,
    `telefonPenjaga` VARCHAR(191) NOT NULL,
    `hubunganPenjaga` VARCHAR(191) NOT NULL,
    `alamatPenjaga` VARCHAR(191) NOT NULL,
    `kelas` VARCHAR(191) NULL,
    `kodPengesahan` VARCHAR(191) NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,
    `pendaftaranId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `daftar_kanak_sijilLahir_key`(`sijilLahir`),
    UNIQUE INDEX `daftar_kanak_pendaftaranId_key`(`pendaftaranId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `daftar_bapa` (
    `id` VARCHAR(191) NOT NULL,
    `nama` VARCHAR(191) NOT NULL,
    `emel` VARCHAR(191) NOT NULL,
    `noKP` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `pekerjaan` VARCHAR(191) NOT NULL,
    `pendapatan` VARCHAR(191) NOT NULL,
    `telefonPejabat` VARCHAR(191) NOT NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,
    `pendaftaranId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `daftar_bapa_noKP_key`(`noKP`),
    UNIQUE INDEX `daftar_bapa_pendaftaranId_key`(`pendaftaranId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `daftar_ibu` (
    `id` VARCHAR(191) NOT NULL,
    `nama` VARCHAR(191) NOT NULL,
    `emel` VARCHAR(191) NOT NULL,
    `noKP` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `pekerjaan` VARCHAR(191) NOT NULL,
    `pendapatan` VARCHAR(191) NOT NULL,
    `telefonPejabat` VARCHAR(191) NOT NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,
    `pendaftaranId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `daftar_ibu_noKP_key`(`noKP`),
    UNIQUE INDEX `daftar_ibu_pendaftaranId_key`(`pendaftaranId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `kehadiran` (
    `id` VARCHAR(191) NOT NULL,
    `hadir` BOOLEAN NOT NULL,
    `suhuNormal` VARCHAR(191) NOT NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,
    `kanakId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `aktiviti` (
    `id` VARCHAR(191) NOT NULL,
    `tarikh` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `namaAktiviti` VARCHAR(191) NOT NULL,
    `tahun` VARCHAR(191) NOT NULL,
    `kesukaran` VARCHAR(191) NOT NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `aktiviti_hari_ini` (
    `id` VARCHAR(191) NOT NULL,
    `tarikh` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `kelas` VARCHAR(191) NOT NULL,
    `aktivitiId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `daftar_kanak` ADD CONSTRAINT `daftar_kanak_pendaftaranId_fkey` FOREIGN KEY (`pendaftaranId`) REFERENCES `urus_pendaftaran`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `daftar_bapa` ADD CONSTRAINT `daftar_bapa_pendaftaranId_fkey` FOREIGN KEY (`pendaftaranId`) REFERENCES `urus_pendaftaran`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `daftar_ibu` ADD CONSTRAINT `daftar_ibu_pendaftaranId_fkey` FOREIGN KEY (`pendaftaranId`) REFERENCES `urus_pendaftaran`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `kehadiran` ADD CONSTRAINT `kehadiran_kanakId_fkey` FOREIGN KEY (`kanakId`) REFERENCES `daftar_kanak`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `aktiviti_hari_ini` ADD CONSTRAINT `aktiviti_hari_ini_aktivitiId_fkey` FOREIGN KEY (`aktivitiId`) REFERENCES `aktiviti`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
