CREATE TABLE IF NOT EXISTS `tk_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `moccarz_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci,
  `edited_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `koordynator` tinyint DEFAULT '0',
  `project_owner` tinyint DEFAULT '0',
  `admin` tinyint DEFAULT '0',
  `show_counter` tinyint DEFAULT '0',
  `active` tinyint DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tk_users_login_unique` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tk_schedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_code` varchar(50) COLLATE utf8mb4_unicode_ci,
  `workday` date,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci,
  `mocarz_id` varchar(255) COLLATE utf8mb4_unicode_ci,
  `zmiana` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduled_start` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduled_end` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduled_duration` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduled_duration_milliseconds` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tk_projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_code` varchar(255) COLLATE utf8mb4_unicode_ci,
  `client_id` bigint,
  `is_active` tinyint DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tk_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_name` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tk_current_work_table` (
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_stage_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_stage` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_stage_additional_info` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remote` tinyint DEFAULT '0',
  `campaign_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_stage_started` timestamp NULL DEFAULT NULL,
  `work_stage_began` timestamp NULL DEFAULT NULL,
  `work_stage_ended` timestamp NULL DEFAULT NULL,
  `work_stage_duration` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_time_started` timestamp NULL DEFAULT NULL,
  `scheduled_start_time` timestamp NULL DEFAULT NULL,
  `work_time_ended` timestamp NULL DEFAULT NULL,
  `scheduled_end_time` timestamp NULL DEFAULT NULL,
  `auto_logout_time` timestamp NULL DEFAULT NULL,
  `sent_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`work_stage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tk_finished_work_table` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_stage_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_stage` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_stage_additional_info` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remote` tinyint DEFAULT '0',
  `campaign_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_stage_started` timestamp NULL DEFAULT NULL,
  `work_stage_ended` timestamp NULL DEFAULT NULL,
  `work_stage_duration` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_time_started` timestamp NULL DEFAULT NULL,
  `scheduled_start_time` timestamp NULL DEFAULT NULL,
  `work_time_ended` timestamp NULL DEFAULT NULL,
  `scheduled_end_time` timestamp NULL DEFAULT NULL,
  `auto_logout` tinyint DEFAULT '0',
  `is_ghost` boolean DEFAULT FALSE,
  `update_case` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tk_campaigns` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campaign_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `starting_hours` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ending_hours` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logout_buffer` int DEFAULT '15',
  `next_ghost_creation` timestamp DEFAULT NULL,
  `ending_next_day` boolean DEFAULT FALSE,
  `edited_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tk_user_campaign` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `koordynator` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tk_po_campaign` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tk_campaign_statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `tk_deleted_records` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `work_stage_id` varchar(100) DEFAULT NULL,
  `work_stage` varchar(100) DEFAULT NULL,
  `work_stage_additional_info` varchar(100) DEFAULT NULL,
  `campaign_name` varchar(100) DEFAULT NULL,
  `campaign_id` varchar(100) DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `work_stage_started` timestamp NULL DEFAULT NULL,
  `work_stage_ended` timestamp NULL DEFAULT NULL,
  `work_stage_duration` varchar(1000) DEFAULT NULL,
  `work_time_started` timestamp NULL DEFAULT NULL,
  `scheduled_start_time` timestamp NULL DEFAULT NULL,
  `work_time_ended` timestamp NULL DEFAULT NULL,
  `scheduled_end_time` timestamp NULL DEFAULT NULL,
  `auto_logout` tinyint DEFAULT NULL,
  `edited_by` varchar(255) DEFAULT NULL,
  `time_of_update` timestamp NULL DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;






