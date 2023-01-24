-- CreateTable
CREATE TABLE `answers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `value` VARCHAR(255) NOT NULL,
    `position` INTEGER NOT NULL,
    `examination_id` INTEGER NULL,

    UNIQUE INDEX `IDX_d32b2bd0b847f0dceeedf8465c`(`examination_id`, `position`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `examinations` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `remembered_at` DATETIME(0) NULL,
    `answered_at` DATETIME(0) NULL,
    `created_at` DATETIME(0) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `examinations_words` (
    `examination_id` INTEGER NOT NULL,
    `word_id` INTEGER NOT NULL,

    INDEX `IDX_443488b793d0dcd4a2b39fd875`(`examination_id`),
    INDEX `IDX_4ac2e9bcf81c974035f7df65fc`(`word_id`),
    PRIMARY KEY (`examination_id`, `word_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `migrations` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `timestamp` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `words` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `IDX_975efd50047f02b2266a8d8e9c`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `answers` ADD CONSTRAINT `FK_baa2a4992b35d75732153a4a371` FOREIGN KEY (`examination_id`) REFERENCES `examinations`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `examinations_words` ADD CONSTRAINT `FK_443488b793d0dcd4a2b39fd8751` FOREIGN KEY (`examination_id`) REFERENCES `examinations`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `examinations_words` ADD CONSTRAINT `FK_4ac2e9bcf81c974035f7df65fc8` FOREIGN KEY (`word_id`) REFERENCES `words`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

