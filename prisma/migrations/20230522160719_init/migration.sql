-- CreateTable
CREATE TABLE `Pendaftaran` (
    `id` VARCHAR(191) NOT NULL,
    `nama` VARCHAR(191) NOT NULL,
    `umur` INTEGER NOT NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DaftarKanak` (
    `id` VARCHAR(191) NOT NULL,
    `sijilLahir` VARCHAR(191) NOT NULL,
    `bangsa` VARCHAR(191) NOT NULL,
    `tarikhLahir` VARCHAR(191) NOT NULL,
    `tempatLahir` VARCHAR(191) NOT NULL,
    `jantina` VARCHAR(191) NOT NULL,
    `namaPenjaga` VARCHAR(191) NOT NULL,
    `telefonPenjaga` VARCHAR(191) NOT NULL,
    `hubunganPenjaga` VARCHAR(191) NOT NULL,
    `alamatPenjaga` VARCHAR(191) NOT NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DaftarBapa` (
    `id` VARCHAR(191) NOT NULL,
    `emel` VARCHAR(191) NOT NULL,
    `noKP` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `pekerjaan` VARCHAR(191) NOT NULL,
    `pendapatan` VARCHAR(191) NOT NULL,
    `telefonPejabat` VARCHAR(191) NOT NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DaftarIbu` (
    `id` VARCHAR(191) NOT NULL,
    `emel` VARCHAR(191) NOT NULL,
    `noKP` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `pekerjaan` VARCHAR(191) NOT NULL,
    `pendapatan` VARCHAR(191) NOT NULL,
    `telefonPejabat` VARCHAR(191) NOT NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Kehadiran` (
    `id` VARCHAR(191) NOT NULL,
    `tarikh` VARCHAR(191) NOT NULL,
    `hadir` VARCHAR(191) NOT NULL,
    `suhuNormal` VARCHAR(191) NOT NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Kekosongan` (
    `id` VARCHAR(191) NOT NULL,
    `tahun` INTEGER NOT NULL,
    `jumlahKanak` INTEGER NOT NULL,
    `kapasitiKanak` INTEGER NOT NULL,
    `kekosonganSemasa` INTEGER NOT NULL,
    `kekosonganSeterusnya` INTEGER NOT NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Aktiviti` (
    `id` VARCHAR(191) NOT NULL,
    `tarikh` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `namaAktiviti` VARCHAR(191) NOT NULL,
    `diciptaPada` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `dikemaskiniPada` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
