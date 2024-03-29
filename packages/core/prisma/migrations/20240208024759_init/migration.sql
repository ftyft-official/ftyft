-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NULL,
    `username` VARCHAR(191) NULL,
    `recived_emails` BOOLEAN NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Gift` (
    `code` INTEGER NOT NULL AUTO_INCREMENT,
    `id_user` INTEGER NOT NULL,
    `date_create` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `date_expire` DATETIME(3) NOT NULL,
    `for_whom` VARCHAR(191) NOT NULL,
    `state` ENUM('OPEN', 'CLOSE') NOT NULL DEFAULT 'CLOSE',

    UNIQUE INDEX `Gift_id_user_key`(`id_user`),
    PRIMARY KEY (`code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Items` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` INTEGER NOT NULL,
    `url_gift` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Items_code_key`(`code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Gift` ADD CONSTRAINT `Gift_id_user_fkey` FOREIGN KEY (`id_user`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Items` ADD CONSTRAINT `Items_code_fkey` FOREIGN KEY (`code`) REFERENCES `Gift`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;
