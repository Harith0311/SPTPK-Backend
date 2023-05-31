-- CreateTable
CREATE TABLE `AktivitiHariIni` (
    `id` VARCHAR(191) NOT NULL,
    `tarikh` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `aktivitiId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `AktivitiHariIni` ADD CONSTRAINT `AktivitiHariIni_aktivitiId_fkey` FOREIGN KEY (`aktivitiId`) REFERENCES `Aktiviti`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
