-- CreateTable
CREATE TABLE `Pengguna` (
    `id` VARCHAR(191) NOT NULL,
    `peranan` VARCHAR(191) NOT NULL,
    `nama` VARCHAR(191) NOT NULL,
    `emel` VARCHAR(191) NOT NULL,
    `noKP` VARCHAR(191) NOT NULL,
    `kataLaluan` VARCHAR(191) NOT NULL,
    `kodPengesahan` VARCHAR(191) NOT NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Pengguna_emel_key`(`emel`),
    UNIQUE INDEX `Pengguna_noKP_key`(`noKP`),
    UNIQUE INDEX `Pengguna_kodPengesahan_key`(`kodPengesahan`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UrusPendaftaran` (
    `id` VARCHAR(191) NOT NULL,
    `pendaftaranLulus` BOOLEAN NULL,
    `kodPengesahan` VARCHAR(191) NULL,
    `kelas` VARCHAR(191) NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DaftarKanak` (
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

    UNIQUE INDEX `DaftarKanak_sijilLahir_key`(`sijilLahir`),
    UNIQUE INDEX `DaftarKanak_pendaftaranId_key`(`pendaftaranId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DaftarBapa` (
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

    UNIQUE INDEX `DaftarBapa_noKP_key`(`noKP`),
    UNIQUE INDEX `DaftarBapa_pendaftaranId_key`(`pendaftaranId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DaftarIbu` (
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

    UNIQUE INDEX `DaftarIbu_noKP_key`(`noKP`),
    UNIQUE INDEX `DaftarIbu_pendaftaranId_key`(`pendaftaranId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Kehadiran` (
    `id` VARCHAR(191) NOT NULL,
    `hadir` BOOLEAN NOT NULL,
    `suhuNormal` VARCHAR(191) NOT NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,
    `kanakId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Aktiviti` (
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
CREATE TABLE `AktivitiHariIni` (
    `id` VARCHAR(191) NOT NULL,
    `tarikh` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `kelas` VARCHAR(191) NOT NULL,
    `aktivitiId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `DaftarKanak` ADD CONSTRAINT `DaftarKanak_pendaftaranId_fkey` FOREIGN KEY (`pendaftaranId`) REFERENCES `UrusPendaftaran`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DaftarBapa` ADD CONSTRAINT `DaftarBapa_pendaftaranId_fkey` FOREIGN KEY (`pendaftaranId`) REFERENCES `UrusPendaftaran`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DaftarIbu` ADD CONSTRAINT `DaftarIbu_pendaftaranId_fkey` FOREIGN KEY (`pendaftaranId`) REFERENCES `UrusPendaftaran`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Kehadiran` ADD CONSTRAINT `Kehadiran_kanakId_fkey` FOREIGN KEY (`kanakId`) REFERENCES `DaftarKanak`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AktivitiHariIni` ADD CONSTRAINT `AktivitiHariIni_aktivitiId_fkey` FOREIGN KEY (`aktivitiId`) REFERENCES `Aktiviti`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
