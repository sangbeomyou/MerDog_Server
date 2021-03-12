-- --------------------------------------------------------
-- 호스트:                          ccit2019.cafe24.com
-- 서버 버전:                        5.5.64-MariaDB - MariaDB Server
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- MerDog 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `MerDog` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `MerDog`;

-- 테이블 MerDog.account 구조 내보내기
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '계좌 인덱스 번호',
  `doctor_id` int(11) NOT NULL COMMENT '의사회원번호',
  `bank_name` varchar(50) NOT NULL COMMENT '은행명',
  `bank_number` varchar(50) NOT NULL COMMENT '계좌번호',
  `bank_depo` varchar(50) NOT NULL COMMENT '예금주',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `FK_account_doctor_info` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_info` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='의사 계좌 정보';

-- 테이블 데이터 MerDog.account:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`, `doctor_id`, `bank_name`, `bank_number`, `bank_depo`, `created_at`) VALUES
	(6, 115, '신한은행', '11033392223', '심성윤', '2019-11-13 13:33:16');
INSERT INTO `account` (`id`, `doctor_id`, `bank_name`, `bank_number`, `bank_depo`, `created_at`) VALUES
	(12, 103, '신한은행', '11046646', '심성윤', '2019-11-24 14:53:30');
INSERT INTO `account` (`id`, `doctor_id`, `bank_name`, `bank_number`, `bank_depo`, `created_at`) VALUES
	(14, 143, '신한은행', '1000010011', '심성윤', '2019-12-13 02:28:28');
INSERT INTO `account` (`id`, `doctor_id`, `bank_name`, `bank_number`, `bank_depo`, `created_at`) VALUES
	(15, 117, '신한은행', '110417188220', '공지환', '2019-12-13 10:54:31');
INSERT INTO `account` (`id`, `doctor_id`, `bank_name`, `bank_number`, `bank_depo`, `created_at`) VALUES
	(16, 111, 'KB국민은행', '8888', 'ㅎㄹ', '2019-12-13 11:03:08');
INSERT INTO `account` (`id`, `doctor_id`, `bank_name`, `bank_number`, `bank_depo`, `created_at`) VALUES
	(19, 170, '신한은행', '193949', '929393', '2020-01-07 19:49:24');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- 테이블 MerDog.accumulate 구조 내보내기
CREATE TABLE IF NOT EXISTS `accumulate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '적립 인덱스 번호',
  `doctor_id` int(11) NOT NULL COMMENT '의사 번호',
  `point` int(11) NOT NULL COMMENT '적립 포인트',
  `chat_request_id` int(11) NOT NULL COMMENT '채팅 요청 번호',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chat_request_id` (`chat_request_id`),
  KEY `FK_accumulate_doctor_info` (`doctor_id`),
  CONSTRAINT `FK_accumulate_chat_request` FOREIGN KEY (`chat_request_id`) REFERENCES `chat_request` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_accumulate_doctor_info` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_info` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='의사 마일리지 적립 기록';

-- 테이블 데이터 MerDog.accumulate:~147 rows (대략적) 내보내기
/*!40000 ALTER TABLE `accumulate` DISABLE KEYS */;
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(57, 111, 5000, 577, '2019-11-26 18:15:06');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(58, 111, 5000, 578, '2019-11-26 19:38:31');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(59, 103, 5000, 580, '2019-11-26 20:30:19');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(60, 111, 5000, 581, '2019-11-26 20:51:09');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(61, 111, 5000, 582, '2019-11-26 21:16:13');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(62, 111, 5000, 587, '2019-11-26 22:42:07');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(66, 111, 5000, 589, '2019-11-26 23:14:54');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(67, 111, 5000, 593, '2019-11-26 23:21:23');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(68, 111, 5000, 598, '2019-11-26 23:38:13');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(69, 111, 5000, 601, '2019-11-26 23:52:14');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(70, 111, 5000, 602, '2019-11-26 23:58:35');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(72, 111, 5000, 603, '2019-11-27 00:05:23');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(73, 111, 5000, 600, '2019-11-27 20:17:38');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(74, 111, 5000, 611, '2019-11-27 20:39:02');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(75, 111, 5000, 613, '2019-11-28 16:25:14');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(76, 111, 5000, 625, '2019-11-28 17:09:06');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(77, 111, 5000, 633, '2019-11-30 17:35:33');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(78, 111, 5000, 632, '2019-12-01 23:41:45');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(79, 103, 5000, 637, '2019-12-02 16:42:50');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(80, 111, 5000, 634, '2019-12-02 16:42:59');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(81, 111, 5000, 642, '2019-12-02 17:00:22');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(82, 111, 5000, 627, '2019-12-03 15:38:15');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(83, 111, 5000, 638, '2019-12-03 15:38:20');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(84, 111, 5000, 641, '2019-12-03 15:38:21');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(85, 111, 5000, 646, '2019-12-03 15:38:22');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(87, 111, 5000, 648, '2019-12-03 15:38:23');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(88, 111, 5000, 650, '2019-12-03 15:38:24');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(89, 111, 5000, 652, '2019-12-03 15:38:24');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(90, 111, 5000, 654, '2019-12-03 16:06:35');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(91, 111, 5000, 655, '2019-12-03 19:40:04');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(92, 111, 5000, 656, '2019-12-03 19:56:40');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(94, 111, 5000, 658, '2019-12-06 11:11:52');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(95, 117, 5000, 673, '2019-12-06 11:12:38');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(96, 117, 5000, 676, '2019-12-06 11:15:21');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(97, 117, 5000, 687, '2019-12-06 11:26:45');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(98, 117, 5000, 697, '2019-12-06 12:15:43');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(99, 117, 5000, 696, '2019-12-06 12:19:54');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(101, 117, 5000, 703, '2019-12-06 12:27:39');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(102, 111, 5000, 707, '2019-12-06 12:28:19');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(103, 117, 5000, 706, '2019-12-06 14:05:16');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(104, 111, 5000, 714, '2019-12-06 14:07:45');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(105, 111, 5000, 715, '2019-12-06 14:08:19');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(106, 111, 5000, 719, '2019-12-06 14:11:04');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(107, 111, 5000, 720, '2019-12-06 14:11:37');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(108, 111, 5000, 723, '2019-12-06 14:15:47');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(109, 111, 5000, 724, '2019-12-06 14:16:16');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(110, 111, 5000, 726, '2019-12-06 14:21:36');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(111, 111, 5000, 727, '2019-12-06 14:22:32');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(112, 111, 5000, 729, '2019-12-06 14:25:18');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(114, 111, 5000, 732, '2019-12-06 14:30:33');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(115, 111, 5000, 734, '2019-12-06 14:31:51');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(116, 111, 5000, 736, '2019-12-06 14:33:35');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(117, 111, 5000, 739, '2019-12-06 14:35:46');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(118, 111, 5000, 740, '2019-12-06 14:36:48');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(119, 111, 5000, 741, '2019-12-06 14:37:20');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(120, 111, 5000, 752, '2019-12-06 14:43:32');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(121, 111, 5000, 754, '2019-12-06 14:45:25');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(122, 111, 5000, 756, '2019-12-06 14:46:22');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(123, 111, 5000, 761, '2019-12-06 14:48:00');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(124, 111, 5000, 764, '2019-12-06 14:50:13');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(125, 111, 5000, 768, '2019-12-06 14:51:53');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(126, 111, 5000, 769, '2019-12-06 14:52:25');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(127, 111, 5000, 778, '2019-12-06 14:54:04');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(129, 111, 5000, 792, '2019-12-06 14:58:48');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(130, 111, 5000, 793, '2019-12-06 14:59:05');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(131, 111, 5000, 794, '2019-12-06 14:59:26');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(132, 111, 5000, 797, '2019-12-07 15:58:51');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(134, 111, 5000, 835, '2019-12-10 15:23:25');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(135, 111, 5000, 836, '2019-12-11 01:24:48');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(136, 111, 5000, 838, '2019-12-12 14:28:45');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(137, 147, 5000, 840, '2019-12-13 10:53:52');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(138, 111, 5000, 843, '2019-12-13 11:48:57');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(139, 111, 5000, 845, '2019-12-16 19:03:14');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(141, 111, 5000, 846, '2019-12-17 17:52:00');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(142, 111, 5000, 848, '2019-12-17 18:16:19');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(143, 111, 5000, 854, '2019-12-17 18:37:05');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(144, 117, 5000, 841, '2019-12-17 20:38:31');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(145, 111, 5000, 861, '2019-12-18 13:49:46');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(146, 111, 5000, 862, '2019-12-18 14:37:40');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(147, 111, 5000, 863, '2019-12-18 18:31:49');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(148, 111, 5000, 867, '2019-12-19 21:16:44');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(150, 111, 5000, 868, '2019-12-21 19:04:41');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(153, 111, 5000, 869, '2019-12-21 19:04:43');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(154, 111, 5000, 871, '2019-12-25 02:11:34');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(155, 111, 5000, 872, '2019-12-25 03:45:20');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(156, 143, 5000, 874, '2019-12-29 16:52:55');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(157, 143, 5000, 876, '2019-12-29 19:23:50');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(158, 111, 5000, 877, '2020-01-02 19:11:51');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(160, 171, 5000, 880, '2020-01-02 20:08:59');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(161, 171, 5000, 881, '2020-01-02 20:34:53');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(162, 171, 5000, 882, '2020-01-02 21:15:46');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(163, 171, 5000, 883, '2020-01-03 11:30:23');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(164, 143, 5000, 887, '2020-01-07 20:32:48');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(165, 171, 5000, 890, '2020-01-07 21:01:59');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(167, 171, 5000, 893, '2020-01-07 21:06:44');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(168, 171, 5000, 894, '2020-01-07 21:08:46');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(169, 171, 5000, 889, '2020-01-07 21:23:53');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(171, 171, 5000, 892, '2020-01-07 21:23:55');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(173, 171, 5000, 896, '2020-01-08 14:11:22');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(174, 103, 5000, 897, '2020-01-08 14:46:37');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(175, 103, 5000, 899, '2020-01-08 15:29:41');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(177, 171, 5000, 903, '2020-01-08 16:33:09');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(178, 171, 5000, 901, '2020-01-08 16:35:06');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(179, 171, 5000, 902, '2020-01-08 16:35:07');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(182, 171, 5000, 908, '2020-01-09 12:12:31');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(184, 171, 5000, 909, '2020-01-09 13:27:54');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(185, 171, 5000, 907, '2020-01-09 14:34:27');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(186, 171, 5000, 910, '2020-01-09 15:12:52');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(187, 171, 5000, 912, '2020-01-09 15:41:12');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(188, 171, 5000, 913, '2020-01-09 16:05:35');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(189, 171, 5000, 914, '2020-01-09 16:23:42');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(190, 171, 5000, 916, '2020-01-09 16:51:42');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(191, 171, 5000, 917, '2020-01-09 17:00:53');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(192, 171, 5000, 918, '2020-01-09 17:00:54');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(193, 103, 5000, 915, '2020-01-09 17:01:42');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(194, 103, 5000, 920, '2020-01-09 17:15:35');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(195, 171, 5000, 919, '2020-01-09 17:20:44');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(196, 171, 5000, 921, '2020-01-09 17:41:11');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(197, 171, 5000, 924, '2020-01-09 18:13:50');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(198, 171, 5000, 922, '2020-01-09 18:58:37');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(199, 171, 5000, 925, '2020-01-09 19:18:37');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(200, 171, 5000, 934, '2020-01-09 19:47:55');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(201, 171, 5000, 935, '2020-01-09 19:50:39');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(203, 171, 5000, 936, '2020-01-09 19:55:51');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(204, 171, 5000, 937, '2020-01-09 20:00:52');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(205, 171, 5000, 938, '2020-01-09 20:08:43');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(207, 171, 5000, 939, '2020-01-09 20:25:19');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(208, 171, 5000, 940, '2020-01-09 20:25:29');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(210, 171, 5000, 941, '2020-01-09 20:45:36');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(212, 171, 5000, 944, '2020-01-09 20:45:50');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(213, 171, 5000, 945, '2020-01-09 21:05:09');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(215, 171, 5000, 946, '2020-01-09 21:06:41');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(216, 171, 5000, 947, '2020-01-09 21:39:54');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(217, 171, 5000, 948, '2020-01-09 21:51:00');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(221, 171, 5000, 949, '2020-01-09 21:52:20');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(222, 171, 5000, 958, '2020-01-09 22:08:11');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(224, 171, 5000, 959, '2020-01-09 22:13:36');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(225, 171, 5000, 962, '2020-01-09 22:16:27');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(226, 171, 5000, 951, '2020-01-09 22:16:39');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(228, 171, 5000, 950, '2020-01-09 22:43:56');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(230, 171, 5000, 952, '2020-01-09 22:43:57');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(231, 171, 5000, 953, '2020-01-09 22:43:58');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(232, 171, 5000, 960, '2020-01-09 22:44:00');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(234, 171, 5000, 961, '2020-01-09 22:44:01');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(235, 171, 5000, 963, '2020-01-09 22:44:03');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(237, 171, 5000, 964, '2020-01-09 22:44:04');
INSERT INTO `accumulate` (`id`, `doctor_id`, `point`, `chat_request_id`, `created_at`) VALUES
	(238, 171, 5000, 965, '2020-01-09 22:44:05');
/*!40000 ALTER TABLE `accumulate` ENABLE KEYS */;

-- 테이블 MerDog.admin_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `admin_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '관리자 고유번호',
  `admin_id` varchar(50) NOT NULL COMMENT '관리자 아이디',
  `admin_pw` text NOT NULL COMMENT '관리자 비밀번호',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '관리자 등급번호 ',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id` (`admin_id`),
  KEY `FK_admin_info_level_list` (`level`),
  CONSTRAINT `FK_admin_info_level_list` FOREIGN KEY (`level`) REFERENCES `level_list` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='관리자 정보';

-- 테이블 데이터 MerDog.admin_info:~13 rows (대략적) 내보내기
/*!40000 ALTER TABLE `admin_info` DISABLE KEYS */;
INSERT INTO `admin_info` (`id`, `admin_id`, `admin_pw`, `level`, `remember_token`, `created_at`) VALUES
	(5, 'ccit2019', '$2y$10$aw8Acjkki/.gNker7sjWMuv5RrXebstyAE3ilSZ5Z3kFV7RL1dRb.', 4, 'sn92yWNwsNpE5egcbr2Dhp2Rgu9MISnEtR7zerC96OUlADR9dyEGzrEsd2lR', '2019-10-22 21:13:55');
INSERT INTO `admin_info` (`id`, `admin_id`, `admin_pw`, `level`, `remember_token`, `created_at`) VALUES
	(13, 'asdasd', '$2y$10$Z8SbBkFkujq7/nOIZHRpBe1TH/SdCuojwygejONbLS/q/QiDcIVm.', 3, NULL, '2019-10-30 20:07:09');
INSERT INTO `admin_info` (`id`, `admin_id`, `admin_pw`, `level`, `remember_token`, `created_at`) VALUES
	(15, 'asd123', '$2y$10$QPCM64fqnEH3sgJXPvNwXu7gsN55zp18aNuCC.QZcJ5i8r4k9cGHC', 1, NULL, '2019-10-31 12:15:35');
INSERT INTO `admin_info` (`id`, `admin_id`, `admin_pw`, `level`, `remember_token`, `created_at`) VALUES
	(16, 'asdasdasd', '$2y$10$.zm7.v32jXZDOx817flcTOxKzS4XloYH.rBU5nM4L50Br.0ElCW6W', 1, NULL, '2019-10-31 12:20:19');
INSERT INTO `admin_info` (`id`, `admin_id`, `admin_pw`, `level`, `remember_token`, `created_at`) VALUES
	(17, 'abc123', '$2y$10$c6/.lOPnoli4D0KTYWk4KOxlY0R6VnUJEVxd23PEnpU1IRmzBkh72', 1, NULL, '2019-10-31 19:20:05');
INSERT INTO `admin_info` (`id`, `admin_id`, `admin_pw`, `level`, `remember_token`, `created_at`) VALUES
	(19, 'asfrtqwt14', '$2y$10$Hp2Wtbid0tr3vv2eZB3cM.u/thDRmX/JaPeqo/0BshTKLRIuvzdyi', 1, NULL, '2019-10-31 19:21:01');
INSERT INTO `admin_info` (`id`, `admin_id`, `admin_pw`, `level`, `remember_token`, `created_at`) VALUES
	(20, 'asfasf134', '$2y$10$1fJm30hDQEZmEdwtHB8my.9nEB2wMbjtlmfEl3s0nFnTyryo14d/C', 1, NULL, '2019-10-31 19:21:12');
INSERT INTO `admin_info` (`id`, `admin_id`, `admin_pw`, `level`, `remember_token`, `created_at`) VALUES
	(21, 'asf12352365', '$2y$10$.OULb8dcSgX.9HelqCYO9.lnkaiXPARjScqt2L9FPqwuX4KuAjZNq', 1, NULL, '2019-10-31 19:21:25');
INSERT INTO `admin_info` (`id`, `admin_id`, `admin_pw`, `level`, `remember_token`, `created_at`) VALUES
	(22, 'sdgsdg214', '$2y$10$d.Nmhm/FSs5D0YlJz4RhAezw6jEgIQoGXAUlsELDf9wMG7EF4ykzy', 1, NULL, '2019-10-31 19:21:37');
INSERT INTO `admin_info` (`id`, `admin_id`, `admin_pw`, `level`, `remember_token`, `created_at`) VALUES
	(23, 'gw35235', '$2y$10$68LvE/6fP1ZW8QS4MM7YpuH5wqkNcTB1AoVG6flkzwRlhdE5ja8CK', 2, NULL, '2019-10-31 19:21:51');
INSERT INTO `admin_info` (`id`, `admin_id`, `admin_pw`, `level`, `remember_token`, `created_at`) VALUES
	(24, 'asfas214214', '$2y$10$/Gdonmb9dL8FQYDFGSWNOu/s1DViRqqUmwXJgzuS9SCGurAOGwhXy', 3, NULL, '2019-10-31 19:22:02');
INSERT INTO `admin_info` (`id`, `admin_id`, `admin_pw`, `level`, `remember_token`, `created_at`) VALUES
	(25, 'asgasgasg', '$2y$10$86mMVv1FASaZF6mxZi0x1unO0GC6PgnYP0mgrYY6.eaoAYjwkFyhm', 2, NULL, '2019-10-31 19:22:14');
INSERT INTO `admin_info` (`id`, `admin_id`, `admin_pw`, `level`, `remember_token`, `created_at`) VALUES
	(29, 'ccit2020', '$2y$10$pThKxa/YmsdyeabTvldb1Om03yscDaQOrpZVdgoR6ks32jETy5Umu', 2, NULL, '2020-01-02 17:11:44');
/*!40000 ALTER TABLE `admin_info` ENABLE KEYS */;

-- 테이블 MerDog.chat 구조 내보내기
CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '채팅 메시지 번호',
  `request_id` int(11) NOT NULL COMMENT '요청정보 번호',
  `id_type` varchar(50) NOT NULL COMMENT 'user / doctor',
  `send_user` int(11) DEFAULT NULL COMMENT '사용자 번호 <보냄>',
  `send_doctor` int(11) DEFAULT NULL COMMENT '의사 번호 <보냄>',
  `room` int(11) NOT NULL COMMENT '애완동물 번호 = 방이름',
  `message_type` varchar(50) NOT NULL COMMENT 'text / img / video',
  `message` text NOT NULL COMMENT '메시지 내용',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read` varchar(50) NOT NULL DEFAULT 'no' COMMENT '읽음 여부  yes=읽음/ no=안읽음',
  `on/off` varchar(10) NOT NULL DEFAULT 'on' COMMENT '채팅 삭제 여부',
  PRIMARY KEY (`id`),
  KEY `FK_chat_pet` (`room`),
  KEY `FK_chat_doctor_info` (`send_doctor`),
  KEY `FK_chat_user_info` (`send_user`),
  KEY `FK_chat_chat_request` (`request_id`),
  CONSTRAINT `FK_chat_chat_request` FOREIGN KEY (`request_id`) REFERENCES `chat_request` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_chat_doctor_info` FOREIGN KEY (`send_doctor`) REFERENCES `doctor_info` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_chat_pet` FOREIGN KEY (`room`) REFERENCES `pet_info` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_chat_user_info` FOREIGN KEY (`send_user`) REFERENCES `user_info` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='채팅 목록';

-- 테이블 데이터 MerDog.chat:~505 rows (대략적) 내보내기
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(416, 577, 'user', 77, NULL, 35, 'text', '.', '2019-11-26 18:15:04', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(417, 578, 'user', 77, NULL, 35, 'text', 'dd', '2019-11-26 19:38:22', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(418, 580, 'doctor', NULL, 103, 35, 'text', 'ddd', '2019-11-26 19:39:57', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(419, 580, 'user', 77, NULL, 35, 'text', 'nn', '2019-11-26 20:28:33', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(420, 581, 'doctor', NULL, 111, 35, 'text', '시딛ㅂㄴㄱ시디', '2019-11-26 20:31:13', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(421, 581, 'doctor', NULL, 111, 35, 'text', 'ㅎㄷㅂㅈㄱ디ㅣ', '2019-11-26 20:50:46', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(422, 582, 'doctor', NULL, 111, 35, 'text', '보내', '2019-11-26 20:52:04', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(423, 582, 'doctor', NULL, 111, 35, 'text', 'ㅣ호잇', '2019-11-26 20:53:24', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(424, 582, 'user', 77, NULL, 35, 'text', '채팅좀묘', '2019-11-26 21:00:10', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(425, 582, 'doctor', NULL, 111, 35, 'text', '아나', '2019-11-26 21:00:26', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(426, 582, 'doctor', NULL, 111, 35, 'text', '시ㅢㄷ브', '2019-11-26 21:04:06', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(427, 582, 'doctor', NULL, 111, 35, 'text', 'ㅅㄷ긔닏ㄱㄷ긔', '2019-11-26 21:11:20', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(428, 582, 'doctor', NULL, 111, 35, 'text', 'ㄷ븨니ㅡㄱ븝', '2019-11-26 21:11:58', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(429, 582, 'doctor', NULL, 111, 35, 'text', 'ㄱ디ㅢㅣ짖', '2019-11-26 21:16:06', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(430, 587, 'doctor', NULL, 111, 35, 'text', 'c8', '2019-11-26 21:18:48', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(431, 587, 'doctor', NULL, 111, 35, 'text', '8800', '2019-11-26 21:18:58', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(432, 587, 'doctor', NULL, 111, 35, 'text', 'bveu2ue', '2019-11-26 21:23:13', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(433, 587, 'doctor', NULL, 111, 35, 'text', 'cwuwh2', '2019-11-26 21:23:52', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(434, 587, 'doctor', NULL, 111, 35, 'text', 'fru3u372', '2019-11-26 21:24:31', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(435, 587, 'doctor', NULL, 111, 35, 'text', 'rggshwu2', '2019-11-26 21:26:27', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(436, 587, 'doctor', NULL, 111, 35, 'text', 'fyutui', '2019-11-26 21:29:39', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(437, 587, 'user', 77, NULL, 35, 'text', '종료?', '2019-11-26 23:09:50', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(438, 589, 'doctor', NULL, 111, 35, 'text', 'ㅎㅇ', '2019-11-26 23:11:23', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(439, 587, 'user', 77, NULL, 35, 'text', '?', '2019-11-26 23:11:28', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(440, 589, 'user', 77, NULL, 35, 'text', '?', '2019-11-26 23:11:43', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(441, 589, 'user', 77, NULL, 35, 'text', '네', '2019-11-26 23:11:47', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(442, 589, 'doctor', NULL, 111, 35, 'text', '종료눌러?', '2019-11-26 23:11:52', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(443, 589, 'user', 77, NULL, 35, 'text', '눌러요', '2019-11-26 23:11:53', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(444, 589, 'doctor', NULL, 111, 35, 'text', '잠시만', '2019-11-26 23:12:03', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(445, 589, 'doctor', NULL, 111, 35, 'text', '이거 이러면 15분 기다려야하는데', '2019-11-26 23:12:19', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(446, 589, 'doctor', NULL, 111, 35, 'text', 'ㄱㄷ', '2019-11-26 23:12:57', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(447, 593, 'doctor', NULL, 111, 35, 'text', '굳', '2019-11-26 23:18:31', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(448, 589, 'user', 77, NULL, 35, 'text', '채팅', '2019-11-26 23:18:34', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(449, 593, 'doctor', NULL, 111, 35, 'text', '종료 눌러?', '2019-11-26 23:18:44', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(450, 589, 'user', 77, NULL, 35, 'text', '종료해봐요', '2019-11-26 23:18:45', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(451, 593, 'doctor', NULL, 111, 35, 'text', '1분 기다려', '2019-11-26 23:18:53', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(452, 589, 'user', 77, NULL, 35, 'text', '고고요', '2019-11-26 23:19:36', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(453, 593, 'doctor', NULL, 111, 35, 'text', '너가 보낸거', '2019-11-26 23:19:55', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(454, 593, 'doctor', NULL, 111, 35, 'text', '마지막 기준 1분이라', '2019-11-26 23:20:00', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(455, 593, 'doctor', NULL, 111, 35, 'text', '여기로 보내지마', '2019-11-26 23:20:18', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(456, 593, 'doctor', NULL, 111, 35, 'text', 'ㅠㅠ', '2019-11-26 23:20:21', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(457, 598, 'user', 80, NULL, 39, 'text', '슷', '2019-11-26 23:36:56', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(458, 598, 'user', 80, NULL, 39, 'text', '슷', '2019-11-26 23:36:58', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(459, 601, 'user', 77, NULL, 35, 'text', '.', '2019-11-26 23:50:22', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(460, 601, 'doctor', NULL, 111, 35, 'text', '스', '2019-11-26 23:50:26', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(461, 602, 'doctor', NULL, 111, 35, 'text', '보내지마', '2019-11-26 23:58:07', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(462, 602, 'user', 77, NULL, 35, 'text', '종료합니다', '2019-11-27 00:03:50', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(463, 600, 'doctor', NULL, 111, 39, 'text', 'ㄷ', '2019-11-27 20:17:35', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(464, 611, 'doctor', NULL, 111, 39, 'text', 'h', '2019-11-27 20:38:56', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(465, 613, 'user', 80, NULL, 39, 'text', 'hw', '2019-11-27 20:40:53', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(466, 613, 'user', 80, NULL, 39, 'text', 'uiiijji', '2019-11-27 20:41:14', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(467, 613, 'user', 80, NULL, 39, 'text', 'd33', '2019-11-27 20:42:31', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(468, 613, 'doctor', NULL, 111, 39, 'text', '야임마', '2019-11-28 15:33:59', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(469, 625, 'user', 80, NULL, 39, 'text', '어이', '2019-11-28 17:05:30', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(470, 625, 'user', 80, NULL, 39, 'text', '이자식아', '2019-11-28 17:05:33', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(471, 625, 'user', 80, NULL, 39, 'text', '어이', '2019-11-28 17:05:52', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(472, 625, 'user', 80, NULL, 39, 'text', '야', '2019-11-28 17:06:02', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(473, 625, 'user', 80, NULL, 39, 'text', 'ㅇ디ㅡ', '2019-11-28 17:06:58', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(474, 625, 'user', 80, NULL, 39, 'text', '이', '2019-11-28 17:07:15', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(475, 625, 'user', 80, NULL, 39, 'text', '이', '2019-11-28 17:07:46', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(476, 625, 'user', 80, NULL, 39, 'text', '이', '2019-11-28 17:08:01', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(477, 625, 'user', 80, NULL, 39, 'text', '듭지', '2019-11-28 17:08:07', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(478, 625, 'user', 80, NULL, 39, 'text', '디', '2019-11-28 17:08:41', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(479, 627, 'user', 78, NULL, 34, 'text', 'ㅎㅇ', '2019-11-28 17:11:20', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(480, 627, 'user', 78, NULL, 34, 'text', 'ㅊㅊ2', '2019-11-28 17:12:57', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(481, 632, 'user', 77, NULL, 35, 'text', '메세징', '2019-11-28 17:29:28', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(482, 632, 'user', 77, NULL, 35, 'text', 'ㄷㅅ', '2019-11-28 17:29:46', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(483, 632, 'user', 77, NULL, 35, 'text', 'ㅇ', '2019-11-28 17:32:58', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(484, 632, 'user', 77, NULL, 35, 'text', 'ㄱㅇㆍㄱ윽ㅇ', '2019-11-28 17:34:57', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(485, 632, 'user', 77, NULL, 35, 'text', 'ㅂㄷ프', '2019-11-28 17:35:09', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(486, 632, 'doctor', NULL, 111, 35, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/35/11120191128_180819786.jpeg', '2019-11-28 18:08:23', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(487, 632, 'user', 77, NULL, 35, 'text', 'ㅅㄱㄷㄱㄷㄱ', '2019-11-28 18:13:53', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(488, 632, 'user', 77, NULL, 35, 'text', 'ㅂㅈㄷㅂㄴㅅ', '2019-11-28 18:14:06', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(489, 632, 'user', 77, NULL, 35, 'text', 'ㄷㄱㆍㄷㄱㆍㄷㄱㆍㄷ', '2019-11-28 18:14:38', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(490, 633, 'doctor', NULL, 111, 39, 'video', 'http://ccit2019.cafe24.com/storage/video/chat/39/11120191129_101837242.mp4', '2019-11-29 10:18:59', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(491, 633, 'doctor', NULL, 111, 39, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/39/11120191129_111346268.jpeg', '2019-11-29 11:13:57', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(492, 633, 'doctor', NULL, 111, 39, 'text', '시발', '2019-11-30 17:34:54', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(493, 633, 'user', 80, NULL, 39, 'text', '싣거ㅓ', '2019-11-30 17:35:13', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(494, 634, 'doctor', NULL, 111, 41, 'text', 'ㅎㅇ', '2019-12-01 20:42:22', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(495, 634, 'doctor', NULL, 111, 41, 'text', 'ㅎㅇ', '2019-12-01 20:42:38', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(496, 634, 'user', 77, NULL, 41, 'text', '뿅', '2019-12-01 21:00:26', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(497, 634, 'user', 77, NULL, 41, 'text', '뭐지다시가네', '2019-12-01 21:00:44', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(498, 634, 'user', 77, NULL, 41, 'text', '.', '2019-12-01 22:10:37', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(499, 634, 'user', 77, NULL, 41, 'text', '좋군', '2019-12-01 22:10:52', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(500, 634, 'user', 77, NULL, 41, 'text', '뭐야 왤케느러', '2019-12-01 22:10:59', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(501, 634, 'user', 77, NULL, 41, 'text', 'ㅅ', '2019-12-01 22:52:05', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(502, 634, 'user', 77, NULL, 41, 'text', 'ㄴㅈㄱㅈ', '2019-12-01 22:52:39', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(503, 634, 'user', 77, NULL, 41, 'text', '.', '2019-12-01 23:19:09', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(504, 634, 'user', 77, NULL, 41, 'text', '.', '2019-12-01 23:35:37', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(505, 634, 'user', 77, NULL, 41, 'text', '.', '2019-12-01 23:37:52', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(506, 634, 'user', 77, NULL, 41, 'text', 'ㄷ', '2019-12-01 23:38:07', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(507, 634, 'user', 77, NULL, 41, 'text', 'ㄷ', '2019-12-01 23:38:37', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(508, 634, 'user', 77, NULL, 41, 'text', 'ㄱ', '2019-12-01 23:38:40', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(509, 634, 'user', 77, NULL, 41, 'text', 'ㄴ', '2019-12-01 23:38:44', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(510, 634, 'user', 77, NULL, 41, 'text', 'ㄱ', '2019-12-01 23:38:47', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(511, 637, 'doctor', NULL, 103, 35, 'text', 'ffff', '2019-12-01 23:47:40', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(512, 637, 'doctor', NULL, 103, 35, 'text', 'fg', '2019-12-01 23:47:45', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(513, 637, 'doctor', NULL, 103, 35, 'text', 'cx?', '2019-12-01 23:47:52', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(514, 637, 'user', 77, NULL, 35, 'text', '형', '2019-12-01 23:48:01', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(515, 637, 'user', 77, NULL, 35, 'text', '연속으로 채팅 보내봐요', '2019-12-01 23:48:10', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(516, 637, 'doctor', NULL, 103, 35, 'text', 'dd', '2019-12-01 23:48:13', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(517, 637, 'doctor', NULL, 103, 35, 'text', 'hu', '2019-12-01 23:48:16', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(518, 637, 'doctor', NULL, 103, 35, 'text', 'hyuu', '2019-12-01 23:48:21', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(519, 637, 'doctor', NULL, 103, 35, 'text', 'ui', '2019-12-01 23:48:26', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(520, 637, 'doctor', NULL, 103, 35, 'text', 'uu', '2019-12-01 23:48:29', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(521, 637, 'user', 77, NULL, 35, 'text', '계속가긴가나', '2019-12-01 23:48:31', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(522, 637, 'doctor', NULL, 103, 35, 'text', '77', '2019-12-01 23:48:33', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(523, 637, 'doctor', NULL, 103, 35, 'text', 'uu', '2019-12-01 23:48:37', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(524, 637, 'doctor', NULL, 103, 35, 'text', 'iuuu', '2019-12-01 23:48:40', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(525, 637, 'doctor', NULL, 103, 35, 'text', 'uu', '2019-12-01 23:48:44', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(526, 637, 'user', 77, NULL, 35, 'text', '그게 최대속도인가요?', '2019-12-01 23:48:45', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(527, 637, 'doctor', NULL, 103, 35, 'text', 'ii', '2019-12-01 23:48:47', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(528, 637, 'doctor', NULL, 103, 35, 'text', 'uuuuhh', '2019-12-01 23:48:51', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(529, 637, 'doctor', NULL, 103, 35, 'text', 'uu', '2019-12-01 23:48:54', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(530, 637, 'doctor', NULL, 103, 35, 'text', 'uu', '2019-12-01 23:48:57', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(531, 637, 'doctor', NULL, 103, 35, 'text', 'uu', '2019-12-01 23:49:01', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(532, 637, 'user', 77, NULL, 35, 'text', '보낼때 바로바로 가요?', '2019-12-01 23:49:02', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(533, 637, 'doctor', NULL, 103, 35, 'text', 'uu', '2019-12-01 23:49:04', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(534, 637, 'doctor', NULL, 103, 35, 'text', 'yy', '2019-12-01 23:49:08', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(535, 637, 'doctor', NULL, 103, 35, 'text', 'tre', '2019-12-01 23:49:11', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(536, 637, 'doctor', NULL, 103, 35, 'text', 'ttt', '2019-12-01 23:49:14', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(537, 637, 'doctor', NULL, 103, 35, 'text', 'yy', '2019-12-01 23:49:18', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(538, 637, 'doctor', NULL, 103, 35, 'text', 'yy', '2019-12-01 23:49:21', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(539, 637, 'doctor', NULL, 103, 35, 'text', 'yy', '2019-12-01 23:49:24', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(540, 637, 'doctor', NULL, 103, 35, 'text', 'yyuu', '2019-12-01 23:49:29', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(541, 637, 'doctor', NULL, 103, 35, 'text', 'yy', '2019-12-01 23:49:32', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(542, 637, 'doctor', NULL, 103, 35, 'text', 'uuu', '2019-12-01 23:49:36', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(543, 637, 'doctor', NULL, 103, 35, 'text', 'uu', '2019-12-01 23:49:39', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(544, 637, 'doctor', NULL, 103, 35, 'text', 'uu', '2019-12-01 23:49:42', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(545, 637, 'doctor', NULL, 103, 35, 'text', 'ㅇㅇㅇㅇ지금 10개정도 더나옿긋', '2019-12-01 23:49:45', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(546, 634, 'user', 77, NULL, 41, 'text', '.', '2019-12-02 00:39:07', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(547, 634, 'user', 77, NULL, 41, 'text', '굿?', '2019-12-02 00:45:55', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(548, 634, 'user', 77, NULL, 41, 'text', '고', '2019-12-02 00:47:55', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(549, 634, 'user', 77, NULL, 41, 'text', '되긴되네', '2019-12-02 00:48:04', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(550, 634, 'user', 77, NULL, 41, 'text', '지금', '2019-12-02 00:48:12', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(551, 634, 'user', 77, NULL, 41, 'text', '다시', '2019-12-02 00:48:14', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(552, 634, 'user', 77, NULL, 41, 'text', '디', '2019-12-02 00:48:17', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(553, 637, 'user', 77, NULL, 35, 'text', '.', '2019-12-02 00:49:21', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(554, 637, 'doctor', NULL, 103, 35, 'text', '아', '2019-12-02 00:54:24', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(555, 637, 'doctor', NULL, 103, 35, 'text', '에', '2019-12-02 00:54:27', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(556, 637, 'user', 77, NULL, 35, 'text', 'ㄴ', '2019-12-02 00:54:28', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(557, 637, 'doctor', NULL, 103, 35, 'text', '에', '2019-12-02 00:54:30', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(558, 637, 'user', 77, NULL, 35, 'text', 'ㄱ', '2019-12-02 00:54:31', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(559, 637, 'doctor', NULL, 103, 35, 'text', '오', '2019-12-02 00:54:32', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(560, 637, 'user', 77, NULL, 35, 'text', 'ㄴ', '2019-12-02 00:54:34', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(561, 637, 'doctor', NULL, 103, 35, 'text', '우', '2019-12-02 00:54:36', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(562, 637, 'user', 77, NULL, 35, 'text', 'ㄷ', '2019-12-02 00:54:37', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(563, 637, 'doctor', NULL, 103, 35, 'text', '가', '2019-12-02 00:54:39', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(564, 637, 'doctor', NULL, 103, 35, 'text', '케', '2019-12-02 00:54:42', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(565, 637, 'user', 77, NULL, 35, 'text', 'ㄱ', '2019-12-02 00:54:43', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(566, 637, 'doctor', NULL, 103, 35, 'text', '키', '2019-12-02 00:54:45', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(567, 637, 'user', 77, NULL, 35, 'text', 'ㄴ', '2019-12-02 00:54:46', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(568, 637, 'doctor', NULL, 103, 35, 'text', '코', '2019-12-02 00:54:47', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(569, 637, 'doctor', NULL, 103, 35, 'text', '쿠', '2019-12-02 00:54:50', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(570, 637, 'doctor', NULL, 103, 35, 'text', '느금?', '2019-12-02 00:54:53', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(571, 637, 'user', 77, NULL, 35, 'text', '됐음다', '2019-12-02 00:54:55', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(572, 637, 'doctor', NULL, 103, 35, 'text', 'ㄴㄱ???!?????', '2019-12-02 00:54:56', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(573, 637, 'doctor', NULL, 103, 35, 'text', '패드립?', '2019-12-02 00:54:59', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(574, 637, 'user', 77, NULL, 35, 'text', '갑자기?', '2019-12-02 00:55:00', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(575, 637, 'doctor', NULL, 103, 35, 'text', '아까보다 빨라짐', '2019-12-02 00:55:04', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(576, 637, 'doctor', NULL, 103, 35, 'text', '아까보다', '2019-12-02 00:55:13', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(577, 637, 'doctor', NULL, 103, 35, 'text', '빨라졋네', '2019-12-02 00:55:17', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(578, 637, 'doctor', NULL, 103, 35, 'text', '기분탓?', '2019-12-02 00:55:24', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(579, 637, 'doctor', NULL, 103, 35, 'text', 'ㅇ', '2019-12-02 00:55:27', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(580, 637, 'user', 77, NULL, 35, 'text', '전송예외처리 야매로 박아놓가했는데', '2019-12-02 00:55:29', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(581, 637, 'doctor', NULL, 103, 35, 'text', 'ㅇ', '2019-12-02 00:55:30', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(582, 637, 'doctor', NULL, 103, 35, 'text', 'ㅇ', '2019-12-02 00:55:33', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(583, 637, 'user', 77, NULL, 35, 'text', '기분탓', '2019-12-02 00:55:33', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(584, 637, 'doctor', NULL, 103, 35, 'text', 'ㅇ', '2019-12-02 00:55:35', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(585, 637, 'doctor', NULL, 103, 35, 'text', 'ㅇ', '2019-12-02 00:55:38', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(586, 637, 'user', 77, NULL, 35, 'text', '서버상태 이상해서', '2019-12-02 00:55:49', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(587, 637, 'user', 77, NULL, 35, 'text', '.', '2019-12-02 12:45:27', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(588, 637, 'user', 77, NULL, 35, 'text', '.', '2019-12-02 13:19:56', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(589, 637, 'user', 77, NULL, 35, 'text', 'ㄷ', '2019-12-02 13:21:59', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(590, 634, 'user', 77, NULL, 41, 'text', '.', '2019-12-02 13:22:42', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(591, 634, 'user', 77, NULL, 41, 'text', '.', '2019-12-02 13:23:56', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(592, 634, 'user', 77, NULL, 41, 'text', 'ㄷㄱㄷㄱㄷ', '2019-12-02 13:24:00', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(593, 634, 'user', 77, NULL, 41, 'text', '?', '2019-12-02 13:24:06', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(594, 634, 'user', 77, NULL, 41, 'text', 'ㄴ', '2019-12-02 15:51:49', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(595, 637, 'user', 77, NULL, 35, 'text', 'ㄱㄷㄱㄷ', '2019-12-02 15:51:58', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(596, 638, 'user', 77, NULL, 45, 'text', '넵', '2019-12-02 16:48:24', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(597, 638, 'user', 77, NULL, 45, 'text', '다른거도 받아줘요', '2019-12-02 16:48:36', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(598, 638, 'doctor', NULL, 111, 45, 'text', 'ok', '2019-12-02 16:48:56', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(599, 638, 'doctor', NULL, 111, 45, 'text', '이미 수락', '2019-12-02 16:49:35', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(600, 641, 'user', 77, NULL, 46, 'text', '다믐것도', '2019-12-02 16:50:26', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(601, 650, 'user', 77, NULL, 44, 'text', '.', '2019-12-02 17:00:04', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(602, 648, 'user', 77, NULL, 42, 'text', '.', '2019-12-02 17:00:09', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(603, 642, 'user', 77, NULL, 47, 'text', '.', '2019-12-02 17:00:17', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(604, 652, 'user', 77, NULL, 35, 'text', '?', '2019-12-02 17:02:53', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(605, 652, 'doctor', NULL, 111, 35, 'text', 'ㅎ', '2019-12-02 17:03:07', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(606, 652, 'user', 77, NULL, 35, 'text', '그 fmpeg찾아봤어요?', '2019-12-02 17:06:10', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(607, 652, 'doctor', NULL, 111, 35, 'text', '안드로이드에 설치하는거 까지는', '2019-12-02 17:11:15', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(608, 652, 'doctor', NULL, 111, 35, 'text', '찾아봤는데', '2019-12-02 17:11:18', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(609, 652, 'doctor', NULL, 111, 35, 'text', '이거  힘드네', '2019-12-02 17:12:50', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(610, 646, 'user', 77, NULL, 43, 'text', 'ㄱㄷ', '2019-12-02 17:28:07', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(611, 646, 'user', 77, NULL, 43, 'text', 'ㄷㄱㄷ', '2019-12-02 17:29:25', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(612, 627, 'user', 78, NULL, 34, 'text', '.', '2019-12-03 14:17:52', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(613, 652, 'user', 77, NULL, 35, 'text', '.', '2019-12-03 14:34:06', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(614, 627, 'user', 78, NULL, 34, 'text', 'ㅇ', '2019-12-03 14:39:05', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(615, 627, 'doctor', NULL, 111, 34, 'text', 'ㅇ', '2019-12-03 14:39:15', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(616, 654, 'user', 77, NULL, 35, 'text', 'fdgyfv', '2019-12-03 15:39:18', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(617, 654, 'user', 77, NULL, 35, 'text', 'hgvugh', '2019-12-03 15:39:22', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(618, 654, 'doctor', NULL, 111, 35, 'text', 'ㄷ극ㄴㄱ디', '2019-12-03 15:39:26', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(619, 654, 'user', 77, NULL, 35, 'text', 'gvhhvg', '2019-12-03 15:39:27', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(620, 654, 'doctor', NULL, 111, 35, 'text', '십아', '2019-12-03 15:39:34', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(621, 654, 'doctor', NULL, 111, 35, 'text', '딧기', '2019-12-03 15:39:59', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(622, 654, 'user', 77, NULL, 35, 'text', 'nejejfje', '2019-12-03 15:40:04', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(623, 654, 'user', 77, NULL, 35, 'text', 'eufidiwifc', '2019-12-03 15:40:12', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(624, 654, 'user', 77, NULL, 35, 'text', 'wodofocoehsodo', '2019-12-03 15:40:25', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(625, 655, 'user', 77, NULL, 35, 'text', '네', '2019-12-03 18:56:22', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(626, 656, 'user', 77, NULL, 41, 'text', '네', '2019-12-03 19:26:05', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(627, 656, 'doctor', NULL, 111, 41, 'video', 'http://ccit2019.cafe24.com/storage/video/chat/41/11120191203_193038594.mp4', '2019-12-03 19:30:47', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(628, 656, 'doctor', NULL, 111, 41, 'video', 'http://ccit2019.cafe24.com/storage/video/chat/41/11120191203_194018094.mp4', '2019-12-03 19:40:30', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(629, 656, 'doctor', NULL, 111, 41, 'text', 'ㅇ', '2019-12-03 19:50:55', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(630, 658, 'doctor', NULL, 111, 39, 'text', 'ㅎ', '2019-12-06 10:31:41', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(631, 658, 'doctor', NULL, 111, 39, 'text', 'ㅎ느ㆍㄴ', '2019-12-06 10:31:43', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(632, 658, 'doctor', NULL, 111, 39, 'text', 'ㄱㅅ느', '2019-12-06 10:31:45', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(633, 658, 'user', 80, NULL, 39, 'text', '시바', '2019-12-06 10:32:03', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(634, 673, 'user', 83, NULL, 55, 'text', 'tg', '2019-12-06 11:05:50', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(635, 673, 'doctor', NULL, 117, 55, 'text', 'ㅗ옹', '2019-12-06 11:05:56', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(636, 673, 'user', 83, NULL, 55, 'text', 'ㅎㅇ?', '2019-12-06 11:08:03', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(637, 673, 'user', 83, NULL, 55, 'text', '?', '2019-12-06 11:08:17', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(638, 673, 'user', 83, NULL, 55, 'text', '?', '2019-12-06 11:08:30', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(639, 673, 'user', 83, NULL, 55, 'text', '?', '2019-12-06 11:08:35', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(640, 673, 'doctor', NULL, 117, 55, 'text', '기모링', '2019-12-06 11:08:42', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(641, 673, 'user', 83, NULL, 55, 'text', 'ㅇㅅㅇ', '2019-12-06 11:11:00', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(642, 673, 'user', 83, NULL, 55, 'text', '?', '2019-12-06 11:11:08', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(643, 673, 'user', 83, NULL, 55, 'text', 'ㅇ', '2019-12-06 11:12:07', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(644, 676, 'user', 83, NULL, 55, 'text', 'ㅎㅇ', '2019-12-06 11:24:11', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(645, 687, 'user', 83, NULL, 55, 'text', 'ㅎㅇ', '2019-12-06 11:25:03', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(646, 687, 'user', 83, NULL, 55, 'text', '통신보안', '2019-12-06 11:25:16', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(647, 687, 'user', 83, NULL, 55, 'text', '뭐하누', '2019-12-06 11:25:38', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(648, 687, 'user', 83, NULL, 55, 'text', '진료하라이거야', '2019-12-06 11:25:49', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(649, 734, 'doctor', NULL, 111, 57, 'text', 'ko8', '2019-12-06 14:32:19', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(650, 835, 'doctor', NULL, 111, 64, 'text', '하이', '2019-12-10 00:46:29', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(651, 836, 'doctor', NULL, 111, 57, 'text', 'hwk1', '2019-12-11 00:32:34', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(652, 836, 'doctor', NULL, 111, 57, 'text', 'hei3', '2019-12-11 00:32:40', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(653, 836, 'doctor', NULL, 111, 57, 'text', 'hekd', '2019-12-11 00:32:46', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(654, 836, 'doctor', NULL, 111, 57, 'text', 'jsje', '2019-12-11 00:32:51', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(655, 836, 'doctor', NULL, 111, 57, 'text', '아이고', '2019-12-11 00:32:56', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(656, 836, 'doctor', NULL, 111, 57, 'text', '시바', '2019-12-11 00:33:04', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(657, 838, 'doctor', NULL, 111, 57, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/57/11120191212_140355597.jpeg', '2019-12-12 14:04:12', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(658, 840, 'doctor', NULL, 147, 72, 'text', '넵', '2019-12-13 00:18:28', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(659, 841, 'doctor', NULL, 117, 71, 'text', 'ㅎㅇ', '2019-12-13 11:05:08', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(660, 841, 'user', 78, NULL, 71, 'text', 'ㅎㅇ', '2019-12-13 11:05:25', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(661, 841, 'doctor', NULL, 117, 71, 'text', '萬', '2019-12-13 11:06:28', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(662, 841, 'doctor', NULL, 117, 71, 'text', '日', '2019-12-13 11:06:40', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(663, 841, 'doctor', NULL, 117, 71, 'text', '梁', '2019-12-13 11:06:59', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(664, 841, 'doctor', NULL, 117, 71, 'text', '緊', '2019-12-13 11:07:20', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(665, 841, 'doctor', NULL, 117, 71, 'text', '%', '2019-12-13 11:07:36', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(666, 843, 'doctor', NULL, 111, 74, 'text', '곤니찌와', '2019-12-13 11:08:14', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(667, 843, 'user', 78, NULL, 74, 'text', 'hㅅ', '2019-12-13 11:08:20', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(668, 841, 'doctor', NULL, 117, 71, 'text', '!', '2019-12-13 11:12:16', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(669, 841, 'doctor', NULL, 117, 71, 'text', '÷/÷^×₩×%!%#&', '2019-12-13 11:12:20', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(670, 841, 'doctor', NULL, 117, 71, 'text', 'ㅎㅇ!', '2019-12-13 11:12:25', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(671, 841, 'doctor', NULL, 117, 71, 'text', 'ㅎㅇ', '2019-12-13 11:12:30', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(672, 843, 'user', 78, NULL, 74, 'text', '얍', '2019-12-13 11:12:34', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(673, 841, 'doctor', NULL, 117, 71, 'text', 'ㄷ', '2019-12-13 11:12:55', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(674, 841, 'user', 78, NULL, 71, 'text', '여기', '2019-12-13 11:13:02', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(675, 841, 'doctor', NULL, 117, 71, 'text', '金', '2019-12-13 11:13:12', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(676, 841, 'doctor', NULL, 117, 71, 'text', '!@%#^~', '2019-12-13 11:13:32', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(677, 841, 'doctor', NULL, 117, 71, 'text', 'whs', '2019-12-13 11:13:38', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(678, 841, 'doctor', NULL, 117, 71, 'text', '九', '2019-12-13 11:13:50', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(679, 841, 'user', 78, NULL, 71, 'text', '可', '2019-12-13 11:13:59', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(680, 841, 'user', 78, NULL, 71, 'text', 'ㄱㅈㄱㅈ', '2019-12-13 11:14:02', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(681, 843, 'doctor', NULL, 111, 74, 'text', '♡', '2019-12-13 11:26:35', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(682, 845, 'doctor', NULL, 111, 57, 'text', '시기', '2019-12-16 18:34:36', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(683, 861, 'doctor', NULL, 111, 64, 'text', '오이', '2019-12-18 13:28:23', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(684, 861, 'user', 84, NULL, 64, 'text', '이이', '2019-12-18 13:28:34', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(685, 861, 'doctor', NULL, 111, 64, 'text', '하이', '2019-12-18 13:48:16', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(686, 861, 'doctor', NULL, 111, 64, 'text', 'ㅇ', '2019-12-18 13:49:52', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(687, 862, 'doctor', NULL, 111, 57, 'text', 'cwj2', '2019-12-18 14:13:35', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(688, 862, 'doctor', NULL, 111, 57, 'text', 'hw', '2019-12-18 14:13:43', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(689, 863, 'doctor', NULL, 111, 57, 'text', 'ㅅㄷ', '2019-12-18 14:38:09', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(690, 871, 'doctor', NULL, 111, 57, 'text', '아', '2019-12-21 19:04:52', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(691, 874, 'user', 84, NULL, 57, 'text', '안녕하세요', '2019-12-29 15:13:05', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(692, 874, 'user', 84, NULL, 57, 'text', '하이', '2019-12-29 15:13:23', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(693, 874, 'doctor', NULL, 143, 57, 'text', 'ㅎㅇ', '2019-12-29 15:13:30', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(694, 874, 'user', 84, NULL, 57, 'text', 'ㅎㅈ', '2019-12-29 15:14:00', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(695, 874, 'user', 84, NULL, 57, 'text', '드', '2019-12-29 15:14:03', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(696, 874, 'user', 84, NULL, 57, 'text', '나', '2019-12-29 15:14:07', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(697, 874, 'doctor', NULL, 143, 57, 'text', '답장안해줘도됌 ㄱㅅ', '2019-12-29 15:14:16', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(698, 874, 'doctor', NULL, 143, 57, 'text', '아니다 그 이미지 하나보내줄수잇나 고양이사진', '2019-12-29 15:14:26', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(699, 874, 'doctor', NULL, 143, 57, 'text', 'ㅇ', '2019-12-29 15:14:32', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(700, 874, 'doctor', NULL, 143, 57, 'text', 'ㅇ', '2019-12-29 15:14:35', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(701, 874, 'doctor', NULL, 143, 57, 'text', 'ㅇ', '2019-12-29 15:14:39', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(702, 874, 'doctor', NULL, 143, 57, 'text', 'ㅇ', '2019-12-29 15:14:43', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(703, 874, 'doctor', NULL, 143, 57, 'text', 'ㅇ', '2019-12-29 15:14:47', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(704, 874, 'doctor', NULL, 143, 57, 'text', 'ㅇㅇ', '2019-12-29 15:14:50', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(705, 874, 'doctor', NULL, 143, 57, 'text', 'ㅇ', '2019-12-29 15:14:54', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(706, 874, 'doctor', NULL, 143, 57, 'text', 'ㅇ', '2019-12-29 15:14:58', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(707, 874, 'doctor', NULL, 143, 57, 'text', 'ㅇ', '2019-12-29 15:15:01', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(708, 874, 'user', 84, NULL, 57, 'text', '고객앱', '2019-12-29 15:15:41', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(709, 874, 'user', 84, NULL, 57, 'text', '아니지', '2019-12-29 15:15:45', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(710, 874, 'user', 84, NULL, 57, 'text', '보냄', '2019-12-29 15:15:49', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(711, 874, 'doctor', NULL, 143, 57, 'video', 'http://ccit2019.cafe24.com/storage/video/chat/57/14320191229_151832839.mp4', '2019-12-29 15:19:13', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(712, 876, 'doctor', NULL, 143, 57, 'video', 'http://ccit2019.cafe24.com/storage/video/chat/57/14320191229_185826737.mp4', '2019-12-29 18:59:01', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(713, 876, 'doctor', NULL, 143, 57, 'video', 'http://ccit2019.cafe24.com/storage/video/chat/57/14320191229_185922810.mp4', '2019-12-29 18:59:56', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(714, 876, 'doctor', NULL, 143, 57, 'text', '.', '2019-12-29 19:00:01', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(715, 877, 'doctor', NULL, 111, 100, 'text', '안녕하세요', '2020-01-02 18:39:08', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(716, 877, 'user', 78, NULL, 100, 'text', '안녕하세요', '2020-01-02 18:39:09', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(717, 877, 'doctor', NULL, 111, 100, 'text', '반가워요', '2020-01-02 18:39:18', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(718, 877, 'user', 78, NULL, 100, 'text', '저희 콩이가 많이 아파요...', '2020-01-02 18:39:19', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(719, 877, 'doctor', NULL, 111, 100, 'text', '네 더 자세한 내용 말씀해주세요', '2020-01-02 18:39:40', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(720, 880, 'doctor', NULL, 171, 101, 'text', '안녕하세요', '2020-01-02 20:04:55', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(721, 877, 'user', 78, NULL, 100, 'text', '안녕하세요!', '2020-01-02 20:04:55', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(722, 880, 'user', 78, NULL, 101, 'text', '안녕하세요', '2020-01-02 20:07:04', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(723, 881, 'doctor', NULL, 171, 100, 'text', '안녕하세요', '2020-01-02 20:07:08', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(724, 880, 'user', 78, NULL, 101, 'text', '강아지가 발을 자꾸절어요', '2020-01-02 20:07:17', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(725, 880, 'user', 78, NULL, 101, 'text', '어찌해야하나요???', '2020-01-02 20:07:27', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(726, 882, 'doctor', NULL, 171, 102, 'text', '안녕하세요', '2020-01-02 20:46:12', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(727, 882, 'user', 85, NULL, 102, 'text', '안녕하세요~', '2020-01-02 20:46:13', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(728, 882, 'user', 85, NULL, 102, 'text', '강아지가 아파요...', '2020-01-02 20:46:18', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(729, 882, 'doctor', NULL, 171, 102, 'text', '수의사 유상범입니다', '2020-01-02 20:46:20', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(730, 882, 'doctor', NULL, 171, 102, 'text', '네 어디가 아픈지 더 말씀해주세요', '2020-01-02 20:46:43', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(731, 883, 'doctor', NULL, 171, 57, 'text', '안녕하세요', '2020-01-02 22:33:20', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(732, 887, 'doctor', NULL, 143, 104, 'text', '안녕하세요', '2020-01-07 19:41:46', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(733, 887, 'user', 85, NULL, 104, 'text', '아이거 테스트임 잠만', '2020-01-07 19:41:50', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(734, 887, 'doctor', NULL, 143, 104, 'text', 'ㅇㅋ', '2020-01-07 19:43:08', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(735, 887, 'user', 85, NULL, 104, 'text', 'ㅇㅋ', '2020-01-07 19:43:16', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(736, 889, 'doctor', NULL, 171, 57, 'text', '넵', '2020-01-07 20:56:07', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(737, 889, 'doctor', NULL, 171, 57, 'text', 'ㄴㄱㆍ', '2020-01-07 20:57:24', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(738, 890, 'doctor', NULL, 171, 64, 'text', '안녕하세요', '2020-01-07 20:57:54', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(739, 890, 'doctor', NULL, 171, 64, 'text', '안녕', '2020-01-07 20:58:12', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(740, 889, 'doctor', NULL, 171, 57, 'text', 'ㅇ', '2020-01-07 20:59:33', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(741, 892, 'doctor', NULL, 171, 65, 'text', '아니', '2020-01-07 21:01:44', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(742, 896, 'doctor', NULL, 171, 64, 'text', 'ㅅㄷ', '2020-01-07 21:24:09', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(743, 897, 'user', 85, NULL, 103, 'text', '안녕하세요', '2020-01-08 14:10:43', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(744, 897, 'doctor', NULL, 103, 103, 'text', '연속으로 세번말해줘', '2020-01-08 14:10:55', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(745, 897, 'user', 85, NULL, 103, 'text', '저희 콩이가', '2020-01-08 14:11:09', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(746, 897, 'user', 85, NULL, 103, 'text', '어제밤부터', '2020-01-08 14:11:12', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(747, 897, 'user', 85, NULL, 103, 'text', '발을 저는데', '2020-01-08 14:11:17', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(748, 897, 'user', 85, NULL, 103, 'text', '어떻게 해야하나요?', '2020-01-08 14:11:22', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(749, 897, 'doctor', NULL, 103, 103, 'text', 'ㅇㅋㄷㅋ끜', '2020-01-08 14:11:33', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(750, 897, 'user', 85, NULL, 103, 'text', 'ㅇㅋㄷㅋ', '2020-01-08 14:11:41', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(751, 897, 'doctor', NULL, 103, 103, 'text', '안녕하세요', '2020-01-08 14:13:24', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(752, 897, 'doctor', NULL, 103, 103, 'text', '답장안해도됌', '2020-01-08 14:13:29', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(753, 897, 'doctor', NULL, 103, 103, 'text', '네', '2020-01-08 14:14:20', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(754, 899, 'doctor', NULL, 103, 102, 'text', '네', '2020-01-08 14:47:12', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(755, 899, 'user', 85, NULL, 102, 'text', '이미지보내짐?', '2020-01-08 14:50:34', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(756, 899, 'doctor', NULL, 103, 102, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/102/10320200108_145018224.jpeg', '2020-01-08 14:51:02', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(757, 899, 'doctor', NULL, 103, 102, 'text', 'ㅇㅇㅇ', '2020-01-08 14:51:07', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(758, 910, 'user', 85, NULL, 103, 'text', '안녕하세요!', '2020-01-09 15:06:44', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(759, 910, 'doctor', NULL, 171, 103, 'text', '안녕하세요', '2020-01-09 15:06:46', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(760, 910, 'user', 85, NULL, 103, 'text', '취소', '2020-01-09 15:06:53', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(761, 910, 'user', 85, NULL, 103, 'text', 'ㅈㅅ 상담했었네', '2020-01-09 15:07:01', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(762, 910, 'user', 85, NULL, 103, 'text', 'ㄱㄷㅇ', '2020-01-09 15:07:34', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(763, 912, 'doctor', NULL, 171, 106, 'text', '안녕하세요', '2020-01-09 15:10:57', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(764, 912, 'user', 85, NULL, 106, 'text', '안녕하세요', '2020-01-09 15:11:06', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(765, 912, 'user', 85, NULL, 106, 'text', '몽이가 다리를 절어요', '2020-01-09 15:11:14', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(766, 912, 'doctor', NULL, 171, 106, 'text', '네 더 말씀해 주세요', '2020-01-09 15:11:30', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(767, 912, 'user', 85, NULL, 106, 'text', 'ㅇㅋㅇㅋ', '2020-01-09 15:11:49', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(768, 912, 'user', 85, NULL, 106, 'text', '넴', '2020-01-09 15:14:16', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(769, 912, 'user', 85, NULL, 106, 'text', '잠만', '2020-01-09 15:23:14', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(770, 912, 'user', 85, NULL, 106, 'text', '연장해주세요', '2020-01-09 15:23:38', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(771, 912, 'doctor', NULL, 171, 106, 'text', '잠시만요', '2020-01-09 15:24:11', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(772, 912, 'doctor', NULL, 171, 106, 'text', '연장 되었습니다', '2020-01-09 15:24:19', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(773, 912, 'doctor', NULL, 171, 106, 'text', '10분이요', '2020-01-09 15:24:32', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(774, 912, 'user', 85, NULL, 106, 'text', '감사합니다', '2020-01-09 15:24:42', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(775, 913, 'user', 85, NULL, 104, 'text', '안녕하세요', '2020-01-09 15:41:45', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(776, 913, 'user', 85, NULL, 104, 'text', 'ㄱㅅ 테스트', '2020-01-09 15:41:58', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(777, 913, 'doctor', NULL, 171, 104, 'text', '네 안녕하세요', '2020-01-09 15:42:03', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(778, 914, 'doctor', NULL, 171, 106, 'text', '테스트?', '2020-01-09 15:56:46', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(779, 914, 'doctor', NULL, 171, 106, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/106/17120200109_155911996.jpeg', '2020-01-09 15:59:55', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(780, 912, 'user', 85, NULL, 106, 'text', 'ㅇㅇ', '2020-01-09 16:00:15', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(781, 915, 'user', 85, NULL, 107, 'text', '안녕하세요', '2020-01-09 16:26:33', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(782, 887, 'doctor', NULL, 103, 104, 'text', '안녕하세요', '2020-01-09 16:26:43', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(783, 915, 'user', 85, NULL, 107, 'text', '쿠키가 다리를 절어요', '2020-01-09 16:26:44', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(784, 915, 'user', 85, NULL, 107, 'text', '어떻게 해야하나요???', '2020-01-09 16:27:00', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(785, 918, 'doctor', NULL, 171, 109, 'text', '안녕하세요', '2020-01-09 16:33:57', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(786, 918, 'user', 85, NULL, 109, 'text', '안녕하세요', '2020-01-09 16:33:58', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(787, 918, 'user', 85, NULL, 109, 'text', '강아지 귀에 염증이 났는데', '2020-01-09 16:34:13', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(788, 918, 'user', 85, NULL, 109, 'text', '어떻게 해야하나요??', '2020-01-09 16:34:15', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(789, 919, 'doctor', NULL, 171, 110, 'text', '안녕하세요', '2020-01-09 16:43:50', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(790, 919, 'user', 85, NULL, 110, 'text', '안녕하세요', '2020-01-09 16:43:59', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(791, 920, 'user', 77, NULL, 105, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/105/downloadfile.jpg', '2020-01-09 16:58:58', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(792, 919, 'user', 85, NULL, 110, 'text', '강아지가 자꾸 기침을 하는데', '2020-01-09 17:02:17', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(793, 920, 'user', 77, NULL, 105, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/105/(87)downloadfile.jpg', '2020-01-09 17:03:25', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(794, 920, 'user', 77, NULL, 105, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/105/(92)downloadfile.jpg', '2020-01-09 17:04:12', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(795, 920, 'user', 77, NULL, 105, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/105/(89)downloadfile.jpg', '2020-01-09 17:09:57', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(796, 921, 'user', 77, NULL, 105, 'text', 'ㅎㅇ요', '2020-01-09 17:21:01', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(797, 921, 'user', 77, NULL, 105, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/105/(79)downloadfile.jpg', '2020-01-09 17:21:04', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(798, 921, 'user', 77, NULL, 105, 'text', '사진잘 가나요', '2020-01-09 17:21:16', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(799, 921, 'doctor', NULL, 171, 105, 'text', '사진 잘 옵니다', '2020-01-09 17:21:20', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(800, 921, 'doctor', NULL, 171, 105, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/105/17120200109_172050025.jpeg', '2020-01-09 17:21:33', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(801, 921, 'doctor', NULL, 171, 105, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/105/17120200109_172115083.jpeg', '2020-01-09 17:21:59', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(802, 921, 'doctor', NULL, 171, 105, 'text', '잘 가?', '2020-01-09 17:22:12', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(803, 921, 'doctor', NULL, 171, 105, 'text', '난 가나?', '2020-01-09 17:26:32', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(804, 922, 'user', 85, NULL, 102, 'text', '아아', '2020-01-09 17:38:47', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(805, 922, 'user', 85, NULL, 102, 'text', '보내지는데?', '2020-01-09 17:38:54', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(806, 922, 'user', 85, NULL, 102, 'text', '안보내짐?', '2020-01-09 17:40:20', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(807, 924, 'user', 77, NULL, 105, 'text', '다시', '2020-01-09 17:51:26', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(808, 924, 'user', 77, NULL, 105, 'text', 'ip밴인거같은데', '2020-01-09 17:51:41', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(809, 924, 'user', 77, NULL, 105, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/105/(57)downloadfile.jpg', '2020-01-09 17:51:48', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(810, 924, 'user', 77, NULL, 105, 'text', '.', '2020-01-09 17:52:19', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(811, 924, 'doctor', NULL, 171, 105, 'text', '왜', '2020-01-09 17:54:12', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(812, 924, 'doctor', NULL, 171, 105, 'text', 'ㅋㅋㅋㅋ', '2020-01-09 17:54:34', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(813, 924, 'user', 77, NULL, 105, 'text', '사진보내서 밴당했나', '2020-01-09 17:54:42', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(814, 924, 'user', 77, NULL, 105, 'text', '용량커서', '2020-01-09 17:54:48', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(815, 924, 'doctor', NULL, 171, 105, 'text', '그런가', '2020-01-09 17:55:00', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(816, 924, 'doctor', NULL, 171, 105, 'text', '사진도', '2020-01-09 17:55:03', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(817, 924, 'user', 77, NULL, 105, 'text', '서버가 이상한건지', '2020-01-09 17:55:05', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(818, 924, 'doctor', NULL, 171, 105, 'text', '영상 찍어야함?', '2020-01-09 17:55:09', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(819, 924, 'user', 77, NULL, 105, 'text', '찍으면 좋죠', '2020-01-09 18:02:40', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(820, 921, 'user', 77, NULL, 105, 'text', '네', '2020-01-09 18:58:44', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(821, 925, 'doctor', NULL, 171, 105, 'text', '받았슴다', '2020-01-09 18:58:45', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(822, 925, 'doctor', NULL, 171, 105, 'text', 'ㅎㅇ', '2020-01-09 19:03:11', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(823, 925, 'user', 77, NULL, 105, 'text', '채팅', '2020-01-09 19:03:40', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(824, 925, 'doctor', NULL, 171, 105, 'text', 'ㅎㅇ', '2020-01-09 19:03:43', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(825, 925, 'doctor', NULL, 171, 105, 'text', 'ㅇㅇ', '2020-01-09 19:03:47', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(826, 925, 'user', 77, NULL, 105, 'text', '옙', '2020-01-09 19:04:25', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(827, 925, 'user', 77, NULL, 105, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/105/JPEG_20200109190358_1216571108374690406.jpg', '2020-01-09 19:04:52', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(828, 925, 'user', 77, NULL, 105, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/105/20191217_191509.jpg', '2020-01-09 19:06:11', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(829, 925, 'doctor', NULL, 171, 105, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/105/17120200109_190528265.jpeg', '2020-01-09 19:06:14', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(830, 925, 'user', 77, NULL, 105, 'text', 'ㅅ', '2020-01-09 19:07:41', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(831, 925, 'user', 77, NULL, 105, 'text', '보내봐요', '2020-01-09 19:07:49', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(832, 925, 'doctor', NULL, 171, 105, 'text', 'ㅎㅇ', '2020-01-09 19:07:55', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(833, 925, 'user', 77, NULL, 105, 'text', '다시요', '2020-01-09 19:08:23', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(834, 925, 'doctor', NULL, 171, 105, 'text', '다시', '2020-01-09 19:08:33', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(835, 925, 'user', 77, NULL, 105, 'text', '리리', '2020-01-09 19:09:19', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(836, 925, 'doctor', NULL, 171, 105, 'text', 'ㅇㅋㅇㅋ', '2020-01-09 19:09:26', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(837, 925, 'user', 77, NULL, 105, 'text', 'ㅇ', '2020-01-09 19:10:18', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(838, 925, 'doctor', NULL, 171, 105, 'text', '다시?', '2020-01-09 19:10:29', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(839, 925, 'user', 77, NULL, 105, 'text', '다시다시', '2020-01-09 19:10:40', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(840, 925, 'doctor', NULL, 171, 105, 'text', '테스트1', '2020-01-09 19:10:50', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(841, 925, 'user', 77, NULL, 105, 'text', '간닷', '2020-01-09 19:11:56', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(842, 925, 'doctor', NULL, 171, 105, 'text', '테스트2', '2020-01-09 19:12:03', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(843, 925, 'user', 77, NULL, 105, 'text', '뭐지', '2020-01-09 19:12:52', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(844, 925, 'doctor', NULL, 171, 105, 'text', '테스트3', '2020-01-09 19:13:01', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(845, 925, 'doctor', NULL, 171, 105, 'text', '왜?', '2020-01-09 19:13:04', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(846, 925, 'user', 77, NULL, 105, 'text', '다시', '2020-01-09 19:14:57', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(847, 925, 'user', 77, NULL, 105, 'text', '지금', '2020-01-09 19:16:23', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(848, 925, 'user', 77, NULL, 105, 'text', '다시 보내봐유', '2020-01-09 19:16:29', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(849, 925, 'user', 77, NULL, 105, 'text', '막타', '2020-01-09 19:16:39', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(850, 925, 'user', 77, NULL, 105, 'text', '.', '2020-01-09 19:17:06', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(851, 925, 'doctor', NULL, 171, 105, 'text', 'ㅌ스트4', '2020-01-09 19:17:27', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(852, 925, 'user', 77, NULL, 105, 'text', '지금', '2020-01-09 19:17:47', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(853, 925, 'user', 77, NULL, 105, 'text', '다시욥', '2020-01-09 19:17:50', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(854, 925, 'doctor', NULL, 171, 105, 'text', 'ㄴㄴ', '2020-01-09 19:17:53', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(855, 925, 'doctor', NULL, 171, 105, 'text', '안옴', '2020-01-09 19:17:56', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(856, 925, 'user', 77, NULL, 105, 'text', '굿', '2020-01-09 19:18:17', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(857, 925, 'doctor', NULL, 171, 105, 'text', '굿굿', '2020-01-09 19:18:33', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(858, 934, 'doctor', NULL, 171, 104, 'text', '확인', '2020-01-09 19:45:51', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(859, 934, 'user', 85, NULL, 104, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/104/Screenshot_20200109-193316_Gallery.jpg', '2020-01-09 19:46:16', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(860, 934, 'user', 85, NULL, 104, 'text', '사진', '2020-01-09 19:46:19', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(861, 934, 'user', 85, NULL, 104, 'text', '감?', '2020-01-09 19:46:36', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(862, 934, 'doctor', NULL, 171, 104, 'text', '잘옵니다', '2020-01-09 19:46:38', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(863, 936, 'doctor', NULL, 171, 123, 'text', '아픈곳 말씀해주세요', '2020-01-09 19:56:00', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(864, 936, 'doctor', NULL, 171, 123, 'text', '아니', '2020-01-09 19:56:04', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(865, 936, 'doctor', NULL, 171, 123, 'text', '잉?', '2020-01-09 19:56:08', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(866, 936, 'doctor', NULL, 171, 123, 'text', '잉', '2020-01-09 19:56:13', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(867, 936, 'doctor', NULL, 171, 123, 'text', '잉', '2020-01-09 19:56:35', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(868, 937, 'doctor', NULL, 171, 124, 'text', '안녕하세요', '2020-01-09 19:58:11', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(869, 937, 'user', 85, NULL, 124, 'text', '스트레스 조지네', '2020-01-09 19:58:24', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(870, 937, 'doctor', NULL, 171, 124, 'text', 'ㅋㅋㅋㅋㅋㅋ', '2020-01-09 19:58:37', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(871, 937, 'user', 85, NULL, 124, 'text', '서버오류 나만떠?', '2020-01-09 19:58:44', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(872, 937, 'doctor', NULL, 171, 124, 'text', '값 들어오는거 확인 했엉?', '2020-01-09 19:58:48', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(873, 937, 'user', 85, NULL, 124, 'text', '이거 정보 뭐라고뜸?', '2020-01-09 19:58:51', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(874, 937, 'doctor', NULL, 171, 124, 'text', '난 안떠', '2020-01-09 19:58:52', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(875, 937, 'doctor', NULL, 171, 124, 'text', '종환부계정', '2020-01-09 19:58:58', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(876, 937, 'user', 85, NULL, 124, 'text', '몽이라고 떠? 강아지이름', '2020-01-09 19:59:06', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(877, 937, 'user', 85, NULL, 124, 'text', 'null뜸??', '2020-01-09 19:59:12', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(878, 937, 'doctor', NULL, 171, 124, 'text', '펫이름', '2020-01-09 19:59:27', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(879, 937, 'doctor', NULL, 171, 124, 'text', '몽이라고', '2020-01-09 19:59:31', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(880, 937, 'user', 85, NULL, 124, 'text', '돌겠네진짜 잠만', '2020-01-09 19:59:52', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(881, 937, 'user', 85, NULL, 124, 'text', '진짜 미안...', '2020-01-09 20:00:01', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(882, 938, 'doctor', NULL, 171, 106, 'text', 'ㅎㅇ', '2020-01-09 20:08:18', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(883, 938, 'user', 85, NULL, 106, 'text', '이건잘뜨네', '2020-01-09 20:08:37', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(884, 938, 'doctor', NULL, 171, 106, 'text', '사진하나만', '2020-01-09 20:11:37', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(885, 938, 'doctor', NULL, 171, 106, 'text', '보내줘', '2020-01-09 20:11:41', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(886, 939, 'doctor', NULL, 171, 136, 'text', '안녕하세요', '2020-01-09 20:20:01', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(887, 939, 'user', 85, NULL, 136, 'text', '또널떳다', '2020-01-09 20:20:10', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(888, 939, 'doctor', NULL, 171, 136, 'text', 'ㅋㅋㄲ', '2020-01-09 20:20:15', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(889, 939, 'user', 85, NULL, 136, 'text', '왜이러지 시발', '2020-01-09 20:20:16', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(890, 939, 'user', 85, NULL, 136, 'text', '아', '2020-01-09 20:20:19', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(891, 939, 'doctor', NULL, 171, 136, 'text', '형 일딴', '2020-01-09 20:20:20', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(892, 939, 'doctor', NULL, 171, 136, 'text', '사진점', '2020-01-09 20:20:24', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(893, 939, 'user', 85, NULL, 136, 'text', '먼사진?', '2020-01-09 20:20:34', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(894, 939, 'user', 85, NULL, 136, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/136/Screenshot_20200109-193316_Gallery.jpg', '2020-01-09 20:21:15', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(895, 939, 'user', 85, NULL, 136, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/136/Screenshot_20200109-154025.jpg', '2020-01-09 20:23:09', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(896, 941, 'user', 85, NULL, 139, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/139/Screenshot_20200109-193316_Gallery.jpg', '2020-01-09 20:33:08', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(897, 941, 'user', 85, NULL, 139, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/139/(66)Screenshot_20200109-193316_Gallery.jpg', '2020-01-09 20:37:54', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(898, 941, 'user', 85, NULL, 139, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/139/Screenshot_20200109-154035.jpg', '2020-01-09 20:39:42', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(899, 944, 'user', 85, NULL, 141, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/141/Screenshot_20200109-193316_Gallery.jpg', '2020-01-09 20:42:45', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(900, 944, 'user', 85, NULL, 141, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/141/Screenshot_20200109-155609.jpg', '2020-01-09 20:43:59', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(901, 944, 'user', 85, NULL, 141, 'img', 'http://ccit2019.cafe24.com/storage/img/chat/141/JPEG_20200109204346_6401967059089829840.jpg', '2020-01-09 20:44:41', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(902, 945, 'doctor', NULL, 171, 142, 'text', '안녕하세요', '2020-01-09 21:04:49', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(903, 946, 'doctor', NULL, 171, 140, 'text', '안녕하세요', '2020-01-09 21:06:13', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(904, 945, 'user', 85, NULL, 142, 'text', '안녕하세요', '2020-01-09 21:06:13', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(905, 946, 'user', 85, NULL, 140, 'text', '안녕하세여', '2020-01-09 21:06:20', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(906, 946, 'user', 85, NULL, 140, 'text', '다시..', '2020-01-09 21:06:36', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(907, 947, 'doctor', NULL, 171, 143, 'text', '안녕하세요', '2020-01-09 21:18:03', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(908, 946, 'user', 85, NULL, 140, 'text', '올라프의 상담방에', '2020-01-09 21:18:07', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(909, 946, 'user', 85, NULL, 140, 'text', '왜 들어가져', '2020-01-09 21:18:12', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(910, 947, 'user', 85, NULL, 143, 'text', '또 올라프의 상담방에', '2020-01-09 21:18:24', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(911, 947, 'user', 85, NULL, 143, 'text', '드가지네', '2020-01-09 21:18:28', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(912, 947, 'user', 85, NULL, 143, 'text', '하 ㅋㅋㅋㅋㅋㅋ', '2020-01-09 21:18:33', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(913, 947, 'doctor', NULL, 171, 143, 'text', '먼가', '2020-01-09 21:18:51', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(914, 947, 'doctor', NULL, 171, 143, 'text', '이상하네', '2020-01-09 21:18:55', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(915, 947, 'doctor', NULL, 171, 143, 'text', 'fcm도', '2020-01-09 21:19:04', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(916, 948, 'doctor', NULL, 171, 139, 'text', '사진이', '2020-01-09 21:49:59', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(917, 948, 'doctor', NULL, 171, 139, 'text', '이미', '2020-01-09 21:50:06', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(918, 948, 'user', 85, NULL, 139, 'text', 'ㅇㅇ?', '2020-01-09 21:50:10', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(919, 948, 'user', 85, NULL, 139, 'text', '종료합니다', '2020-01-09 21:50:49', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(920, 948, 'doctor', NULL, 171, 139, 'text', 'ㅇㅋㅇㅋ', '2020-01-09 21:50:56', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(921, 948, 'user', 85, NULL, 139, 'text', '다시요청오면 받아주', '2020-01-09 21:50:58', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(922, 948, 'user', 85, NULL, 139, 'text', '안나제발', '2020-01-09 21:51:34', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(923, 949, 'doctor', NULL, 171, 141, 'text', '안녕하세요', '2020-01-09 21:52:02', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(924, 950, 'doctor', NULL, 171, 138, 'text', '토토로', '2020-01-09 22:01:23', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(925, 953, 'user', 85, NULL, 144, 'text', '맞음', '2020-01-09 22:04:38', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(926, 953, 'user', 85, NULL, 144, 'text', '아니일단', '2020-01-09 22:04:45', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(927, 953, 'user', 85, NULL, 144, 'text', '널도안뜨고', '2020-01-09 22:04:55', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(928, 953, 'user', 85, NULL, 144, 'text', '방도 존나 잘들어가져 왜 되냐고ㅋㅋㅋ', '2020-01-09 22:05:04', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(929, 959, 'doctor', NULL, 171, 146, 'text', '안녕하세요', '2020-01-09 22:09:38', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(930, 960, 'doctor', NULL, 171, 145, 'text', '안녕하세요', '2020-01-09 22:11:47', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(931, 962, 'user', 85, NULL, 143, 'text', '한스 됨', '2020-01-09 22:14:37', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(932, 962, 'doctor', NULL, 171, 143, 'text', 'ㅇㅋㅇㅋ', '2020-01-09 22:14:51', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(933, 964, 'user', 85, NULL, 143, 'text', 'ㅇㅋ 한스', '2020-01-09 22:17:24', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(934, 964, 'user', 85, NULL, 143, 'text', '이제 갑니다 10초뒤에', '2020-01-09 22:17:33', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(935, 964, 'user', 85, NULL, 143, 'text', '영상키셈ㄱ', '2020-01-09 22:17:37', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(936, 965, 'user', 85, NULL, 147, 'text', '안녕하세요', '2020-01-09 22:18:14', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(937, 965, 'doctor', NULL, 171, 147, 'text', '안녕하세요', '2020-01-09 22:18:16', 'no', 'on');
INSERT INTO `chat` (`id`, `request_id`, `id_type`, `send_user`, `send_doctor`, `room`, `message_type`, `message`, `created_at`, `read`, `on/off`) VALUES
	(938, 634, 'user', 77, NULL, 41, 'text', '넵', '2020-01-12 03:39:01', 'no', 'on');
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;

-- 테이블 MerDog.chat_request 구조 내보내기
CREATE TABLE IF NOT EXISTS `chat_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '채팅요청정보 인덱스',
  `user_id` int(11) NOT NULL COMMENT '사용자 회원번호',
  `pet_id` int(11) NOT NULL COMMENT '펫 회원번호 = 방 이름',
  `chat_title` text NOT NULL COMMENT '상담신청서 제목',
  `chat_content` text NOT NULL COMMENT '상담신청서 내용',
  `address` text NOT NULL COMMENT '사용자 주소',
  `latitude` float(11,6) NOT NULL DEFAULT '0.000000' COMMENT '위도 <가로 0~90 북/남> 정보',
  `longitude` float(11,6) NOT NULL DEFAULT '0.000000' COMMENT '경도 <세로 0~180> 정보',
  `distance` int(11) NOT NULL COMMENT '채팅요청 최대 거리 정보',
  `state` varchar(10) NOT NULL DEFAULT 'wait' COMMENT '채팅요청 상태 ing: 채팅중/off: 연결 실패 / wait : 대기중/ finish : 완료',
  `doctor_id` int(11) DEFAULT NULL COMMENT '매칭된 의사 번호',
  `rating` float(2,1) DEFAULT NULL COMMENT '채팅 평점 <의사를 평가하는 기준>',
  `extra_time` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_chat_request_user_info` (`user_id`),
  KEY `FK_chat_request_pet_info` (`pet_id`),
  KEY `FK_chat_request_doctor_info` (`doctor_id`),
  CONSTRAINT `FK_chat_request_doctor_info` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_info` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_chat_request_pet_info` FOREIGN KEY (`pet_id`) REFERENCES `pet_info` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_chat_request_user_info` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='채팅 요청 정보';

-- 테이블 데이터 MerDog.chat_request:~362 rows (대략적) 내보내기
/*!40000 ALTER TABLE `chat_request` DISABLE KEYS */;
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(577, 77, 35, '행동', '상벙스', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 111, NULL, NULL, '2019-11-26 18:13:46');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(578, 77, 35, '행동', 'ㄷㄴ슨ㅅ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 111, NULL, NULL, '2019-11-26 18:15:12');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(579, 77, 35, '행동', 'ehshehene', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713379, 126.889061, 15, 'off', NULL, NULL, NULL, '2019-11-26 19:38:38');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(580, 77, 35, '행동', 'ehshehene', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713379, 126.889061, 15, 'finish', 103, NULL, NULL, '2019-11-26 19:38:57');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(581, 77, 35, '행동', 'ydc7rcurcurc', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713387, 126.889061, 15, 'finish', 111, NULL, NULL, '2019-11-26 20:30:45');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(582, 77, 35, '행동', 'ftvtvbun', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 111, NULL, NULL, '2019-11-26 20:51:18');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(583, 77, 35, '행동', 'ㄱㄷㅂㄷㅇㄷㅅㄷㄱㄷㄱ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-26 21:16:21');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(584, 77, 35, '행동', 'ㄱㄷㅅㄷㅅㄷㄴㅈ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-26 21:16:29');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(585, 77, 35, '행동', 'ㄱㄷㅅㄷㅅㄷㄴㅈ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-26 21:16:49');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(586, 77, 35, '행동', 'ㄱㄷㄱㄷㅅㅈㄱ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-26 21:17:11');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(587, 77, 35, '행동', 'ㄱㄷㄱㄷㅅㅈㄱ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 111, NULL, NULL, '2019-11-26 21:18:37');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(588, 77, 35, '행동', '다시', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-26 23:10:49');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(589, 77, 35, '행동', '다시', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 111, NULL, NULL, '2019-11-26 23:11:10');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(590, 77, 35, '행동', '다시좀요', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-26 23:17:10');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(591, 77, 35, '행동', '다시좀요', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-26 23:17:41');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(592, 77, 35, '행동', '다시좀요', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-26 23:17:55');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(593, 77, 35, '행동', 'ㅡㄴㅇㄷㄴㅇ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 111, NULL, NULL, '2019-11-26 23:18:15');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(594, 80, 40, '행동', 'ㅅㄷㄹㄷ', '경기도 고양시 덕양구', 37.713287, 126.889915, 15, 'off', NULL, NULL, NULL, '2019-11-26 23:32:37');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(595, 80, 40, '행동', 'ㅅㄷㄹㄷ', '경기도 고양시 덕양구', 37.713287, 126.889915, 15, 'off', NULL, NULL, NULL, '2019-11-26 23:32:55');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(596, 80, 39, '행동', 'ㅅㄷㄹㄷ', '경기도 고양시 덕양구', 37.713287, 126.889915, 15, 'wait', NULL, NULL, NULL, '2019-11-26 23:33:40');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(597, 80, 39, '행동', 'ㅅㄷㄹㄷ', '경기도 고양시 덕양구', 37.713287, 126.889915, 15, 'off', NULL, NULL, NULL, '2019-11-26 23:34:08');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(598, 80, 39, '행동', 'ㅅㄷㄹㄷ', '경기도 고양시 덕양구', 37.713287, 126.889915, 15, 'finish', 111, NULL, NULL, '2019-11-26 23:35:12');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(599, 80, 39, '행동', 'ㅅㄱ디디', '경기도 고양시 덕양구', 37.713287, 126.889915, 15, 'off', NULL, NULL, NULL, '2019-11-26 23:38:23');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(600, 80, 39, '행동', 'ㅅㄱ디디', '경기도 고양시 덕양구', 37.713287, 126.889915, 15, 'finish', 111, NULL, NULL, '2019-11-26 23:40:27');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(601, 77, 35, '행동', '간다아', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 111, 1.0, NULL, '2019-11-26 23:50:02');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(602, 77, 35, '행동', '간다아', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 111, 5.0, NULL, '2019-11-26 23:57:51');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(603, 77, 35, '행동', 'ㄱㄷㄱㄷㄱㄷㄱㄷㄱㄷㄱ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 111, 0.5, NULL, '2019-11-27 00:03:35');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(604, 80, 39, '행동', '디디', '경기도 고양시 덕양구', 37.713287, 126.889915, 15, 'wait', NULL, NULL, NULL, '2019-11-27 20:17:48');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(605, 80, 39, '행동', '디디', '경기도 고양시 덕양구', 37.713287, 126.889915, 15, 'off', NULL, NULL, NULL, '2019-11-27 20:17:59');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(606, 80, 39, '행동', '디디ㄷㄱㅈ디', '경기도 고양시 덕양구', 37.713287, 126.889915, 15, 'wait', NULL, NULL, NULL, '2019-11-27 20:18:36');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(607, 80, 39, '행동', '디디ㄷㄱㅈ디', '경기도 고양시 덕양구', 37.713287, 126.889915, 100, 'wait', NULL, NULL, NULL, '2019-11-27 20:18:46');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(608, 80, 39, '행동', '디디ㄷㄱㅈ디', '경기도 고양시 덕양구', 37.713287, 126.889915, 100, 'wait', NULL, NULL, NULL, '2019-11-27 20:20:59');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(609, 80, 39, '행동', '디디ㄷㄱㅈ디', '경기도 고양시 덕양구', 37.713287, 126.889915, 100, 'off', NULL, NULL, NULL, '2019-11-27 20:21:48');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(610, 80, 39, '행동', 'ㅈㄷㄹ', '경기도 고양시 덕양구', 37.713287, 126.889915, 100, 'wait', NULL, NULL, NULL, '2019-11-27 20:37:53');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(611, 80, 39, '행동', 'ㅈㄷㄹ', '경기도 고양시 덕양구', 37.713287, 126.889915, 100, 'finish', 111, NULL, NULL, '2019-11-27 20:38:28');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(612, 80, 39, '행동', 'ㅈㄷㄹ', '경기도 고양시 덕양구', 37.713287, 126.889915, 100, 'off', NULL, NULL, NULL, '2019-11-27 20:39:30');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(613, 80, 39, '행동', 'ㅈㄷㄹ', '경기도 고양시 덕양구', 37.713287, 126.889915, 100, 'finish', 111, NULL, NULL, '2019-11-27 20:40:29');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(614, 80, 39, '행동', '하이', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-28 16:52:51');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(615, 80, 39, '행동', '하이', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'wait', NULL, NULL, NULL, '2019-11-28 16:53:40');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(616, 80, 39, '행동', '하이', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-28 16:54:19');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(617, 80, 39, '행동', '하이', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-28 16:54:29');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(618, 80, 39, '행동', '하이', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-28 16:56:56');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(619, 80, 39, '행동', '하이', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-28 16:57:11');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(620, 80, 39, '행동', '하이', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'wait', NULL, NULL, NULL, '2019-11-28 16:58:33');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(621, 78, 34, '행동', 'ㅗㅛㅑㅑㅇ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713379, 126.889061, 15, 'off', NULL, NULL, NULL, '2019-11-28 16:59:31');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(622, 78, 34, '행동', 'ㅗㅛㅑㅑㅇ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713379, 126.889061, 15, 'off', NULL, NULL, NULL, '2019-11-28 17:00:08');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(623, 78, 34, '행동', 'ㅗㅛㅑㅑㅇ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713379, 126.889061, 15, 'off', NULL, NULL, NULL, '2019-11-28 17:00:13');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(624, 78, 34, '행동', 'ㅎㅎ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713387, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-28 17:03:08');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(625, 80, 39, '행동', '하이', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 111, NULL, NULL, '2019-11-28 17:05:16');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(626, 80, 39, '행동', 'ㄷㄱㅈ디', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-28 17:09:14');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(627, 78, 34, '행동', 'ㅎㅎ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713379, 126.889076, 15, 'finish', 111, NULL, NULL, '2019-11-28 17:10:51');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(628, 80, 39, '행동', '지디', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-28 17:18:04');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(629, 80, 39, '행동', '지디', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-28 17:18:26');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(630, 80, 39, '행동', '지디', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-11-28 17:18:58');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(631, 80, 39, '행동', '늗', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'wait', NULL, NULL, NULL, '2019-11-28 17:19:28');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(632, 77, 35, '행동', 'whshcjee', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 111, 4.0, NULL, '2019-11-28 17:29:11');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(633, 80, 39, '행동', '늗ㅡ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 111, NULL, NULL, '2019-11-28 18:15:41');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(634, 77, 41, '행동', '받아줭', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692005, 126.769379, 15, 'finish', 111, 5.0, NULL, '2019-12-01 20:42:10');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(635, 77, 35, '행동', '성윤형 받아주세요', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692013, 126.769363, 15, 'off', NULL, NULL, NULL, '2019-12-01 23:42:25');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(636, 77, 35, '행동', '성윤형 받아주세요', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692013, 126.769363, 100, 'off', NULL, NULL, NULL, '2019-12-01 23:47:00');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(637, 77, 35, '행동', '성윤형 받아주세요', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692013, 126.769363, 100, 'finish', 103, 5.0, NULL, '2019-12-01 23:47:28');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(638, 77, 45, '행동', 'ㄱㄷㄱㄷ', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692009, 126.769363, 15, 'finish', 111, NULL, NULL, '2019-12-02 16:48:10');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(639, 77, 46, '행동', 'ㄱㄷㄱㄷ', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692009, 126.769363, 15, 'off', NULL, NULL, NULL, '2019-12-02 16:48:39');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(640, 77, 46, '행동', 'ㄱㄷㄱㄷ', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692009, 126.769363, 15, 'off', NULL, NULL, NULL, '2019-12-02 16:49:17');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(641, 77, 46, '행동', 'ㄱㄷㄱㄷ', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692009, 126.769363, 15, 'finish', 111, NULL, NULL, '2019-12-02 16:50:12');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(642, 77, 47, '행동', 'ㄱㄷㄱㄷ', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692009, 126.769363, 15, 'finish', 111, 5.0, NULL, '2019-12-02 16:50:28');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(643, 77, 43, '행동', 'ㄱㄷㄱㄷ', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692009, 126.769363, 15, 'off', NULL, NULL, NULL, '2019-12-02 16:50:37');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(644, 77, 43, '행동', 'ㄱㄷㄱㅈㄱㄷ', '경기도 고양시 일산서구 일산1동 현중로 10', 37.691990, 126.769394, 15, 'off', NULL, NULL, NULL, '2019-12-02 16:51:11');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(645, 77, 43, '행동', 'ㄱㄷㄱㅈㄱㄷ', '경기도 고양시 일산서구 일산1동 현중로 10', 37.691990, 126.769394, 15, 'off', NULL, NULL, NULL, '2019-12-02 16:51:48');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(646, 77, 43, '기타', '받아요', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692013, 126.769379, 15, 'finish', 111, NULL, NULL, '2019-12-02 16:52:29');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(647, 77, 42, '기타', '받아요', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692013, 126.769379, 15, 'off', NULL, NULL, NULL, '2019-12-02 16:52:39');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(648, 77, 42, '기타', '받아요', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692013, 126.769379, 15, 'finish', 111, NULL, NULL, '2019-12-02 16:53:39');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(649, 77, 44, '기타', '받아요', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692013, 126.769379, 15, 'off', NULL, NULL, NULL, '2019-12-02 16:53:56');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(650, 77, 44, '기타', '받아요', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692013, 126.769379, 15, 'finish', 111, NULL, NULL, '2019-12-02 16:55:57');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(651, 77, 41, '기타', '받아요', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692013, 126.769379, 15, 'off', NULL, NULL, NULL, '2019-12-02 16:56:09');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(652, 77, 35, '행동', 'ㄱㄷㄱㄷㄱㄷ', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692001, 126.769371, 15, 'finish', 111, NULL, NULL, '2019-12-02 17:00:49');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(653, 77, 41, '행동', 'ㄱㄷㄱㄷㄱㄷ', '경기도 고양시 일산서구 일산1동 현중로 10', 37.692001, 126.769371, 15, 'off', NULL, NULL, NULL, '2019-12-02 17:01:03');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(654, 77, 35, '행동', 'djdkdkel', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 111, NULL, NULL, '2019-12-03 15:38:49');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(655, 77, 35, '행동', 'ㅋㄷㄱㄷㄱㄷㄱㄷㄱ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 111, NULL, 20, '2019-12-03 18:56:14');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(656, 77, 41, '예방접종', '네', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 111, NULL, 10, '2019-12-03 19:25:53');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(657, 78, 48, '행동', 'ㅊ허ㅓ', '고양시 대화동 성저마을7단지', 37.684383, 126.752716, 20, 'off', NULL, NULL, NULL, '2019-12-05 18:28:06');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(658, 80, 39, '수술', 'ㅂ시마이', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713474, 126.889420, 20, 'finish', 111, NULL, NULL, '2019-12-06 10:31:19');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(659, 83, 55, '영양', '아이폰이 아파용', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713470, 126.889427, 100, 'off', NULL, NULL, NULL, '2019-12-06 10:54:11');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(660, 83, 56, '질병', 'ㅎ', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713474, 126.889427, 15, 'off', NULL, NULL, NULL, '2019-12-06 10:55:55');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(661, 83, 56, '행동', '김ㅎ링', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713467, 126.889435, 15, 'off', NULL, NULL, NULL, '2019-12-06 10:56:49');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(662, 83, 56, '행동', '김ㅎ링', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713467, 126.889435, 15, 'off', NULL, NULL, NULL, '2019-12-06 10:57:16');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(663, 83, 55, '행동', 'ㅎ', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713455, 126.889397, 15, 'off', NULL, NULL, NULL, '2019-12-06 10:58:18');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(664, 83, 55, '행동', 'ㅎ', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713455, 126.889397, 15, 'wait', NULL, NULL, NULL, '2019-12-06 10:58:52');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(665, 83, 56, '행동', 'ㅎ', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713455, 126.889397, 15, 'wait', NULL, NULL, NULL, '2019-12-06 10:59:43');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(666, 83, 55, '행동', 'ㅎ', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713467, 126.889435, 15, 'off', NULL, NULL, NULL, '2019-12-06 10:59:50');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(667, 83, 55, '한방/재활', '안녕하세융', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713467, 126.889435, 10, 'off', NULL, NULL, NULL, '2019-12-06 11:00:25');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(668, 84, 57, '행동', 'ㄹ', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713490, 126.889442, 15, 'off', NULL, NULL, NULL, '2019-12-06 11:01:04');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(669, 84, 57, '행동', 'ㄹ', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713490, 126.889442, 15, 'off', NULL, NULL, NULL, '2019-12-06 11:01:14');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(670, 84, 57, '행동', 'ㆍㅅㆍㅅㆍㅅ', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713478, 126.889435, 15, 'off', NULL, NULL, NULL, '2019-12-06 11:02:31');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(671, 84, 57, '행동', 'ㆍㅅㆍㅅㆍㅅ', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713478, 126.889435, 15, 'off', NULL, NULL, NULL, '2019-12-06 11:03:28');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(672, 84, 57, '행동', 'ㆍㅅㆍㅅㆍㅅ', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713478, 126.889435, 15, 'off', NULL, NULL, NULL, '2019-12-06 11:03:36');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(673, 83, 55, '수술', 'twts', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713478, 126.889435, 15, 'finish', 117, 5.0, 10, '2019-12-06 11:05:40');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(674, 83, 56, '수술', '꼬꼬', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713478, 126.889435, 15, 'off', NULL, NULL, NULL, '2019-12-06 11:06:20');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(675, 83, 56, '행동', 'ㅎㅇㄹ', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713470, 126.889427, 15, 'off', NULL, NULL, NULL, '2019-12-06 11:11:24');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(676, 83, 55, '행동', '고', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713470, 126.889427, 15, 'finish', 117, 5.0, NULL, '2019-12-06 11:13:04');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(677, 83, 56, '행동', 'ㅅㅅㅅ', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713478, 126.889435, 15, 'off', NULL, NULL, NULL, '2019-12-06 11:13:56');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(678, 83, 55, '행동', '고', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713470, 126.889427, 15, 'off', NULL, NULL, NULL, '2019-12-06 11:15:58');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(679, 83, 55, '행동', '고', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713470, 126.889427, 15, 'off', NULL, NULL, NULL, '2019-12-06 11:17:13');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(680, 83, 55, '행동', '고', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713470, 126.889427, 15, 'off', NULL, NULL, NULL, '2019-12-06 11:17:26');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(681, 83, 55, '행동', '고', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713470, 126.889427, 15, 'off', NULL, NULL, NULL, '2019-12-06 11:17:36');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(682, 83, 55, '행동', '고', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713470, 126.889427, 15, 'off', NULL, NULL, NULL, '2019-12-06 11:18:08');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(683, 83, 55, '행동', '고', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713470, 126.889435, 15, 'off', NULL, NULL, NULL, '2019-12-06 11:18:42');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(684, 83, 55, '행동', '고허', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713470, 126.889435, 15, 'off', NULL, NULL, NULL, '2019-12-06 11:18:54');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(685, 83, 55, '행동', '고허ㅓ랴랄', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713470, 126.889435, 15, 'off', NULL, NULL, NULL, '2019-12-06 11:19:06');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(686, 83, 55, '행동', '고허ㅓ랴랄', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713470, 126.889435, 15, 'off', NULL, NULL, NULL, '2019-12-06 11:19:37');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(687, 83, 55, '행동', 'ㅎㅇㄹ', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713463, 126.889420, 15, 'finish', 117, 0.0, 10, '2019-12-06 11:26:47');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(688, 83, 55, '한방/재활', 'ctctxt\n7gigihi\njjibbi\nononon9j\nihhiihboob\noj9jojp\nyugug7g77g\ng7g7g7g7g7g7988\nhuvuvuvuhuguguib\nijjbhollikmloiuy\njihihihojoj', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713467, 126.889420, 100, 'off', NULL, NULL, NULL, '2019-12-06 11:40:18');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(689, 83, 55, '한방/재활', 'ctctxt\n7gigihi\njjibbi\nononon9j\nihhiihboob\noj9jojp\nyugug7g77g\ng7g7g7g7g7g7988\nhuvuvuvuhuguguib\nijjbhollikmloiuy\njihihihojoj', '경기도 고양시 덕양구 대자동 동헌로 305', 37.713467, 126.889420, 100, 'off', NULL, NULL, NULL, '2019-12-06 11:40:25');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(690, 77, 62, '기타', 'ㅆㅈㄷ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-12-06 12:04:06');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(691, 77, 62, '기타', 'ㅆㅈㄷ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-12-06 12:05:02');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(692, 77, 63, '행동', 'ㄱㅈㅅㅈㅅㄷㄱㅈㅂ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-12-06 12:06:46');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(693, 77, 63, '행동', 'ㄱㅈㅅㅈㅅㄷㄱㅈㅂ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-12-06 12:07:20');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(694, 77, 63, '행동', 'ㄱㅈㅅㅈㅅㄷㄱㅈㅂ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'wait', NULL, NULL, NULL, '2019-12-06 12:07:33');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(695, 84, 57, '행동', '하잇', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-12-06 12:11:46');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(696, 84, 57, '행동', '하잇', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 117, 5.0, NULL, '2019-12-06 12:13:29');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(697, 84, 64, '행동', '시발새끼', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 117, 5.0, NULL, '2019-12-06 12:15:16');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(698, 84, 64, '행동', '디디ㅡㄱㄷㅂㄷㄱ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-12-06 12:16:12');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(699, 84, 64, '행동', '디디ㅡㄱㄷㅂㄷㄱ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-12-06 12:16:47');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(700, 84, 64, '행동', '듯드ㅡ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-12-06 12:17:30');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(701, 84, 64, '행동', '듯드ㅡ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-12-06 12:17:56');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(702, 84, 64, '행동', '듯드ㅡ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-12-06 12:18:47');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(703, 84, 57, '행동', '디ㅢㅡㄱ디ㄷ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 117, 5.0, NULL, '2019-12-06 12:20:19');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(704, 84, 64, '행동', '머냐', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-12-06 12:20:47');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(705, 84, 64, '행동', '머냐', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-12-06 12:21:34');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(706, 84, 64, '행동', '머냐', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 117, NULL, NULL, '2019-12-06 12:26:05');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(707, 84, 57, '행동', '지디ㄷ', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'finish', 111, 5.0, NULL, '2019-12-06 12:27:52');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(708, 84, 57, '행동', 'ㅅ드', '경기도 고양시 덕양구 대자동 동헌로307번길 40-3', 37.713383, 126.889069, 15, 'off', NULL, NULL, NULL, '2019-12-06 12:28:29');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(709, 84, 57, '행동', '듯ㄷ', '경기도 고양시 덕양구 화정동 880', 37.638832, 126.835602, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:06:01');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(710, 84, 57, '행동', '즏', '경기도 고양시 덕양구 화정동 880', 37.638809, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:06:28');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(711, 84, 57, '행동', '즏', '경기도 고양시 덕양구 화정동 880', 37.638809, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:06:29');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(712, 84, 64, '행동', 'ㄸㅈ', '경기도 고양시 덕양구 화정동 880', 37.638809, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:06:37');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(713, 84, 64, '행동', 'ㄸㅈ', '경기도 고양시 덕양구 화정동 880', 37.638809, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:07:05');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(714, 84, 57, '행동', 'ㄸㅈ', '경기도 고양시 덕양구 화정동 879-9', 37.638817, 126.835571, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:07:23');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(715, 84, 57, '행동', 'ㄸㅈ', '경기도 고양시 덕양구 화정동 879-9', 37.638817, 126.835571, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:07:54');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(716, 84, 57, '행동', 'ㄸㅈjko88', '경기도 고양시 덕양구 화정동 879-9', 37.638817, 126.835571, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:08:30');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(717, 84, 57, '행동', 'ㄸㅈjko88', '경기도 고양시 덕양구 화정동 879-9', 37.638817, 126.835571, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:08:59');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(718, 84, 57, '행동', 'ㄸㅈjko88', '경기도 고양시 덕양구 화정동 879-9', 37.638817, 126.835571, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:09:14');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(719, 84, 57, '행동', 'ㄸㅈjko88', '경기도 고양시 덕양구 화정동 879-9', 37.638817, 126.835571, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:10:42');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(720, 84, 57, '행동', 'ㄸㅈjko8890', '경기도 고양시 덕양구 화정동 879-9', 37.638817, 126.835571, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:11:16');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(721, 84, 57, '행동', 'ㄸㅈjko8890', '경기도 고양시 덕양구 화정동 879-9', 37.638817, 126.835571, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:11:41');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(722, 84, 57, '행동', 'ㄸㅈjko8890111', '경기도 고양시 덕양구 화정동 879-9', 37.638817, 126.835571, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:11:57');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(723, 84, 57, '행동', 'ㄸㅈjko8890111', '경기도 고양시 덕양구 화정동 879-9', 37.638817, 126.835571, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:15:21');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(724, 84, 57, '행동', 'ㄸㅈjko88901112', '경기도 고양시 덕양구 화정동 879-9', 37.638817, 126.835571, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:16:01');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(725, 84, 57, '행동', 'ㄸㅈjko889011123', '경기도 고양시 덕양구 화정동 879-9', 37.638817, 126.835571, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:16:26');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(726, 84, 57, '행동', 'ㄸㅈjko889011123', '경기도 고양시 덕양구 화정동 879-9', 37.638817, 126.835571, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:21:00');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(727, 84, 57, '행동', '4', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:21:55');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(728, 84, 57, '행동', '6', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:22:39');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(729, 84, 57, '행동', '6', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:25:02');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(730, 84, 57, '행동', '6', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:25:27');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(731, 84, 57, '행동', '77', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:26:33');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(732, 84, 57, '행동', '7888', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:30:07');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(733, 84, 57, '행동', '7888', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:30:36');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(734, 84, 57, '행동', '78889', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:31:27');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(735, 84, 57, '행동', '7888900', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'wait', NULL, NULL, NULL, '2019-12-06 14:31:56');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(736, 84, 57, '행동', '7888900', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:33:11');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(737, 84, 57, '행동', '7888900', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:33:40');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(738, 84, 57, '행동', '7888900', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:34:08');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(739, 84, 57, '행동', '7888900', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:34:58');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(740, 84, 57, '행동', '1', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:36:19');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(741, 84, 57, '행동', '2', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:36:56');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(742, 84, 57, '행동', '3', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:38:37');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(743, 84, 57, '행동', '3', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:38:45');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(744, 84, 57, '행동', '3', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:38:49');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(745, 84, 57, '행동', '3', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:38:53');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(746, 84, 57, '행동', '3', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:38:59');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(747, 84, 57, '행동', '3', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'wait', NULL, NULL, NULL, '2019-12-06 14:39:03');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(748, 84, 57, '행동', '3', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:39:20');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(749, 84, 57, '행동', '3', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:39:25');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(750, 84, 57, '행동', '3', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:39:30');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(751, 84, 57, '행동', '3', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:41:46');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(752, 84, 57, '행동', '1', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:43:10');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(753, 84, 57, '행동', '2', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:43:38');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(754, 84, 57, '행동', '1', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:45:03');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(755, 84, 57, '행동', '2', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:45:37');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(756, 84, 57, '행동', '2', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:46:00');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(757, 84, 57, '행동', '3', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:46:27');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(758, 84, 57, '행동', '3', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:46:42');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(759, 84, 57, '행동', '3', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:46:48');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(760, 84, 57, '행동', '3', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:46:53');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(761, 84, 57, '행동', '3', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:47:36');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(762, 84, 57, '행동', '4', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:48:05');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(763, 84, 57, '행동', '4', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:48:29');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(764, 84, 57, '행동', '4', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:49:31');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(765, 84, 57, '행동', '4', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:50:18');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(766, 84, 57, '행동', '5', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:50:26');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(767, 84, 57, '행동', '5', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:50:56');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(768, 84, 57, '행동', '6', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:51:32');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(769, 84, 57, '행동', '7', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:52:02');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(770, 84, 57, '행동', '8', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:52:30');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(771, 84, 57, '행동', '9', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:52:49');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(772, 84, 57, '행동', '10', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:53:02');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(773, 84, 57, '행동', '11', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:53:09');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(774, 84, 57, '행동', '12', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:53:16');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(775, 84, 57, '행동', '13', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:53:22');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(776, 84, 57, '행동', '13', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:53:27');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(777, 84, 57, '행동', '14', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:53:33');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(778, 84, 57, '행동', '15', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:53:52');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(779, 84, 57, '행동', '16', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:54:09');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(780, 84, 57, '행동', '17', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:54:17');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(781, 84, 57, '행동', '18', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:54:27');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(782, 84, 57, '행동', '19', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:54:34');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(783, 84, 57, '행동', '20', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:54:40');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(784, 84, 57, '행동', '21', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:54:48');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(785, 84, 57, '행동', '22', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:54:55');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(786, 84, 57, '행동', '23', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:55:00');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(787, 84, 57, '행동', '24', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:55:09');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(788, 84, 57, '행동', '25', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:55:16');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(789, 84, 57, '행동', '26', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:55:21');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(790, 84, 57, '행동', '27', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:55:30');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(791, 84, 57, '행동', '27', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'off', NULL, NULL, NULL, '2019-12-06 14:55:44');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(792, 84, 57, '행동', '1', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:58:21');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(793, 84, 57, '행동', '2', '경기도 고양시 덕양구 화정동 879-9', 37.638817, 126.835579, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:58:58');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(794, 84, 57, '행동', '3', '경기도 고양시 덕양구 화정동 879-9', 37.638817, 126.835579, 15, 'finish', 111, 5.0, NULL, '2019-12-06 14:59:14');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(795, 84, 57, '행동', '4', '경기도 고양시 덕양구 화정동 880', 37.638828, 126.835587, 15, 'wait', NULL, NULL, NULL, '2019-12-06 14:59:32');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(796, 84, 57, '행동', '4', '경기도 고양시 덕양구 화정동 880', 37.638828, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-06 15:03:52');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(797, 84, 57, '행동', '4', '경기도 고양시 덕양구 화정동 880', 37.638828, 126.835587, 15, 'finish', 111, NULL, NULL, '2019-12-06 15:04:00');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(798, 84, 64, '행동', '안녕하세요', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-08 10:15:52');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(799, 84, 57, '행동', '왜지?', '경기도 고양시 덕양구 화정동 879-9', 37.638832, 126.835579, 15, 'wait', NULL, NULL, NULL, '2019-12-08 10:16:09');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(800, 84, 57, '행동', '왜지?', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'wait', NULL, NULL, NULL, '2019-12-08 10:16:43');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(801, 84, 57, '행동', '안녕하세요', '경기도 고양시 덕양구 화정동 880', 37.638821, 126.835594, 15, 'off', NULL, NULL, NULL, '2019-12-08 10:25:45');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(802, 84, 57, '행동', '안녕하세요', '경기도 고양시 덕양구 화정동 880', 37.638836, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-08 10:26:14');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(803, 84, 64, '행동', '안녕하세요', '경기도 고양시 덕양구 화정동 880', 37.638836, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-08 10:26:17');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(804, 84, 57, '행동', '안녕하세요', '경기도 고양시 덕양구 화정동 880', 37.638836, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-08 10:26:18');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(805, 84, 57, '행동', '안녕하세요', '경기도 고양시 덕양구 화정동 880', 37.638836, 126.835587, 15, 'off', NULL, NULL, NULL, '2019-12-08 10:26:18');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(806, 84, 57, '행동', '안녕하세요\nㅡ', '경기도 고양시 덕양구 화정동 880', 37.638836, 126.835587, 15, 'wait', NULL, NULL, NULL, '2019-12-08 10:26:25');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(807, 84, 57, '행동', '안녕하세요\nㅡ', '경기도 고양시 덕양구 화정동 880', 37.638809, 126.835602, 15, 'off', NULL, NULL, NULL, '2019-12-08 10:26:51');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(808, 84, 57, '행동', '안녕하세요\nㅡ', '경기도 고양시 덕양구 화정동 880', 37.638809, 126.835602, 15, 'off', NULL, NULL, NULL, '2019-12-08 10:28:59');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(809, 84, 57, '행동', '안녕하세요\nㅡ', '경기도 고양시 덕양구 화정동 880', 37.638809, 126.835594, 15, 'off', NULL, NULL, NULL, '2019-12-08 10:29:47');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(810, 84, 57, '행동', 'ㅅㄴㄷ', '경기도 고양시 덕양구 화정동 880', 37.638824, 126.835609, 15, 'off', NULL, NULL, NULL, '2019-12-08 10:57:10');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(811, 84, 57, '행동', 'ㅅㄴㄷ', '경기도 고양시 덕양구 화정동 880', 37.638824, 126.835609, 15, 'wait', NULL, NULL, NULL, '2019-12-08 11:01:17');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(812, 84, 57, '행동', 'ㅅㄴㄷ', '경기도 고양시 덕양구 화정동 880', 37.638824, 126.835609, 15, 'wait', NULL, NULL, NULL, '2019-12-08 11:21:56');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(813, 84, 57, '행동', 'ㅅㄴㄷ', '경기도 고양시 덕양구 화정동 880', 37.638824, 126.835609, 15, 'off', NULL, NULL, NULL, '2019-12-08 12:40:31');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(814, 84, 57, '행동', '아기모딱', '경기도 고양시 덕양구 화정동 880', 37.638824, 126.835609, 15, 'wait', NULL, NULL, NULL, '2019-12-08 15:01:16');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(815, 84, 57, '행동', '아ㄷ', '경기도 고양시 덕양구 화정동 880', 37.638824, 126.835609, 15, 'wait', NULL, NULL, NULL, '2019-12-08 15:09:43');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(816, 84, 64, '행동', '아ㄷ', '경기도 고양시 덕양구 화정동 880', 37.638824, 126.835609, 15, 'wait', NULL, NULL, NULL, '2019-12-08 15:09:59');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(817, 84, 64, '행동', '아ㄷ', '경기도 고양시 덕양구 화정동 880', 37.638824, 126.835609, 15, 'wait', NULL, NULL, NULL, '2019-12-08 15:10:30');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(818, 84, 64, '행동', '아ㄷ', '경기도 고양시 덕양구 화정동 880', 37.638824, 126.835609, 15, 'wait', NULL, NULL, NULL, '2019-12-08 15:17:09');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(819, 84, 64, '행동', '아ㄷ', '경기도 고양시 덕양구 화정동 880', 37.638824, 126.835609, 15, 'wait', NULL, NULL, NULL, '2019-12-08 15:19:18');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(820, 84, 64, '행동', '아ㄷk', '경기도 고양시 덕양구 화정동 880', 37.638824, 126.835609, 15, 'wait', NULL, NULL, NULL, '2019-12-08 15:42:26');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(821, 84, 64, '행동', '아ㄷk 호우', '경기도 고양시 덕양구 화정동 880', 37.638824, 126.835609, 15, 'wait', NULL, NULL, NULL, '2019-12-08 15:42:48');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(822, 84, 57, '행동', '아니', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'wait', NULL, NULL, NULL, '2019-12-08 16:04:31');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(823, 84, 57, '행동', '시바', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'wait', NULL, NULL, NULL, '2019-12-08 16:47:59');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(824, 84, 57, '행동', '시바ㄷ', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'wait', NULL, NULL, NULL, '2019-12-08 16:55:14');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(825, 84, 57, '행동', '시바ㄷ', '경기도 고양시 덕양구 화정동 879-9', 37.638821, 126.835579, 15, 'wait', NULL, NULL, NULL, '2019-12-08 16:56:15');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(826, 84, 64, '행동', 'ㅅㄷ', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'wait', NULL, NULL, NULL, '2019-12-08 16:56:58');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(827, 84, 64, '행동', 'ㅅㄷ', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'wait', NULL, NULL, NULL, '2019-12-08 16:58:40');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(828, 84, 65, '행동', '하이', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'wait', NULL, NULL, NULL, '2019-12-08 17:00:35');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(829, 84, 65, '행동', '하이', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'wait', NULL, NULL, NULL, '2019-12-08 17:02:18');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(830, 84, 65, '행동', '하이', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'wait', NULL, NULL, NULL, '2019-12-08 17:06:00');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(831, 84, 65, '행동', '하이', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'wait', NULL, NULL, NULL, '2019-12-08 17:06:46');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(832, 84, 65, '행동', '하이', '경기도 고양시 덕양구 화정동 880', 37.638813, 126.835587, 15, 'wait', NULL, NULL, NULL, '2019-12-08 17:11:47');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(833, 84, 57, '행동', '하이', '경기도 고양시 덕양구 화정동 880', 37.638809, 126.835602, 15, 'wait', NULL, NULL, NULL, '2019-12-08 19:45:50');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(834, 84, 57, '행동', '하이', '경기도 고양시 덕양구 화정동 880', 37.638809, 126.835602, 15, 'wait', NULL, NULL, NULL, '2019-12-08 19:55:17');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(835, 84, 64, '행동', 'ㄴㄷ', '경기도 고양시 덕양구 화정1동 879-8', 37.638786, 126.835571, 15, 'finish', 111, NULL, NULL, '2019-12-10 00:46:20');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(836, 84, 57, '행동', 'ck', '경기도 고양시 덕양구 화정동 879-9', 37.638824, 126.835579, 15, 'finish', 111, NULL, NULL, '2019-12-11 00:32:26');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(837, 85, 72, '영양', 'ㄱㄱㄱ', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690952, 126.762428, 15, 'off', NULL, NULL, NULL, '2019-12-12 01:48:47');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(838, 84, 57, '행동', 'ㅅㄷ', '경기도 고양시 덕양구 화정동 880', 37.638821, 126.835587, 15, 'finish', 111, NULL, NULL, '2019-12-12 14:03:48');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(839, 78, 71, '행동', '이용권테스트', '고양시 대화동 성저마을7단지', 37.684334, 126.752670, 15, 'off', NULL, NULL, NULL, '2019-12-13 00:16:28');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(840, 85, 72, '행동', 'ㅇㅇ', '고양시 대화동 성저마을7단지', 37.684357, 126.752686, 15, 'finish', 147, NULL, NULL, '2019-12-13 00:18:20');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(841, 78, 71, '행동', 'ㄷ극', '서울특별시 강남구 신사동 569-22', 37.523876, 127.026962, 15, 'finish', 117, NULL, NULL, '2019-12-13 11:05:02');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(842, 78, 74, '행동', 'ㄷ극hej2', '서울특별시 강남구 신사동 569-22', 37.523876, 127.026962, 15, 'off', NULL, NULL, NULL, '2019-12-13 11:07:36');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(843, 78, 74, '행동', 'ㄷ극hej2', '서울특별시 강남구 신사동 569-22', 37.523876, 127.026962, 15, 'finish', 111, NULL, 10, '2019-12-13 11:07:47');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(844, 84, 57, '행동', '이현 개새', '경기도 용인시 기흥구 마북동 502-2', 37.297752, 127.105209, 15, 'wait', NULL, NULL, NULL, '2019-12-16 18:31:46');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(845, 84, 57, '행동', '이현 개새6', '경기도 용인시 기흥구 마북동 502-2', 37.297752, 127.105209, 15, 'finish', 111, NULL, NULL, '2019-12-16 18:34:27');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(846, 84, 57, '행동', '상담', '경기도 용인시 기흥구 보정동 죽전로15번길 15-15', 37.321873, 127.109161, 15, 'finish', 111, 5.0, NULL, '2019-12-17 17:47:51');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(847, 84, 57, '행동', '상담', '경기도 용인시 기흥구 보정동 213-7', 37.321911, 127.109169, 15, 'wait', NULL, NULL, NULL, '2019-12-17 17:52:10');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(848, 84, 57, '행동', '상담', '경기도 용인시 기흥구 보정동 213-7', 37.321911, 127.109169, 15, 'finish', 111, NULL, NULL, '2019-12-17 17:52:31');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(849, 84, 64, '행동', '상담', '경기도 용인시 기흥구 보정동 213-7', 37.321911, 127.109169, 15, 'wait', NULL, NULL, NULL, '2019-12-17 17:54:50');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(850, 84, 64, '행동', '상담', '경기도 용인시 기흥구 보정동 213-7', 37.321911, 127.109169, 15, 'wait', NULL, NULL, NULL, '2019-12-17 18:09:06');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(851, 84, 64, '행동', '상담', '경기도 용인시 기흥구 보정동 213-7', 37.321911, 127.109169, 15, 'wait', NULL, NULL, NULL, '2019-12-17 18:12:06');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(852, 84, 64, '행동', '상담', '경기도 용인시 기흥구 보정동 213-7', 37.321911, 127.109169, 15, 'wait', NULL, NULL, NULL, '2019-12-17 18:14:18');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(853, 84, 64, '행동', '상담', '경기도 용인시 기흥구 보정동 213-7', 37.321911, 127.109169, 15, 'wait', NULL, NULL, NULL, '2019-12-17 18:16:01');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(854, 84, 64, '행동', '상담', '경기도 용인시 기흥구 보정동 213-7', 37.321911, 127.109169, 15, 'finish', 111, NULL, NULL, '2019-12-17 18:16:18');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(855, 84, 57, '행동', '상담', '경기도 용인시 기흥구 보정동 213-7', 37.321911, 127.109169, 15, 'wait', NULL, NULL, NULL, '2019-12-17 18:16:44');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(856, 84, 65, '행동', '상담', '경기도 용인시 기흥구 보정동 213-7', 37.321911, 127.109169, 15, 'wait', NULL, NULL, NULL, '2019-12-17 18:26:03');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(857, 84, 65, '행동', '상담', '경기도 용인시 기흥구 보정동 213-7', 37.321911, 127.109169, 15, 'wait', NULL, NULL, NULL, '2019-12-17 18:34:55');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(858, 84, 65, '행동', '상담', '경기도 용인시 기흥구 보정동 213-7', 37.321911, 127.109169, 15, 'wait', NULL, NULL, NULL, '2019-12-17 18:35:48');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(859, 84, 57, '행동', '싣', '경기도 용인시 기흥구 마북동 548-5', 37.301338, 127.111298, 15, 'off', NULL, NULL, NULL, '2019-12-18 13:27:35');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(860, 84, 64, '행동', '싣', '경기도 용인시 기흥구 마북동 548-5', 37.301338, 127.111298, 15, 'off', NULL, NULL, NULL, '2019-12-18 13:27:39');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(861, 84, 64, '행동', '싣', '경기도 용인시 기흥구 마북동 548-5', 37.301338, 127.111298, 15, 'finish', 111, NULL, NULL, '2019-12-18 13:28:16');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(862, 84, 57, '행동', 'c', '경기도 용인시 기흥구 마북동 548-8', 37.301304, 127.111313, 15, 'finish', 111, NULL, NULL, '2019-12-18 14:13:29');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(863, 84, 57, '행동', 'c', '경기도 용인시 기흥구 마북동 548-8', 37.301304, 127.111313, 15, 'finish', 111, NULL, NULL, '2019-12-18 14:37:56');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(864, 78, 75, '행동', '종료?', '고양시 대화동 성저마을7단지', 37.684364, 126.752670, 15, 'wait', NULL, NULL, NULL, '2019-12-18 19:12:29');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(865, 84, 57, '행동', 'ㄷ슫ㅊ', '경기도 수원시 영통구 이의동 340-4', 37.292904, 127.048691, 20, 'off', NULL, NULL, NULL, '2019-12-19 20:20:15');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(866, 84, 57, '행동', 'ㄷ슫ㅊ', '경기도 수원시 영통구 이의동 340-4', 37.292904, 127.048691, 100, 'wait', NULL, NULL, NULL, '2019-12-19 20:20:18');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(867, 84, 57, '행동', 'ㄷ슫ㅊ', '경기도 수원시 영통구 이의동 340-4', 37.292904, 127.048691, 100, 'finish', 111, NULL, NULL, '2019-12-19 20:21:00');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(868, 84, 64, '행동', 'ㄷ슫ㅊ.', '경기도 수원시 영통구 이의동 340-4', 37.292900, 127.048698, 100, 'finish', 111, NULL, NULL, '2019-12-19 21:16:40');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(869, 84, 65, '행동', 'ㄷ슫ㅊ.', '경기도 수원시 영통구 이의동 340-4', 37.292900, 127.048698, 100, 'finish', 111, NULL, NULL, '2019-12-19 21:23:19');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(870, 84, 57, '행동', 'ㄷ슫ㅊ.', '경기도 수원시 영통구 이의동 340-4', 37.292900, 127.048698, 100, 'wait', NULL, NULL, NULL, '2019-12-19 21:41:44');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(871, 84, 57, '행동', 'rh4j3j', '경기도 용인시 기흥구 죽전로', 37.320190, 127.110130, 15, 'finish', 111, NULL, NULL, '2019-12-21 19:04:36');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(872, 84, 57, '행동', 'be', '경기도 용인시 기흥구 마북동 548-8', 37.301350, 127.111282, 15, 'finish', 111, NULL, 10, '2019-12-25 03:00:33');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(873, 84, 57, '행동', '아', '경기도 수원시 팔달구 인계동 1041-6', 37.265423, 127.030701, 100, 'wait', NULL, NULL, NULL, '2019-12-29 15:11:48');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(874, 84, 57, '행동', '아', '경기도 수원시 팔달구 인계동 1041-6', 37.265423, 127.030701, 100, 'finish', 143, NULL, NULL, '2019-12-29 15:12:50');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(875, 84, 57, '행동', '시디', '경기도 용인시 기흥구 마북동 510-9', 37.298195, 127.107971, 100, 'wait', NULL, NULL, NULL, '2019-12-29 18:57:39');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(876, 84, 57, '행동', '시디', '경기도 용인시 기흥구 마북동 510-9', 37.298195, 127.107971, 100, 'finish', 143, NULL, NULL, '2019-12-29 18:58:12');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(877, 78, 100, '질병', '강아지가 아파요!!', '경기도 고양시 일산서구 탄현동 1563-6', 37.691139, 126.762436, 100, 'finish', 111, 3.0, NULL, '2020-01-02 18:38:57');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(878, 78, 100, '질병', '아파요..', '경기도 고양시 일산서구 일산1동 일현로 41', 37.691078, 126.762398, 100, 'off', NULL, NULL, NULL, '2020-01-02 19:55:31');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(879, 78, 100, '질병', '아파요..', '경기도 고양시 일산서구 탄현동 1563-6', 37.691277, 126.762459, 100, 'off', NULL, NULL, NULL, '2020-01-02 19:56:31');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(880, 78, 101, '질병', '아파요...', '경기도 고양시 일산서구 일산1동 일현로 41', 37.691044, 126.762466, 100, 'finish', 171, 2.5, NULL, '2020-01-02 20:04:43');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(881, 78, 100, '수술', '아파요...', '경기도 고양시 일산서구 탄현동 1563-6', 37.691227, 126.762390, 100, 'finish', 171, NULL, NULL, '2020-01-02 20:06:51');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(882, 85, 102, '행동', '아파요..', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690987, 126.762444, 15, 'finish', 171, NULL, NULL, '2020-01-02 20:46:00');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(883, 84, 57, '행동', '안녕하세요', '경기도 용인시 기흥구 언남동 419-2', 37.292740, 127.121544, 100, 'finish', 171, NULL, NULL, '2020-01-02 22:33:07');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(884, 85, 102, '질병', '가능하신분', '고양시 대화동 성저마을7단지', 37.684364, 126.752625, 100, 'wait', NULL, NULL, NULL, '2020-01-07 18:36:49');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(885, 85, 102, '질병', '테스트 ㄱ', '고양시 대화동 성저마을7단지', 37.684364, 126.752625, 100, 'off', NULL, NULL, NULL, '2020-01-07 19:29:19');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(886, 85, 104, '행동', '테스트임', '고양시 대화동 성저마을7단지', 37.684345, 126.752670, 100, 'off', NULL, NULL, NULL, '2020-01-07 19:40:59');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(887, 85, 104, '행동', '테스트임', '고양시 대화동 성저마을7단지', 37.684345, 126.752670, 100, 'finish', 143, NULL, NULL, '2020-01-07 19:41:34');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(888, 84, 57, '행동', '시', '경기도 용인시 기흥구 마북동 548-5', 37.301331, 127.111343, 15, 'off', NULL, NULL, NULL, '2020-01-07 20:55:46');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(889, 84, 57, '행동', '시', '경기도 용인시 기흥구 마북동 548-5', 37.301331, 127.111343, 100, 'finish', 171, NULL, NULL, '2020-01-07 20:55:57');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(890, 84, 64, '행동', '시', '경기도 용인시 기흥구 마북동 548-5', 37.301331, 127.111343, 100, 'finish', 171, 5.0, NULL, '2020-01-07 20:57:39');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(891, 84, 65, '행동', 'ㅅㄷ', '경기도 용인시 기흥구 마북동 548-5', 37.301315, 127.111336, 15, 'off', NULL, NULL, NULL, '2020-01-07 21:00:35');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(892, 84, 65, '행동', 'ㅅㄷ', '경기도 용인시 기흥구 마북동 548-5', 37.301315, 127.111336, 100, 'finish', 171, NULL, NULL, '2020-01-07 21:00:44');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(893, 84, 64, '행동', 'ㅅㄴ', '경기도 용인시 기흥구 마북동 548-5', 37.301327, 127.111343, 100, 'finish', 171, 5.0, NULL, '2020-01-07 21:02:24');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(894, 84, 64, '행동', '지', '경기도 용인시 기흥구 마북동 548-5', 37.301331, 127.111343, 100, 'finish', 171, 5.0, NULL, '2020-01-07 21:06:57');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(895, 84, 64, '행동', '딪ㄱㄴ', '경기도 용인시 기흥구 마북동 548-5', 37.301334, 127.111336, 15, 'off', NULL, NULL, NULL, '2020-01-07 21:08:57');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(896, 84, 64, '행동', '딪ㄱㄴ', '경기도 용인시 기흥구 마북동 548-5', 37.301334, 127.111336, 100, 'finish', 171, NULL, NULL, '2020-01-07 21:09:07');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(897, 85, 103, '행동', '강아지가 발을 절어요', '경기도 고양시 일산서구 대화동 2388', 37.683064, 126.754723, 100, 'finish', 103, NULL, NULL, '2020-01-08 14:10:31');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(898, 85, 102, '행동', '받아죠', '경기도 고양시 일산서구 대화동 2388', 37.683079, 126.754707, 100, 'off', NULL, NULL, NULL, '2020-01-08 14:45:59');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(899, 85, 102, '행동', '받아죠', '경기도 고양시 일산서구 대화동 2388', 37.683079, 126.754707, 100, 'finish', 103, NULL, NULL, '2020-01-08 14:47:03');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(900, 84, 64, '행동', '지ㅣ', '경기도 용인시 기흥구 마북동 548-5', 37.301327, 127.111320, 15, 'off', NULL, NULL, NULL, '2020-01-08 15:51:18');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(901, 84, 64, '행동', '지ㅣ', '경기도 용인시 기흥구 마북동 548-5', 37.301327, 127.111320, 100, 'finish', 171, NULL, NULL, '2020-01-08 15:51:28');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(902, 84, 57, '행동', '지ㅣ', '경기도 용인시 기흥구 마북동 548-5', 37.301327, 127.111320, 100, 'finish', 171, NULL, NULL, '2020-01-08 15:51:56');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(903, 85, 102, '행동', '받아줘열', '경기도 고양시 일산서구 대화동 2388', 37.683067, 126.754715, 100, 'finish', 171, NULL, NULL, '2020-01-08 16:03:22');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(904, 85, 102, '행동', '받아줘열', '경기도 고양시 일산서구 대화동 2388', 37.683064, 126.754723, 100, 'off', NULL, NULL, NULL, '2020-01-08 16:33:32');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(905, 85, 102, '행동', '받아줘열', '경기도 고양시 일산서구 대화동 2388', 37.683064, 126.754723, 100, 'off', NULL, NULL, NULL, '2020-01-08 16:34:00');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(906, 85, 102, '행동', '받아줘열', '경기도 고양시 일산서구 대화동 2388', 37.683064, 126.754723, 100, 'off', NULL, NULL, NULL, '2020-01-08 16:34:25');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(907, 85, 102, '행동', '받아줘열', '경기도 고양시 일산서구 대화동 2388', 37.683064, 126.754723, 100, 'finish', 171, NULL, NULL, '2020-01-08 16:35:03');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(908, 77, 105, '행동', 'djfhfuf', '서울특별시 강남구 신사동 569-9', 37.523922, 127.026924, 15, 'finish', 171, NULL, NULL, '2020-01-09 11:34:32');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(909, 77, 105, '행동', 'rkrkrke', '서울특별시 강남구 신사동 569-9', 37.523918, 127.026939, 15, 'finish', 171, NULL, NULL, '2020-01-09 12:13:36');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(910, 85, 103, '행동', '콩이가 다리를 절어요', '고양시 대화동 성저마을7단지', 37.684364, 126.752701, 100, 'finish', 171, 3.5, NULL, '2020-01-09 15:06:31');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(911, 85, 106, '행동', '강아지가 다리를 절어요', '고양시 대화동 성저마을7단지', 37.684361, 126.752678, 100, 'off', NULL, NULL, NULL, '2020-01-09 15:09:48');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(912, 85, 106, '행동', '강아지가 다리를 절어요', '고양시 대화동 성저마을7단지', 37.684345, 126.752670, 100, 'finish', 171, NULL, 10, '2020-01-09 15:10:47');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(913, 85, 104, '질병', '뽀삐의 귀에 염증이 생겼어요', '고양시 대화동 성저마을7단지', 37.684349, 126.752647, 100, 'finish', 171, NULL, NULL, '2020-01-09 15:41:11');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(914, 85, 106, '행동', '받아줠', '고양시 대화동 성저마을7단지', 37.684338, 126.752663, 100, 'finish', 171, NULL, NULL, '2020-01-09 15:56:37');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(915, 85, 107, '질병', '쿠키가 다리를 절어요', '고양시 대화동 성저마을7단지', 37.684319, 126.752678, 100, 'finish', 103, NULL, NULL, '2020-01-09 16:26:22');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(916, 77, 105, '행동', '받아주셈요', '서울특별시 강남구 신사동 569-9', 37.523914, 127.026939, 15, 'finish', 171, 5.0, NULL, '2020-01-09 16:27:45');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(917, 85, 108, '질병', '귀에 염증이 있어요', '고양시 대화동 성저마을7단지', 37.684338, 126.752663, 100, 'finish', 171, NULL, NULL, '2020-01-09 16:31:45');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(918, 85, 109, '질병', '귀에 염증', '고양시 대화동 성저마을7단지', 37.684341, 126.752663, 100, 'finish', 171, NULL, NULL, '2020-01-09 16:33:49');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(919, 85, 110, '질병', '귀에 염증', '고양시 대화동 성저마을7단지', 37.684353, 126.752708, 100, 'finish', 171, NULL, NULL, '2020-01-09 16:43:42');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(920, 77, 105, '행동', 'ㅅㆍㄴㆍㄴㆍㄴㆍ', '서울특별시 강남구 신사동 569-9', 37.523911, 127.026939, 15, 'finish', 103, NULL, NULL, '2020-01-09 16:53:06');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(921, 77, 105, '행동', '꾸엑', '서울특별시 강남구 신사동 569-9', 37.523914, 127.026924, 100, 'finish', 171, NULL, NULL, '2020-01-09 17:20:42');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(922, 85, 102, '행동', '아파여', '고양시 대화동 성저마을7단지', 37.684418, 126.752762, 15, 'finish', 171, NULL, 10, '2020-01-09 17:37:51');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(923, 77, 105, '행동', '다시', '서울특별시 강남구 신사동 569-9', 37.523922, 127.026939, 15, 'off', NULL, NULL, NULL, '2020-01-09 17:49:11');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(924, 77, 105, '행동', '다시', '서울특별시 강남구 신사동 569-9', 37.523922, 127.026939, 100, 'finish', 171, NULL, NULL, '2020-01-09 17:50:02');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(925, 77, 105, '행동', '받아봐요', '서울특별시 강남구 신사동 569-9', 37.523918, 127.026909, 100, 'finish', 171, NULL, NULL, '2020-01-09 18:58:35');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(926, 85, 104, '행동', '테스트', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690903, 126.762466, 100, 'off', NULL, NULL, NULL, '2020-01-09 19:36:53');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(927, 85, 104, '행동', '테스트', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690903, 126.762466, 100, 'off', NULL, NULL, NULL, '2020-01-09 19:37:29');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(928, 85, 104, '행동', '테스트', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690903, 126.762466, 100, 'off', NULL, NULL, NULL, '2020-01-09 19:38:10');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(929, 85, 104, '행동', '테스트', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690926, 126.762489, 100, 'off', NULL, NULL, NULL, '2020-01-09 19:39:45');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(930, 85, 104, '행동', '테스트', '고양시 일산1동 탄현역', 37.690937, 126.762611, 100, 'off', NULL, NULL, NULL, '2020-01-09 19:43:50');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(931, 85, 104, '행동', '테스트', '고양시 일산1동 탄현역', 37.690937, 126.762611, 100, 'off', NULL, NULL, NULL, '2020-01-09 19:44:14');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(932, 85, 104, '기타', '테스트', '고양시 일산1동 탄현역', 37.690937, 126.762611, 100, 'off', NULL, NULL, NULL, '2020-01-09 19:44:41');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(933, 85, 104, '기타', '테스트', '고양시 일산1동 탄현역', 37.690937, 126.762611, 100, 'off', NULL, NULL, NULL, '2020-01-09 19:45:11');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(934, 85, 104, '기타', '테스트', '고양시 일산1동 탄현역', 37.690937, 126.762611, 100, 'finish', 171, 5.0, NULL, '2020-01-09 19:45:43');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(935, 85, 109, '질병', '귀에 염증', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690937, 126.762466, 100, 'finish', 171, 3.5, NULL, '2020-01-09 19:49:18');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(936, 85, 123, '질병', '귀에 염증', '고양시 일산1동 탄현역', 37.690838, 126.762512, 100, 'finish', 171, 3.5, NULL, '2020-01-09 19:54:40');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(937, 85, 124, '질병', '귀에 염증', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690948, 126.762474, 100, 'finish', 171, 5.0, NULL, '2020-01-09 19:58:02');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(938, 85, 106, '질병', 'ㅇ', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690903, 126.762489, 15, 'finish', 171, 3.5, NULL, '2020-01-09 20:08:08');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(939, 85, 136, '질병', '귀에 염증', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690948, 126.762436, 100, 'finish', 171, 5.0, NULL, '2020-01-09 20:19:51');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(940, 85, 137, '질병', '아오', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690948, 126.762451, 100, 'finish', 171, 5.0, NULL, '2020-01-09 20:24:54');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(941, 85, 139, '질병', '테스트', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690929, 126.762451, 15, 'finish', 171, 3.5, NULL, '2020-01-09 20:30:14');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(942, 85, 141, '기타', 'ㅇㅇ', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690948, 126.762444, 100, 'off', NULL, NULL, NULL, '2020-01-09 20:41:32');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(943, 85, 141, '기타', 'ㅇㅇ', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690948, 126.762444, 100, 'off', NULL, NULL, NULL, '2020-01-09 20:41:56');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(944, 85, 141, '기타', 'ㅇㅇ', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690948, 126.762444, 100, 'finish', 171, 5.0, NULL, '2020-01-09 20:42:29');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(945, 85, 142, '질병', '귀에 염증', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690945, 126.762444, 100, 'finish', 171, 5.0, NULL, '2020-01-09 21:04:38');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(946, 85, 140, '질병', '귀에 염증', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690945, 126.762466, 100, 'finish', 171, 5.0, NULL, '2020-01-09 21:06:03');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(947, 85, 143, '질병', '귀에 염증', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690945, 126.762466, 100, 'finish', 171, NULL, NULL, '2020-01-09 21:17:53');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(948, 85, 139, '행동', '받아주세요', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690945, 126.762466, 100, 'finish', 171, 2.5, NULL, '2020-01-09 21:49:45');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(949, 85, 141, '잘 모르겠어요', '가자', '고양시 일산1동 육각수오피스텔', 37.690601, 126.762405, 100, 'finish', 171, 2.5, NULL, '2020-01-09 21:51:20');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(950, 85, 138, '한방/재활', 'ㅇㅇ', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690945, 126.762474, 100, 'finish', 171, NULL, NULL, '2020-01-09 22:01:08');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(951, 85, 139, '기타', 'ㅇㅇ', '고양시 일산1동 탄현역', 37.690865, 126.762566, 100, 'finish', 171, 2.5, NULL, '2020-01-09 22:02:39');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(952, 85, 141, '행동', 'ㅇㅇ', '고양시 일산1동 탄현역', 37.690865, 126.762566, 100, 'finish', 171, NULL, NULL, '2020-01-09 22:03:33');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(953, 85, 144, '수술', 'ㅇㅇ', '고양시 일산1동 탄현역', 37.690865, 126.762566, 100, 'finish', 171, NULL, NULL, '2020-01-09 22:04:22');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(954, 85, 145, '행동', '네', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690937, 126.762459, 100, 'off', NULL, NULL, NULL, '2020-01-09 22:06:04');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(955, 85, 145, '행동', '네', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690937, 126.762459, 100, 'off', NULL, NULL, NULL, '2020-01-09 22:06:27');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(956, 85, 145, '행동', '네', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690937, 126.762459, 100, 'off', NULL, NULL, NULL, '2020-01-09 22:06:52');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(957, 85, 145, '행동', '네', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690937, 126.762459, 100, 'off', NULL, NULL, NULL, '2020-01-09 22:07:13');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(958, 85, 145, '행동', '네', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690937, 126.762459, 100, 'finish', 171, 3.0, NULL, '2020-01-09 22:07:41');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(959, 85, 146, '질병', '귀에 염증', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690941, 126.762466, 100, 'finish', 171, 5.0, NULL, '2020-01-09 22:09:25');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(960, 85, 145, '질병', '귀에염증', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690971, 126.762428, 100, 'finish', 171, NULL, NULL, '2020-01-09 22:11:37');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(961, 85, 146, '수술', 'ㅇㅇ', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690937, 126.762459, 100, 'finish', 171, NULL, NULL, '2020-01-09 22:13:54');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(962, 85, 143, '수술', 'ㅇㅇ', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690910, 126.762451, 100, 'finish', 171, 3.0, NULL, '2020-01-09 22:14:24');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(963, 85, 139, '행동', 'ㅇㅇ', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690910, 126.762482, 15, 'finish', 171, NULL, NULL, '2020-01-09 22:16:53');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(964, 85, 143, '행동', 'ㅇㅇ', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690910, 126.762482, 15, 'finish', 171, NULL, NULL, '2020-01-09 22:17:12');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(965, 85, 147, '질병', '귀에 염증', '경기도 고양시 일산서구 일산1동 일현로 41', 37.690945, 126.762474, 100, 'finish', 171, NULL, NULL, '2020-01-09 22:18:04');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(966, 77, 148, '행동', '받아주세욥', '경기도 고양시 일산서구 일산1동 현중로 10', 37.691994, 126.769379, 100, 'off', NULL, NULL, NULL, '2020-01-09 22:39:59');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(967, 77, 148, '잘 모르겠어요', '테스트', '서울특별시 서초구 서초동 1445-29', 37.483608, 127.017792, 15, 'off', NULL, NULL, NULL, '2020-01-10 13:54:08');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(968, 78, 100, '질병', 'ㅋ', '서울특별시 서대문구 창천동 52-59', 37.557690, 126.935913, 100, 'wait', NULL, NULL, NULL, '2020-01-22 22:13:14');
INSERT INTO `chat_request` (`id`, `user_id`, `pet_id`, `chat_title`, `chat_content`, `address`, `latitude`, `longitude`, `distance`, `state`, `doctor_id`, `rating`, `extra_time`, `created_at`) VALUES
	(969, 78, 149, '질병', '아파', '서울특별시 마포구 동교동 207-1', 37.559483, 126.921829, 100, 'off', NULL, NULL, NULL, '2020-01-26 13:50:34');
/*!40000 ALTER TABLE `chat_request` ENABLE KEYS */;

-- 테이블 MerDog.doctor_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `doctor_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '의사 번호',
  `doctor_id` varchar(50) DEFAULT NULL COMMENT '의사 아이디',
  `doctor_pw` text COMMENT '의사 비밀번호',
  `doctor_name` varchar(50) NOT NULL COMMENT '의사 이름',
  `doctor_phone` varchar(50) NOT NULL COMMENT '의사 전화번호',
  `doctor_kakao` varchar(50) DEFAULT NULL COMMENT '의사 카카오계정 아이디',
  `doctor_naver` varchar(50) DEFAULT NULL COMMENT '의사 네이버계정 아이디',
  `doctor_google` varchar(50) DEFAULT NULL COMMENT '의사 구글계정 아이디',
  `doctor_facebook` varchar(50) DEFAULT NULL COMMENT '의사 페이스북계정 아이디',
  `doctor_twitter` varchar(50) DEFAULT NULL COMMENT '의사 트위터계정 아이디',
  `state` varchar(10) NOT NULL DEFAULT 'off' COMMENT '채팅 요청 상태 on/off',
  `latitude` float(11,6) DEFAULT '0.000000' COMMENT '위도 <가로 0~90 북/남> 정보',
  `longitude` float(11,6) DEFAULT '0.000000' COMMENT '경도 <세로 0~180> 정보',
  `address` text COMMENT '현재 주소',
  `approval` varchar(50) NOT NULL DEFAULT 'wait' COMMENT '승인여부 wait : 승인대기 / complete: 승인 / deny: 승인거부',
  `fcm_token` text,
  `doctor_token` text,
  `fee` int(11) NOT NULL DEFAULT '30' COMMENT '수수료',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `on/off` varchar(10) NOT NULL DEFAULT 'on' COMMENT '의사 회원 활성화여부 on/off',
  PRIMARY KEY (`id`),
  UNIQUE KEY `doctor_phone` (`doctor_phone`),
  UNIQUE KEY `doctor_id` (`doctor_id`),
  UNIQUE KEY `doctor_kakao` (`doctor_kakao`),
  UNIQUE KEY `doctor_naver` (`doctor_naver`),
  UNIQUE KEY `doctor_google` (`doctor_google`),
  UNIQUE KEY `doctor_facebook` (`doctor_facebook`),
  UNIQUE KEY `doctor_twitter` (`doctor_twitter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='의사 정보';

-- 테이블 데이터 MerDog.doctor_info:~21 rows (대략적) 내보내기
/*!40000 ALTER TABLE `doctor_info` DISABLE KEYS */;
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(103, 'tesx4', '$2y$10$zKpf7.3Hr9L/YFnBfGrsX.b81oVNdl95DrXi3eV1GycuDiIHiqgCG', '심성윤', '01077322222', NULL, NULL, NULL, NULL, NULL, 'off', 0.000000, 0.000000, NULL, 'complete', NULL, NULL, 30, '2019-10-30 13:52:00', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(106, 'cv778', '$2y$10$BPIQ3aY8y5KJsQLDRRB4Pudmr25ZJSawWVcWwPL4xNAOBo4HIptfa', '드느느', '0109966336', NULL, NULL, NULL, NULL, NULL, 'off', 0.000000, 0.000000, NULL, 'complete', 'eChoYUo53KM:APA91bGG9_Qs7qA_pFKgE0ysKRZ6wZMU2fd8AMmR7HVeeU0CTrQywWA9Ppecoz_azdspixWO6TOutXSoRdCki_mLzPXhtBxoP9cllu7VFjeZyWsOyM3R1-2z-9YIS759uwqezcKiAiNn', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb2N0b3JfaWQiOjEwM30.x3Nh4b1mPEJJEqB5KFIq_WT1vq3PDWurErZ7entPTK0', 30, '2019-10-30 15:51:53', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(107, 'hey373', '$2y$10$Rye2VfXUS/ovblI1AXdd8OIzUAxtlnlYHiH/q7zyn0o0fHUp.H5ea', '도도기', '01088663333', NULL, NULL, NULL, NULL, NULL, 'off', 0.000000, 0.000000, NULL, 'wait', 'eChoYUo53KM:APA91bGG9_Qs7qA_pFKgE0ysKRZ6wZMU2fd8AMmR7HVeeU0CTrQywWA9Ppecoz_azdspixWO6TOutXSoRdCki_mLzPXhtBxoP9cllu7VFjeZyWsOyM3R1-2z-9YIS759uwqezcKiAiNn', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb2N0b3JfaWQiOjEwM30.x3Nh4b1mPEJJEqB5KFIq_WT1vq3PDWurErZ7entPTK0', 30, '2019-10-30 15:53:27', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(108, 'tesx6', '$2y$10$a6gRnoB0MJo3.l43O6Xov.l6.4PzIg/axTxf2JO7d4HO2XG6KWwwO', '심상범', '01089285877', NULL, NULL, NULL, NULL, NULL, 'off', 0.000000, 0.000000, NULL, 'wait', 'eChoYUo53KM:APA91bGG9_Qs7qA_pFKgE0ysKRZ6wZMU2fd8AMmR7HVeeU0CTrQywWA9Ppecoz_azdspixWO6TOutXSoRdCki_mLzPXhtBxoP9cllu7VFjeZyWsOyM3R1-2z-9YIS759uwqezcKiAiNn', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb2N0b3JfaWQiOjEwM30.x3Nh4b1mPEJJEqB5KFIq_WT1vq3PDWurErZ7entPTK0', 30, '2019-10-30 16:02:12', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(109, 'vdhe4', '$2y$10$.7ATT0HGFF3T6AhzV1ECCeVv4IEE7LJ0q3WQI6PdENGA78SQkBHre', '드드드', '0101888666', NULL, NULL, NULL, NULL, NULL, 'off', 0.000000, 0.000000, NULL, 'deny', 'eChoYUo53KM:APA91bGG9_Qs7qA_pFKgE0ysKRZ6wZMU2fd8AMmR7HVeeU0CTrQywWA9Ppecoz_azdspixWO6TOutXSoRdCki_mLzPXhtBxoP9cllu7VFjeZyWsOyM3R1-2z-9YIS759uwqezcKiAiNn', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb2N0b3JfaWQiOjEwM30.x3Nh4b1mPEJJEqB5KFIq_WT1vq3PDWurErZ7entPTK0', 30, '2019-10-30 16:06:02', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(111, 'cvcv5648', '$2y$10$BnP0jK2fWutE.MhLw8w.FuS4qM8rkilLkZgJba0WUDF0aP/tVe6tm', '드드드', '01051816265', NULL, NULL, NULL, NULL, NULL, 'off', 0.000000, 0.000000, NULL, 'complete', NULL, NULL, 30, '2019-11-26 20:07:37', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(112, 'test12', '$2y$10$qQPBzc2p.T8wL5XpTS71UuGEb4cq9KbQtqoZLLDx06P9ZxgQrcI5G', '심성윤', '01077383530', NULL, NULL, NULL, NULL, NULL, 'off', NULL, NULL, NULL, 'complete', 'eChoYUo53KM:APA91bGG9_Qs7qA_pFKgE0ysKRZ6wZMU2fd8AMmR7HVeeU0CTrQywWA9Ppecoz_azdspixWO6TOutXSoRdCki_mLzPXhtBxoP9cllu7VFjeZyWsOyM3R1-2z-9YIS759uwqezcKiAiNn', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb2N0b3JfaWQiOjEwM30.x3Nh4b1mPEJJEqB5KFIq_WT1vq3PDWurErZ7entPTK0', 30, '2019-10-30 19:01:52', 'off');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(115, 'test1', '$2y$10$RDE5EItzZZCLoNTATh.l0uhsBsK6MHnPpWbncP.jGlVrtDi7jNN0i', '심성윤', '01063911618', NULL, NULL, NULL, NULL, NULL, 'off', 0.000000, 0.000000, NULL, 'complete', 'eChoYUo53KM:APA91bGG9_Qs7qA_pFKgE0ysKRZ6wZMU2fd8AMmR7HVeeU0CTrQywWA9Ppecoz_azdspixWO6TOutXSoRdCki_mLzPXhtBxoP9cllu7VFjeZyWsOyM3R1-2z-9YIS759uwqezcKiAiNn', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb2N0b3JfaWQiOjEwM30.x3Nh4b1mPEJJEqB5KFIq_WT1vq3PDWurErZ7entPTK0', 30, '2019-11-06 15:44:50', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(116, 'test2', '$2y$10$A1iryhYuusD8BpUXmRt8NOp32c3QWJgqRsFcZMGCwKJBYEccZB7Ae', '백종원', '01053050315', NULL, NULL, NULL, NULL, NULL, 'off', NULL, NULL, NULL, 'complete', 'eChoYUo53KM:APA91bGG9_Qs7qA_pFKgE0ysKRZ6wZMU2fd8AMmR7HVeeU0CTrQywWA9Ppecoz_azdspixWO6TOutXSoRdCki_mLzPXhtBxoP9cllu7VFjeZyWsOyM3R1-2z-9YIS759uwqezcKiAiNn', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb2N0b3JfaWQiOjEwM30.x3Nh4b1mPEJJEqB5KFIq_WT1vq3PDWurErZ7entPTK0', 30, '2019-11-07 13:52:04', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(117, 'st02219', '$2y$10$sUG2Xk6a0C/sq7cwsCKgs.YnnFJy6fH9te7yHXy84d1R47OxCsM5S', '공지환', '01073756544', NULL, NULL, NULL, NULL, NULL, 'on', 37.523876, 127.026962, '대한민국 서울특별시 강남구 신사동 569-22', 'complete', 'eChoYUo53KM:APA91bGG9_Qs7qA_pFKgE0ysKRZ6wZMU2fd8AMmR7HVeeU0CTrQywWA9Ppecoz_azdspixWO6TOutXSoRdCki_mLzPXhtBxoP9cllu7VFjeZyWsOyM3R1-2z-9YIS759uwqezcKiAiNn', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb2N0b3JfaWQiOjEwM30.x3Nh4b1mPEJJEqB5KFIq_WT1vq3PDWurErZ7entPTK0', 30, '2019-11-21 19:07:36', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(143, NULL, NULL, '심성윤', '01077383507', '1046848409', NULL, NULL, NULL, NULL, 'off', 0.000000, 0.000000, NULL, 'complete', NULL, NULL, 30, '2019-12-01 15:31:51', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(144, 'cvcv77', '$2y$10$WWsIjDNmm8X4E29wsWfk3ORx8oQZmcItFRR.iLvKEpnmSYtH7ROli', '상범', '01051816220', NULL, NULL, NULL, NULL, NULL, 'off', 0.000000, 0.000000, NULL, 'wait', 'eChoYUo53KM:APA91bGG9_Qs7qA_pFKgE0ysKRZ6wZMU2fd8AMmR7HVeeU0CTrQywWA9Ppecoz_azdspixWO6TOutXSoRdCki_mLzPXhtBxoP9cllu7VFjeZyWsOyM3R1-2z-9YIS759uwqezcKiAiNn', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb2N0b3JfaWQiOjEwM30.x3Nh4b1mPEJJEqB5KFIq_WT1vq3PDWurErZ7entPTK0', 30, '2019-12-02 15:15:57', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(146, 'ccit2019', '$2y$10$KREGZ06DFh6sseldY4YkleGk4dMdzv121q2avFvKOG3xZJUfb21jG', '신', '01096488148', NULL, NULL, NULL, NULL, NULL, 'off', 0.000000, 0.000000, NULL, 'wait', 'eChoYUo53KM:APA91bGG9_Qs7qA_pFKgE0ysKRZ6wZMU2fd8AMmR7HVeeU0CTrQywWA9Ppecoz_azdspixWO6TOutXSoRdCki_mLzPXhtBxoP9cllu7VFjeZyWsOyM3R1-2z-9YIS759uwqezcKiAiNn', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb2N0b3JfaWQiOjEwM30.x3Nh4b1mPEJJEqB5KFIq_WT1vq3PDWurErZ7entPTK0', 30, '2019-12-06 10:34:52', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(147, 'ashly9696', '$2y$10$Fi2Qccsqx.dRujJBVliX2eaDcIEn7VvwlSH/Epn3VOtnlwXYjD3Aa', '조재형', '01020751754', NULL, NULL, NULL, NULL, NULL, 'off', 0.000000, 0.000000, NULL, 'complete', 'eChoYUo53KM:APA91bGG9_Qs7qA_pFKgE0ysKRZ6wZMU2fd8AMmR7HVeeU0CTrQywWA9Ppecoz_azdspixWO6TOutXSoRdCki_mLzPXhtBxoP9cllu7VFjeZyWsOyM3R1-2z-9YIS759uwqezcKiAiNn', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb2N0b3JfaWQiOjEwM30.x3Nh4b1mPEJJEqB5KFIq_WT1vq3PDWurErZ7entPTK0', 30, '2019-12-06 10:37:53', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(148, 'cvcv8888', '$2y$10$QBqzkKPzThYw3exYjdIrZuP5g6rf.h2Y5zghRDcd98Py.491Txxxm', '듸스', '01051816263', NULL, NULL, NULL, NULL, NULL, 'off', 0.000000, 0.000000, NULL, 'wait', 'eChoYUo53KM:APA91bGG9_Qs7qA_pFKgE0ysKRZ6wZMU2fd8AMmR7HVeeU0CTrQywWA9Ppecoz_azdspixWO6TOutXSoRdCki_mLzPXhtBxoP9cllu7VFjeZyWsOyM3R1-2z-9YIS759uwqezcKiAiNn', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb2N0b3JfaWQiOjEwM30.x3Nh4b1mPEJJEqB5KFIq_WT1vq3PDWurErZ7entPTK0', 30, '2019-12-06 15:33:10', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(153, 'h2i3o', '$2y$10$bKqXToU6Sr0QeOKUK3fOButcDU3VZrtncN0HaMavPY7whLe265OsC', '상범', '01051816262', NULL, NULL, NULL, NULL, NULL, 'off', 0.000000, 0.000000, NULL, 'wait', 'eChoYUo53KM:APA91bGG9_Qs7qA_pFKgE0ysKRZ6wZMU2fd8AMmR7HVeeU0CTrQywWA9Ppecoz_azdspixWO6TOutXSoRdCki_mLzPXhtBxoP9cllu7VFjeZyWsOyM3R1-2z-9YIS759uwqezcKiAiNn', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb2N0b3JfaWQiOjEwM30.x3Nh4b1mPEJJEqB5KFIq_WT1vq3PDWurErZ7entPTK0', 30, '2019-12-17 23:13:17', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(164, NULL, NULL, '페상범', '01051816244', NULL, NULL, NULL, 'x2B5igo16dduro8Sarg4Ceuoo4X2', NULL, 'off', 0.000000, 0.000000, NULL, 'deny', 'eChoYUo53KM:APA91bGG9_Qs7qA_pFKgE0ysKRZ6wZMU2fd8AMmR7HVeeU0CTrQywWA9Ppecoz_azdspixWO6TOutXSoRdCki_mLzPXhtBxoP9cllu7VFjeZyWsOyM3R1-2z-9YIS759uwqezcKiAiNn', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb2N0b3JfaWQiOjEwM30.x3Nh4b1mPEJJEqB5KFIq_WT1vq3PDWurErZ7entPTK0', 30, '2019-12-23 23:11:59', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(167, NULL, NULL, '트상범', '0105186368', NULL, NULL, NULL, NULL, 'NsUOFThpijPo0RMcNznWUBqpWWo2', 'off', 0.000000, 0.000000, NULL, 'complete', 'eChoYUo53KM:APA91bGG9_Qs7qA_pFKgE0ysKRZ6wZMU2fd8AMmR7HVeeU0CTrQywWA9Ppecoz_azdspixWO6TOutXSoRdCki_mLzPXhtBxoP9cllu7VFjeZyWsOyM3R1-2z-9YIS759uwqezcKiAiNn', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb2N0b3JfaWQiOjEwM30.x3Nh4b1mPEJJEqB5KFIq_WT1vq3PDWurErZ7entPTK0', 30, '2019-12-25 16:21:46', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(170, NULL, NULL, '네이보', '01077383511', NULL, '49583790', NULL, NULL, NULL, 'off', 0.000000, 0.000000, NULL, 'complete', NULL, NULL, 30, '2019-12-26 01:22:30', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(171, NULL, NULL, '유상범', '01051816269', NULL, NULL, 'moHgEURcK6Nvf1OMVbBodGSSfji1', NULL, NULL, 'on', 37.713459, 126.890442, '대한민국 경기도 고양시 덕양구 대자동 동헌로307번길 22-5', 'complete', 'dtK5q_A81ZI:APA91bHHlpG4p-snbM0N5p5U3UiarxIToZVBqjkKow6LxaSFc9FAh8piiPDh6Vf9A_07MupNNS45mERVaKqIMPKP7kOol-qMEK1TyZNtfrGdcOj1KvKWpLU86Z3ONhwnGzjQ9EABV1v5', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkb2N0b3JfaWQiOjE3MX0._0KAepAmZvGKCD8_0H0nqT6HGW2z_aqeHpt8w1212H0', 30, '2020-01-02 19:58:21', 'on');
INSERT INTO `doctor_info` (`id`, `doctor_id`, `doctor_pw`, `doctor_name`, `doctor_phone`, `doctor_kakao`, `doctor_naver`, `doctor_google`, `doctor_facebook`, `doctor_twitter`, `state`, `latitude`, `longitude`, `address`, `approval`, `fcm_token`, `doctor_token`, `fee`, `created_at`, `on/off`) VALUES
	(172, NULL, NULL, '유상범', '01051816260', '1223066710', NULL, NULL, NULL, NULL, 'off', 0.000000, 0.000000, NULL, 'complete', NULL, NULL, 30, '2020-01-02 21:49:23', 'on');
/*!40000 ALTER TABLE `doctor_info` ENABLE KEYS */;

-- 테이블 MerDog.except_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `except_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_request_id` int(11) DEFAULT NULL,
  `except` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_except_list_chat_request` (`chat_request_id`),
  CONSTRAINT `FK_except_list_chat_request` FOREIGN KEY (`chat_request_id`) REFERENCES `chat_request` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='매칭 제외 목록';

-- 테이블 데이터 MerDog.except_list:~461 rows (대략적) 내보내기
/*!40000 ALTER TABLE `except_list` DISABLE KEYS */;
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(520, 577, 'a:1:{i:0;i:111;}', '2019-11-26 18:13:46');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(521, 578, 'a:1:{i:0;i:111;}', '2019-11-26 18:15:12');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(522, 580, 'a:1:{i:0;i:103;}', '2019-11-26 19:38:57');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(523, 581, 'a:1:{i:0;i:111;}', '2019-11-26 20:30:45');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(524, 582, 'a:1:{i:0;i:111;}', '2019-11-26 20:51:18');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(525, 584, 'a:1:{i:0;i:111;}', '2019-11-26 21:16:29');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(526, 585, 'a:1:{i:0;i:111;}', '2019-11-26 21:16:49');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(527, 586, 'a:1:{i:0;i:111;}', '2019-11-26 21:17:11');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(528, 587, 'a:1:{i:0;i:111;}', '2019-11-26 21:18:37');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(529, 588, 'a:1:{i:0;i:111;}', '2019-11-26 23:10:49');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(530, 589, 'a:1:{i:0;i:111;}', '2019-11-26 23:11:10');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(531, 590, 'a:1:{i:0;i:111;}', '2019-11-26 23:17:10');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(532, 591, 'a:1:{i:0;i:111;}', '2019-11-26 23:17:41');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(533, 592, 'a:1:{i:0;i:111;}', '2019-11-26 23:17:55');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(534, 593, 'a:1:{i:0;i:111;}', '2019-11-26 23:18:15');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(535, 594, 'a:1:{i:0;i:111;}', '2019-11-26 23:32:37');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(536, 595, 'a:1:{i:0;i:111;}', '2019-11-26 23:32:55');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(537, 596, 'a:1:{i:0;i:111;}', '2019-11-26 23:33:40');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(538, 597, 'a:1:{i:0;i:111;}', '2019-11-26 23:34:08');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(539, 598, 'a:1:{i:0;i:111;}', '2019-11-26 23:35:12');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(540, 599, 'a:1:{i:0;i:111;}', '2019-11-26 23:38:23');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(541, 600, 'a:1:{i:0;i:111;}', '2019-11-26 23:40:27');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(542, 601, 'a:1:{i:0;i:111;}', '2019-11-26 23:50:02');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(543, 602, 'a:1:{i:0;i:111;}', '2019-11-26 23:57:51');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(544, 603, 'a:1:{i:0;i:111;}', '2019-11-27 00:03:35');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(545, 604, 'a:1:{i:0;i:111;}', '2019-11-27 20:17:48');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(546, 605, 'a:1:{i:0;i:111;}', '2019-11-27 20:17:59');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(547, 606, 'a:1:{i:0;i:111;}', '2019-11-27 20:18:36');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(548, 607, 'a:1:{i:0;i:111;}', '2019-11-27 20:18:46');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(549, 608, 'a:1:{i:0;i:111;}', '2019-11-27 20:20:59');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(550, 609, 'a:1:{i:0;i:111;}', '2019-11-27 20:21:48');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(551, 610, 'a:1:{i:0;i:111;}', '2019-11-27 20:37:53');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(552, 611, 'a:1:{i:0;i:111;}', '2019-11-27 20:38:28');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(553, 612, 'a:1:{i:0;i:111;}', '2019-11-27 20:39:30');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(554, 613, 'a:1:{i:0;i:111;}', '2019-11-27 20:40:29');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(555, 615, 'a:1:{i:0;i:111;}', '2019-11-28 16:53:40');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(556, 616, 'a:1:{i:0;i:111;}', '2019-11-28 16:54:19');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(557, 617, 'a:1:{i:0;i:111;}', '2019-11-28 16:54:29');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(558, 618, 'a:1:{i:0;i:111;}', '2019-11-28 16:56:56');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(559, 619, 'a:1:{i:0;i:111;}', '2019-11-28 16:57:11');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(560, 620, 'a:1:{i:0;i:111;}', '2019-11-28 16:58:33');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(561, 621, 'a:1:{i:0;i:111;}', '2019-11-28 16:59:31');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(562, 622, 'a:1:{i:0;i:111;}', '2019-11-28 17:00:08');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(563, 623, 'a:1:{i:0;i:111;}', '2019-11-28 17:00:13');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(564, 624, 'a:1:{i:0;i:111;}', '2019-11-28 17:03:08');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(565, 625, 'a:1:{i:0;i:111;}', '2019-11-28 17:05:16');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(566, 626, 'a:1:{i:0;i:111;}', '2019-11-28 17:09:14');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(567, 627, 'a:1:{i:0;i:111;}', '2019-11-28 17:10:51');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(568, 628, 'a:1:{i:0;i:111;}', '2019-11-28 17:18:04');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(569, 629, 'a:1:{i:0;i:111;}', '2019-11-28 17:18:26');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(570, 630, 'a:1:{i:0;i:111;}', '2019-11-28 17:18:58');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(571, 631, 'a:1:{i:0;i:111;}', '2019-11-28 17:19:28');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(572, 632, 'a:1:{i:0;i:111;}', '2019-11-28 17:29:11');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(573, 633, 'a:1:{i:0;i:111;}', '2019-11-28 18:15:41');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(574, 634, 'a:1:{i:0;i:111;}', '2019-12-01 20:42:10');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(575, 635, 'a:1:{i:0;i:111;}', '2019-12-01 23:42:25');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(576, 636, 'a:2:{i:0;i:103;i:1;i:111;}', '2019-12-01 23:47:00');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(577, 637, 'a:2:{i:0;i:103;i:1;i:111;}', '2019-12-01 23:47:28');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(578, 638, 'a:1:{i:0;i:111;}', '2019-12-02 16:48:10');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(579, 639, 'a:1:{i:0;i:111;}', '2019-12-02 16:48:39');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(580, 640, 'a:1:{i:0;i:111;}', '2019-12-02 16:49:17');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(581, 641, 'a:2:{i:0;i:111;i:1;i:143;}', '2019-12-02 16:50:12');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(582, 642, 'a:2:{i:0;i:111;i:1;i:143;}', '2019-12-02 16:50:28');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(583, 643, 'a:2:{i:0;i:111;i:1;i:143;}', '2019-12-02 16:50:37');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(584, 644, 'a:2:{i:0;i:111;i:1;i:143;}', '2019-12-02 16:51:11');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(585, 645, 'a:2:{i:0;i:111;i:1;i:143;}', '2019-12-02 16:51:48');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(586, 646, 'a:2:{i:0;i:111;i:1;i:143;}', '2019-12-02 16:52:29');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(587, 647, 'a:2:{i:0;i:111;i:1;i:143;}', '2019-12-02 16:52:39');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(588, 648, 'a:1:{i:0;i:111;}', '2019-12-02 16:53:39');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(589, 649, 'a:1:{i:0;i:111;}', '2019-12-02 16:53:56');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(590, 650, 'a:1:{i:0;i:111;}', '2019-12-02 16:55:57');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(591, 651, 'a:1:{i:0;i:111;}', '2019-12-02 16:56:09');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(592, 652, 'a:1:{i:0;i:111;}', '2019-12-02 17:00:49');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(593, 653, 'a:1:{i:0;i:111;}', '2019-12-02 17:01:03');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(594, 654, 'a:1:{i:0;i:111;}', '2019-12-03 15:38:49');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(595, 655, 'a:1:{i:0;i:111;}', '2019-12-03 18:56:05');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(596, 656, 'a:1:{i:0;i:111;}', '2019-12-03 19:25:50');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(597, 657, 'a:2:{i:0;i:103;i:1;i:111;}', '2019-12-05 18:28:06');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(598, 658, 'a:1:{i:0;i:111;}', '2019-12-06 10:31:12');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(599, 659, 'a:2:{i:0;i:111;i:1;i:143;}', '2019-12-06 10:54:11');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(600, 660, 'a:2:{i:0;i:111;i:1;i:143;}', '2019-12-06 10:55:55');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(601, 661, 'a:2:{i:0;i:111;i:1;i:143;}', '2019-12-06 10:56:49');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(602, 662, 'a:3:{i:0;i:111;i:1;i:117;i:2;i:143;}', '2019-12-06 10:57:16');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(603, 663, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-06 10:58:18');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(604, 664, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-06 10:58:52');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(605, 665, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-06 10:59:43');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(606, 666, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-06 10:59:50');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(607, 667, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-06 11:00:25');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(608, 668, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-06 11:01:04');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(609, 669, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-06 11:01:14');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(610, 670, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-06 11:02:31');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(611, 671, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-06 11:03:28');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(612, 672, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-06 11:03:36');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(613, 673, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-06 11:05:30');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(614, 674, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-06 11:06:20');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(615, 675, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-06 11:11:24');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(616, 676, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-06 11:12:55');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(617, 677, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-06 11:13:56');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(618, 678, 'a:3:{i:0;i:111;i:1;i:117;i:2;i:147;}', '2019-12-06 11:15:58');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(619, 679, 'a:3:{i:0;i:111;i:1;i:117;i:2;i:147;}', '2019-12-06 11:17:13');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(620, 680, 'a:3:{i:0;i:111;i:1;i:117;i:2;i:147;}', '2019-12-06 11:17:26');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(621, 681, 'a:2:{i:0;i:111;i:1;i:147;}', '2019-12-06 11:17:36');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(622, 682, 'a:2:{i:0;i:111;i:1;i:147;}', '2019-12-06 11:18:08');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(623, 683, 'a:2:{i:0;i:111;i:1;i:147;}', '2019-12-06 11:18:42');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(624, 684, 'a:2:{i:0;i:111;i:1;i:147;}', '2019-12-06 11:18:54');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(625, 685, 'a:2:{i:0;i:111;i:1;i:147;}', '2019-12-06 11:19:06');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(626, 686, 'a:2:{i:0;i:111;i:1;i:147;}', '2019-12-06 11:19:37');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(627, 687, 'a:3:{i:0;i:111;i:1;i:117;i:2;i:147;}', '2019-12-06 11:23:54');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(628, 688, 'a:1:{i:0;i:147;}', '2019-12-06 11:40:18');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(629, 689, 'a:1:{i:0;i:147;}', '2019-12-06 11:40:25');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(630, 690, 'a:2:{i:0;i:111;i:1;i:147;}', '2019-12-06 12:04:06');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(631, 691, 'a:2:{i:0;i:111;i:1;i:147;}', '2019-12-06 12:05:02');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(632, 692, 'a:2:{i:0;i:111;i:1;i:147;}', '2019-12-06 12:06:46');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(633, 693, 'a:2:{i:0;i:111;i:1;i:147;}', '2019-12-06 12:07:20');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(634, 694, 'a:2:{i:0;i:111;i:1;i:147;}', '2019-12-06 12:07:33');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(635, 695, 'a:3:{i:0;i:111;i:1;i:117;i:2;i:147;}', '2019-12-06 12:11:46');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(636, 696, 'a:3:{i:0;i:111;i:1;i:117;i:2;i:147;}', '2019-12-06 12:13:14');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(637, 697, 'a:3:{i:0;i:111;i:1;i:117;i:2;i:147;}', '2019-12-06 12:15:04');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(638, 698, 'a:3:{i:0;i:111;i:1;i:117;i:2;i:147;}', '2019-12-06 12:16:12');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(639, 699, 'a:3:{i:0;i:111;i:1;i:117;i:2;i:147;}', '2019-12-06 12:16:47');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(640, 700, 'a:3:{i:0;i:111;i:1;i:117;i:2;i:147;}', '2019-12-06 12:17:30');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(641, 701, 'a:2:{i:0;i:111;i:1;i:117;}', '2019-12-06 12:17:56');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(642, 702, 'a:2:{i:0;i:111;i:1;i:117;}', '2019-12-06 12:18:47');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(643, 703, 'a:2:{i:0;i:111;i:1;i:117;}', '2019-12-06 12:20:08');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(644, 704, 'a:2:{i:0;i:111;i:1;i:117;}', '2019-12-06 12:20:47');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(645, 705, 'a:2:{i:0;i:111;i:1;i:117;}', '2019-12-06 12:21:34');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(646, 706, 'a:2:{i:0;i:111;i:1;i:117;}', '2019-12-06 12:26:03');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(647, 707, 'a:1:{i:0;i:111;}', '2019-12-06 12:27:48');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(648, 708, 'a:1:{i:0;i:111;}', '2019-12-06 12:28:29');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(649, 713, 'a:1:{i:0;i:111;}', '2019-12-06 14:07:05');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(650, 714, 'a:1:{i:0;i:111;}', '2019-12-06 14:07:20');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(651, 715, 'a:1:{i:0;i:111;}', '2019-12-06 14:07:52');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(652, 716, 'a:1:{i:0;i:111;}', '2019-12-06 14:08:30');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(653, 717, 'a:1:{i:0;i:111;}', '2019-12-06 14:08:59');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(654, 718, 'a:1:{i:0;i:111;}', '2019-12-06 14:09:14');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(655, 719, 'a:1:{i:0;i:111;}', '2019-12-06 14:10:40');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(656, 720, 'a:1:{i:0;i:111;}', '2019-12-06 14:11:13');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(657, 721, 'a:1:{i:0;i:111;}', '2019-12-06 14:11:41');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(658, 722, 'a:1:{i:0;i:111;}', '2019-12-06 14:11:57');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(659, 723, 'a:1:{i:0;i:111;}', '2019-12-06 14:15:12');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(660, 724, 'a:1:{i:0;i:111;}', '2019-12-06 14:15:52');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(661, 725, 'a:1:{i:0;i:111;}', '2019-12-06 14:16:26');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(662, 726, 'a:1:{i:0;i:111;}', '2019-12-06 14:20:57');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(663, 727, 'a:1:{i:0;i:111;}', '2019-12-06 14:21:53');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(664, 728, 'a:1:{i:0;i:111;}', '2019-12-06 14:22:39');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(665, 729, 'a:1:{i:0;i:111;}', '2019-12-06 14:24:53');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(666, 730, 'a:1:{i:0;i:111;}', '2019-12-06 14:25:27');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(667, 731, 'a:1:{i:0;i:111;}', '2019-12-06 14:26:33');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(668, 732, 'a:1:{i:0;i:111;}', '2019-12-06 14:30:04');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(669, 733, 'a:1:{i:0;i:111;}', '2019-12-06 14:30:36');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(670, 734, 'a:1:{i:0;i:111;}', '2019-12-06 14:31:24');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(671, 735, 'a:1:{i:0;i:111;}', '2019-12-06 14:31:56');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(672, 736, 'a:1:{i:0;i:111;}', '2019-12-06 14:33:03');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(673, 737, 'a:1:{i:0;i:111;}', '2019-12-06 14:33:40');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(674, 738, 'a:1:{i:0;i:111;}', '2019-12-06 14:34:08');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(675, 739, 'a:1:{i:0;i:111;}', '2019-12-06 14:34:47');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(676, 740, 'a:1:{i:0;i:111;}', '2019-12-06 14:36:17');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(677, 741, 'a:1:{i:0;i:111;}', '2019-12-06 14:36:54');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(678, 742, 'a:1:{i:0;i:111;}', '2019-12-06 14:38:37');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(679, 743, 'a:1:{i:0;i:111;}', '2019-12-06 14:38:45');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(680, 744, 'a:1:{i:0;i:111;}', '2019-12-06 14:38:49');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(681, 745, 'a:1:{i:0;i:111;}', '2019-12-06 14:38:53');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(682, 746, 'a:1:{i:0;i:111;}', '2019-12-06 14:38:59');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(683, 747, 'a:1:{i:0;i:111;}', '2019-12-06 14:39:03');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(684, 748, 'a:1:{i:0;i:111;}', '2019-12-06 14:39:20');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(685, 749, 'a:1:{i:0;i:111;}', '2019-12-06 14:39:25');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(686, 750, 'a:1:{i:0;i:111;}', '2019-12-06 14:39:30');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(687, 751, 'a:1:{i:0;i:111;}', '2019-12-06 14:41:46');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(688, 752, 'a:1:{i:0;i:111;}', '2019-12-06 14:43:08');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(689, 753, 'a:1:{i:0;i:111;}', '2019-12-06 14:43:38');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(690, 754, 'a:1:{i:0;i:111;}', '2019-12-06 14:45:00');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(691, 755, 'a:1:{i:0;i:111;}', '2019-12-06 14:45:37');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(692, 756, 'a:1:{i:0;i:111;}', '2019-12-06 14:45:58');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(693, 757, 'a:1:{i:0;i:111;}', '2019-12-06 14:46:27');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(694, 758, 'a:1:{i:0;i:111;}', '2019-12-06 14:46:42');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(695, 759, 'a:1:{i:0;i:111;}', '2019-12-06 14:46:48');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(696, 760, 'a:1:{i:0;i:111;}', '2019-12-06 14:46:53');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(697, 761, 'a:1:{i:0;i:111;}', '2019-12-06 14:47:34');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(698, 762, 'a:1:{i:0;i:111;}', '2019-12-06 14:48:05');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(699, 763, 'a:1:{i:0;i:111;}', '2019-12-06 14:48:29');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(700, 764, 'a:1:{i:0;i:111;}', '2019-12-06 14:49:20');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(701, 765, 'a:1:{i:0;i:111;}', '2019-12-06 14:50:18');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(702, 766, 'a:1:{i:0;i:111;}', '2019-12-06 14:50:26');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(703, 767, 'a:1:{i:0;i:111;}', '2019-12-06 14:50:56');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(704, 768, 'a:1:{i:0;i:111;}', '2019-12-06 14:51:29');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(705, 769, 'a:1:{i:0;i:111;}', '2019-12-06 14:52:00');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(706, 770, 'a:1:{i:0;i:111;}', '2019-12-06 14:52:30');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(707, 771, 'a:1:{i:0;i:111;}', '2019-12-06 14:52:49');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(708, 772, 'a:1:{i:0;i:111;}', '2019-12-06 14:53:02');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(709, 773, 'a:1:{i:0;i:111;}', '2019-12-06 14:53:09');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(710, 774, 'a:1:{i:0;i:111;}', '2019-12-06 14:53:16');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(711, 775, 'a:1:{i:0;i:111;}', '2019-12-06 14:53:22');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(712, 776, 'a:1:{i:0;i:111;}', '2019-12-06 14:53:27');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(713, 777, 'a:1:{i:0;i:111;}', '2019-12-06 14:53:33');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(714, 778, 'a:1:{i:0;i:111;}', '2019-12-06 14:53:40');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(715, 779, 'a:1:{i:0;i:111;}', '2019-12-06 14:54:09');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(716, 780, 'a:1:{i:0;i:111;}', '2019-12-06 14:54:17');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(717, 781, 'a:1:{i:0;i:111;}', '2019-12-06 14:54:27');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(718, 782, 'a:1:{i:0;i:111;}', '2019-12-06 14:54:34');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(719, 783, 'a:1:{i:0;i:111;}', '2019-12-06 14:54:40');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(720, 784, 'a:1:{i:0;i:111;}', '2019-12-06 14:54:48');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(721, 785, 'a:1:{i:0;i:111;}', '2019-12-06 14:54:55');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(722, 786, 'a:1:{i:0;i:111;}', '2019-12-06 14:55:00');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(723, 787, 'a:1:{i:0;i:111;}', '2019-12-06 14:55:09');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(724, 788, 'a:1:{i:0;i:111;}', '2019-12-06 14:55:16');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(725, 789, 'a:1:{i:0;i:111;}', '2019-12-06 14:55:21');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(726, 790, 'a:1:{i:0;i:111;}', '2019-12-06 14:55:30');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(727, 791, 'a:1:{i:0;i:111;}', '2019-12-06 14:55:44');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(728, 792, 'a:1:{i:0;i:111;}', '2019-12-06 14:58:19');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(729, 793, 'a:1:{i:0;i:111;}', '2019-12-06 14:58:56');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(730, 794, 'a:1:{i:0;i:111;}', '2019-12-06 14:59:11');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(731, 795, 'a:1:{i:0;i:111;}', '2019-12-06 14:59:32');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(732, 796, 'a:1:{i:0;i:111;}', '2019-12-06 15:03:52');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(733, 797, 'a:1:{i:0;i:111;}', '2019-12-06 15:03:58');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(734, 799, 'a:1:{i:0;i:111;}', '2019-12-08 10:16:09');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(735, 800, 'a:1:{i:0;i:111;}', '2019-12-08 10:16:43');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(736, 806, 'a:1:{i:0;i:111;}', '2019-12-08 10:26:25');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(737, 807, 'a:1:{i:0;i:111;}', '2019-12-08 10:26:51');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(738, 808, 'a:1:{i:0;i:111;}', '2019-12-08 10:28:59');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(739, 809, 'a:1:{i:0;i:111;}', '2019-12-08 10:29:47');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(740, 810, 'a:1:{i:0;i:111;}', '2019-12-08 10:57:10');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(741, 811, 'a:1:{i:0;i:111;}', '2019-12-08 11:01:17');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(742, 812, 'a:1:{i:0;i:111;}', '2019-12-08 11:21:56');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(743, 813, 'a:1:{i:0;i:111;}', '2019-12-08 12:40:31');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(744, 814, 'a:2:{i:0;i:103;i:1;i:111;}', '2019-12-08 15:01:16');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(745, 815, 'a:2:{i:0;i:103;i:1;i:111;}', '2019-12-08 15:09:43');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(746, 816, 'a:2:{i:0;i:103;i:1;i:111;}', '2019-12-08 15:09:59');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(747, 817, 'a:2:{i:0;i:103;i:1;i:111;}', '2019-12-08 15:10:30');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(748, 818, 'a:2:{i:0;i:103;i:1;i:111;}', '2019-12-08 15:17:09');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(749, 819, 'a:2:{i:0;i:103;i:1;i:111;}', '2019-12-08 15:19:18');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(750, 820, 'a:2:{i:0;i:103;i:1;i:111;}', '2019-12-08 15:42:26');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(751, 821, 'a:2:{i:0;i:103;i:1;i:111;}', '2019-12-08 15:42:48');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(752, 822, 'a:1:{i:0;i:111;}', '2019-12-08 16:04:31');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(753, 823, 'a:1:{i:0;i:111;}', '2019-12-08 16:47:59');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(754, 824, 'a:1:{i:0;i:111;}', '2019-12-08 16:55:14');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(755, 825, 'a:1:{i:0;i:111;}', '2019-12-08 16:56:15');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(756, 826, 'a:1:{i:0;i:111;}', '2019-12-08 16:56:58');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(757, 827, 'a:1:{i:0;i:111;}', '2019-12-08 16:58:40');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(758, 828, 'a:1:{i:0;i:111;}', '2019-12-08 17:00:35');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(759, 829, 'a:1:{i:0;i:111;}', '2019-12-08 17:02:18');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(760, 830, 'a:1:{i:0;i:111;}', '2019-12-08 17:06:00');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(761, 831, 'a:1:{i:0;i:111;}', '2019-12-08 17:06:46');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(762, 832, 'a:1:{i:0;i:111;}', '2019-12-08 17:11:47');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(763, 833, 'a:1:{i:0;i:111;}', '2019-12-08 19:45:50');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(764, 834, 'a:1:{i:0;i:111;}', '2019-12-08 19:55:17');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(765, 835, 'a:1:{i:0;i:111;}', '2019-12-10 00:46:04');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(766, 836, 'a:1:{i:0;i:111;}', '2019-12-11 00:32:12');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(767, 837, 'a:1:{i:0;i:111;}', '2019-12-12 01:48:47');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(768, 838, 'a:1:{i:0;i:111;}', '2019-12-12 14:03:44');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(769, 839, 'a:1:{i:0;i:111;}', '2019-12-13 00:16:28');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(770, 840, 'a:2:{i:0;i:111;i:1;i:147;}', '2019-12-13 00:18:18');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(771, 841, 'a:2:{i:0;i:111;i:1;i:117;}', '2019-12-13 11:04:57');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(772, 842, 'a:2:{i:0;i:111;i:1;i:117;}', '2019-12-13 11:07:36');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(773, 843, 'a:2:{i:0;i:111;i:1;i:117;}', '2019-12-13 11:07:44');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(774, 844, 'a:1:{i:0;i:111;}', '2019-12-16 18:31:46');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(775, 845, 'a:1:{i:0;i:111;}', '2019-12-16 18:34:18');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(776, 846, 'a:1:{i:0;i:111;}', '2019-12-17 17:47:45');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(777, 847, 'a:1:{i:0;i:111;}', '2019-12-17 17:52:10');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(778, 848, 'a:1:{i:0;i:111;}', '2019-12-17 17:52:27');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(779, 849, 'a:1:{i:0;i:111;}', '2019-12-17 17:54:50');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(780, 850, 'a:1:{i:0;i:111;}', '2019-12-17 18:09:06');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(781, 851, 'a:1:{i:0;i:111;}', '2019-12-17 18:12:06');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(782, 852, 'a:1:{i:0;i:111;}', '2019-12-17 18:14:18');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(783, 853, 'a:1:{i:0;i:111;}', '2019-12-17 18:16:01');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(784, 854, 'a:1:{i:0;i:111;}', '2019-12-17 18:16:13');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(785, 855, 'a:1:{i:0;i:111;}', '2019-12-17 18:16:44');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(786, 856, 'a:1:{i:0;i:111;}', '2019-12-17 18:26:03');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(787, 857, 'a:1:{i:0;i:111;}', '2019-12-17 18:34:55');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(788, 858, 'a:1:{i:0;i:111;}', '2019-12-17 18:35:48');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(789, 861, 'a:1:{i:0;i:111;}', '2019-12-18 13:28:09');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(790, 862, 'a:1:{i:0;i:111;}', '2019-12-18 14:13:24');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(791, 863, 'a:1:{i:0;i:111;}', '2019-12-18 14:37:51');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(792, 864, 'a:1:{i:0;i:147;}', '2019-12-18 19:12:29');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(793, 866, 'a:2:{i:0;i:117;i:1;i:147;}', '2019-12-19 20:20:18');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(794, 867, 'a:3:{i:0;i:111;i:1;i:117;i:2;i:147;}', '2019-12-19 20:20:54');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(795, 868, 'a:3:{i:0;i:111;i:1;i:117;i:2;i:147;}', '2019-12-19 21:16:36');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(796, 869, 'a:3:{i:0;i:111;i:1;i:117;i:2;i:147;}', '2019-12-19 21:23:15');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(797, 870, 'a:3:{i:0;i:111;i:1;i:117;i:2;i:147;}', '2019-12-19 21:41:44');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(798, 871, 'a:1:{i:0;i:111;}', '2019-12-21 19:04:28');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(799, 872, 'a:1:{i:0;i:111;}', '2019-12-25 03:00:27');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(800, 873, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-29 15:11:48');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(801, 874, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-29 15:12:45');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(802, 875, 'a:3:{i:0;i:111;i:1;i:117;i:2;i:147;}', '2019-12-29 18:57:39');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(803, 876, 'a:4:{i:0;i:111;i:1;i:117;i:2;i:143;i:3;i:147;}', '2019-12-29 18:58:06');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(804, 877, 'a:4:{i:0;i:103;i:1;i:111;i:2;i:117;i:3;i:147;}', '2020-01-02 18:38:53');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(805, 878, 'a:4:{i:0;i:103;i:1;i:111;i:2;i:117;i:3;i:147;}', '2020-01-02 19:55:31');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(806, 879, 'a:4:{i:0;i:103;i:1;i:111;i:2;i:117;i:3;i:147;}', '2020-01-02 19:56:31');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(807, 880, 'a:4:{i:0;i:103;i:1;i:117;i:2;i:147;i:3;i:171;}', '2020-01-02 20:04:39');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(808, 881, 'a:4:{i:0;i:103;i:1;i:117;i:2;i:147;i:3;i:171;}', '2020-01-02 20:06:48');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(809, 882, 'a:2:{i:0;i:147;i:1;i:171;}', '2020-01-02 20:45:57');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(810, 883, 'a:4:{i:0;i:103;i:1;i:117;i:2;i:147;i:3;i:171;}', '2020-01-02 22:33:02');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(811, 884, 'a:2:{i:0;i:117;i:1;i:147;}', '2020-01-07 18:36:49');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(812, 885, 'a:2:{i:0;i:117;i:1;i:147;}', '2020-01-07 19:29:19');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(813, 886, 'a:3:{i:0;i:117;i:1;i:143;i:2;i:147;}', '2020-01-07 19:40:59');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(814, 887, 'a:3:{i:0;i:117;i:1;i:143;i:2;i:147;}', '2020-01-07 19:41:31');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(815, 889, 'a:4:{i:0;i:103;i:1;i:117;i:2;i:147;i:3;i:171;}', '2020-01-07 20:55:51');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(816, 890, 'a:4:{i:0;i:103;i:1;i:117;i:2;i:147;i:3;i:171;}', '2020-01-07 20:57:32');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(817, 892, 'a:4:{i:0;i:103;i:1;i:117;i:2;i:147;i:3;i:171;}', '2020-01-07 21:00:39');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(818, 893, 'a:4:{i:0;i:103;i:1;i:117;i:2;i:147;i:3;i:171;}', '2020-01-07 21:02:18');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(819, 894, 'a:4:{i:0;i:103;i:1;i:117;i:2;i:147;i:3;i:171;}', '2020-01-07 21:06:53');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(820, 896, 'a:4:{i:0;i:103;i:1;i:117;i:2;i:147;i:3;i:171;}', '2020-01-07 21:09:02');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(821, 897, 'a:4:{i:0;i:103;i:1;i:117;i:2;i:147;i:3;i:171;}', '2020-01-08 14:10:28');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(822, 898, 'a:4:{i:0;i:103;i:1;i:117;i:2;i:147;i:3;i:171;}', '2020-01-08 14:45:59');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(823, 899, 'a:4:{i:0;i:103;i:1;i:117;i:2;i:147;i:3;i:171;}', '2020-01-08 14:46:57');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(824, 901, 'a:4:{i:0;i:103;i:1;i:117;i:2;i:147;i:3;i:171;}', '2020-01-08 15:51:21');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(825, 902, 'a:4:{i:0;i:103;i:1;i:117;i:2;i:147;i:3;i:171;}', '2020-01-08 15:51:52');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(826, 903, 'a:4:{i:0;i:103;i:1;i:117;i:2;i:147;i:3;i:171;}', '2020-01-08 16:03:19');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(827, 904, 'a:4:{i:0;i:103;i:1;i:117;i:2;i:147;i:3;i:171;}', '2020-01-08 16:33:32');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(828, 905, 'a:4:{i:0;i:103;i:1;i:117;i:2;i:147;i:3;i:171;}', '2020-01-08 16:34:00');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(829, 906, 'a:3:{i:0;i:117;i:1;i:147;i:2;i:171;}', '2020-01-08 16:34:25');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(830, 907, 'a:3:{i:0;i:117;i:1;i:147;i:2;i:171;}', '2020-01-08 16:34:55');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(831, 908, 'a:2:{i:0;i:117;i:1;i:147;}', '2020-01-09 11:34:32');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(832, 909, 'a:1:{i:0;i:117;}', '2020-01-09 12:13:36');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(833, 910, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 15:06:24');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(834, 911, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 15:09:48');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(835, 912, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 15:10:40');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(836, 913, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 15:41:03');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(837, 914, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 15:56:23');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(838, 915, 'a:3:{i:0;i:103;i:1;i:117;i:2;i:171;}', '2020-01-09 16:26:18');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(839, 916, 'a:1:{i:0;i:117;}', '2020-01-09 16:27:45');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(840, 917, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 16:31:38');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(841, 918, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 16:33:46');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(842, 919, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 16:43:36');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(843, 920, 'a:1:{i:0;i:117;}', '2020-01-09 16:53:06');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(844, 921, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 17:20:33');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(845, 922, 'a:1:{i:0;i:171;}', '2020-01-09 17:37:42');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(846, 923, 'a:1:{i:0;i:117;}', '2020-01-09 17:49:11');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(847, 924, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 17:50:02');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(848, 925, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 18:58:26');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(849, 926, 'a:1:{i:0;i:117;}', '2020-01-09 19:36:53');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(850, 927, 'a:1:{i:0;i:117;}', '2020-01-09 19:37:29');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(851, 928, 'a:1:{i:0;i:117;}', '2020-01-09 19:38:10');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(852, 929, 'a:1:{i:0;i:117;}', '2020-01-09 19:39:45');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(853, 930, 'a:1:{i:0;i:117;}', '2020-01-09 19:43:50');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(854, 931, 'a:1:{i:0;i:117;}', '2020-01-09 19:44:14');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(855, 932, 'a:1:{i:0;i:117;}', '2020-01-09 19:44:41');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(856, 933, 'a:1:{i:0;i:117;}', '2020-01-09 19:45:11');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(857, 934, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 19:45:34');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(858, 935, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 19:49:11');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(859, 936, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 19:54:33');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(860, 937, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 19:57:56');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(861, 938, 'a:1:{i:0;i:171;}', '2020-01-09 20:07:59');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(862, 939, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 20:19:45');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(863, 940, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 20:24:48');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(864, 941, 'a:1:{i:0;i:171;}', '2020-01-09 20:30:06');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(865, 942, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 20:41:32');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(866, 943, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 20:41:56');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(867, 944, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 20:42:24');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(868, 945, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 21:04:32');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(869, 946, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 21:05:56');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(870, 947, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 21:17:46');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(871, 948, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 21:49:23');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(872, 949, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 21:51:18');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(873, 950, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 22:00:38');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(874, 951, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 22:02:34');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(875, 952, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 22:03:30');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(876, 953, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 22:04:19');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(877, 954, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 22:06:04');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(878, 955, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 22:06:27');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(879, 956, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 22:06:52');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(880, 957, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 22:07:13');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(881, 958, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 22:07:38');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(882, 959, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 22:09:21');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(883, 960, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 22:11:31');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(884, 961, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 22:13:49');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(885, 962, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 22:14:22');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(886, 963, 'a:1:{i:0;i:171;}', '2020-01-09 22:16:46');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(887, 964, 'a:1:{i:0;i:171;}', '2020-01-09 22:17:10');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(888, 965, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 22:18:00');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(889, 966, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-09 22:39:59');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(890, 967, 'a:1:{i:0;i:117;}', '2020-01-10 13:54:08');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(891, 968, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-22 22:13:14');
INSERT INTO `except_list` (`id`, `chat_request_id`, `except`, `created_at`) VALUES
	(892, 969, 'a:2:{i:0;i:117;i:1;i:171;}', '2020-01-26 13:50:34');
/*!40000 ALTER TABLE `except_list` ENABLE KEYS */;

-- 테이블 MerDog.fcm_log 구조 내보내기
CREATE TABLE IF NOT EXISTS `fcm_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` varchar(50) NOT NULL COMMENT 'user / doctor',
  `fcm_id` int(11) NOT NULL COMMENT '회원번호',
  `type` varchar(50) NOT NULL COMMENT '알림 종류',
  `ip_address` varchar(50) NOT NULL COMMENT 'ip 주소',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='fcm 기록 로그';

-- 테이블 데이터 MerDog.fcm_log:~966 rows (대략적) 내보내기
/*!40000 ALTER TABLE `fcm_log` DISABLE KEYS */;
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(96, 'user', 77, '관리자 단체 발송', '114.204.208.165', '2019-12-01 20:16:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(97, 'user', 80, '관리자 단체 발송', '114.204.208.165', '2019-12-01 20:16:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(98, 'user', 77, '관리자 단체 발송', '114.204.208.165', '2019-12-01 20:20:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(99, 'user', 80, '관리자 단체 발송', '114.204.208.165', '2019-12-01 20:20:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(100, 'user', 77, '관리자 단체 발송', '114.204.208.165', '2019-12-01 20:21:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(101, 'user', 80, '관리자 단체 발송', '114.204.208.165', '2019-12-01 20:21:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(102, 'user', 77, '관리자 단체 발송', '114.204.208.165', '2019-12-01 20:22:43');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(103, 'user', 80, '관리자 단체 발송', '114.204.208.165', '2019-12-01 20:22:43');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(104, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-01 20:42:10');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(105, 'user', 77, '채팅 연결', '223.38.28.226', '2019-12-01 20:42:13');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(106, 'user', 77, '채팅 메시지', '223.38.28.226', '2019-12-01 20:42:22');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(107, 'user', 77, '채팅 메시지', '223.38.28.226', '2019-12-01 20:42:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(108, 'user', 77, '관리자 단체 발송', '114.204.208.165', '2019-12-01 20:52:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(109, 'doctor', 111, '관리자 단체 발송', '114.204.208.165', '2019-12-01 20:52:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(110, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-01 21:00:26');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(111, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-01 21:00:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(112, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-01 22:10:37');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(113, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-01 22:10:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(114, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-01 22:10:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(115, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-01 22:52:05');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(116, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-01 22:52:39');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(117, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-01 23:19:09');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(118, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-01 23:42:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(119, 'doctor', 103, '채팅 요청', '1.236.88.213', '2019-12-01 23:47:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(120, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-01 23:47:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(121, 'doctor', 103, '채팅 요청', '1.236.88.213', '2019-12-01 23:47:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(122, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-01 23:47:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(123, 'user', 77, '채팅 연결', '106.102.142.204', '2019-12-01 23:47:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(124, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:47:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(125, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:47:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(126, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:47:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(127, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-01 23:48:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(128, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-01 23:48:10');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(129, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:48:13');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(130, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:48:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(131, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:48:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(132, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:48:26');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(133, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:48:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(134, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-01 23:48:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(135, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:48:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(136, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:48:37');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(137, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:48:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(138, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:48:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(139, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-01 23:48:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(140, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:48:47');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(141, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:48:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(142, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:48:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(143, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:48:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(144, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:49:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(145, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-01 23:49:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(146, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:49:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(147, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:49:08');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(148, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:49:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(149, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:49:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(150, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:49:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(151, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:49:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(152, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:49:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(153, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:49:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(154, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:49:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(155, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:49:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(156, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:49:39');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(157, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:49:42');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(158, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-01 23:49:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(159, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-02 00:47:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(160, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-02 00:48:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(161, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-02 00:49:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(162, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:54:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(163, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:54:27');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(164, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-02 00:54:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(165, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:54:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(166, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-02 00:54:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(167, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:54:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(168, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-02 00:54:34');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(169, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:54:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(170, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-02 00:54:37');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(171, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:54:39');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(172, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:54:42');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(173, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-02 00:54:43');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(174, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:54:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(175, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-02 00:54:46');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(176, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:54:47');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(177, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:54:50');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(178, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:54:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(179, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-02 00:54:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(180, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:54:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(181, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:54:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(182, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-02 00:55:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(183, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:55:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(184, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:55:13');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(185, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:55:17');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(186, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:55:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(187, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:55:27');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(188, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-02 00:55:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(189, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:55:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(190, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:55:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(191, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-02 00:55:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(192, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:55:35');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(193, 'user', 77, '채팅 메시지', '106.102.142.204', '2019-12-02 00:55:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(194, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-02 00:55:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(195, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-02 12:45:27');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(196, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-02 13:19:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(197, 'doctor', 103, '채팅 메시지', '1.236.88.213', '2019-12-02 13:21:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(198, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-02 13:22:42');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(199, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-02 13:23:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(200, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-02 13:24:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(201, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-02 13:24:06');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(202, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-02 15:51:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(203, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-02 16:48:10');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(204, 'user', 77, '채팅 연결', '223.38.28.226', '2019-12-02 16:48:15');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(205, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-02 16:48:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(206, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-02 16:48:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(207, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-02 16:48:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(208, 'user', 77, '채팅 메시지', '223.38.28.226', '2019-12-02 16:48:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(209, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-02 16:49:17');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(210, 'user', 77, '채팅 메시지', '223.38.28.226', '2019-12-02 16:49:35');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(211, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-02 16:50:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(212, 'doctor', 143, '채팅 요청', '1.236.88.213', '2019-12-02 16:50:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(213, 'user', 77, '채팅 연결', '223.38.28.226', '2019-12-02 16:50:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(214, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-02 16:50:26');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(215, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-02 16:50:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(216, 'doctor', 143, '채팅 요청', '1.236.88.213', '2019-12-02 16:50:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(217, 'user', 77, '채팅 연결', '223.38.28.226', '2019-12-02 16:50:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(218, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-02 16:50:37');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(219, 'doctor', 143, '채팅 요청', '1.236.88.213', '2019-12-02 16:50:37');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(220, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-02 16:51:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(221, 'doctor', 143, '채팅 요청', '1.236.88.213', '2019-12-02 16:51:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(222, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-02 16:51:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(223, 'doctor', 143, '채팅 요청', '1.236.88.213', '2019-12-02 16:51:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(224, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-02 16:52:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(225, 'doctor', 143, '채팅 요청', '1.236.88.213', '2019-12-02 16:52:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(226, 'user', 77, '채팅 연결', '223.38.28.226', '2019-12-02 16:52:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(227, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-02 16:52:39');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(228, 'doctor', 143, '채팅 요청', '1.236.88.213', '2019-12-02 16:52:39');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(229, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-02 16:53:39');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(230, 'user', 77, '채팅 연결', '223.38.28.226', '2019-12-02 16:53:41');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(231, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-02 16:53:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(232, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-02 16:55:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(233, 'user', 77, '채팅 연결', '223.38.28.226', '2019-12-02 16:56:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(234, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-02 16:56:09');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(235, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-02 17:00:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(236, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-02 17:00:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(237, 'user', 77, '채팅 연결', '223.38.28.226', '2019-12-02 17:00:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(238, 'doctor', 111, '채팅 요청', '1.236.88.213', '2019-12-02 17:01:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(239, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-02 17:02:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(240, 'user', 77, '채팅 메시지', '223.38.28.226', '2019-12-02 17:03:07');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(241, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-02 17:06:10');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(242, 'user', 77, '채팅 메시지', '223.38.28.226', '2019-12-02 17:11:15');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(243, 'user', 77, '채팅 메시지', '223.38.28.226', '2019-12-02 17:11:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(244, 'user', 77, '채팅 메시지', '223.38.28.226', '2019-12-02 17:12:50');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(245, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-02 17:28:07');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(246, 'doctor', 111, '채팅 메시지', '1.236.88.213', '2019-12-02 17:29:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(247, 'doctor', 111, '채팅 메시지', '223.62.219.211', '2019-12-03 14:17:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(248, 'doctor', 111, '채팅 메시지', '14.42.86.31', '2019-12-03 14:34:06');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(249, 'doctor', 111, '채팅 메시지', '223.62.219.211', '2019-12-03 14:39:05');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(250, 'doctor', 111, '채팅 요청', '14.42.86.31', '2019-12-03 15:38:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(251, 'user', 77, '채팅 연결', '223.39.140.159', '2019-12-03 15:39:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(252, 'doctor', 111, '채팅 메시지', '14.42.86.31', '2019-12-03 15:39:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(253, 'doctor', 111, '채팅 메시지', '14.42.86.31', '2019-12-03 15:39:22');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(254, 'user', 77, '채팅 메시지', '223.39.140.159', '2019-12-03 15:39:26');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(255, 'doctor', 111, '채팅 메시지', '14.42.86.31', '2019-12-03 15:39:27');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(256, 'user', 77, '채팅 메시지', '223.39.140.159', '2019-12-03 15:39:34');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(257, 'user', 77, '채팅 메시지', '223.39.140.159', '2019-12-03 15:39:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(258, 'doctor', 111, '채팅 메시지', '14.42.86.31', '2019-12-03 15:40:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(259, 'doctor', 111, '채팅 메시지', '14.42.86.31', '2019-12-03 15:40:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(260, 'doctor', 111, '채팅 메시지', '14.42.86.31', '2019-12-03 15:40:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(261, 'doctor', 111, '채팅 요청', '14.42.86.31', '2019-12-03 18:56:05');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(262, 'user', 77, '채팅 연결', '223.39.140.159', '2019-12-03 18:56:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(263, 'doctor', 111, '채팅 메시지', '14.42.86.31', '2019-12-03 18:56:22');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(264, 'doctor', 111, '채팅 요청', '14.42.86.31', '2019-12-03 19:25:50');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(265, 'user', 77, '채팅 연결', '223.39.140.159', '2019-12-03 19:25:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(266, 'doctor', 111, '채팅 메시지', '14.42.86.31', '2019-12-03 19:26:05');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(267, 'user', 77, '채팅 메시지', '223.39.140.159', '2019-12-03 19:50:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(268, 'doctor', 143, '관리자 단체 발송', '112.152.195.218', '2019-12-05 15:47:43');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(269, 'user', 77, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:07:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(270, 'doctor', 103, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:19:35');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(271, 'doctor', 111, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:19:35');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(272, 'doctor', 143, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:19:35');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(273, 'doctor', 103, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:21:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(274, 'doctor', 111, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:21:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(275, 'doctor', 143, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:21:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(276, 'user', 77, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:22:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(277, 'user', 78, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:22:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(278, 'doctor', 103, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:23:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(279, 'doctor', 111, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:23:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(280, 'doctor', 143, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:23:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(281, 'doctor', 103, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:28:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(282, 'doctor', 111, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:28:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(283, 'doctor', 103, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:29:46');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(284, 'doctor', 111, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:29:46');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(285, 'doctor', 143, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:29:46');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(286, 'doctor', 103, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:31:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(287, 'doctor', 111, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:31:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(288, 'doctor', 143, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:31:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(289, 'doctor', 103, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:32:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(290, 'doctor', 111, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:32:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(291, 'doctor', 143, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:32:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(292, 'doctor', 103, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:34:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(293, 'doctor', 111, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:34:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(294, 'doctor', 143, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:34:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(295, 'doctor', 111, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:39:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(296, 'doctor', 111, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:47:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(297, 'doctor', 103, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:48:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(298, 'doctor', 111, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:48:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(299, 'doctor', 103, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:49:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(300, 'doctor', 111, '관리자 단체 발송', '112.152.195.218', '2019-12-05 17:49:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(301, 'doctor', 103, '채팅 요청', '223.38.28.228', '2019-12-05 18:28:06');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(302, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-05 18:28:06');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(303, 'user', 77, '관리자 단체 발송', '112.152.195.218', '2019-12-05 19:08:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(304, 'user', 78, '관리자 단체 발송', '112.152.195.218', '2019-12-05 19:08:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(305, 'doctor', 103, '관리자 단체 발송', '112.152.195.218', '2019-12-05 19:10:08');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(306, 'doctor', 143, '관리자 단체 발송', '112.152.195.218', '2019-12-05 19:10:08');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(307, 'doctor', 103, '관리자 단체 발송', '112.152.195.218', '2019-12-05 20:18:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(308, 'doctor', 111, '관리자 단체 발송', '112.152.195.218', '2019-12-05 20:18:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(309, 'doctor', 103, '관리자 단체 발송', '112.152.195.218', '2019-12-05 20:25:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(310, 'doctor', 111, '관리자 단체 발송', '112.152.195.218', '2019-12-05 20:25:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(311, 'doctor', 103, '관리자 단체 발송', '112.152.195.218', '2019-12-05 20:33:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(312, 'doctor', 103, '관리자 단체 발송', '112.152.195.218', '2019-12-05 20:51:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(313, 'doctor', 143, '관리자 단체 발송', '112.152.195.218', '2019-12-05 20:51:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(314, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 10:31:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(315, 'user', 80, '채팅 연결', '223.39.141.48', '2019-12-06 10:31:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(316, 'user', 80, '채팅 메시지', '223.39.141.48', '2019-12-06 10:31:41');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(317, 'user', 80, '채팅 메시지', '223.39.141.48', '2019-12-06 10:31:43');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(318, 'user', 80, '채팅 메시지', '223.39.141.48', '2019-12-06 10:31:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(319, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 10:54:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(320, 'doctor', 143, '채팅 요청', '223.38.28.228', '2019-12-06 10:54:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(321, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 10:55:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(322, 'doctor', 143, '채팅 요청', '223.38.28.228', '2019-12-06 10:55:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(323, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 10:56:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(324, 'doctor', 143, '채팅 요청', '223.38.28.228', '2019-12-06 10:56:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(325, 'user', 83, '관리자 발송', '14.42.86.31', '2019-12-06 10:57:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(326, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 10:57:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(327, 'doctor', 117, '채팅 요청', '223.38.28.228', '2019-12-06 10:57:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(328, 'doctor', 143, '채팅 요청', '223.38.28.228', '2019-12-06 10:57:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(329, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 10:58:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(330, 'doctor', 117, '채팅 요청', '223.38.28.228', '2019-12-06 10:58:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(331, 'doctor', 143, '채팅 요청', '223.38.28.228', '2019-12-06 10:58:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(332, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 10:58:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(333, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 10:58:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(334, 'doctor', 117, '채팅 요청', '223.38.28.228', '2019-12-06 10:58:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(335, 'doctor', 143, '채팅 요청', '223.38.28.228', '2019-12-06 10:58:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(336, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 10:58:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(337, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 10:59:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(338, 'doctor', 117, '채팅 요청', '223.38.28.228', '2019-12-06 10:59:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(339, 'doctor', 143, '채팅 요청', '223.38.28.228', '2019-12-06 10:59:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(340, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 10:59:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(341, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 10:59:50');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(342, 'doctor', 117, '채팅 요청', '223.38.28.228', '2019-12-06 10:59:50');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(343, 'doctor', 143, '채팅 요청', '223.38.28.228', '2019-12-06 10:59:50');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(344, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 10:59:50');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(345, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 11:00:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(346, 'doctor', 117, '채팅 요청', '223.38.28.228', '2019-12-06 11:00:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(347, 'doctor', 143, '채팅 요청', '223.38.28.228', '2019-12-06 11:00:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(348, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:00:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(349, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 11:01:05');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(350, 'doctor', 117, '채팅 요청', '223.39.141.48', '2019-12-06 11:01:05');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(351, 'doctor', 143, '채팅 요청', '223.39.141.48', '2019-12-06 11:01:05');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(352, 'doctor', 147, '채팅 요청', '223.39.141.48', '2019-12-06 11:01:05');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(353, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 11:01:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(354, 'doctor', 117, '채팅 요청', '223.39.141.48', '2019-12-06 11:01:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(355, 'doctor', 143, '채팅 요청', '223.39.141.48', '2019-12-06 11:01:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(356, 'doctor', 147, '채팅 요청', '223.39.141.48', '2019-12-06 11:01:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(357, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 11:02:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(358, 'doctor', 117, '채팅 요청', '223.39.141.48', '2019-12-06 11:02:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(359, 'doctor', 143, '채팅 요청', '223.39.141.48', '2019-12-06 11:02:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(360, 'doctor', 147, '채팅 요청', '223.39.141.48', '2019-12-06 11:02:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(361, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 11:03:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(362, 'doctor', 117, '채팅 요청', '223.39.141.48', '2019-12-06 11:03:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(363, 'doctor', 143, '채팅 요청', '223.39.141.48', '2019-12-06 11:03:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(364, 'doctor', 147, '채팅 요청', '223.39.141.48', '2019-12-06 11:03:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(365, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 11:03:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(366, 'doctor', 117, '채팅 요청', '223.39.141.48', '2019-12-06 11:03:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(367, 'doctor', 143, '채팅 요청', '223.39.141.48', '2019-12-06 11:03:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(368, 'doctor', 147, '채팅 요청', '223.39.141.48', '2019-12-06 11:03:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(369, 'doctor', 111, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:03:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(370, 'doctor', 117, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:03:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(371, 'doctor', 143, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:03:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(372, 'doctor', 147, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:03:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(373, 'doctor', 117, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:04:22');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(374, 'doctor', 143, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:04:22');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(375, 'doctor', 147, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:04:22');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(376, 'user', 84, '관리자 발송', '14.42.86.31', '2019-12-06 11:04:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(377, 'doctor', 117, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:05:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(378, 'doctor', 143, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:05:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(379, 'doctor', 147, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:05:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(380, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 11:05:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(381, 'doctor', 117, '채팅 요청', '223.38.28.228', '2019-12-06 11:05:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(382, 'doctor', 143, '채팅 요청', '223.38.28.228', '2019-12-06 11:05:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(383, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:05:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(384, 'user', 83, '채팅 연결', '211.36.130.86', '2019-12-06 11:05:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(385, 'doctor', 117, '채팅 메시지', '223.38.28.228', '2019-12-06 11:05:50');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(386, 'user', 83, '채팅 메시지', '211.36.130.86', '2019-12-06 11:05:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(387, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 11:06:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(388, 'doctor', 117, '채팅 요청', '223.38.28.228', '2019-12-06 11:06:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(389, 'doctor', 143, '채팅 요청', '223.38.28.228', '2019-12-06 11:06:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(390, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:06:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(391, 'doctor', 117, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:07:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(392, 'doctor', 143, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:07:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(393, 'doctor', 147, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:07:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(394, 'doctor', 117, '채팅 메시지', '223.38.28.228', '2019-12-06 11:08:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(395, 'doctor', 117, '채팅 메시지', '223.38.28.228', '2019-12-06 11:08:17');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(396, 'doctor', 117, '채팅 메시지', '223.38.28.228', '2019-12-06 11:08:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(397, 'doctor', 117, '채팅 메시지', '223.38.28.228', '2019-12-06 11:08:35');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(398, 'doctor', 117, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:08:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(399, 'doctor', 143, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:08:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(400, 'doctor', 147, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:08:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(401, 'user', 83, '채팅 메시지', '211.36.130.86', '2019-12-06 11:08:42');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(402, 'user', 83, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:09:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(403, 'user', 83, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:10:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(404, 'user', 77, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:10:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(405, 'user', 83, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:10:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(406, 'user', 84, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:10:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(407, 'doctor', 117, '채팅 메시지', '223.38.28.228', '2019-12-06 11:11:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(408, 'doctor', 117, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:11:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(409, 'doctor', 143, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:11:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(410, 'doctor', 147, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:11:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(411, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 11:11:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(412, 'doctor', 117, '채팅 요청', '223.38.28.228', '2019-12-06 11:11:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(413, 'doctor', 143, '채팅 요청', '223.38.28.228', '2019-12-06 11:11:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(414, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:11:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(415, 'doctor', 117, '채팅 메시지', '223.38.28.228', '2019-12-06 11:12:07');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(416, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 11:12:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(417, 'doctor', 117, '채팅 요청', '223.38.28.228', '2019-12-06 11:12:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(418, 'doctor', 143, '채팅 요청', '223.38.28.228', '2019-12-06 11:12:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(419, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:12:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(420, 'user', 83, '채팅 연결', '211.36.130.86', '2019-12-06 11:13:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(421, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 11:13:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(422, 'doctor', 117, '채팅 요청', '223.38.28.228', '2019-12-06 11:13:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(423, 'doctor', 143, '채팅 요청', '223.38.28.228', '2019-12-06 11:13:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(424, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:13:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(425, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 11:15:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(426, 'doctor', 117, '채팅 요청', '223.38.28.228', '2019-12-06 11:15:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(427, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:15:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(428, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 11:17:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(429, 'doctor', 117, '채팅 요청', '223.38.28.228', '2019-12-06 11:17:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(430, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:17:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(431, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 11:17:26');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(432, 'doctor', 117, '채팅 요청', '223.38.28.228', '2019-12-06 11:17:26');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(433, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:17:26');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(434, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 11:17:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(435, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:17:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(436, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 11:18:08');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(437, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:18:08');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(438, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 11:18:42');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(439, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:18:42');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(440, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 11:18:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(441, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:18:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(442, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 11:19:06');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(443, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:19:06');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(444, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 11:19:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(445, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:19:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(446, 'doctor', 111, '채팅 요청', '223.38.28.228', '2019-12-06 11:23:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(447, 'doctor', 117, '채팅 요청', '223.38.28.228', '2019-12-06 11:23:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(448, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:23:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(449, 'user', 83, '채팅 연결', '211.36.130.86', '2019-12-06 11:23:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(450, 'doctor', 117, '채팅 메시지', '223.38.28.228', '2019-12-06 11:24:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(451, 'doctor', 117, '채팅 메시지', '223.38.28.228', '2019-12-06 11:25:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(452, 'doctor', 117, '채팅 메시지', '223.38.28.228', '2019-12-06 11:25:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(453, 'doctor', 117, '채팅 메시지', '223.38.28.228', '2019-12-06 11:25:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(454, 'doctor', 117, '채팅 메시지', '223.38.28.228', '2019-12-06 11:25:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(455, 'doctor', 111, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:39:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(456, 'doctor', 117, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:39:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(457, 'doctor', 147, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:39:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(458, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:40:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(459, 'doctor', 147, '채팅 요청', '223.38.28.228', '2019-12-06 11:40:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(460, 'doctor', 111, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:40:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(461, 'doctor', 117, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:40:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(462, 'doctor', 147, '관리자 단체 발송', '14.42.86.31', '2019-12-06 11:40:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(463, 'doctor', 111, '채팅 요청', '14.42.86.31', '2019-12-06 12:04:06');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(464, 'doctor', 147, '채팅 요청', '14.42.86.31', '2019-12-06 12:04:06');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(465, 'doctor', 111, '채팅 요청', '14.42.86.31', '2019-12-06 12:05:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(466, 'doctor', 147, '채팅 요청', '14.42.86.31', '2019-12-06 12:05:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(467, 'doctor', 111, '채팅 요청', '14.42.86.31', '2019-12-06 12:06:46');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(468, 'doctor', 147, '채팅 요청', '14.42.86.31', '2019-12-06 12:06:46');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(469, 'doctor', 111, '채팅 요청', '14.42.86.31', '2019-12-06 12:07:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(470, 'doctor', 147, '채팅 요청', '14.42.86.31', '2019-12-06 12:07:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(471, 'doctor', 111, '채팅 요청', '14.42.86.31', '2019-12-06 12:07:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(472, 'doctor', 147, '채팅 요청', '14.42.86.31', '2019-12-06 12:07:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(473, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 12:11:46');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(474, 'doctor', 117, '채팅 요청', '223.39.141.48', '2019-12-06 12:11:46');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(475, 'doctor', 147, '채팅 요청', '223.39.141.48', '2019-12-06 12:11:46');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(476, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 12:13:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(477, 'doctor', 117, '채팅 요청', '223.39.141.48', '2019-12-06 12:13:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(478, 'doctor', 147, '채팅 요청', '223.39.141.48', '2019-12-06 12:13:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(479, 'user', 84, '채팅 연결', '211.36.130.86', '2019-12-06 12:13:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(480, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 12:15:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(481, 'doctor', 117, '채팅 요청', '223.39.141.48', '2019-12-06 12:15:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(482, 'doctor', 147, '채팅 요청', '223.39.141.48', '2019-12-06 12:15:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(483, 'user', 84, '채팅 연결', '211.36.130.86', '2019-12-06 12:15:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(484, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 12:16:13');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(485, 'doctor', 117, '채팅 요청', '223.39.141.48', '2019-12-06 12:16:13');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(486, 'doctor', 147, '채팅 요청', '223.39.141.48', '2019-12-06 12:16:13');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(487, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 12:16:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(488, 'doctor', 117, '채팅 요청', '223.39.141.48', '2019-12-06 12:16:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(489, 'doctor', 147, '채팅 요청', '223.39.141.48', '2019-12-06 12:16:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(490, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 12:17:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(491, 'doctor', 117, '채팅 요청', '223.39.141.48', '2019-12-06 12:17:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(492, 'doctor', 147, '채팅 요청', '223.39.141.48', '2019-12-06 12:17:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(493, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 12:17:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(494, 'doctor', 117, '채팅 요청', '223.39.141.48', '2019-12-06 12:17:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(495, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 12:18:47');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(496, 'doctor', 117, '채팅 요청', '223.39.141.48', '2019-12-06 12:18:47');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(497, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 12:20:08');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(498, 'doctor', 117, '채팅 요청', '223.39.141.48', '2019-12-06 12:20:08');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(499, 'user', 84, '채팅 연결', '211.36.130.86', '2019-12-06 12:20:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(500, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 12:20:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(501, 'doctor', 117, '채팅 요청', '223.39.141.48', '2019-12-06 12:20:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(502, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 12:21:34');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(503, 'doctor', 117, '채팅 요청', '223.39.141.48', '2019-12-06 12:21:34');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(504, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 12:26:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(505, 'doctor', 117, '채팅 요청', '223.39.141.48', '2019-12-06 12:26:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(506, 'user', 84, '채팅 연결', '211.36.130.86', '2019-12-06 12:26:05');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(507, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 12:27:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(508, 'user', 84, '채팅 연결', '211.36.130.86', '2019-12-06 12:27:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(509, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 12:28:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(510, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:07:05');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(511, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:07:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(512, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:07:23');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(513, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:07:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(514, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:07:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(515, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:08:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(516, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:08:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(517, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:09:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(518, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:10:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(519, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:10:42');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(520, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:11:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(521, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:11:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(522, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:11:41');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(523, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:11:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(524, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:15:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(525, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:15:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(526, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:15:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(527, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:16:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(528, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:16:26');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(529, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:20:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(530, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:21:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(531, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:21:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(532, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:21:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(533, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:22:39');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(534, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:24:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(535, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:25:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(536, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:25:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(537, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:26:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(538, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:30:05');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(539, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:30:07');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(540, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:30:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(541, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:31:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(542, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:31:27');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(543, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:31:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(544, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:33:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(545, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:33:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(546, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:33:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(547, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:34:08');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(548, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:34:47');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(549, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:34:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(550, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:36:17');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(551, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:36:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(552, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:36:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(553, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:36:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(554, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:38:37');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(555, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:38:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(556, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:38:50');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(557, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:38:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(558, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:39:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(559, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:39:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(560, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:39:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(561, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:39:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(562, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:39:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(563, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:41:46');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(564, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:43:08');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(565, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:43:10');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(566, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:43:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(567, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:45:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(568, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:45:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(569, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:45:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(570, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:45:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(571, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:46:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(572, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:46:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(573, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:46:42');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(574, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:46:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(575, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:46:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(576, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:47:34');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(577, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:47:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(578, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:48:05');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(579, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:48:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(580, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:49:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(581, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:49:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(582, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:50:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(583, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:50:26');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(584, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:50:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(585, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:51:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(586, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:51:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(587, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:52:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(588, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:52:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(589, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:52:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(590, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:52:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(591, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:53:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(592, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:53:10');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(593, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:53:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(594, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:53:22');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(595, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:53:27');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(596, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:53:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(597, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:53:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(598, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:53:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(599, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:54:09');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(600, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:54:17');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(601, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:54:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(602, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:54:35');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(603, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:54:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(604, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:54:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(605, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:54:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(606, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:55:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(607, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:55:09');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(608, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:55:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(609, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:55:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(610, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:55:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(611, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:55:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(612, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:58:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(613, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:58:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(614, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:58:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(615, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:58:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(616, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:59:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(617, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 14:59:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(618, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 14:59:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(619, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 15:03:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(620, 'doctor', 111, '채팅 요청', '223.39.141.48', '2019-12-06 15:03:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(621, 'user', 84, '채팅 연결', '223.39.141.48', '2019-12-06 15:04:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(622, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 10:26:26');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(623, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 10:26:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(624, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 10:28:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(625, 'doctor', 111, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:29:13');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(626, 'doctor', 143, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:29:13');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(627, 'doctor', 147, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:29:13');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(628, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 10:29:47');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(629, 'user', 77, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:29:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(630, 'user', 83, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:29:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(631, 'user', 84, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:29:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(632, 'doctor', 111, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:29:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(633, 'doctor', 143, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:29:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(634, 'doctor', 147, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:29:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(635, 'doctor', 111, '관리자 단체 발송', '112.152.195.218', '2019-12-08 10:48:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(636, 'doctor', 143, '관리자 단체 발송', '112.152.195.218', '2019-12-08 10:48:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(637, 'doctor', 147, '관리자 단체 발송', '112.152.195.218', '2019-12-08 10:48:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(638, 'user', 77, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:55:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(639, 'user', 83, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:55:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(640, 'user', 84, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:55:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(641, 'doctor', 111, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:55:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(642, 'doctor', 143, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:55:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(643, 'doctor', 147, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:55:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(644, 'doctor', 111, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:56:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(645, 'doctor', 143, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:56:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(646, 'doctor', 147, '관리자 단체 발송', '175.123.118.23', '2019-12-08 10:56:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(647, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 10:57:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(648, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 11:01:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(649, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 11:21:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(650, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 12:40:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(651, 'doctor', 103, '채팅 요청', '223.62.175.116', '2019-12-08 15:01:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(652, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 15:01:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(653, 'doctor', 103, '채팅 요청', '223.62.175.116', '2019-12-08 15:09:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(654, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 15:09:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(655, 'doctor', 103, '채팅 요청', '223.62.175.116', '2019-12-08 15:09:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(656, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 15:09:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(657, 'doctor', 103, '채팅 요청', '223.62.175.116', '2019-12-08 15:10:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(658, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 15:10:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(659, 'doctor', 103, '채팅 요청', '223.62.175.116', '2019-12-08 15:17:09');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(660, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 15:17:09');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(661, 'doctor', 103, '채팅 요청', '223.62.175.116', '2019-12-08 15:19:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(662, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 15:19:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(663, 'doctor', 103, '채팅 요청', '223.62.175.116', '2019-12-08 15:42:27');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(664, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 15:42:27');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(665, 'doctor', 103, '채팅 요청', '223.62.175.116', '2019-12-08 15:42:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(666, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 15:42:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(667, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 16:04:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(668, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 16:48:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(669, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 16:55:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(670, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 16:56:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(671, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 16:56:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(672, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 16:58:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(673, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 17:00:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(674, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 17:02:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(675, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 17:06:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(676, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 17:06:47');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(677, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 17:11:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(678, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 19:45:50');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(679, 'doctor', 111, '채팅 요청', '223.62.175.116', '2019-12-08 19:55:17');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(680, 'doctor', 103, '관리자 단체 발송', '175.123.118.23', '2019-12-10 00:02:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(681, 'doctor', 111, '관리자 단체 발송', '175.123.118.23', '2019-12-10 00:02:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(682, 'doctor', 147, '관리자 단체 발송', '175.123.118.23', '2019-12-10 00:02:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(683, 'doctor', 111, '채팅 요청', '223.62.162.219', '2019-12-10 00:46:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(684, 'user', 84, '채팅 연결', '223.62.162.219', '2019-12-10 00:46:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(685, 'user', 84, '채팅 메시지', '223.62.162.219', '2019-12-10 00:46:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(686, 'doctor', 111, '채팅 요청', '223.62.162.210', '2019-12-11 00:32:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(687, 'user', 84, '채팅 연결', '223.62.162.210', '2019-12-11 00:32:26');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(688, 'user', 84, '채팅 메시지', '223.62.162.210', '2019-12-11 00:32:34');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(689, 'user', 84, '채팅 메시지', '223.62.162.210', '2019-12-11 00:32:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(690, 'user', 84, '채팅 메시지', '223.62.162.210', '2019-12-11 00:32:46');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(691, 'user', 84, '채팅 메시지', '223.62.162.210', '2019-12-11 00:32:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(692, 'user', 84, '채팅 메시지', '223.62.162.210', '2019-12-11 00:32:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(693, 'user', 84, '채팅 메시지', '223.62.162.210', '2019-12-11 00:33:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(694, 'doctor', 111, '채팅 요청', '223.62.175.155', '2019-12-12 01:48:47');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(695, 'doctor', 111, '채팅 요청', '223.62.202.97', '2019-12-12 14:03:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(696, 'user', 84, '채팅 연결', '223.62.202.97', '2019-12-12 14:03:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(697, 'user', 84, '채팅 메시지', '223.62.202.97', '2019-12-12 14:04:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(698, 'doctor', 111, '채팅 요청', '223.62.175.155', '2019-12-13 00:16:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(699, 'doctor', 111, '채팅 요청', '223.62.175.155', '2019-12-13 00:18:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(700, 'doctor', 147, '채팅 요청', '223.62.175.155', '2019-12-13 00:18:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(701, 'user', 85, '채팅 연결', '1.236.88.213', '2019-12-13 00:18:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(702, 'user', 85, '채팅 메시지', '1.236.88.213', '2019-12-13 00:18:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(703, 'user', 77, '관리자 발송', '1.236.88.213', '2019-12-13 00:43:41');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(704, 'doctor', 111, '채팅 요청', '223.38.22.89', '2019-12-13 11:04:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(705, 'doctor', 117, '채팅 요청', '223.38.22.89', '2019-12-13 11:04:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(706, 'doctor', 117, '채팅 메시지', '223.38.22.89', '2019-12-13 11:05:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(707, 'doctor', 111, '채팅 요청', '223.38.22.89', '2019-12-13 11:07:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(708, 'doctor', 117, '채팅 요청', '223.38.22.89', '2019-12-13 11:07:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(709, 'doctor', 111, '채팅 요청', '223.38.22.89', '2019-12-13 11:07:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(710, 'doctor', 117, '채팅 요청', '223.38.22.89', '2019-12-13 11:07:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(711, 'doctor', 111, '채팅 메시지', '223.38.22.89', '2019-12-13 11:08:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(712, 'doctor', 111, '채팅 메시지', '223.38.22.89', '2019-12-13 11:12:34');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(713, 'doctor', 117, '채팅 메시지', '223.38.22.89', '2019-12-13 11:13:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(714, 'doctor', 117, '채팅 메시지', '223.38.22.89', '2019-12-13 11:13:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(715, 'doctor', 117, '채팅 메시지', '223.38.22.89', '2019-12-13 11:14:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(716, 'doctor', 111, '채팅 요청', '223.38.22.221', '2019-12-16 18:31:47');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(717, 'doctor', 111, '채팅 요청', '223.38.22.221', '2019-12-16 18:34:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(718, 'user', 84, '채팅 연결', '223.38.22.221', '2019-12-16 18:34:27');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(719, 'doctor', 111, '채팅 요청', '223.33.164.48', '2019-12-17 17:47:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(720, 'user', 84, '채팅 연결', '223.33.164.48', '2019-12-17 17:47:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(721, 'doctor', 111, '채팅 요청', '223.33.164.48', '2019-12-17 17:52:10');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(722, 'doctor', 111, '채팅 요청', '223.33.164.48', '2019-12-17 17:52:27');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(723, 'user', 84, '채팅 연결', '223.33.164.48', '2019-12-17 17:52:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(724, 'doctor', 111, '채팅 요청', '223.33.164.48', '2019-12-17 17:54:50');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(725, 'doctor', 111, '채팅 요청', '223.33.164.48', '2019-12-17 18:09:06');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(726, 'doctor', 111, '채팅 요청', '223.33.164.48', '2019-12-17 18:12:07');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(727, 'doctor', 111, '채팅 요청', '223.33.164.48', '2019-12-17 18:14:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(728, 'doctor', 111, '채팅 요청', '223.33.164.48', '2019-12-17 18:16:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(729, 'doctor', 111, '채팅 요청', '223.33.164.48', '2019-12-17 18:16:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(730, 'user', 84, '채팅 연결', '223.33.164.48', '2019-12-17 18:16:17');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(731, 'doctor', 111, '채팅 요청', '223.33.164.48', '2019-12-17 18:16:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(732, 'doctor', 111, '채팅 요청', '223.33.164.48', '2019-12-17 18:26:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(733, 'doctor', 111, '채팅 요청', '223.33.164.48', '2019-12-17 18:34:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(734, 'doctor', 111, '채팅 요청', '223.33.164.48', '2019-12-17 18:35:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(735, 'doctor', 111, '채팅 요청', '112.152.7.132', '2019-12-18 13:28:09');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(736, 'user', 84, '채팅 연결', '112.152.7.132', '2019-12-18 13:28:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(737, 'user', 84, '채팅 메시지', '112.152.7.132', '2019-12-18 13:28:23');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(738, 'doctor', 111, '채팅 메시지', '112.152.7.132', '2019-12-18 13:28:34');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(739, 'user', 84, '채팅 메시지', '112.152.7.132', '2019-12-18 13:48:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(740, 'user', 84, '채팅 메시지', '112.152.7.132', '2019-12-18 13:49:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(741, 'doctor', 111, '채팅 요청', '112.152.7.132', '2019-12-18 14:13:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(742, 'user', 84, '채팅 연결', '112.152.7.132', '2019-12-18 14:13:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(743, 'user', 84, '채팅 메시지', '112.152.7.132', '2019-12-18 14:13:35');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(744, 'doctor', 111, '채팅 요청', '112.152.7.132', '2019-12-18 14:37:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(745, 'user', 84, '채팅 연결', '112.152.7.132', '2019-12-18 14:37:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(746, 'doctor', 147, '채팅 요청', '223.62.203.78', '2019-12-18 19:12:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(747, 'doctor', 117, '채팅 요청', '223.38.17.67', '2019-12-19 20:20:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(748, 'doctor', 147, '채팅 요청', '223.38.17.67', '2019-12-19 20:20:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(749, 'doctor', 111, '채팅 요청', '223.38.17.67', '2019-12-19 20:20:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(750, 'doctor', 117, '채팅 요청', '223.38.17.67', '2019-12-19 20:20:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(751, 'doctor', 147, '채팅 요청', '223.38.17.67', '2019-12-19 20:20:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(752, 'user', 84, '채팅 연결', '223.38.17.67', '2019-12-19 20:21:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(753, 'doctor', 111, '채팅 요청', '223.38.17.67', '2019-12-19 21:16:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(754, 'doctor', 117, '채팅 요청', '223.38.17.67', '2019-12-19 21:16:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(755, 'doctor', 147, '채팅 요청', '223.38.17.67', '2019-12-19 21:16:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(756, 'user', 84, '채팅 연결', '223.38.17.67', '2019-12-19 21:16:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(757, 'doctor', 111, '채팅 요청', '223.38.17.67', '2019-12-19 21:23:15');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(758, 'doctor', 117, '채팅 요청', '223.38.17.67', '2019-12-19 21:23:15');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(759, 'doctor', 147, '채팅 요청', '223.38.17.67', '2019-12-19 21:23:15');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(760, 'user', 84, '채팅 연결', '223.38.17.67', '2019-12-19 21:23:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(761, 'doctor', 111, '채팅 요청', '223.38.17.67', '2019-12-19 21:41:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(762, 'doctor', 117, '채팅 요청', '223.38.17.67', '2019-12-19 21:41:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(763, 'doctor', 147, '채팅 요청', '223.38.17.67', '2019-12-19 21:41:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(764, 'doctor', 111, '채팅 요청', '223.38.24.179', '2019-12-21 19:04:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(765, 'user', 84, '채팅 연결', '223.38.24.179', '2019-12-21 19:04:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(766, 'user', 84, '채팅 메시지', '223.38.24.179', '2019-12-21 19:04:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(767, 'doctor', 111, '채팅 요청', '223.62.173.169', '2019-12-25 03:00:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(768, 'user', 84, '채팅 연결', '223.62.173.169', '2019-12-25 03:00:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(769, 'doctor', 111, '채팅 요청', '223.62.219.86', '2019-12-29 15:11:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(770, 'doctor', 117, '채팅 요청', '223.62.219.86', '2019-12-29 15:11:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(771, 'doctor', 143, '채팅 요청', '223.62.219.86', '2019-12-29 15:11:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(772, 'doctor', 147, '채팅 요청', '223.62.219.86', '2019-12-29 15:11:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(773, 'doctor', 111, '채팅 요청', '223.62.219.86', '2019-12-29 15:12:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(774, 'doctor', 117, '채팅 요청', '223.62.219.86', '2019-12-29 15:12:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(775, 'doctor', 143, '채팅 요청', '223.62.219.86', '2019-12-29 15:12:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(776, 'doctor', 147, '채팅 요청', '223.62.219.86', '2019-12-29 15:12:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(777, 'user', 84, '채팅 연결', '49.172.64.107', '2019-12-29 15:12:50');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(778, 'doctor', 143, '채팅 메시지', '223.62.219.86', '2019-12-29 15:13:05');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(779, 'doctor', 143, '채팅 메시지', '223.62.219.86', '2019-12-29 15:13:23');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(780, 'user', 84, '채팅 메시지', '49.172.64.107', '2019-12-29 15:13:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(781, 'doctor', 143, '채팅 메시지', '223.62.219.86', '2019-12-29 15:14:07');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(782, 'user', 84, '채팅 메시지', '49.172.64.107', '2019-12-29 15:14:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(783, 'user', 84, '채팅 메시지', '49.172.64.107', '2019-12-29 15:14:26');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(784, 'user', 84, '채팅 메시지', '49.172.64.107', '2019-12-29 15:14:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(785, 'user', 84, '채팅 메시지', '49.172.64.107', '2019-12-29 15:14:35');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(786, 'user', 84, '채팅 메시지', '49.172.64.107', '2019-12-29 15:14:39');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(787, 'user', 84, '채팅 메시지', '49.172.64.107', '2019-12-29 15:14:43');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(788, 'user', 84, '채팅 메시지', '49.172.64.107', '2019-12-29 15:14:47');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(789, 'user', 84, '채팅 메시지', '49.172.64.107', '2019-12-29 15:14:50');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(790, 'user', 84, '채팅 메시지', '49.172.64.107', '2019-12-29 15:14:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(791, 'user', 84, '채팅 메시지', '49.172.64.107', '2019-12-29 15:14:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(792, 'user', 84, '채팅 메시지', '49.172.64.107', '2019-12-29 15:15:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(793, 'doctor', 143, '채팅 메시지', '223.62.219.86', '2019-12-29 15:15:41');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(794, 'doctor', 143, '채팅 메시지', '223.62.219.86', '2019-12-29 15:15:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(795, 'doctor', 143, '채팅 메시지', '223.62.219.86', '2019-12-29 15:15:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(796, 'user', 84, '채팅 메시지', '49.172.64.107', '2019-12-29 15:19:13');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(797, 'doctor', 111, '채팅 요청', '223.62.219.86', '2019-12-29 18:57:39');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(798, 'doctor', 117, '채팅 요청', '223.62.219.86', '2019-12-29 18:57:39');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(799, 'doctor', 147, '채팅 요청', '223.62.219.86', '2019-12-29 18:57:39');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(800, 'doctor', 111, '채팅 요청', '223.62.219.86', '2019-12-29 18:58:07');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(801, 'doctor', 117, '채팅 요청', '223.62.219.86', '2019-12-29 18:58:07');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(802, 'doctor', 143, '채팅 요청', '223.62.219.86', '2019-12-29 18:58:07');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(803, 'doctor', 147, '채팅 요청', '223.62.219.86', '2019-12-29 18:58:07');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(804, 'user', 84, '채팅 연결', '49.172.64.107', '2019-12-29 18:58:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(805, 'user', 84, '채팅 메시지', '49.172.64.107', '2019-12-29 18:59:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(806, 'doctor', 103, '출금 신청 수락', '49.172.64.107', '2020-01-02 13:04:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(807, 'doctor', 111, '출금 신청 거절', '211.55.49.10', '2020-01-02 18:37:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(808, 'doctor', 103, '채팅 요청', '223.62.216.236', '2020-01-02 18:38:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(809, 'doctor', 111, '채팅 요청', '223.62.216.236', '2020-01-02 18:38:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(810, 'doctor', 117, '채팅 요청', '223.62.216.236', '2020-01-02 18:38:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(811, 'doctor', 147, '채팅 요청', '223.62.216.236', '2020-01-02 18:38:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(812, 'user', 78, '채팅 연결', '112.152.7.132', '2020-01-02 18:38:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(813, 'user', 78, '채팅 메시지', '112.152.7.132', '2020-01-02 18:39:08');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(814, 'doctor', 111, '채팅 메시지', '223.62.216.236', '2020-01-02 18:39:09');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(815, 'user', 78, '채팅 메시지', '112.152.7.132', '2020-01-02 18:39:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(816, 'doctor', 111, '채팅 메시지', '223.62.216.236', '2020-01-02 18:39:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(817, 'user', 78, '채팅 메시지', '112.152.7.132', '2020-01-02 18:39:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(818, 'user', 78, '환불 신청 거절', '211.55.49.10', '2020-01-02 18:43:09');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(819, 'user', 86, '환불 신청 거절', '203.229.113.145', '2020-01-02 19:50:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(820, 'doctor', 103, '채팅 요청', '223.62.216.236', '2020-01-02 19:55:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(821, 'doctor', 111, '채팅 요청', '223.62.216.236', '2020-01-02 19:55:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(822, 'doctor', 117, '채팅 요청', '223.62.216.236', '2020-01-02 19:55:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(823, 'doctor', 147, '채팅 요청', '223.62.216.236', '2020-01-02 19:55:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(824, 'doctor', 103, '채팅 요청', '223.62.216.236', '2020-01-02 19:56:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(825, 'doctor', 111, '채팅 요청', '223.62.216.236', '2020-01-02 19:56:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(826, 'doctor', 117, '채팅 요청', '223.62.216.236', '2020-01-02 19:56:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(827, 'doctor', 147, '채팅 요청', '223.62.216.236', '2020-01-02 19:56:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(828, 'doctor', 103, '채팅 요청', '223.62.216.236', '2020-01-02 20:04:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(829, 'doctor', 117, '채팅 요청', '223.62.216.236', '2020-01-02 20:04:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(830, 'doctor', 147, '채팅 요청', '223.62.216.236', '2020-01-02 20:04:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(831, 'doctor', 171, '채팅 요청', '223.62.216.236', '2020-01-02 20:04:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(832, 'user', 78, '채팅 연결', '220.88.68.40', '2020-01-02 20:04:43');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(833, 'user', 78, '채팅 메시지', '220.88.68.40', '2020-01-02 20:04:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(834, 'doctor', 103, '채팅 요청', '223.62.216.236', '2020-01-02 20:06:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(835, 'doctor', 117, '채팅 요청', '223.62.216.236', '2020-01-02 20:06:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(836, 'doctor', 147, '채팅 요청', '223.62.216.236', '2020-01-02 20:06:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(837, 'doctor', 171, '채팅 요청', '223.62.216.236', '2020-01-02 20:06:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(838, 'user', 78, '채팅 연결', '220.88.68.40', '2020-01-02 20:06:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(839, 'user', 78, '채팅 메시지', '220.88.68.40', '2020-01-02 20:07:08');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(840, 'doctor', 147, '채팅 요청', '223.62.216.236', '2020-01-02 20:45:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(841, 'doctor', 171, '채팅 요청', '223.62.216.236', '2020-01-02 20:45:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(842, 'user', 85, '채팅 연결', '220.88.68.40', '2020-01-02 20:46:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(843, 'user', 85, '채팅 메시지', '220.88.68.40', '2020-01-02 20:46:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(844, 'doctor', 171, '채팅 메시지', '223.62.216.236', '2020-01-02 20:46:13');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(845, 'doctor', 171, '채팅 메시지', '223.62.216.236', '2020-01-02 20:46:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(846, 'user', 85, '채팅 메시지', '220.88.68.40', '2020-01-02 20:46:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(847, 'user', 85, '채팅 메시지', '220.88.68.40', '2020-01-02 20:46:43');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(848, 'doctor', 103, '채팅 요청', '223.62.175.57', '2020-01-02 22:33:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(849, 'doctor', 117, '채팅 요청', '223.62.175.57', '2020-01-02 22:33:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(850, 'doctor', 147, '채팅 요청', '223.62.175.57', '2020-01-02 22:33:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(851, 'doctor', 171, '채팅 요청', '223.62.175.57', '2020-01-02 22:33:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(852, 'user', 84, '채팅 연결', '223.62.175.57', '2020-01-02 22:33:07');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(853, 'user', 84, '채팅 메시지', '223.62.175.57', '2020-01-02 22:33:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(854, 'user', 84, '관리자 단체 발송', '211.55.49.10', '2020-01-03 16:40:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(855, 'user', 85, '관리자 단체 발송', '211.55.49.10', '2020-01-03 16:40:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(856, 'user', 86, '관리자 단체 발송', '211.55.49.10', '2020-01-03 16:40:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(857, 'doctor', 103, '관리자 단체 발송', '211.55.49.10', '2020-01-03 16:40:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(858, 'doctor', 106, '관리자 단체 발송', '211.55.49.10', '2020-01-03 16:40:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(859, 'doctor', 115, '관리자 단체 발송', '211.55.49.10', '2020-01-03 16:40:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(860, 'doctor', 116, '관리자 단체 발송', '211.55.49.10', '2020-01-03 16:40:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(861, 'doctor', 117, '관리자 단체 발송', '211.55.49.10', '2020-01-03 16:40:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(862, 'doctor', 147, '관리자 단체 발송', '211.55.49.10', '2020-01-03 16:40:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(863, 'doctor', 167, '관리자 단체 발송', '211.55.49.10', '2020-01-03 16:40:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(864, 'doctor', 171, '관리자 단체 발송', '211.55.49.10', '2020-01-03 16:40:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(865, 'user', 85, '환불 신청 거절', '1.224.150.62', '2020-01-07 18:16:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(866, 'doctor', 117, '채팅 요청', '223.62.169.8', '2020-01-07 18:36:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(867, 'doctor', 147, '채팅 요청', '223.62.169.8', '2020-01-07 18:36:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(868, 'doctor', 117, '채팅 요청', '223.62.169.8', '2020-01-07 19:29:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(869, 'doctor', 147, '채팅 요청', '223.62.169.8', '2020-01-07 19:29:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(870, 'doctor', 117, '채팅 요청', '223.62.169.8', '2020-01-07 19:40:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(871, 'doctor', 143, '채팅 요청', '223.62.169.8', '2020-01-07 19:40:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(872, 'doctor', 147, '채팅 요청', '223.62.169.8', '2020-01-07 19:40:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(873, 'doctor', 117, '채팅 요청', '223.62.169.8', '2020-01-07 19:41:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(874, 'doctor', 143, '채팅 요청', '223.62.169.8', '2020-01-07 19:41:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(875, 'doctor', 147, '채팅 요청', '223.62.169.8', '2020-01-07 19:41:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(876, 'user', 85, '채팅 연결', '49.172.64.107', '2020-01-07 19:41:34');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(877, 'user', 85, '채팅 메시지', '49.172.64.107', '2020-01-07 19:41:46');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(878, 'doctor', 143, '채팅 메시지', '223.62.169.8', '2020-01-07 19:41:50');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(879, 'user', 85, '채팅 메시지', '49.172.64.107', '2020-01-07 19:43:08');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(880, 'doctor', 143, '채팅 메시지', '223.62.169.8', '2020-01-07 19:43:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(881, 'doctor', 103, '채팅 요청', '112.152.7.132', '2020-01-07 20:55:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(882, 'doctor', 117, '채팅 요청', '112.152.7.132', '2020-01-07 20:55:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(883, 'doctor', 147, '채팅 요청', '112.152.7.132', '2020-01-07 20:55:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(884, 'doctor', 171, '채팅 요청', '112.152.7.132', '2020-01-07 20:55:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(885, 'user', 84, '채팅 연결', '112.152.7.132', '2020-01-07 20:55:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(886, 'user', 84, '채팅 메시지', '112.152.7.132', '2020-01-07 20:56:07');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(887, 'user', 84, '채팅 메시지', '112.152.7.132', '2020-01-07 20:57:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(888, 'doctor', 103, '채팅 요청', '112.152.7.132', '2020-01-07 20:57:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(889, 'doctor', 117, '채팅 요청', '112.152.7.132', '2020-01-07 20:57:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(890, 'doctor', 147, '채팅 요청', '112.152.7.132', '2020-01-07 20:57:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(891, 'doctor', 171, '채팅 요청', '112.152.7.132', '2020-01-07 20:57:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(892, 'user', 84, '채팅 연결', '112.152.7.132', '2020-01-07 20:57:39');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(893, 'user', 84, '채팅 메시지', '112.152.7.132', '2020-01-07 20:57:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(894, 'user', 84, '채팅 메시지', '112.152.7.132', '2020-01-07 20:58:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(895, 'user', 84, '채팅 메시지', '112.152.7.132', '2020-01-07 20:59:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(896, 'doctor', 103, '채팅 요청', '112.152.7.132', '2020-01-07 21:00:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(897, 'doctor', 117, '채팅 요청', '112.152.7.132', '2020-01-07 21:00:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(898, 'doctor', 147, '채팅 요청', '112.152.7.132', '2020-01-07 21:00:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(899, 'doctor', 171, '채팅 요청', '112.152.7.132', '2020-01-07 21:00:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(900, 'user', 84, '채팅 연결', '112.152.7.132', '2020-01-07 21:00:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(901, 'doctor', 103, '채팅 요청', '112.152.7.132', '2020-01-07 21:02:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(902, 'doctor', 117, '채팅 요청', '112.152.7.132', '2020-01-07 21:02:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(903, 'doctor', 147, '채팅 요청', '112.152.7.132', '2020-01-07 21:02:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(904, 'doctor', 171, '채팅 요청', '112.152.7.132', '2020-01-07 21:02:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(905, 'user', 84, '채팅 연결', '112.152.7.132', '2020-01-07 21:02:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(906, 'doctor', 103, '채팅 요청', '112.152.7.132', '2020-01-07 21:06:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(907, 'doctor', 117, '채팅 요청', '112.152.7.132', '2020-01-07 21:06:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(908, 'doctor', 147, '채팅 요청', '112.152.7.132', '2020-01-07 21:06:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(909, 'doctor', 171, '채팅 요청', '112.152.7.132', '2020-01-07 21:06:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(910, 'user', 84, '채팅 연결', '112.152.7.132', '2020-01-07 21:06:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(911, 'doctor', 103, '채팅 요청', '112.152.7.132', '2020-01-07 21:09:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(912, 'doctor', 117, '채팅 요청', '112.152.7.132', '2020-01-07 21:09:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(913, 'doctor', 147, '채팅 요청', '112.152.7.132', '2020-01-07 21:09:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(914, 'doctor', 171, '채팅 요청', '112.152.7.132', '2020-01-07 21:09:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(915, 'user', 84, '채팅 연결', '112.152.7.132', '2020-01-07 21:09:07');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(916, 'user', 84, '채팅 메시지', '112.152.7.132', '2020-01-07 21:24:09');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(917, 'doctor', 103, '채팅 요청', '223.62.169.8', '2020-01-08 14:10:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(918, 'doctor', 117, '채팅 요청', '223.62.169.8', '2020-01-08 14:10:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(919, 'doctor', 147, '채팅 요청', '223.62.169.8', '2020-01-08 14:10:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(920, 'doctor', 171, '채팅 요청', '223.62.169.8', '2020-01-08 14:10:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(921, 'user', 85, '채팅 연결', '49.172.64.107', '2020-01-08 14:10:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(922, 'doctor', 103, '채팅 메시지', '223.62.169.8', '2020-01-08 14:10:43');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(923, 'user', 85, '채팅 메시지', '49.172.64.107', '2020-01-08 14:10:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(924, 'doctor', 103, '채팅 메시지', '223.62.169.8', '2020-01-08 14:11:09');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(925, 'doctor', 103, '채팅 메시지', '223.62.169.8', '2020-01-08 14:11:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(926, 'doctor', 103, '채팅 메시지', '223.62.169.8', '2020-01-08 14:11:17');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(927, 'doctor', 103, '채팅 메시지', '223.62.169.8', '2020-01-08 14:11:22');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(928, 'user', 85, '채팅 메시지', '49.172.64.107', '2020-01-08 14:11:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(929, 'doctor', 103, '채팅 메시지', '223.62.169.8', '2020-01-08 14:11:41');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(930, 'user', 85, '채팅 메시지', '49.172.64.107', '2020-01-08 14:13:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(931, 'user', 85, '채팅 메시지', '49.172.64.107', '2020-01-08 14:14:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(932, 'doctor', 103, '채팅 요청', '223.62.169.8', '2020-01-08 14:46:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(933, 'doctor', 117, '채팅 요청', '223.62.169.8', '2020-01-08 14:46:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(934, 'doctor', 147, '채팅 요청', '223.62.169.8', '2020-01-08 14:46:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(935, 'doctor', 171, '채팅 요청', '223.62.169.8', '2020-01-08 14:46:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(936, 'doctor', 103, '채팅 요청', '223.62.169.8', '2020-01-08 14:46:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(937, 'doctor', 117, '채팅 요청', '223.62.169.8', '2020-01-08 14:46:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(938, 'doctor', 147, '채팅 요청', '223.62.169.8', '2020-01-08 14:46:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(939, 'doctor', 171, '채팅 요청', '223.62.169.8', '2020-01-08 14:46:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(940, 'user', 85, '채팅 연결', '49.172.64.107', '2020-01-08 14:47:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(941, 'user', 85, '채팅 메시지', '49.172.64.107', '2020-01-08 14:47:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(942, 'doctor', 103, '채팅 메시지', '223.62.169.8', '2020-01-08 14:50:34');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(943, 'user', 85, '채팅 메시지', '49.172.64.107', '2020-01-08 14:51:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(944, 'user', 85, '채팅 메시지', '49.172.64.107', '2020-01-08 14:51:07');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(945, 'doctor', 103, '채팅 요청', '112.152.7.132', '2020-01-08 15:51:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(946, 'doctor', 117, '채팅 요청', '112.152.7.132', '2020-01-08 15:51:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(947, 'doctor', 147, '채팅 요청', '112.152.7.132', '2020-01-08 15:51:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(948, 'doctor', 171, '채팅 요청', '112.152.7.132', '2020-01-08 15:51:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(949, 'user', 84, '채팅 연결', '112.152.7.132', '2020-01-08 15:51:28');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(950, 'doctor', 103, '채팅 요청', '112.152.7.132', '2020-01-08 15:51:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(951, 'doctor', 117, '채팅 요청', '112.152.7.132', '2020-01-08 15:51:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(952, 'doctor', 147, '채팅 요청', '112.152.7.132', '2020-01-08 15:51:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(953, 'doctor', 171, '채팅 요청', '112.152.7.132', '2020-01-08 15:51:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(954, 'user', 84, '채팅 연결', '112.152.7.132', '2020-01-08 15:51:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(955, 'doctor', 103, '채팅 요청', '223.62.169.8', '2020-01-08 16:03:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(956, 'doctor', 117, '채팅 요청', '223.62.169.8', '2020-01-08 16:03:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(957, 'doctor', 147, '채팅 요청', '223.62.169.8', '2020-01-08 16:03:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(958, 'doctor', 171, '채팅 요청', '223.62.169.8', '2020-01-08 16:03:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(959, 'user', 85, '채팅 연결', '112.152.7.132', '2020-01-08 16:03:22');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(960, 'doctor', 103, '채팅 요청', '223.62.169.8', '2020-01-08 16:33:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(961, 'doctor', 117, '채팅 요청', '223.62.169.8', '2020-01-08 16:33:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(962, 'doctor', 147, '채팅 요청', '223.62.169.8', '2020-01-08 16:33:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(963, 'doctor', 171, '채팅 요청', '223.62.169.8', '2020-01-08 16:33:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(964, 'doctor', 103, '채팅 요청', '223.62.169.8', '2020-01-08 16:34:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(965, 'doctor', 117, '채팅 요청', '223.62.169.8', '2020-01-08 16:34:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(966, 'doctor', 147, '채팅 요청', '223.62.169.8', '2020-01-08 16:34:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(967, 'doctor', 171, '채팅 요청', '223.62.169.8', '2020-01-08 16:34:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(968, 'doctor', 117, '채팅 요청', '223.62.169.8', '2020-01-08 16:34:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(969, 'doctor', 147, '채팅 요청', '223.62.169.8', '2020-01-08 16:34:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(970, 'doctor', 171, '채팅 요청', '223.62.169.8', '2020-01-08 16:34:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(971, 'doctor', 117, '채팅 요청', '223.62.169.8', '2020-01-08 16:34:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(972, 'doctor', 147, '채팅 요청', '223.62.169.8', '2020-01-08 16:34:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(973, 'doctor', 171, '채팅 요청', '223.62.169.8', '2020-01-08 16:34:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(974, 'user', 85, '채팅 연결', '112.152.7.132', '2020-01-08 16:35:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(975, 'doctor', 117, '채팅 요청', '211.55.49.10', '2020-01-09 11:34:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(976, 'doctor', 147, '채팅 요청', '211.55.49.10', '2020-01-09 11:34:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(977, 'doctor', 117, '채팅 요청', '211.55.49.10', '2020-01-09 12:13:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(978, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 15:06:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(979, 'doctor', 171, '채팅 요청', '223.33.184.92', '2020-01-09 15:06:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(980, 'user', 85, '채팅 연결', '112.152.7.132', '2020-01-09 15:06:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(981, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 15:06:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(982, 'user', 85, '채팅 메시지', '112.152.7.132', '2020-01-09 15:06:46');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(983, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 15:06:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(984, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 15:07:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(985, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 15:07:34');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(986, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 15:09:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(987, 'doctor', 171, '채팅 요청', '223.33.184.92', '2020-01-09 15:09:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(988, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 15:10:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(989, 'doctor', 171, '채팅 요청', '223.33.184.92', '2020-01-09 15:10:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(990, 'user', 85, '채팅 연결', '112.152.7.132', '2020-01-09 15:10:47');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(991, 'user', 85, '채팅 메시지', '112.152.7.132', '2020-01-09 15:10:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(992, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 15:11:06');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(993, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 15:11:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(994, 'user', 85, '채팅 메시지', '112.152.7.132', '2020-01-09 15:11:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(995, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 15:14:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(996, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 15:23:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(997, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 15:23:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(998, 'user', 85, '채팅 메시지', '112.152.7.132', '2020-01-09 15:24:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(999, 'user', 85, '채팅 메시지', '112.152.7.132', '2020-01-09 15:24:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1000, 'user', 85, '채팅 메시지', '112.152.7.132', '2020-01-09 15:24:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1001, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 15:24:42');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1002, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 15:41:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1003, 'doctor', 171, '채팅 요청', '223.33.184.92', '2020-01-09 15:41:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1004, 'user', 85, '채팅 연결', '112.152.7.132', '2020-01-09 15:41:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1005, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 15:41:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1006, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 15:41:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1007, 'user', 85, '채팅 메시지', '112.152.7.132', '2020-01-09 15:42:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1008, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 15:56:23');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1009, 'doctor', 171, '채팅 요청', '223.33.184.92', '2020-01-09 15:56:23');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1010, 'user', 85, '채팅 연결', '112.152.7.132', '2020-01-09 15:56:37');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1011, 'user', 85, '채팅 메시지', '112.152.7.132', '2020-01-09 15:56:46');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1012, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 16:00:15');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1013, 'doctor', 103, '채팅 요청', '223.33.184.92', '2020-01-09 16:26:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1014, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 16:26:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1015, 'doctor', 171, '채팅 요청', '223.33.184.92', '2020-01-09 16:26:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1016, 'user', 85, '채팅 연결', '49.174.174.48', '2020-01-09 16:26:22');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1017, 'doctor', 103, '채팅 메시지', '223.33.184.92', '2020-01-09 16:26:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1018, 'user', 85, '채팅 메시지', '49.174.174.48', '2020-01-09 16:26:43');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1019, 'doctor', 103, '채팅 메시지', '223.33.184.92', '2020-01-09 16:26:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1020, 'doctor', 103, '채팅 메시지', '223.33.184.92', '2020-01-09 16:27:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1021, 'doctor', 117, '채팅 요청', '211.55.49.10', '2020-01-09 16:27:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1022, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 16:31:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1023, 'doctor', 171, '채팅 요청', '223.33.184.92', '2020-01-09 16:31:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1024, 'user', 85, '채팅 연결', '112.152.7.132', '2020-01-09 16:31:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1025, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 16:33:46');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1026, 'doctor', 171, '채팅 요청', '223.33.184.92', '2020-01-09 16:33:46');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1027, 'user', 85, '채팅 연결', '112.152.7.132', '2020-01-09 16:33:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1028, 'user', 85, '채팅 메시지', '112.152.7.132', '2020-01-09 16:33:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1029, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 16:33:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1030, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 16:34:13');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1031, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 16:34:15');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1032, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 16:43:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1033, 'doctor', 171, '채팅 요청', '223.33.184.92', '2020-01-09 16:43:36');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1034, 'user', 85, '채팅 연결', '112.152.7.132', '2020-01-09 16:43:42');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1035, 'user', 85, '채팅 메시지', '112.152.7.132', '2020-01-09 16:43:50');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1036, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 16:43:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1037, 'doctor', 117, '채팅 요청', '211.55.49.10', '2020-01-09 16:53:06');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1038, 'doctor', 103, '채팅 메시지', '211.55.49.10', '2020-01-09 16:58:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1039, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 17:02:17');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1040, 'doctor', 103, '채팅 메시지', '211.55.49.10', '2020-01-09 17:03:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1041, 'doctor', 103, '채팅 메시지', '211.55.49.10', '2020-01-09 17:04:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1042, 'doctor', 117, '채팅 요청', '211.55.49.10', '2020-01-09 17:20:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1043, 'doctor', 171, '채팅 요청', '211.55.49.10', '2020-01-09 17:20:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1044, 'user', 77, '채팅 연결', '112.152.7.132', '2020-01-09 17:20:42');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1045, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 17:21:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1046, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 17:21:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1047, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 17:21:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1048, 'user', 77, '채팅 메시지', '112.152.7.132', '2020-01-09 17:21:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1049, 'user', 77, '채팅 메시지', '112.152.7.132', '2020-01-09 17:21:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1050, 'user', 77, '채팅 메시지', '112.152.7.132', '2020-01-09 17:21:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1051, 'user', 77, '채팅 메시지', '112.152.7.132', '2020-01-09 17:22:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1052, 'user', 77, '채팅 메시지', '112.152.7.132', '2020-01-09 17:26:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1053, 'doctor', 171, '채팅 요청', '223.33.184.92', '2020-01-09 17:37:43');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1054, 'user', 85, '채팅 연결', '112.152.7.132', '2020-01-09 17:37:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1055, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 17:38:47');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1056, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 17:38:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1057, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 17:40:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1058, 'doctor', 117, '채팅 요청', '211.55.49.10', '2020-01-09 17:49:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1059, 'doctor', 117, '채팅 요청', '211.55.49.10', '2020-01-09 17:50:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1060, 'doctor', 171, '채팅 요청', '211.55.49.10', '2020-01-09 17:50:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1061, 'doctor', 171, '채팅 메시지', '223.62.175.40', '2020-01-09 17:51:26');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1062, 'doctor', 171, '채팅 메시지', '223.62.175.40', '2020-01-09 17:51:41');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1063, 'doctor', 171, '채팅 메시지', '223.62.175.40', '2020-01-09 17:51:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1064, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 17:52:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1065, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 17:54:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1066, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 17:54:34');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1067, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 17:54:42');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1068, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 17:54:48');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1069, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 17:55:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1070, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 17:55:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1071, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 17:55:05');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1072, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 17:55:09');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1073, 'doctor', 117, '채팅 요청', '211.55.49.10', '2020-01-09 18:58:27');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1074, 'doctor', 171, '채팅 요청', '211.55.49.10', '2020-01-09 18:58:27');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1075, 'user', 77, '채팅 연결', '223.38.30.169', '2020-01-09 18:58:35');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1076, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 18:58:44');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1077, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 18:58:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1078, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 19:03:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1079, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 19:03:43');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1080, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 19:03:47');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1081, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 19:04:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1082, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 19:04:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1083, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 19:07:41');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1084, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 19:07:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1085, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 19:07:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1086, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 19:08:23');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1087, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 19:08:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1088, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 19:09:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1089, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 19:09:26');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1090, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 19:10:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1091, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 19:10:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1092, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 19:10:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1093, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 19:10:50');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1094, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 19:11:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1095, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 19:12:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1096, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 19:12:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1097, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 19:13:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1098, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 19:13:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1099, 'doctor', 171, '채팅 메시지', '211.55.49.10', '2020-01-09 19:17:06');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1100, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 19:17:27');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1101, 'user', 77, '채팅 메시지', '223.38.30.169', '2020-01-09 19:18:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1102, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 19:36:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1103, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 19:37:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1104, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 19:38:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1105, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 19:39:46');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1106, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 19:43:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1107, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 19:44:15');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1108, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 19:44:41');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1109, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 19:45:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1110, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 19:45:35');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1111, 'doctor', 171, '채팅 요청', '223.33.184.92', '2020-01-09 19:45:35');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1112, 'user', 85, '채팅 연결', '223.38.30.169', '2020-01-09 19:45:43');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1113, 'user', 85, '채팅 메시지', '223.38.30.169', '2020-01-09 19:45:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1114, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 19:46:16');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1115, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 19:46:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1116, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 19:49:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1117, 'doctor', 171, '채팅 요청', '223.33.184.92', '2020-01-09 19:49:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1118, 'user', 85, '채팅 연결', '223.38.30.169', '2020-01-09 19:49:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1119, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 19:54:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1120, 'doctor', 171, '채팅 요청', '223.33.184.92', '2020-01-09 19:54:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1121, 'user', 85, '채팅 연결', '223.38.30.169', '2020-01-09 19:54:40');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1122, 'doctor', 117, '채팅 요청', '223.33.184.92', '2020-01-09 19:57:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1123, 'doctor', 171, '채팅 요청', '223.33.184.92', '2020-01-09 19:57:56');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1124, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 19:58:02');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1125, 'user', 85, '채팅 메시지', '223.38.29.31', '2020-01-09 19:58:11');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1126, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 19:59:06');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1127, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 19:59:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1128, 'user', 85, '채팅 메시지', '223.38.29.31', '2020-01-09 19:59:27');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1129, 'user', 85, '채팅 메시지', '223.38.29.31', '2020-01-09 19:59:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1130, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 19:59:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1131, 'doctor', 171, '채팅 메시지', '223.33.184.92', '2020-01-09 20:00:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1132, 'doctor', 171, '채팅 요청', '223.33.184.92', '2020-01-09 20:08:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1133, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 20:08:08');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1134, 'user', 85, '채팅 메시지', '223.38.29.31', '2020-01-09 20:08:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1135, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 20:19:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1136, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 20:19:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1137, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 20:19:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1138, 'user', 85, '채팅 메시지', '223.38.29.31', '2020-01-09 20:20:01');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1139, 'user', 85, '채팅 메시지', '223.38.29.31', '2020-01-09 20:20:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1140, 'doctor', 171, '채팅 메시지', '14.42.37.155', '2020-01-09 20:20:34');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1141, 'doctor', 171, '채팅 메시지', '14.42.37.155', '2020-01-09 20:21:15');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1142, 'doctor', 171, '채팅 메시지', '14.42.37.155', '2020-01-09 20:23:09');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1143, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 20:24:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1144, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 20:24:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1145, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 20:24:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1146, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 20:30:06');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1147, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 20:30:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1148, 'doctor', 171, '채팅 메시지', '14.42.37.155', '2020-01-09 20:33:08');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1149, 'doctor', 171, '채팅 메시지', '14.42.37.155', '2020-01-09 20:37:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1150, 'doctor', 171, '채팅 메시지', '14.42.37.155', '2020-01-09 20:39:42');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1151, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 20:41:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1152, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 20:41:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1153, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 20:41:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1154, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 20:41:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1155, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 20:42:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1156, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 20:42:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1157, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 20:42:29');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1158, 'doctor', 171, '채팅 메시지', '14.42.37.155', '2020-01-09 20:42:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1159, 'doctor', 171, '채팅 메시지', '14.42.37.155', '2020-01-09 20:43:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1160, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 21:04:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1161, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 21:04:32');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1162, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 21:04:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1163, 'user', 85, '채팅 메시지', '223.38.29.31', '2020-01-09 21:04:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1164, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 21:05:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1165, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 21:05:57');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1166, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 21:06:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1167, 'user', 85, '채팅 메시지', '223.38.29.31', '2020-01-09 21:06:13');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1168, 'doctor', 171, '채팅 메시지', '14.42.37.155', '2020-01-09 21:06:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1169, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 21:17:47');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1170, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 21:17:47');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1171, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 21:17:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1172, 'user', 85, '채팅 메시지', '223.38.29.31', '2020-01-09 21:18:03');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1173, 'doctor', 171, '채팅 메시지', '14.42.37.155', '2020-01-09 21:18:07');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1174, 'doctor', 171, '채팅 메시지', '14.42.37.155', '2020-01-09 21:18:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1175, 'doctor', 171, '채팅 메시지', '14.42.37.155', '2020-01-09 21:18:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1176, 'user', 85, '채팅 메시지', '223.38.29.31', '2020-01-09 21:18:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1177, 'user', 85, '채팅 메시지', '223.38.29.31', '2020-01-09 21:18:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1178, 'user', 85, '채팅 메시지', '223.38.29.31', '2020-01-09 21:19:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1179, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 21:49:23');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1180, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 21:49:23');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1181, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 21:49:45');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1182, 'user', 85, '채팅 메시지', '223.38.29.31', '2020-01-09 21:49:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1183, 'doctor', 171, '채팅 메시지', '14.42.37.155', '2020-01-09 21:50:58');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1184, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 21:51:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1185, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 21:51:18');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1186, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 21:51:20');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1187, 'doctor', 171, '채팅 메시지', '14.42.37.155', '2020-01-09 21:51:34');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1188, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 22:00:39');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1189, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 22:00:39');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1190, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 22:01:08');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1191, 'user', 85, '채팅 메시지', '223.38.29.31', '2020-01-09 22:01:23');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1192, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 22:02:34');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1193, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 22:02:34');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1194, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 22:02:39');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1195, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 22:03:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1196, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 22:03:30');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1197, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 22:03:33');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1198, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 22:04:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1199, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 22:04:19');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1200, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 22:04:22');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1201, 'doctor', 171, '채팅 메시지', '14.42.37.155', '2020-01-09 22:04:55');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1202, 'doctor', 171, '채팅 메시지', '14.42.37.155', '2020-01-09 22:05:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1203, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 22:06:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1204, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 22:06:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1205, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 22:06:27');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1206, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 22:06:27');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1207, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 22:06:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1208, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 22:06:52');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1209, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 22:07:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1210, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 22:07:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1211, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 22:07:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1212, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 22:07:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1213, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 22:07:41');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1214, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 22:09:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1215, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 22:09:21');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1216, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 22:09:25');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1217, 'user', 85, '채팅 메시지', '223.38.29.31', '2020-01-09 22:09:38');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1218, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 22:11:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1219, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 22:11:31');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1220, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 22:11:37');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1221, 'user', 85, '채팅 메시지', '223.38.29.31', '2020-01-09 22:11:47');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1222, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 22:13:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1223, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 22:13:49');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1224, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 22:13:54');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1225, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 22:14:22');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1226, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 22:14:22');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1227, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 22:14:24');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1228, 'user', 85, '채팅 메시지', '223.38.29.31', '2020-01-09 22:14:51');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1229, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 22:16:47');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1230, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 22:16:53');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1231, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 22:17:10');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1232, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 22:17:12');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1233, 'doctor', 117, '채팅 요청', '14.42.37.155', '2020-01-09 22:18:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1234, 'doctor', 171, '채팅 요청', '14.42.37.155', '2020-01-09 22:18:00');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1235, 'user', 85, '채팅 연결', '223.38.29.31', '2020-01-09 22:18:04');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1236, 'doctor', 117, '채팅 요청', '223.62.175.8', '2020-01-09 22:39:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1237, 'doctor', 171, '채팅 요청', '223.62.175.8', '2020-01-09 22:39:59');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1238, 'doctor', 117, '채팅 요청', '223.33.164.85', '2020-01-10 13:54:08');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1239, 'doctor', 117, '채팅 요청', '223.62.22.232', '2020-01-22 22:13:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1240, 'doctor', 171, '채팅 요청', '223.62.22.232', '2020-01-22 22:13:14');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1241, 'doctor', 117, '채팅 요청', '223.62.203.215', '2020-01-26 13:50:35');
INSERT INTO `fcm_log` (`id`, `id_type`, `fcm_id`, `type`, `ip_address`, `created_at`) VALUES
	(1242, 'doctor', 171, '채팅 요청', '223.62.203.215', '2020-01-26 13:50:35');
/*!40000 ALTER TABLE `fcm_log` ENABLE KEYS */;

-- 테이블 MerDog.hospital_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `hospital_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '병원 번호',
  `doctor_id` int(11) NOT NULL COMMENT '의사 번호',
  `name` varchar(50) DEFAULT NULL COMMENT '병원 이름',
  `address` text COMMENT '주소',
  `intro` text COMMENT '병원 소개',
  `url` varchar(50) DEFAULT NULL COMMENT '병원 홈페이지 url',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_hospital_info_doctor_info` (`doctor_id`),
  CONSTRAINT `FK_hospital_info_doctor_info` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_info` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='병원정보';

-- 테이블 데이터 MerDog.hospital_info:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `hospital_info` DISABLE KEYS */;
INSERT INTO `hospital_info` (`id`, `doctor_id`, `name`, `address`, `intro`, `url`, `created_at`) VALUES
	(21, 115, '장산범', '대한민국 서울특별시 강남구 신사동 논현로163길 13-4', '마지막수정', 'http://www.cc2', '2019-11-07 23:26:19');
INSERT INTO `hospital_info` (`id`, `doctor_id`, `name`, `address`, `intro`, `url`, `created_at`) VALUES
	(24, 103, '중부병원', '대한민국 경기도 고양시 덕양구 화정동 899', '안녕하세요 중부병원입니다 좋은 하루되세요', 'http://www.joongbuhos.com', '2019-11-29 05:12:26');
INSERT INTO `hospital_info` (`id`, `doctor_id`, `name`, `address`, `intro`, `url`, `created_at`) VALUES
	(25, 143, '동물병원', '대한민국 경기도 고양시 덕양구 화정1동 884-6', '안녕하세요 동물병원입니아', 'http://ccit2019.cafe24.com', '2019-12-05 15:46:05');
INSERT INTO `hospital_info` (`id`, `doctor_id`, `name`, `address`, `intro`, `url`, `created_at`) VALUES
	(26, 117, '2223', '대한민국 서울특별시 강남구 신사동 569-22', '기모링', 'http://sksjwjehwj.co.kr', '2019-12-06 10:22:47');
INSERT INTO `hospital_info` (`id`, `doctor_id`, `name`, `address`, `intro`, `url`, `created_at`) VALUES
	(27, 147, '드', '대한민국 경기도 고양시 덕양구 대자동 동헌로 305', '넵 병원입니다.', '없어용', '2019-12-06 10:43:06');
INSERT INTO `hospital_info` (`id`, `doctor_id`, `name`, `address`, `intro`, `url`, `created_at`) VALUES
	(29, 111, '상범 병원', '대한민국 경기도 고양시 덕양구 대자동 동헌로 305', '안녕하세요ㄷㄷ', 'https:www.naver.com', '2019-12-16 21:06:28');
INSERT INTO `hospital_info` (`id`, `doctor_id`, `name`, `address`, `intro`, `url`, `created_at`) VALUES
	(31, 170, 'r', '대한민국 경기도 안산시 상록구 건건동 542', 's', 'd', '2019-12-29 15:00:47');
INSERT INTO `hospital_info` (`id`, `doctor_id`, `name`, `address`, `intro`, `url`, `created_at`) VALUES
	(32, 171, '상범 병원', '대한민국 경기도 고양시 덕양구 대자동 동헌로307번길 22-5', '안녕하세요 상범 병원입니다', 'www.naver.com', '2020-01-02 20:03:27');
/*!40000 ALTER TABLE `hospital_info` ENABLE KEYS */;

-- 테이블 MerDog.level_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `level_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '등급 번호',
  `level` varchar(50) NOT NULL COMMENT '등급 이름',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='관리자 등급 목록';

-- 테이블 데이터 MerDog.level_list:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `level_list` DISABLE KEYS */;
INSERT INTO `level_list` (`id`, `level`) VALUES
	(1, 'wait');
INSERT INTO `level_list` (`id`, `level`) VALUES
	(2, 'normal');
INSERT INTO `level_list` (`id`, `level`) VALUES
	(3, 'manager');
INSERT INTO `level_list` (`id`, `level`) VALUES
	(4, 'admin');
/*!40000 ALTER TABLE `level_list` ENABLE KEYS */;

-- 테이블 MerDog.license 구조 내보내기
CREATE TABLE IF NOT EXISTS `license` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '이미지 번호',
  `doctor_id` int(11) NOT NULL COMMENT '의사 번호',
  `img_name` varchar(50) NOT NULL COMMENT '이미지 이름',
  `division` varchar(50) NOT NULL COMMENT '자격증/ 신분증 구분 (user/doctor)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `img_name` (`img_name`),
  KEY `FK_license_doctor_info` (`doctor_id`),
  CONSTRAINT `FK_license_doctor_info` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='의사 이미지(자격증 및 신분증) 목록';

-- 테이블 데이터 MerDog.license:~42 rows (대략적) 내보내기
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(42, 103, 'CYMERA_20170103_201347.jpg', 'user', '2019-10-30 13:52:00');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(43, 103, 'CYMERA_20170103_201357.jpg', 'doctor', '2019-10-30 13:52:00');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(48, 106, 'JPEG_20191030_155133_2.jpg', 'user', '2019-10-30 15:51:53');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(49, 106, 'JPEG_20191030_155133_1.jpg', 'doctor', '2019-10-30 15:51:53');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(50, 107, '20190829_131357.jpg', 'user', '2019-10-30 15:53:27');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(51, 107, '20190829_135341.jpg', 'doctor', '2019-10-30 15:53:27');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(52, 108, '1522551845341.jpg', 'user', '2019-10-30 15:59:11');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(53, 108, '1522388743824.jpg', 'doctor', '2019-10-30 15:59:11');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(54, 109, 'JPEG_20191030_160542399_2.jpg', 'user', '2019-10-30 16:06:02');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(55, 109, 'JPEG_20191030_160542397_1.jpg', 'doctor', '2019-10-30 16:06:02');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(58, 111, '2019-08-29-10-58-49.jpg', 'user', '2019-11-26 20:07:37');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(59, 111, '20190829_080954.jpg', 'doctor', '2019-11-26 20:07:37');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(60, 112, 'Capture+_2017-09-24-13-07-19.png', 'user', '2019-10-30 19:01:52');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(61, 112, 'Capture+_2017-09-12-20-54-25.png', 'doctor', '2019-10-30 19:01:52');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(66, 115, 'sp.PNG', 'user', '2019-11-06 15:44:50');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(67, 115, '스크린샷(2).png', 'doctor', '2019-11-06 15:44:50');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(68, 116, 'received_1098266496959968.jpeg', 'user', '2019-11-07 13:52:04');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(69, 116, 'JPEG_20191107_135137058_1.jpg', 'doctor', '2019-11-07 13:52:04');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(70, 117, '20191114_165532.jpg', 'user', '2019-11-21 19:07:36');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(71, 117, '20191114_165534.jpg', 'doctor', '2019-11-21 19:07:36');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(104, 143, 'JPEG_20191201_153147609_2.jpg', 'user', '2019-12-01 15:31:51');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(105, 143, 'JPEG_20191201_153147598_1.jpg', 'doctor', '2019-12-01 15:31:51');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(106, 144, 'FB_IMG_1575004676802.jpg', 'user', '2019-12-02 15:15:57');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(107, 144, 'beauty_20191130124355.jpg', 'doctor', '2019-12-02 15:15:57');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(110, 146, 'JPEG_20191206_103444406_2.jpg', 'user', '2019-12-06 10:34:52');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(111, 146, 'JPEG_20191206_103444404_1.jpg', 'doctor', '2019-12-06 10:34:52');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(112, 147, 'JPEG_20191206_103743229_2.jpg', 'user', '2019-12-06 10:37:53');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(113, 147, 'JPEG_20191206_103743228_1.jpg', 'doctor', '2019-12-06 10:37:53');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(114, 148, '1575603821133.jpg', 'user', '2019-12-06 15:33:10');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(115, 148, 'beauty_20191206121409.jpg', 'doctor', '2019-12-06 15:33:10');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(124, 153, 'beauty_20191217163509.jpg', 'user', '2019-12-17 23:13:17');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(125, 153, '2019-12-17-19-25-38-346.jpg', 'doctor', '2019-12-17 23:13:17');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(135, 164, '20191223_23113312020191221_190156.jpguser_license', 'user', '2019-12-23 23:11:59');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(136, 164, '20191223_23113312020191221_221545.jpglicense_name', 'doctor', '2019-12-23 23:11:59');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(137, 167, '20191225_162118762Screenshot_20191218-000321.jpgus', 'user', '2019-12-25 16:21:46');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(138, 167, '20191225_162118762Screenshot_20191218-000325.jpgli', 'doctor', '2019-12-25 16:21:46');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(143, 170, '20191226_01220358620170104_003254_HDR.jpguser_lice', 'user', '2019-12-26 01:22:30');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(144, 170, '20191226_01220358620180203_132324_HDR.jpglicense_n', 'doctor', '2019-12-26 01:22:30');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(145, 171, '20200102_195743273JPEG_20200102195734_718945070726', 'user', '2020-01-02 19:58:21');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(146, 171, '20200102_195743273JPEG_20200102195722_859593612033', 'doctor', '2020-01-02 19:58:21');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(147, 172, '20200102_21484712220200102_213516.jpguser_license', 'user', '2020-01-02 21:49:23');
INSERT INTO `license` (`id`, `doctor_id`, `img_name`, `division`, `created_at`) VALUES
	(148, 172, '20200102_21484712220200102_214657.jpglicense_name', 'doctor', '2020-01-02 21:49:23');
/*!40000 ALTER TABLE `license` ENABLE KEYS */;

-- 테이블 MerDog.login_log 구조 내보내기
CREATE TABLE IF NOT EXISTS `login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` varchar(50) NOT NULL COMMENT 'user/doctor',
  `login_id` int(11) NOT NULL COMMENT '회원번호',
  `ip_address` varchar(50) NOT NULL COMMENT 'ip 주소',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='로그인 로그';

-- 테이블 데이터 MerDog.login_log:~1,316 rows (대략적) 내보내기
/*!40000 ALTER TABLE `login_log` DISABLE KEYS */;
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(124, 'doctor', 111, '223.38.28.226', '2019-12-01 20:33:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(125, 'doctor', 111, '223.38.28.226', '2019-12-01 20:33:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(126, 'user', 77, '1.236.88.213', '2019-12-01 20:34:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(127, 'doctor', 111, '223.38.28.226', '2019-12-01 20:35:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(128, 'doctor', 111, '223.38.28.226', '2019-12-01 20:35:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(129, 'doctor', 111, '223.38.28.226', '2019-12-01 20:35:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(130, 'doctor', 111, '223.38.28.226', '2019-12-01 20:35:21');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(131, 'doctor', 111, '223.38.28.226', '2019-12-01 20:35:23');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(132, 'doctor', 111, '223.38.28.226', '2019-12-01 20:35:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(133, 'doctor', 111, '223.38.28.226', '2019-12-01 20:35:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(134, 'doctor', 111, '223.38.28.226', '2019-12-01 20:35:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(135, 'doctor', 111, '223.38.28.226', '2019-12-01 20:35:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(136, 'doctor', 111, '223.38.28.226', '2019-12-01 20:35:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(137, 'user', 77, '1.236.88.213', '2019-12-01 20:35:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(138, 'doctor', 111, '223.38.28.226', '2019-12-01 20:36:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(139, 'doctor', 111, '223.38.28.226', '2019-12-01 20:36:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(140, 'doctor', 111, '223.38.28.226', '2019-12-01 20:36:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(141, 'doctor', 111, '223.38.28.226', '2019-12-01 20:37:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(142, 'doctor', 111, '223.38.28.226', '2019-12-01 20:37:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(143, 'doctor', 111, '223.38.28.226', '2019-12-01 20:38:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(144, 'doctor', 111, '114.204.208.165', '2019-12-01 20:38:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(145, 'user', 77, '1.236.88.213', '2019-12-01 20:39:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(146, 'doctor', 111, '223.38.28.226', '2019-12-01 20:39:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(147, 'user', 77, '1.236.88.213', '2019-12-01 20:45:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(148, 'user', 77, '1.236.88.213', '2019-12-01 20:46:47');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(149, 'user', 77, '1.236.88.213', '2019-12-01 20:48:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(150, 'user', 77, '1.236.88.213', '2019-12-01 20:50:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(151, 'user', 77, '1.236.88.213', '2019-12-01 20:50:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(152, 'user', 77, '1.236.88.213', '2019-12-01 20:51:21');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(153, 'user', 77, '1.236.88.213', '2019-12-01 20:53:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(155, 'user', 77, '1.236.88.213', '2019-12-01 21:56:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(156, 'user', 77, '1.236.88.213', '2019-12-01 22:10:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(157, 'user', 77, '1.236.88.213', '2019-12-01 22:16:47');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(158, 'user', 77, '1.236.88.213', '2019-12-01 22:20:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(159, 'user', 77, '1.236.88.213', '2019-12-01 22:22:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(160, 'user', 77, '1.236.88.213', '2019-12-01 22:31:43');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(161, 'user', 77, '1.236.88.213', '2019-12-01 22:49:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(162, 'user', 77, '1.236.88.213', '2019-12-01 22:51:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(163, 'user', 77, '1.236.88.213', '2019-12-01 23:03:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(164, 'user', 77, '1.236.88.213', '2019-12-01 23:18:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(165, 'user', 77, '1.236.88.213', '2019-12-01 23:35:23');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(166, 'user', 77, '1.236.88.213', '2019-12-01 23:37:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(167, 'user', 77, '1.236.88.213', '2019-12-01 23:42:01');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(168, 'doctor', 103, '106.102.142.204', '2019-12-01 23:44:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(169, 'user', 77, '1.236.88.213', '2019-12-01 23:52:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(170, 'user', 77, '1.236.88.213', '2019-12-02 00:37:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(171, 'user', 77, '1.236.88.213', '2019-12-02 00:45:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(172, 'user', 77, '1.236.88.213', '2019-12-02 00:47:43');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(173, 'doctor', 103, '106.102.142.204', '2019-12-02 00:48:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(174, 'doctor', 103, '106.102.142.204', '2019-12-02 00:52:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(175, 'doctor', 103, '106.102.142.204', '2019-12-02 00:57:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(176, 'doctor', 103, '106.102.142.204', '2019-12-02 01:13:43');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(177, 'doctor', 103, '106.102.142.204', '2019-12-02 01:17:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(178, 'doctor', 103, '106.102.142.204', '2019-12-02 01:18:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(179, 'doctor', 103, '106.102.142.204', '2019-12-02 01:19:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(180, 'doctor', 103, '106.102.142.204', '2019-12-02 01:21:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(181, 'doctor', 103, '106.102.142.204', '2019-12-02 01:21:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(182, 'doctor', 103, '106.102.142.204', '2019-12-02 01:22:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(183, 'doctor', 103, '106.102.142.204', '2019-12-02 01:23:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(184, 'doctor', 103, '106.102.142.204', '2019-12-02 01:23:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(185, 'doctor', 103, '106.102.142.204', '2019-12-02 01:24:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(186, 'doctor', 111, '223.38.28.226', '2019-12-02 01:58:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(187, 'doctor', 111, '223.38.28.226', '2019-12-02 01:58:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(188, 'doctor', 111, '223.38.28.226', '2019-12-02 02:23:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(189, 'doctor', 111, '223.38.28.226', '2019-12-02 02:24:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(190, 'doctor', 111, '223.38.28.226', '2019-12-02 02:46:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(191, 'doctor', 103, '106.102.142.204', '2019-12-02 04:19:47');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(192, 'user', 77, '1.236.88.213', '2019-12-02 12:45:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(193, 'user', 77, '1.236.88.213', '2019-12-02 13:14:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(194, 'user', 77, '1.236.88.213', '2019-12-02 13:16:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(195, 'user', 77, '1.236.88.213', '2019-12-02 13:17:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(196, 'user', 77, '1.236.88.213', '2019-12-02 13:17:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(197, 'user', 77, '1.236.88.213', '2019-12-02 13:19:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(198, 'user', 77, '1.236.88.213', '2019-12-02 13:23:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(199, 'doctor', 103, '49.172.164.80', '2019-12-02 14:28:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(200, 'doctor', 143, '49.172.164.80', '2019-12-02 14:42:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(201, 'doctor', 143, '49.172.164.80', '2019-12-02 14:44:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(202, 'doctor', 143, '49.172.164.80', '2019-12-02 14:48:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(203, 'doctor', 143, '49.172.164.80', '2019-12-02 14:49:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(204, 'doctor', 143, '49.172.164.80', '2019-12-02 14:51:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(205, 'doctor', 111, '223.38.28.226', '2019-12-02 14:55:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(206, 'doctor', 111, '223.38.28.226', '2019-12-02 14:56:17');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(207, 'doctor', 143, '49.172.164.80', '2019-12-02 14:56:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(208, 'doctor', 143, '49.172.164.80', '2019-12-02 14:58:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(209, 'doctor', 143, '49.172.164.80', '2019-12-02 14:58:21');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(210, 'doctor', 143, '49.172.164.80', '2019-12-02 14:59:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(211, 'doctor', 143, '49.172.164.80', '2019-12-02 15:00:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(212, 'doctor', 143, '49.172.164.80', '2019-12-02 15:00:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(213, 'doctor', 143, '49.172.164.80', '2019-12-02 15:02:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(214, 'doctor', 143, '49.172.164.80', '2019-12-02 15:02:59');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(215, 'doctor', 143, '49.172.164.80', '2019-12-02 15:04:03');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(216, 'doctor', 143, '49.172.164.80', '2019-12-02 15:04:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(217, 'doctor', 111, '223.38.28.226', '2019-12-02 15:11:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(218, 'doctor', 143, '49.172.164.80', '2019-12-02 15:18:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(219, 'doctor', 111, '223.38.28.226', '2019-12-02 15:20:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(220, 'user', 78, '223.62.219.211', '2019-12-02 15:47:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(221, 'user', 77, '1.236.88.213', '2019-12-02 15:51:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(222, 'user', 78, '223.62.219.211', '2019-12-02 15:52:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(223, 'user', 78, '223.62.219.211', '2019-12-02 15:55:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(224, 'user', 78, '223.62.219.211', '2019-12-02 15:56:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(225, 'user', 78, '223.62.219.211', '2019-12-02 16:02:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(226, 'user', 77, '1.236.88.213', '2019-12-02 16:05:15');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(227, 'user', 78, '223.62.219.211', '2019-12-02 16:05:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(228, 'user', 78, '223.62.219.211', '2019-12-02 16:06:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(229, 'user', 77, '1.236.88.213', '2019-12-02 16:06:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(230, 'doctor', 143, '49.172.164.80', '2019-12-02 16:14:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(231, 'doctor', 111, '223.38.28.226', '2019-12-02 16:21:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(232, 'doctor', 143, '49.172.164.80', '2019-12-02 16:28:51');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(233, 'doctor', 143, '49.172.164.80', '2019-12-02 16:30:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(234, 'doctor', 143, '49.172.164.80', '2019-12-02 16:32:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(235, 'user', 78, '223.62.219.211', '2019-12-02 16:33:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(236, 'doctor', 111, '223.38.28.226', '2019-12-02 16:34:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(237, 'doctor', 143, '49.172.164.80', '2019-12-02 16:34:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(238, 'doctor', 143, '49.172.164.80', '2019-12-02 16:34:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(239, 'doctor', 111, '223.38.28.226', '2019-12-02 16:36:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(240, 'user', 77, '1.236.88.213', '2019-12-02 16:38:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(241, 'doctor', 143, '49.172.164.80', '2019-12-02 16:40:30');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(242, 'user', 77, '1.236.88.213', '2019-12-02 16:40:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(243, 'user', 78, '223.62.219.211', '2019-12-02 16:42:03');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(244, 'doctor', 143, '49.172.164.80', '2019-12-02 16:42:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(245, 'user', 77, '1.236.88.213', '2019-12-02 16:42:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(246, 'doctor', 143, '49.172.164.80', '2019-12-02 16:49:15');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(247, 'doctor', 143, '49.172.164.80', '2019-12-02 16:49:56');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(248, 'doctor', 143, '49.172.164.80', '2019-12-02 16:51:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(249, 'doctor', 143, '49.172.164.80', '2019-12-02 16:52:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(250, 'doctor', 143, '49.172.164.80', '2019-12-02 16:53:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(251, 'doctor', 143, '49.172.164.80', '2019-12-02 16:54:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(252, 'doctor', 143, '49.172.164.80', '2019-12-02 16:55:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(253, 'doctor', 143, '49.172.164.80', '2019-12-02 16:55:35');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(254, 'doctor', 143, '49.172.164.80', '2019-12-02 16:56:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(255, 'doctor', 143, '49.172.164.80', '2019-12-02 16:58:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(256, 'doctor', 143, '49.172.164.80', '2019-12-02 17:00:59');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(257, 'user', 77, '1.236.88.213', '2019-12-02 17:03:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(258, 'doctor', 143, '49.172.164.80', '2019-12-02 17:03:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(259, 'user', 77, '1.236.88.213', '2019-12-02 17:05:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(260, 'user', 77, '1.236.88.213', '2019-12-02 17:09:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(261, 'doctor', 143, '49.172.164.80', '2019-12-02 17:10:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(262, 'doctor', 143, '49.172.164.80', '2019-12-02 17:11:17');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(263, 'doctor', 143, '49.172.164.80', '2019-12-02 17:12:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(264, 'doctor', 143, '49.172.164.80', '2019-12-02 17:12:35');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(265, 'doctor', 143, '49.172.164.80', '2019-12-02 17:14:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(266, 'user', 77, '1.236.88.213', '2019-12-02 17:14:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(267, 'doctor', 143, '49.172.164.80', '2019-12-02 17:14:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(268, 'user', 77, '1.236.88.213', '2019-12-02 17:15:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(269, 'doctor', 143, '49.172.164.80', '2019-12-02 17:20:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(270, 'user', 77, '1.236.88.213', '2019-12-02 17:20:30');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(271, 'doctor', 143, '49.172.164.80', '2019-12-02 17:20:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(272, 'user', 77, '1.236.88.213', '2019-12-02 17:22:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(273, 'user', 77, '1.236.88.213', '2019-12-02 17:25:12');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(274, 'user', 77, '1.236.88.213', '2019-12-02 17:26:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(275, 'user', 77, '1.236.88.213', '2019-12-02 17:27:51');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(276, 'user', 77, '1.236.88.213', '2019-12-02 17:29:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(277, 'doctor', 143, '49.172.164.80', '2019-12-02 18:29:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(278, 'user', 78, '223.62.219.211', '2019-12-03 13:04:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(279, 'user', 78, '223.62.219.211', '2019-12-03 13:05:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(280, 'user', 78, '223.62.219.211', '2019-12-03 13:07:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(281, 'user', 78, '223.62.219.211', '2019-12-03 13:11:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(282, 'user', 78, '223.62.219.211', '2019-12-03 13:14:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(283, 'user', 78, '223.62.219.211', '2019-12-03 13:15:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(284, 'user', 78, '223.62.219.211', '2019-12-03 13:18:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(285, 'user', 78, '223.62.219.211', '2019-12-03 13:23:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(286, 'user', 78, '223.62.219.211', '2019-12-03 13:24:43');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(287, 'doctor', 111, '223.38.28.226', '2019-12-03 13:41:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(288, 'user', 78, '223.62.219.211', '2019-12-03 13:41:51');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(289, 'user', 78, '223.62.219.211', '2019-12-03 13:47:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(290, 'user', 78, '223.62.219.211', '2019-12-03 13:51:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(291, 'user', 77, '14.42.86.31', '2019-12-03 14:33:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(292, 'user', 78, '223.62.219.211', '2019-12-03 14:38:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(293, 'user', 77, '14.42.86.31', '2019-12-03 14:43:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(294, 'user', 78, '223.62.219.211', '2019-12-03 14:43:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(295, 'user', 78, '223.62.219.211', '2019-12-03 14:45:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(296, 'user', 77, '14.42.86.31', '2019-12-03 14:46:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(297, 'user', 78, '223.62.219.211', '2019-12-03 14:49:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(298, 'user', 78, '223.62.219.211', '2019-12-03 14:49:43');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(299, 'user', 78, '223.62.219.211', '2019-12-03 14:50:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(300, 'user', 78, '223.62.219.211', '2019-12-03 14:59:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(301, 'user', 78, '223.62.219.211', '2019-12-03 15:01:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(302, 'user', 78, '223.62.219.211', '2019-12-03 15:02:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(303, 'user', 78, '223.62.219.211', '2019-12-03 15:05:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(304, 'user', 78, '223.62.219.211', '2019-12-03 15:08:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(305, 'user', 78, '223.62.219.211', '2019-12-03 15:10:08');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(306, 'user', 78, '223.62.219.211', '2019-12-03 15:11:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(307, 'user', 78, '223.62.219.211', '2019-12-03 15:14:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(308, 'user', 78, '223.62.219.211', '2019-12-03 15:17:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(309, 'user', 78, '223.62.219.211', '2019-12-03 15:18:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(310, 'user', 78, '223.62.219.211', '2019-12-03 15:20:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(311, 'user', 77, '223.38.24.47', '2019-12-03 15:38:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(312, 'user', 78, '223.62.219.211', '2019-12-03 15:46:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(313, 'doctor', 111, '223.39.140.159', '2019-12-03 15:49:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(314, 'doctor', 111, '223.39.140.159', '2019-12-03 15:50:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(315, 'doctor', 111, '223.39.140.159', '2019-12-03 15:54:12');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(316, 'doctor', 111, '223.39.140.159', '2019-12-03 15:57:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(317, 'user', 78, '223.62.219.211', '2019-12-03 15:57:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(318, 'doctor', 111, '223.39.140.159', '2019-12-03 15:59:51');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(319, 'doctor', 111, '223.39.140.159', '2019-12-03 16:06:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(320, 'user', 78, '223.62.219.211', '2019-12-03 16:11:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(321, 'user', 78, '223.62.219.211', '2019-12-03 16:15:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(322, 'user', 78, '223.62.219.211', '2019-12-03 16:44:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(323, 'doctor', 111, '223.39.140.159', '2019-12-03 16:49:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(324, 'doctor', 111, '223.39.140.159', '2019-12-03 16:57:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(325, 'doctor', 111, '223.39.140.159', '2019-12-03 17:00:01');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(326, 'user', 78, '223.62.219.211', '2019-12-03 17:17:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(327, 'user', 78, '223.62.219.211', '2019-12-03 17:21:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(328, 'user', 78, '223.62.219.211', '2019-12-03 17:25:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(329, 'user', 78, '223.62.219.211', '2019-12-03 17:25:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(330, 'user', 78, '223.62.219.211', '2019-12-03 17:26:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(331, 'user', 78, '223.62.219.211', '2019-12-03 17:28:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(332, 'user', 78, '223.62.219.211', '2019-12-03 17:34:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(333, 'user', 78, '223.62.219.211', '2019-12-03 17:34:51');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(334, 'user', 78, '223.62.219.211', '2019-12-03 17:39:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(335, 'user', 78, '223.62.219.211', '2019-12-03 17:42:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(336, 'user', 78, '223.62.219.211', '2019-12-03 17:43:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(337, 'doctor', 111, '223.39.140.159', '2019-12-03 17:43:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(338, 'doctor', 111, '223.39.140.159', '2019-12-03 17:45:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(339, 'doctor', 111, '223.39.140.159', '2019-12-03 17:46:01');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(340, 'doctor', 111, '223.39.140.159', '2019-12-03 17:47:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(341, 'doctor', 111, '223.39.140.159', '2019-12-03 17:47:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(342, 'user', 78, '223.62.219.211', '2019-12-03 17:48:01');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(343, 'doctor', 111, '223.39.140.159', '2019-12-03 18:25:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(344, 'doctor', 111, '223.39.140.159', '2019-12-03 18:26:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(345, 'doctor', 111, '223.39.140.159', '2019-12-03 18:31:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(346, 'doctor', 111, '223.39.140.159', '2019-12-03 18:33:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(347, 'doctor', 111, '223.39.140.159', '2019-12-03 18:35:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(348, 'doctor', 111, '223.39.140.159', '2019-12-03 18:37:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(349, 'user', 78, '223.62.219.211', '2019-12-03 18:44:33');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(350, 'doctor', 111, '223.39.140.159', '2019-12-03 18:46:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(351, 'user', 78, '223.62.219.211', '2019-12-03 18:47:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(352, 'doctor', 111, '223.39.140.159', '2019-12-03 18:48:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(353, 'doctor', 111, '223.39.140.159', '2019-12-03 18:55:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(354, 'doctor', 111, '223.39.140.159', '2019-12-03 18:58:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(355, 'user', 78, '223.62.219.211', '2019-12-03 19:04:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(356, 'user', 78, '223.62.219.211', '2019-12-03 19:05:03');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(357, 'doctor', 111, '223.39.140.159', '2019-12-03 19:05:47');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(358, 'user', 78, '223.62.219.211', '2019-12-03 19:10:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(359, 'user', 78, '223.62.219.211', '2019-12-03 19:12:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(360, 'doctor', 111, '223.39.140.159', '2019-12-03 19:12:47');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(361, 'doctor', 111, '223.39.140.159', '2019-12-03 19:14:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(362, 'doctor', 111, '223.39.140.159', '2019-12-03 19:16:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(363, 'doctor', 111, '223.39.140.159', '2019-12-03 19:18:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(364, 'doctor', 111, '223.39.140.159', '2019-12-03 19:20:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(365, 'doctor', 111, '223.39.140.159', '2019-12-03 19:22:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(366, 'user', 78, '223.62.219.211', '2019-12-03 19:24:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(367, 'doctor', 111, '223.39.140.159', '2019-12-03 19:32:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(368, 'user', 78, '223.62.219.211', '2019-12-03 19:33:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(369, 'doctor', 111, '223.39.140.159', '2019-12-03 19:39:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(370, 'doctor', 111, '223.39.140.159', '2019-12-03 19:46:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(371, 'doctor', 111, '223.39.140.159', '2019-12-03 19:51:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(372, 'doctor', 111, '223.39.140.159', '2019-12-03 19:56:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(373, 'doctor', 111, '223.39.140.159', '2019-12-03 19:58:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(374, 'doctor', 143, '49.172.164.80', '2019-12-03 20:00:56');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(375, 'doctor', 143, '49.172.164.80', '2019-12-03 20:14:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(376, 'doctor', 143, '49.172.164.80', '2019-12-03 20:19:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(377, 'user', 78, '223.62.219.211', '2019-12-03 20:50:08');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(378, 'user', 78, '223.62.219.211', '2019-12-03 20:52:23');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(379, 'doctor', 111, '223.39.140.159', '2019-12-03 20:57:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(380, 'user', 78, '223.62.219.211', '2019-12-03 21:04:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(381, 'user', 78, '223.62.219.211', '2019-12-03 21:04:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(382, 'doctor', 111, '223.39.140.159', '2019-12-03 21:05:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(383, 'doctor', 111, '223.39.140.159', '2019-12-03 21:10:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(384, 'doctor', 111, '223.39.140.159', '2019-12-03 21:12:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(385, 'user', 78, '223.62.219.211', '2019-12-03 21:31:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(386, 'user', 78, '223.62.219.211', '2019-12-03 21:35:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(387, 'user', 78, '223.62.219.211', '2019-12-03 21:36:59');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(388, 'doctor', 111, '223.39.140.159', '2019-12-03 23:12:21');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(389, 'user', 78, '223.38.21.149', '2019-12-04 13:05:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(390, 'user', 78, '223.38.21.149', '2019-12-04 13:07:43');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(391, 'user', 78, '223.38.21.149', '2019-12-04 13:10:08');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(392, 'user', 78, '223.38.21.149', '2019-12-04 16:47:23');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(393, 'user', 78, '223.38.21.149', '2019-12-05 09:42:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(394, 'user', 78, '223.38.21.149', '2019-12-05 13:41:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(395, 'user', 78, '223.38.21.149', '2019-12-05 13:43:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(396, 'user', 78, '223.38.21.149', '2019-12-05 13:49:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(397, 'user', 78, '223.38.21.149', '2019-12-05 13:51:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(398, 'user', 78, '223.38.21.149', '2019-12-05 13:54:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(399, 'user', 78, '223.38.21.149', '2019-12-05 13:57:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(400, 'user', 78, '223.38.21.149', '2019-12-05 13:58:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(401, 'doctor', 111, '223.39.140.159', '2019-12-05 14:13:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(402, 'doctor', 143, '49.172.164.80', '2019-12-05 14:31:43');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(403, 'doctor', 143, '49.172.164.80', '2019-12-05 14:33:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(404, 'doctor', 143, '49.172.164.80', '2019-12-05 14:34:59');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(405, 'doctor', 143, '49.172.164.80', '2019-12-05 14:35:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(406, 'doctor', 143, '49.172.164.80', '2019-12-05 14:45:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(407, 'doctor', 143, '49.172.164.80', '2019-12-05 14:46:15');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(408, 'doctor', 143, '49.172.164.80', '2019-12-05 14:46:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(409, 'doctor', 143, '49.172.164.80', '2019-12-05 14:48:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(410, 'doctor', 143, '49.172.164.80', '2019-12-05 14:51:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(411, 'user', 78, '223.38.21.149', '2019-12-05 15:04:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(412, 'user', 78, '223.38.21.149', '2019-12-05 15:05:08');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(413, 'user', 78, '223.38.21.149', '2019-12-05 15:05:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(414, 'user', 78, '223.38.21.149', '2019-12-05 15:05:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(415, 'user', 80, '223.39.140.159', '2019-12-05 15:13:01');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(416, 'user', 78, '223.38.21.149', '2019-12-05 15:14:47');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(417, 'user', 78, '223.38.21.149', '2019-12-05 15:15:43');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(418, 'user', 78, '223.38.21.149', '2019-12-05 15:15:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(419, 'user', 78, '223.38.21.149', '2019-12-05 15:17:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(420, 'user', 78, '223.38.21.149', '2019-12-05 15:24:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(421, 'user', 78, '223.38.21.149', '2019-12-05 15:28:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(422, 'user', 78, '223.38.21.149', '2019-12-05 15:29:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(423, 'user', 78, '223.38.21.149', '2019-12-05 15:31:47');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(424, 'user', 78, '223.38.21.149', '2019-12-05 15:32:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(425, 'doctor', 111, '223.62.202.12', '2019-12-05 15:34:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(426, 'user', 78, '223.38.21.149', '2019-12-05 15:34:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(427, 'doctor', 111, '223.62.202.12', '2019-12-05 15:34:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(428, 'user', 78, '223.38.21.149', '2019-12-05 15:35:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(429, 'doctor', 111, '223.62.202.12', '2019-12-05 15:38:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(430, 'user', 78, '223.38.21.149', '2019-12-05 15:40:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(431, 'user', 78, '223.38.21.149', '2019-12-05 15:40:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(432, 'doctor', 143, '49.172.164.80', '2019-12-05 15:45:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(433, 'doctor', 111, '223.62.202.12', '2019-12-05 15:48:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(434, 'doctor', 143, '49.172.164.80', '2019-12-05 15:48:56');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(435, 'doctor', 111, '223.62.202.12', '2019-12-05 15:49:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(436, 'user', 80, '223.62.202.12', '2019-12-05 15:49:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(437, 'user', 80, '223.62.202.12', '2019-12-05 15:49:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(438, 'doctor', 143, '49.172.164.80', '2019-12-05 15:51:30');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(439, 'doctor', 111, '223.62.202.12', '2019-12-05 15:53:15');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(440, 'doctor', 111, '223.62.202.12', '2019-12-05 15:53:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(441, 'doctor', 143, '49.172.164.80', '2019-12-05 15:54:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(442, 'doctor', 143, '49.172.164.80', '2019-12-05 15:55:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(443, 'doctor', 111, '223.62.202.12', '2019-12-05 15:56:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(444, 'user', 78, '223.38.21.149', '2019-12-05 15:57:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(445, 'doctor', 111, '223.62.202.12', '2019-12-05 15:57:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(446, 'doctor', 111, '223.62.202.12', '2019-12-05 15:57:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(447, 'doctor', 111, '223.62.202.12', '2019-12-05 15:58:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(448, 'user', 78, '223.38.21.149', '2019-12-05 16:01:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(449, 'doctor', 111, '223.62.202.12', '2019-12-05 16:02:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(450, 'doctor', 111, '223.62.202.12', '2019-12-05 16:03:23');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(451, 'doctor', 111, '223.62.202.12', '2019-12-05 16:05:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(452, 'user', 78, '223.38.21.149', '2019-12-05 16:06:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(453, 'user', 78, '223.38.21.149', '2019-12-05 16:06:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(454, 'user', 80, '223.62.202.12', '2019-12-05 16:11:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(455, 'doctor', 111, '223.62.202.12', '2019-12-05 16:18:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(456, 'doctor', 143, '49.172.164.80', '2019-12-05 16:21:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(457, 'doctor', 143, '49.172.164.80', '2019-12-05 16:23:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(458, 'doctor', 111, '223.62.202.12', '2019-12-05 16:23:12');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(459, 'doctor', 111, '223.62.202.12', '2019-12-05 16:24:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(460, 'doctor', 111, '223.62.202.12', '2019-12-05 16:25:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(461, 'doctor', 143, '49.172.164.80', '2019-12-05 16:28:47');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(462, 'doctor', 111, '223.62.202.12', '2019-12-05 16:31:17');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(463, 'doctor', 143, '49.172.164.80', '2019-12-05 16:32:08');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(464, 'doctor', 111, '223.62.202.12', '2019-12-05 16:35:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(465, 'doctor', 111, '223.62.202.12', '2019-12-05 16:35:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(466, 'doctor', 143, '49.172.164.80', '2019-12-05 16:35:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(467, 'doctor', 143, '49.172.164.80', '2019-12-05 16:36:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(468, 'doctor', 111, '223.62.202.12', '2019-12-05 16:45:15');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(469, 'user', 78, '223.38.28.228', '2019-12-05 16:46:33');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(470, 'user', 78, '223.38.28.228', '2019-12-05 16:46:35');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(471, 'doctor', 111, '223.62.202.12', '2019-12-05 16:47:12');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(472, 'doctor', 143, '49.172.164.80', '2019-12-05 16:51:43');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(473, 'doctor', 111, '223.62.202.12', '2019-12-05 16:56:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(474, 'doctor', 111, '223.62.202.12', '2019-12-05 16:58:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(475, 'doctor', 111, '223.62.202.12', '2019-12-05 17:03:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(476, 'doctor', 111, '223.62.202.12', '2019-12-05 17:05:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(477, 'doctor', 143, '49.172.164.80', '2019-12-05 17:06:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(478, 'doctor', 143, '49.172.164.80', '2019-12-05 17:08:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(479, 'doctor', 143, '49.172.164.80', '2019-12-05 17:10:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(480, 'doctor', 143, '49.172.164.80', '2019-12-05 17:10:33');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(481, 'user', 78, '223.38.28.228', '2019-12-05 17:11:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(482, 'user', 78, '223.38.28.228', '2019-12-05 17:11:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(483, 'doctor', 143, '49.172.164.80', '2019-12-05 17:12:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(484, 'doctor', 143, '49.172.164.80', '2019-12-05 17:14:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(485, 'doctor', 143, '49.172.164.80', '2019-12-05 17:16:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(486, 'doctor', 143, '49.172.164.80', '2019-12-05 17:16:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(487, 'doctor', 103, '49.172.164.80', '2019-12-05 17:18:23');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(488, 'doctor', 111, '223.62.202.12', '2019-12-05 17:21:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(489, 'doctor', 111, '223.62.202.12', '2019-12-05 17:22:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(490, 'doctor', 111, '223.62.202.12', '2019-12-05 17:28:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(491, 'doctor', 103, '49.172.164.80', '2019-12-05 17:29:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(492, 'doctor', 111, '223.62.202.12', '2019-12-05 17:29:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(493, 'doctor', 103, '49.172.164.80', '2019-12-05 17:30:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(494, 'doctor', 103, '49.172.164.80', '2019-12-05 17:32:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(495, 'doctor', 111, '223.62.202.12', '2019-12-05 17:33:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(496, 'doctor', 103, '49.172.164.80', '2019-12-05 17:34:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(497, 'doctor', 103, '49.172.164.80', '2019-12-05 17:35:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(498, 'doctor', 111, '223.62.202.12', '2019-12-05 17:36:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(499, 'doctor', 103, '49.172.164.80', '2019-12-05 17:38:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(500, 'doctor', 111, '223.62.202.12', '2019-12-05 17:39:03');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(501, 'doctor', 103, '49.172.164.80', '2019-12-05 17:39:17');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(502, 'doctor', 111, '223.62.202.12', '2019-12-05 17:40:30');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(503, 'doctor', 111, '223.62.202.12', '2019-12-05 17:40:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(504, 'doctor', 103, '49.172.164.80', '2019-12-05 17:41:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(505, 'doctor', 111, '223.62.202.12', '2019-12-05 17:42:23');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(506, 'doctor', 103, '49.172.164.80', '2019-12-05 17:43:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(507, 'doctor', 111, '223.62.202.12', '2019-12-05 17:43:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(508, 'doctor', 103, '49.172.164.80', '2019-12-05 17:44:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(509, 'doctor', 111, '223.62.202.12', '2019-12-05 17:45:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(510, 'doctor', 111, '223.62.202.12', '2019-12-05 17:47:03');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(511, 'doctor', 111, '223.62.202.12', '2019-12-05 17:48:12');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(512, 'doctor', 103, '49.172.164.80', '2019-12-05 17:49:01');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(513, 'doctor', 103, '49.172.164.80', '2019-12-05 17:50:33');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(514, 'doctor', 103, '49.172.164.80', '2019-12-05 17:51:15');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(515, 'doctor', 111, '223.62.202.12', '2019-12-05 17:51:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(516, 'doctor', 103, '49.172.164.80', '2019-12-05 17:53:56');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(517, 'doctor', 111, '223.62.202.12', '2019-12-05 17:54:56');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(518, 'doctor', 111, '223.62.202.12', '2019-12-05 18:02:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(519, 'doctor', 103, '49.172.164.80', '2019-12-05 18:02:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(520, 'doctor', 111, '223.62.202.12', '2019-12-05 18:03:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(521, 'doctor', 103, '49.172.164.80', '2019-12-05 18:04:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(522, 'doctor', 111, '223.62.202.12', '2019-12-05 18:05:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(523, 'user', 78, '223.38.28.228', '2019-12-05 18:27:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(524, 'user', 78, '223.38.28.228', '2019-12-05 18:27:47');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(525, 'user', 78, '223.38.28.228', '2019-12-05 18:28:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(526, 'doctor', 103, '49.172.164.80', '2019-12-05 18:43:51');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(527, 'doctor', 103, '49.172.164.80', '2019-12-05 18:45:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(528, 'doctor', 103, '49.172.164.80', '2019-12-05 18:48:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(529, 'doctor', 103, '49.172.164.80', '2019-12-05 18:49:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(530, 'doctor', 103, '49.172.164.80', '2019-12-05 18:52:35');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(531, 'doctor', 103, '106.102.142.217', '2019-12-05 18:58:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(532, 'doctor', 111, '223.62.202.12', '2019-12-05 19:10:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(533, 'doctor', 103, '49.172.164.80', '2019-12-05 20:14:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(534, 'doctor', 103, '49.172.164.80', '2019-12-05 20:21:15');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(535, 'doctor', 103, '49.172.164.80', '2019-12-05 20:45:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(536, 'doctor', 103, '49.172.164.80', '2019-12-05 22:31:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(537, 'user', 77, '1.236.88.213', '2019-12-06 00:14:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(538, 'user', 77, '1.236.88.213', '2019-12-06 00:15:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(539, 'doctor', 143, '49.172.164.80', '2019-12-06 01:01:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(540, 'doctor', 143, '49.172.164.80', '2019-12-06 01:02:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(541, 'doctor', 143, '49.172.164.80', '2019-12-06 02:45:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(542, 'doctor', 143, '49.172.164.80', '2019-12-06 02:47:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(543, 'doctor', 143, '49.172.164.80', '2019-12-06 02:53:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(544, 'doctor', 143, '49.172.164.80', '2019-12-06 02:57:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(545, 'doctor', 103, '49.172.164.80', '2019-12-06 03:20:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(546, 'doctor', 143, '49.172.164.80', '2019-12-06 03:20:17');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(547, 'user', 78, '223.38.28.228', '2019-12-06 03:45:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(548, 'user', 78, '223.38.28.228', '2019-12-06 03:49:33');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(549, 'user', 78, '223.38.28.228', '2019-12-06 09:40:03');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(550, 'doctor', 111, '223.39.141.48', '2019-12-06 10:14:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(551, 'doctor', 117, '211.36.130.86', '2019-12-06 10:21:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(552, 'doctor', 117, '211.36.130.86', '2019-12-06 10:21:47');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(553, 'doctor', 117, '211.36.130.86', '2019-12-06 10:23:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(554, 'doctor', 117, '211.36.130.86', '2019-12-06 10:23:59');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(555, 'doctor', 103, '14.42.86.31', '2019-12-06 10:24:51');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(556, 'user', 80, '223.39.141.48', '2019-12-06 10:26:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(557, 'doctor', 143, '14.42.86.31', '2019-12-06 10:26:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(558, 'doctor', 117, '211.36.130.86', '2019-12-06 10:26:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(559, 'doctor', 117, '211.36.130.86', '2019-12-06 10:26:59');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(560, 'user', 78, '223.38.28.228', '2019-12-06 10:28:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(561, 'doctor', 117, '211.36.130.86', '2019-12-06 10:31:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(562, 'doctor', 117, '211.36.130.86', '2019-12-06 10:32:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(563, 'doctor', 143, '14.42.86.31', '2019-12-06 10:35:56');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(564, 'doctor', 143, '14.42.86.31', '2019-12-06 10:36:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(565, 'doctor', 143, '14.42.86.31', '2019-12-06 10:36:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(566, 'doctor', 143, '14.42.86.31', '2019-12-06 10:37:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(567, 'doctor', 143, '14.42.86.31', '2019-12-06 10:37:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(568, 'doctor', 147, '14.42.86.31', '2019-12-06 10:38:56');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(569, 'doctor', 147, '14.42.86.31', '2019-12-06 10:39:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(570, 'doctor', 117, '211.36.130.86', '2019-12-06 10:39:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(571, 'doctor', 117, '211.36.130.86', '2019-12-06 10:39:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(572, 'doctor', 143, '14.42.86.31', '2019-12-06 10:39:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(573, 'doctor', 117, '211.36.130.86', '2019-12-06 10:40:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(574, 'doctor', 117, '211.36.130.86', '2019-12-06 10:41:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(575, 'doctor', 143, '14.42.86.31', '2019-12-06 10:44:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(576, 'user', 83, '223.38.28.228', '2019-12-06 10:45:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(577, 'doctor', 143, '14.42.86.31', '2019-12-06 10:46:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(578, 'doctor', 117, '211.36.130.86', '2019-12-06 10:46:47');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(579, 'doctor', 117, '211.36.130.86', '2019-12-06 10:48:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(580, 'doctor', 143, '14.42.86.31', '2019-12-06 10:48:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(581, 'doctor', 117, '211.36.130.86', '2019-12-06 10:48:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(582, 'doctor', 147, '14.42.86.31', '2019-12-06 10:49:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(583, 'user', 83, '223.38.28.228', '2019-12-06 10:51:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(584, 'doctor', 147, '14.42.86.31', '2019-12-06 10:51:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(585, 'user', 84, '223.39.141.48', '2019-12-06 10:55:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(586, 'doctor', 117, '211.36.130.86', '2019-12-06 11:00:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(587, 'user', 83, '223.38.28.228', '2019-12-06 11:01:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(588, 'doctor', 117, '211.36.130.86', '2019-12-06 11:02:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(589, 'user', 84, '223.39.141.48', '2019-12-06 11:03:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(590, 'user', 78, '223.38.28.228', '2019-12-06 11:03:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(591, 'doctor', 117, '211.36.130.86', '2019-12-06 11:04:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(592, 'user', 83, '223.38.28.228', '2019-12-06 11:05:17');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(593, 'doctor', 117, '211.36.130.86', '2019-12-06 11:07:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(594, 'doctor', 117, '211.36.130.86', '2019-12-06 11:09:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(595, 'doctor', 143, '14.42.86.31', '2019-12-06 11:12:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(596, 'doctor', 117, '211.36.130.86', '2019-12-06 11:13:12');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(597, 'doctor', 111, '223.39.141.48', '2019-12-06 11:15:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(598, 'doctor', 117, '211.36.130.86', '2019-12-06 11:17:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(599, 'user', 77, '14.42.86.31', '2019-12-06 11:17:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(600, 'doctor', 143, '14.42.86.31', '2019-12-06 11:20:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(601, 'doctor', 111, '223.39.141.48', '2019-12-06 11:20:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(602, 'user', 84, '223.39.141.48', '2019-12-06 11:21:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(603, 'doctor', 117, '211.36.130.86', '2019-12-06 11:22:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(604, 'doctor', 117, '211.36.130.86', '2019-12-06 11:23:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(605, 'user', 84, '223.39.141.48', '2019-12-06 11:26:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(606, 'doctor', 117, '211.36.130.86', '2019-12-06 11:26:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(607, 'user', 84, '223.39.141.48', '2019-12-06 11:27:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(608, 'user', 83, '223.38.28.228', '2019-12-06 11:32:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(609, 'doctor', 111, '223.39.141.48', '2019-12-06 11:39:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(610, 'doctor', 111, '223.39.141.48', '2019-12-06 11:39:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(611, 'doctor', 111, '223.39.141.48', '2019-12-06 11:40:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(612, 'user', 83, '223.38.28.228', '2019-12-06 11:41:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(613, 'doctor', 111, '223.39.141.48', '2019-12-06 11:59:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(614, 'doctor', 111, '223.39.141.48', '2019-12-06 12:02:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(615, 'doctor', 111, '223.39.141.48', '2019-12-06 12:05:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(616, 'doctor', 117, '211.36.130.86', '2019-12-06 12:10:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(617, 'doctor', 117, '211.36.130.86', '2019-12-06 12:12:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(618, 'doctor', 117, '211.36.130.86', '2019-12-06 12:13:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(619, 'doctor', 117, '211.36.130.86', '2019-12-06 12:19:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(620, 'doctor', 117, '211.36.130.86', '2019-12-06 12:25:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(621, 'doctor', 111, '211.36.130.86', '2019-12-06 12:26:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(622, 'doctor', 111, '211.36.130.86', '2019-12-06 12:26:51');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(623, 'doctor', 111, '211.36.130.86', '2019-12-06 12:26:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(624, 'doctor', 111, '211.36.130.86', '2019-12-06 12:26:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(625, 'user', 84, '223.39.141.48', '2019-12-06 12:27:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(626, 'user', 84, '223.39.141.48', '2019-12-06 12:28:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(627, 'doctor', 111, '223.39.141.48', '2019-12-06 14:06:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(628, 'doctor', 111, '223.39.141.48', '2019-12-06 14:10:33');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(629, 'doctor', 111, '223.39.141.48', '2019-12-06 14:14:56');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(630, 'doctor', 111, '223.39.141.48', '2019-12-06 14:20:51');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(631, 'doctor', 111, '223.39.141.48', '2019-12-06 14:36:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(632, 'doctor', 111, '223.39.141.48', '2019-12-06 14:42:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(633, 'doctor', 111, '223.39.141.48', '2019-12-06 14:43:01');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(634, 'doctor', 111, '223.39.141.48', '2019-12-06 14:44:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(635, 'doctor', 111, '223.39.141.48', '2019-12-06 14:58:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(636, 'user', 84, '223.39.141.48', '2019-12-06 14:58:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(637, 'doctor', 111, '223.39.141.48', '2019-12-06 15:01:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(638, 'doctor', 111, '223.39.141.48', '2019-12-06 15:30:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(639, 'doctor', 147, '1.236.88.213', '2019-12-06 16:42:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(640, 'doctor', 103, '49.172.164.80', '2019-12-06 21:35:03');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(641, 'doctor', 143, '49.172.164.80', '2019-12-06 21:35:21');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(642, 'doctor', 143, '49.172.164.80', '2019-12-06 21:35:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(643, 'doctor', 143, '49.172.164.80', '2019-12-06 22:17:43');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(644, 'doctor', 143, '49.172.164.80', '2019-12-07 02:02:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(645, 'doctor', 111, '223.39.141.48', '2019-12-07 15:58:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(646, 'doctor', 111, '223.39.141.48', '2019-12-07 15:58:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(647, 'doctor', 111, '223.39.141.48', '2019-12-07 15:58:43');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(648, 'doctor', 111, '223.39.141.48', '2019-12-07 15:58:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(649, 'doctor', 111, '223.39.141.48', '2019-12-07 17:02:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(650, 'doctor', 111, '223.39.141.48', '2019-12-07 17:03:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(651, 'doctor', 111, '223.39.141.48', '2019-12-07 17:03:51');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(652, 'doctor', 111, '223.39.141.48', '2019-12-07 17:06:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(653, 'doctor', 111, '223.39.141.48', '2019-12-07 17:06:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(654, 'doctor', 111, '223.39.141.48', '2019-12-07 17:06:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(655, 'doctor', 111, '223.39.141.48', '2019-12-07 17:06:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(656, 'doctor', 111, '223.39.141.48', '2019-12-07 17:07:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(657, 'doctor', 111, '223.39.141.48', '2019-12-07 17:07:01');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(658, 'doctor', 111, '223.39.141.48', '2019-12-07 17:07:01');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(659, 'doctor', 111, '223.39.141.48', '2019-12-07 17:09:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(660, 'doctor', 111, '223.39.141.48', '2019-12-07 17:10:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(661, 'doctor', 111, '223.39.141.48', '2019-12-07 17:13:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(662, 'doctor', 111, '223.39.141.48', '2019-12-07 17:20:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(663, 'doctor', 111, '223.39.141.48', '2019-12-07 19:57:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(664, 'doctor', 111, '223.39.141.48', '2019-12-07 19:57:56');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(665, 'doctor', 111, '223.39.141.48', '2019-12-07 20:00:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(666, 'doctor', 111, '223.39.141.48', '2019-12-07 20:03:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(667, 'doctor', 111, '223.39.141.48', '2019-12-07 20:10:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(668, 'doctor', 111, '223.39.141.48', '2019-12-07 20:10:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(669, 'doctor', 111, '223.39.141.48', '2019-12-07 20:18:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(670, 'doctor', 111, '223.39.141.48', '2019-12-07 20:18:51');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(671, 'doctor', 111, '223.39.141.48', '2019-12-07 20:22:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(672, 'doctor', 111, '223.39.141.48', '2019-12-07 20:22:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(673, 'doctor', 111, '223.39.141.48', '2019-12-07 20:31:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(674, 'doctor', 111, '223.39.141.48', '2019-12-07 20:49:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(675, 'doctor', 111, '223.39.141.48', '2019-12-07 20:54:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(676, 'doctor', 111, '223.39.141.48', '2019-12-07 20:58:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(677, 'doctor', 111, '223.39.141.48', '2019-12-07 20:59:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(678, 'doctor', 111, '223.39.141.48', '2019-12-07 20:59:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(679, 'doctor', 111, '223.39.141.48', '2019-12-07 21:04:03');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(680, 'doctor', 111, '223.39.141.48', '2019-12-07 21:08:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(681, 'doctor', 111, '223.39.141.48', '2019-12-07 21:11:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(682, 'doctor', 111, '223.39.141.48', '2019-12-07 21:15:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(683, 'doctor', 111, '223.39.141.48', '2019-12-07 21:15:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(684, 'doctor', 111, '223.39.141.48', '2019-12-07 21:18:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(685, 'doctor', 111, '223.39.141.48', '2019-12-07 21:23:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(686, 'doctor', 111, '223.39.141.48', '2019-12-07 21:27:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(687, 'doctor', 111, '223.39.141.48', '2019-12-07 21:32:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(688, 'doctor', 111, '223.62.175.116', '2019-12-07 23:07:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(689, 'doctor', 111, '223.62.175.116', '2019-12-07 23:09:17');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(690, 'doctor', 111, '223.62.175.116', '2019-12-07 23:10:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(691, 'doctor', 111, '223.62.175.116', '2019-12-07 23:11:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(692, 'doctor', 111, '223.62.175.116', '2019-12-08 09:57:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(693, 'doctor', 111, '223.62.175.116', '2019-12-08 09:57:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(694, 'doctor', 111, '223.62.175.116', '2019-12-08 09:57:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(695, 'doctor', 111, '223.62.175.116', '2019-12-08 09:57:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(696, 'user', 84, '223.62.175.116', '2019-12-08 09:57:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(697, 'doctor', 111, '223.62.175.116', '2019-12-08 10:07:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(698, 'doctor', 111, '223.62.175.116', '2019-12-08 10:09:08');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(699, 'doctor', 111, '223.62.175.116', '2019-12-08 10:09:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(700, 'doctor', 111, '223.62.175.116', '2019-12-08 10:17:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(701, 'doctor', 111, '223.62.175.116', '2019-12-08 10:17:30');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(702, 'user', 84, '223.62.175.116', '2019-12-08 10:17:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(703, 'doctor', 143, '49.172.164.80', '2019-12-08 14:01:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(704, 'doctor', 103, '49.172.164.80', '2019-12-08 14:07:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(705, 'doctor', 103, '49.172.164.80', '2019-12-08 14:12:59');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(706, 'doctor', 103, '49.172.164.80', '2019-12-08 14:15:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(707, 'doctor', 103, '49.172.164.80', '2019-12-08 14:29:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(708, 'doctor', 103, '49.172.164.80', '2019-12-08 14:52:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(709, 'doctor', 103, '49.172.164.80', '2019-12-08 14:54:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(710, 'doctor', 103, '49.172.164.80', '2019-12-08 14:59:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(711, 'doctor', 111, '223.62.175.116', '2019-12-08 15:10:21');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(712, 'doctor', 111, '223.62.175.116', '2019-12-08 15:14:35');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(713, 'doctor', 111, '223.62.175.116', '2019-12-08 15:16:08');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(714, 'doctor', 111, '223.62.175.116', '2019-12-08 15:18:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(715, 'doctor', 111, '223.62.175.116', '2019-12-08 15:20:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(716, 'doctor', 111, '223.62.175.116', '2019-12-08 15:41:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(717, 'doctor', 103, '49.172.164.80', '2019-12-08 15:46:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(718, 'doctor', 103, '49.172.164.80', '2019-12-08 15:49:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(719, 'doctor', 111, '223.62.175.116', '2019-12-08 15:56:23');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(720, 'doctor', 111, '223.62.175.116', '2019-12-08 16:04:17');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(721, 'doctor', 103, '49.172.164.80', '2019-12-08 16:31:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(722, 'doctor', 111, '223.62.175.116', '2019-12-08 16:47:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(723, 'doctor', 111, '223.62.175.116', '2019-12-08 16:55:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(724, 'doctor', 111, '223.62.175.116', '2019-12-08 16:56:08');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(725, 'user', 84, '223.62.175.116', '2019-12-08 16:56:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(726, 'doctor', 111, '223.62.175.116', '2019-12-08 16:58:17');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(727, 'doctor', 111, '223.62.175.116', '2019-12-08 17:02:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(728, 'doctor', 111, '223.62.175.116', '2019-12-08 17:05:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(729, 'doctor', 111, '223.62.175.116', '2019-12-08 17:06:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(730, 'doctor', 111, '223.62.175.116', '2019-12-08 17:10:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(731, 'doctor', 111, '223.62.175.116', '2019-12-08 17:11:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(732, 'doctor', 111, '223.62.175.116', '2019-12-08 17:29:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(733, 'doctor', 111, '223.62.175.116', '2019-12-08 19:34:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(734, 'doctor', 111, '223.62.175.116', '2019-12-08 19:38:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(735, 'doctor', 111, '223.62.175.116', '2019-12-08 19:39:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(736, 'doctor', 111, '223.62.175.116', '2019-12-08 19:42:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(737, 'doctor', 111, '223.62.175.116', '2019-12-08 19:54:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(738, 'user', 77, '1.236.88.213', '2019-12-08 23:55:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(739, 'doctor', 111, '223.62.162.219', '2019-12-10 00:45:30');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(740, 'user', 84, '223.62.162.219', '2019-12-10 00:45:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(741, 'doctor', 111, '223.38.8.64', '2019-12-10 15:23:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(742, 'doctor', 111, '223.62.162.210', '2019-12-10 22:35:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(743, 'doctor', 111, '223.62.162.210', '2019-12-10 22:36:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(744, 'doctor', 111, '223.62.162.210', '2019-12-10 22:36:23');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(745, 'doctor', 111, '223.62.162.210', '2019-12-10 22:46:59');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(746, 'doctor', 111, '223.62.162.210', '2019-12-10 22:50:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(747, 'doctor', 111, '223.62.162.210', '2019-12-10 22:53:12');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(748, 'doctor', 111, '223.62.162.210', '2019-12-10 22:55:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(749, 'doctor', 111, '223.62.162.210', '2019-12-10 22:59:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(750, 'doctor', 111, '223.62.162.210', '2019-12-10 23:01:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(751, 'doctor', 111, '223.62.162.210', '2019-12-10 23:02:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(752, 'doctor', 111, '223.62.162.210', '2019-12-10 23:03:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(753, 'doctor', 111, '223.62.162.210', '2019-12-10 23:10:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(754, 'doctor', 111, '223.62.162.210', '2019-12-10 23:11:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(755, 'doctor', 111, '223.62.162.210', '2019-12-10 23:12:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(756, 'doctor', 111, '223.62.162.210', '2019-12-10 23:13:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(757, 'doctor', 111, '223.62.162.210', '2019-12-10 23:14:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(758, 'doctor', 111, '223.62.162.210', '2019-12-10 23:15:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(759, 'doctor', 111, '223.62.162.210', '2019-12-10 23:24:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(760, 'doctor', 111, '223.62.162.210', '2019-12-10 23:27:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(761, 'doctor', 111, '223.62.162.210', '2019-12-10 23:28:30');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(762, 'doctor', 111, '223.62.162.210', '2019-12-10 23:48:59');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(763, 'doctor', 111, '223.62.162.210', '2019-12-10 23:56:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(764, 'doctor', 111, '223.62.162.210', '2019-12-10 23:57:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(765, 'doctor', 111, '223.62.162.210', '2019-12-10 23:58:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(766, 'doctor', 111, '223.62.162.210', '2019-12-11 00:01:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(767, 'doctor', 111, '223.62.162.210', '2019-12-11 00:03:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(768, 'doctor', 111, '223.62.162.210', '2019-12-11 00:03:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(769, 'doctor', 111, '223.62.162.210', '2019-12-11 00:04:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(770, 'doctor', 111, '223.62.162.210', '2019-12-11 00:05:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(771, 'doctor', 111, '223.62.162.210', '2019-12-11 00:07:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(772, 'doctor', 111, '223.62.162.210', '2019-12-11 00:08:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(773, 'doctor', 111, '223.62.162.210', '2019-12-11 00:12:47');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(774, 'doctor', 111, '223.62.162.210', '2019-12-11 00:15:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(775, 'doctor', 111, '223.62.162.210', '2019-12-11 00:15:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(776, 'doctor', 111, '223.62.162.210', '2019-12-11 00:15:43');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(777, 'doctor', 111, '223.62.162.210', '2019-12-11 00:31:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(778, 'user', 84, '223.62.162.210', '2019-12-11 00:32:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(779, 'doctor', 111, '223.62.162.210', '2019-12-11 00:39:08');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(780, 'doctor', 111, '223.62.162.210', '2019-12-11 01:24:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(781, 'doctor', 111, '223.62.162.210', '2019-12-11 16:18:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(782, 'user', 83, '223.62.175.155', '2019-12-11 23:45:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(783, 'user', 78, '223.62.175.155', '2019-12-11 23:45:21');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(784, 'user', 78, '223.62.175.155', '2019-12-11 23:48:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(785, 'user', 78, '223.62.175.155', '2019-12-12 00:09:47');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(786, 'user', 78, '223.62.175.155', '2019-12-12 00:11:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(787, 'user', 78, '223.62.175.155', '2019-12-12 00:12:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(788, 'user', 78, '223.62.175.155', '2019-12-12 00:16:30');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(789, 'user', 78, '223.62.175.155', '2019-12-12 00:19:47');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(790, 'user', 78, '223.62.175.155', '2019-12-12 00:22:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(791, 'user', 78, '223.62.175.155', '2019-12-12 00:28:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(792, 'user', 78, '223.62.175.155', '2019-12-12 00:34:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(793, 'user', 78, '223.62.175.155', '2019-12-12 00:35:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(794, 'user', 78, '223.62.175.155', '2019-12-12 00:37:12');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(795, 'user', 78, '223.62.175.155', '2019-12-12 00:42:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(796, 'user', 78, '223.62.175.155', '2019-12-12 00:45:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(797, 'user', 78, '223.62.175.155', '2019-12-12 00:46:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(798, 'user', 78, '223.62.175.155', '2019-12-12 00:47:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(799, 'user', 78, '223.62.175.155', '2019-12-12 00:47:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(800, 'user', 78, '223.62.175.155', '2019-12-12 00:53:30');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(801, 'user', 78, '223.62.175.155', '2019-12-12 00:54:15');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(802, 'user', 78, '223.62.175.155', '2019-12-12 01:00:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(803, 'user', 78, '223.62.175.155', '2019-12-12 01:07:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(804, 'user', 78, '223.62.175.155', '2019-12-12 01:08:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(805, 'user', 78, '223.62.175.155', '2019-12-12 01:12:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(806, 'user', 78, '223.62.175.155', '2019-12-12 01:25:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(807, 'user', 78, '223.62.175.155', '2019-12-12 01:28:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(808, 'user', 78, '223.62.175.155', '2019-12-12 01:32:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(809, 'user', 78, '223.62.175.155', '2019-12-12 01:37:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(810, 'user', 85, '223.62.175.155', '2019-12-12 01:47:03');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(811, 'doctor', 103, '49.172.164.80', '2019-12-12 12:42:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(812, 'doctor', 111, '223.62.202.97', '2019-12-12 13:28:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(813, 'user', 84, '223.62.202.97', '2019-12-12 13:28:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(814, 'user', 85, '223.62.175.155', '2019-12-12 13:33:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(815, 'doctor', 111, '223.62.202.97', '2019-12-12 13:56:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(816, 'doctor', 103, '49.172.164.80', '2019-12-12 14:06:17');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(817, 'doctor', 103, '49.172.164.80', '2019-12-12 14:07:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(818, 'doctor', 103, '49.172.164.80', '2019-12-12 14:09:08');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(819, 'doctor', 103, '49.172.164.80', '2019-12-12 14:25:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(820, 'doctor', 103, '49.172.164.80', '2019-12-12 14:36:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(821, 'doctor', 103, '49.172.164.80', '2019-12-12 18:27:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(822, 'doctor', 103, '49.172.164.80', '2019-12-12 18:29:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(823, 'doctor', 103, '49.172.164.80', '2019-12-12 18:31:17');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(824, 'doctor', 103, '49.172.164.80', '2019-12-12 18:39:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(825, 'doctor', 103, '49.172.164.80', '2019-12-12 18:40:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(826, 'doctor', 103, '49.172.164.80', '2019-12-12 18:42:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(827, 'doctor', 111, '223.62.172.178', '2019-12-12 18:42:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(828, 'doctor', 103, '49.172.164.80', '2019-12-12 18:46:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(829, 'doctor', 103, '49.172.164.80', '2019-12-12 18:48:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(830, 'doctor', 103, '49.172.164.80', '2019-12-12 18:49:21');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(831, 'doctor', 103, '49.172.164.80', '2019-12-12 18:50:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(832, 'doctor', 103, '49.172.164.80', '2019-12-12 18:51:30');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(833, 'doctor', 103, '49.172.164.80', '2019-12-12 18:57:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(834, 'doctor', 103, '49.172.164.80', '2019-12-12 19:07:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(835, 'doctor', 103, '49.172.164.80', '2019-12-12 19:08:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(836, 'doctor', 103, '49.172.164.80', '2019-12-12 19:16:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(837, 'doctor', 103, '49.172.164.80', '2019-12-12 19:21:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(838, 'doctor', 103, '49.172.164.80', '2019-12-12 19:27:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(839, 'doctor', 103, '49.172.164.80', '2019-12-12 19:49:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(840, 'doctor', 103, '49.172.164.80', '2019-12-12 19:54:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(841, 'doctor', 103, '49.172.164.80', '2019-12-12 19:55:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(842, 'doctor', 103, '49.172.164.80', '2019-12-12 20:03:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(843, 'user', 77, '1.236.88.213', '2019-12-12 23:32:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(844, 'user', 77, '1.236.88.213', '2019-12-13 00:00:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(845, 'user', 85, '223.62.175.155', '2019-12-13 00:12:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(846, 'user', 78, '223.62.175.155', '2019-12-13 00:16:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(847, 'user', 78, '223.62.175.155', '2019-12-13 00:17:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(848, 'user', 85, '223.62.175.155', '2019-12-13 00:17:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(849, 'doctor', 147, '1.236.88.213', '2019-12-13 00:18:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(850, 'user', 78, '223.62.175.155', '2019-12-13 00:22:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(851, 'user', 77, '1.236.88.213', '2019-12-13 00:29:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(852, 'user', 78, '223.62.175.155', '2019-12-13 00:36:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(853, 'user', 77, '1.236.88.213', '2019-12-13 00:42:47');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(854, 'user', 77, '1.236.88.213', '2019-12-13 00:43:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(855, 'user', 78, '223.62.175.155', '2019-12-13 00:45:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(856, 'user', 77, '1.236.88.213', '2019-12-13 00:45:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(857, 'user', 78, '223.62.175.155', '2019-12-13 00:51:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(858, 'user', 78, '223.62.175.155', '2019-12-13 00:53:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(859, 'user', 78, '223.62.175.155', '2019-12-13 00:53:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(860, 'user', 78, '223.62.175.155', '2019-12-13 00:55:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(861, 'doctor', 103, '49.172.164.80', '2019-12-13 02:11:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(862, 'doctor', 143, '49.172.164.80', '2019-12-13 02:15:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(863, 'doctor', 143, '49.172.164.80', '2019-12-13 02:16:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(864, 'doctor', 143, '49.172.164.80', '2019-12-13 02:16:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(865, 'doctor', 143, '49.172.164.80', '2019-12-13 02:23:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(866, 'doctor', 143, '49.172.164.80', '2019-12-13 02:27:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(867, 'doctor', 143, '49.172.164.80', '2019-12-13 02:37:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(868, 'doctor', 143, '49.172.164.80', '2019-12-13 03:20:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(869, 'doctor', 143, '49.172.164.80', '2019-12-13 03:21:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(870, 'doctor', 143, '49.172.164.80', '2019-12-13 03:21:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(871, 'doctor', 143, '49.172.164.80', '2019-12-13 03:21:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(872, 'doctor', 103, '49.172.164.80', '2019-12-13 03:27:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(873, 'doctor', 103, '49.172.164.80', '2019-12-13 03:29:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(874, 'doctor', 103, '49.172.164.80', '2019-12-13 03:31:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(875, 'doctor', 103, '49.172.164.80', '2019-12-13 03:32:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(876, 'doctor', 103, '49.172.164.80', '2019-12-13 03:34:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(877, 'doctor', 103, '49.172.164.80', '2019-12-13 03:35:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(878, 'doctor', 103, '49.172.164.80', '2019-12-13 03:37:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(879, 'doctor', 111, '223.62.172.178', '2019-12-13 09:01:35');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(880, 'doctor', 103, '211.55.49.10', '2019-12-13 10:44:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(881, 'user', 78, '223.62.175.155', '2019-12-13 10:45:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(882, 'user', 77, '223.38.22.89', '2019-12-13 10:46:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(883, 'user', 78, '223.62.175.155', '2019-12-13 10:46:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(884, 'doctor', 111, '223.62.172.178', '2019-12-13 10:47:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(885, 'doctor', 103, '211.55.49.10', '2019-12-13 10:47:51');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(886, 'doctor', 103, '211.55.49.10', '2019-12-13 10:48:03');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(887, 'user', 78, '223.38.22.89', '2019-12-13 10:48:59');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(888, 'user', 78, '223.62.175.155', '2019-12-13 10:49:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(889, 'doctor', 103, '211.55.49.10', '2019-12-13 10:50:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(890, 'doctor', 117, '211.36.142.237', '2019-12-13 10:53:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(891, 'user', 78, '223.62.175.183', '2019-12-13 10:53:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(892, 'user', 85, '223.62.175.183', '2019-12-13 10:53:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(893, 'doctor', 117, '211.36.142.237', '2019-12-13 10:58:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(894, 'doctor', 103, '211.55.49.10', '2019-12-13 10:59:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(895, 'doctor', 103, '211.55.49.10', '2019-12-13 11:00:51');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(896, 'doctor', 111, '223.62.172.178', '2019-12-13 11:02:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(897, 'doctor', 103, '211.55.49.10', '2019-12-13 11:09:17');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(898, 'doctor', 103, '223.62.175.155', '2019-12-13 11:10:15');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(899, 'user', 85, '223.62.175.183', '2019-12-13 11:14:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(900, 'doctor', 103, '211.55.49.10', '2019-12-13 11:47:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(901, 'doctor', 111, '223.62.212.214', '2019-12-13 23:11:23');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(902, 'doctor', 103, '49.172.64.107', '2019-12-14 17:43:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(903, 'doctor', 103, '49.172.164.80', '2019-12-15 18:20:12');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(904, 'user', 84, '223.38.22.221', '2019-12-16 18:31:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(905, 'doctor', 111, '223.38.22.221', '2019-12-16 18:34:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(906, 'doctor', 111, '223.38.22.221', '2019-12-16 18:45:15');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(907, 'doctor', 111, '223.38.22.221', '2019-12-16 19:02:51');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(908, 'doctor', 111, '223.38.22.221', '2019-12-16 19:19:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(909, 'doctor', 111, '223.38.22.221', '2019-12-16 19:25:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(910, 'doctor', 111, '223.38.22.221', '2019-12-16 19:26:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(911, 'doctor', 111, '223.38.22.221', '2019-12-16 19:34:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(912, 'doctor', 111, '223.38.22.221', '2019-12-16 19:38:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(913, 'doctor', 111, '223.38.22.221', '2019-12-16 19:41:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(914, 'doctor', 111, '223.38.22.221', '2019-12-16 19:41:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(915, 'doctor', 111, '223.38.22.221', '2019-12-16 19:42:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(916, 'doctor', 111, '223.38.22.221', '2019-12-16 19:46:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(917, 'doctor', 111, '223.38.22.221', '2019-12-16 20:11:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(918, 'doctor', 111, '223.38.22.221', '2019-12-16 20:11:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(919, 'doctor', 111, '223.38.22.221', '2019-12-16 20:11:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(920, 'doctor', 111, '223.38.22.221', '2019-12-16 20:12:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(921, 'doctor', 111, '223.38.22.221', '2019-12-16 20:13:17');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(922, 'doctor', 111, '223.38.22.221', '2019-12-16 20:14:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(923, 'doctor', 111, '223.38.22.221', '2019-12-16 20:14:59');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(924, 'doctor', 111, '223.38.22.221', '2019-12-16 20:15:43');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(925, 'doctor', 111, '223.38.22.221', '2019-12-16 20:16:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(926, 'doctor', 111, '223.38.22.221', '2019-12-16 20:16:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(927, 'doctor', 111, '223.38.22.221', '2019-12-16 20:16:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(928, 'doctor', 111, '223.38.22.221', '2019-12-16 20:16:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(929, 'doctor', 111, '223.38.22.221', '2019-12-16 20:17:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(930, 'doctor', 111, '223.38.22.221', '2019-12-16 20:17:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(931, 'doctor', 111, '223.38.22.221', '2019-12-16 20:18:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(932, 'doctor', 111, '223.38.22.221', '2019-12-16 20:18:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(933, 'doctor', 111, '223.38.22.221', '2019-12-16 20:19:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(934, 'doctor', 111, '223.38.22.221', '2019-12-16 20:22:17');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(935, 'doctor', 111, '223.38.22.221', '2019-12-16 20:25:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(936, 'doctor', 111, '223.38.22.221', '2019-12-16 20:25:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(937, 'doctor', 111, '223.38.22.221', '2019-12-16 20:25:43');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(938, 'doctor', 111, '223.38.22.221', '2019-12-16 20:26:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(939, 'doctor', 111, '223.38.22.221', '2019-12-16 20:26:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(940, 'doctor', 111, '223.38.22.221', '2019-12-16 20:26:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(941, 'doctor', 111, '223.38.22.221', '2019-12-16 20:27:56');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(942, 'doctor', 111, '223.38.22.221', '2019-12-16 20:28:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(943, 'doctor', 111, '223.38.22.221', '2019-12-16 20:29:21');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(944, 'doctor', 111, '223.38.22.221', '2019-12-16 20:29:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(945, 'doctor', 111, '223.38.22.221', '2019-12-16 20:31:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(946, 'doctor', 111, '223.38.22.221', '2019-12-16 20:32:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(947, 'doctor', 111, '223.38.22.221', '2019-12-16 20:34:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(948, 'doctor', 111, '223.38.22.221', '2019-12-16 20:36:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(949, 'doctor', 111, '223.38.22.221', '2019-12-16 20:38:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(950, 'doctor', 111, '223.38.22.221', '2019-12-16 20:53:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(951, 'doctor', 111, '223.38.22.221', '2019-12-16 21:01:23');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(952, 'doctor', 111, '223.38.22.221', '2019-12-16 21:04:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(953, 'doctor', 111, '223.38.22.221', '2019-12-16 21:05:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(954, 'doctor', 111, '223.38.22.221', '2019-12-16 21:10:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(955, 'doctor', 111, '223.38.22.221', '2019-12-16 21:51:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(956, 'doctor', 111, '223.33.164.48', '2019-12-17 16:18:59');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(957, 'doctor', 111, '223.33.164.48', '2019-12-17 16:20:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(958, 'doctor', 111, '223.33.164.48', '2019-12-17 16:20:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(959, 'doctor', 111, '223.33.164.48', '2019-12-17 16:24:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(960, 'doctor', 111, '223.33.164.48', '2019-12-17 16:27:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(961, 'doctor', 111, '223.33.164.48', '2019-12-17 16:27:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(962, 'doctor', 111, '223.33.164.48', '2019-12-17 16:29:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(963, 'doctor', 111, '223.33.164.48', '2019-12-17 16:32:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(964, 'doctor', 111, '223.33.164.48', '2019-12-17 16:33:33');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(965, 'doctor', 111, '223.33.164.48', '2019-12-17 16:34:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(966, 'doctor', 111, '223.33.164.48', '2019-12-17 16:34:56');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(967, 'doctor', 111, '223.33.164.48', '2019-12-17 16:43:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(968, 'doctor', 111, '223.33.164.48', '2019-12-17 16:48:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(969, 'doctor', 111, '223.33.164.48', '2019-12-17 16:48:23');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(970, 'doctor', 111, '223.33.164.48', '2019-12-17 16:50:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(971, 'doctor', 111, '223.33.164.48', '2019-12-17 16:59:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(972, 'doctor', 103, '49.172.164.80', '2019-12-17 17:10:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(973, 'doctor', 103, '49.172.164.80', '2019-12-17 17:13:33');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(974, 'doctor', 111, '223.33.164.48', '2019-12-17 17:18:43');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(975, 'doctor', 111, '223.33.164.48', '2019-12-17 17:20:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(976, 'doctor', 111, '223.33.164.48', '2019-12-17 17:24:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(977, 'doctor', 111, '223.33.164.48', '2019-12-17 17:33:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(978, 'doctor', 103, '49.172.164.80', '2019-12-17 17:43:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(979, 'user', 84, '223.33.164.48', '2019-12-17 17:46:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(980, 'doctor', 111, '223.33.164.48', '2019-12-17 17:47:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(981, 'doctor', 111, '223.33.164.48', '2019-12-17 17:51:33');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(982, 'doctor', 111, '223.33.164.48', '2019-12-17 18:08:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(983, 'doctor', 111, '223.33.164.48', '2019-12-17 18:11:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(984, 'doctor', 111, '223.33.164.48', '2019-12-17 18:14:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(985, 'doctor', 111, '223.33.164.48', '2019-12-17 18:15:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(986, 'doctor', 111, '223.33.164.48', '2019-12-17 18:21:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(987, 'doctor', 111, '223.33.164.48', '2019-12-17 18:25:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(988, 'doctor', 111, '223.33.164.48', '2019-12-17 18:27:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(989, 'doctor', 103, '49.172.164.80', '2019-12-17 18:30:12');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(990, 'doctor', 111, '223.33.164.48', '2019-12-17 18:32:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(991, 'doctor', 111, '223.33.164.48', '2019-12-17 18:34:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(992, 'doctor', 111, '223.33.164.48', '2019-12-17 18:35:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(993, 'doctor', 111, '223.33.164.48', '2019-12-17 18:36:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(994, 'doctor', 111, '112.152.7.132', '2019-12-17 20:29:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(995, 'doctor', 111, '112.152.7.132', '2019-12-17 20:30:33');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(996, 'user', 78, '223.62.203.78', '2019-12-17 20:38:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(997, 'user', 78, '223.62.203.78', '2019-12-17 21:08:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(998, 'user', 78, '223.62.203.78', '2019-12-17 21:10:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(999, 'user', 86, '112.152.195.218', '2019-12-17 22:02:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1000, 'user', 86, '112.152.195.218', '2019-12-17 22:16:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1001, 'user', 86, '112.152.195.218', '2019-12-17 22:20:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1002, 'doctor', 111, '112.152.7.132', '2019-12-17 22:32:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1003, 'doctor', 111, '112.152.7.132', '2019-12-17 22:36:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1004, 'doctor', 111, '112.152.7.132', '2019-12-17 22:50:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1005, 'doctor', 111, '112.152.7.132', '2019-12-17 23:04:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1006, 'user', 78, '223.62.203.78', '2019-12-17 23:06:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1007, 'doctor', 111, '112.152.7.132', '2019-12-17 23:07:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1008, 'user', 78, '223.62.203.78', '2019-12-17 23:18:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1009, 'doctor', 111, '112.152.7.132', '2019-12-17 23:18:56');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1010, 'user', 78, '223.62.203.78', '2019-12-17 23:30:21');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1011, 'doctor', 111, '112.152.7.132', '2019-12-17 23:44:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1012, 'doctor', 111, '112.152.7.132', '2019-12-18 00:12:01');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1013, 'doctor', 111, '112.152.7.132', '2019-12-18 00:13:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1014, 'doctor', 111, '112.152.7.132', '2019-12-18 00:15:17');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1015, 'doctor', 111, '112.152.7.132', '2019-12-18 00:17:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1016, 'doctor', 111, '112.152.7.132', '2019-12-18 00:19:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1017, 'doctor', 111, '112.152.7.132', '2019-12-18 00:23:23');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1018, 'doctor', 103, '49.172.164.80', '2019-12-18 00:33:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1019, 'doctor', 103, '49.172.164.80', '2019-12-18 00:42:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1020, 'doctor', 103, '49.172.164.80', '2019-12-18 00:44:35');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1021, 'doctor', 103, '49.172.164.80', '2019-12-18 00:48:08');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1022, 'doctor', 103, '49.172.164.80', '2019-12-18 00:49:35');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1023, 'doctor', 103, '49.172.164.80', '2019-12-18 00:51:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1024, 'doctor', 103, '49.172.164.80', '2019-12-18 00:52:30');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1025, 'doctor', 103, '49.172.164.80', '2019-12-18 00:55:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1026, 'doctor', 103, '49.172.164.80', '2019-12-18 00:57:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1027, 'doctor', 103, '49.172.164.80', '2019-12-18 00:59:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1028, 'doctor', 103, '49.172.164.80', '2019-12-18 01:01:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1029, 'doctor', 103, '49.172.164.80', '2019-12-18 01:04:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1030, 'doctor', 103, '49.172.164.80', '2019-12-18 01:08:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1031, 'doctor', 103, '49.172.164.80', '2019-12-18 01:10:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1032, 'doctor', 111, '112.152.7.132', '2019-12-18 01:12:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1033, 'doctor', 111, '112.152.7.132', '2019-12-18 01:18:01');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1034, 'doctor', 111, '112.152.7.132', '2019-12-18 01:22:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1035, 'doctor', 111, '112.152.7.132', '2019-12-18 01:26:30');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1036, 'doctor', 111, '112.152.7.132', '2019-12-18 01:30:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1037, 'doctor', 111, '112.152.7.132', '2019-12-18 01:31:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1038, 'doctor', 111, '112.152.7.132', '2019-12-18 01:31:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1039, 'doctor', 103, '49.172.164.80', '2019-12-18 01:35:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1040, 'doctor', 103, '49.172.164.80', '2019-12-18 01:37:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1041, 'doctor', 111, '112.152.7.132', '2019-12-18 01:37:35');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1042, 'doctor', 103, '49.172.164.80', '2019-12-18 01:38:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1043, 'doctor', 111, '112.152.7.132', '2019-12-18 01:51:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1044, 'doctor', 111, '112.152.7.132', '2019-12-18 01:52:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1045, 'doctor', 111, '112.152.7.132', '2019-12-18 01:54:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1046, 'doctor', 111, '112.152.7.132', '2019-12-18 02:06:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1047, 'doctor', 111, '112.152.7.132', '2019-12-18 02:27:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1048, 'doctor', 111, '112.152.7.132', '2019-12-18 02:30:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1049, 'doctor', 111, '112.152.7.132', '2019-12-18 02:36:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1050, 'doctor', 111, '112.152.7.132', '2019-12-18 02:36:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1051, 'doctor', 111, '112.152.7.132', '2019-12-18 02:39:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1052, 'doctor', 111, '112.152.7.132', '2019-12-18 03:11:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1053, 'doctor', 111, '112.152.7.132', '2019-12-18 03:25:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1054, 'doctor', 111, '112.152.7.132', '2019-12-18 03:30:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1055, 'doctor', 111, '112.152.7.132', '2019-12-18 03:34:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1056, 'doctor', 111, '112.152.7.132', '2019-12-18 03:35:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1057, 'doctor', 111, '112.152.7.132', '2019-12-18 03:36:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1058, 'doctor', 111, '112.152.7.132', '2019-12-18 03:37:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1059, 'doctor', 111, '112.152.7.132', '2019-12-18 03:38:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1060, 'doctor', 111, '112.152.7.132', '2019-12-18 03:40:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1061, 'user', 84, '112.152.7.132', '2019-12-18 03:56:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1063, 'user', 78, '223.62.203.78', '2019-12-18 13:19:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1064, 'user', 84, '112.152.7.132', '2019-12-18 13:27:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1066, 'doctor', 111, '112.152.7.132', '2019-12-18 13:28:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1067, 'user', 86, '112.152.195.218', '2019-12-18 13:40:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1068, 'doctor', 111, '112.152.7.132', '2019-12-18 13:47:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1069, 'user', 78, '223.62.203.78', '2019-12-18 14:05:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1070, 'doctor', 111, '112.152.7.132', '2019-12-18 14:12:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1071, 'doctor', 111, '112.152.7.132', '2019-12-18 14:22:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1072, 'doctor', 111, '112.152.7.132', '2019-12-18 14:37:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1073, 'doctor', 111, '112.152.7.132', '2019-12-18 14:37:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1074, 'doctor', 111, '112.152.7.132', '2019-12-18 14:40:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1075, 'doctor', 111, '112.152.7.132', '2019-12-18 14:43:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1076, 'doctor', 111, '112.152.7.132', '2019-12-18 14:45:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1077, 'doctor', 111, '112.152.7.132', '2019-12-18 15:03:03');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1078, 'doctor', 111, '112.152.7.132', '2019-12-18 18:35:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1079, 'doctor', 111, '112.152.7.132', '2019-12-18 18:36:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1080, 'doctor', 111, '112.152.7.132', '2019-12-18 18:40:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1081, 'doctor', 111, '112.152.7.132', '2019-12-18 18:45:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1082, 'doctor', 111, '112.152.7.132', '2019-12-18 18:46:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1083, 'doctor', 111, '112.152.7.132', '2019-12-18 18:53:33');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1084, 'doctor', 111, '112.152.7.132', '2019-12-18 19:53:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1085, 'doctor', 111, '112.152.7.132', '2019-12-18 19:54:12');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1086, 'doctor', 111, '112.152.7.132', '2019-12-18 19:56:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1087, 'doctor', 111, '112.152.7.132', '2019-12-18 19:56:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1088, 'doctor', 111, '112.152.7.132', '2019-12-18 20:10:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1089, 'doctor', 111, '112.152.7.132', '2019-12-18 20:10:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1090, 'doctor', 111, '112.152.7.132', '2019-12-18 20:13:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1091, 'doctor', 111, '112.152.7.132', '2019-12-18 20:18:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1092, 'doctor', 111, '112.152.7.132', '2019-12-18 20:19:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1093, 'doctor', 111, '112.152.7.132', '2019-12-18 20:24:33');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1094, 'doctor', 111, '112.152.7.132', '2019-12-18 20:25:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1095, 'doctor', 111, '112.152.7.132', '2019-12-18 20:26:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1096, 'doctor', 111, '112.152.7.132', '2019-12-18 20:29:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1097, 'doctor', 111, '223.38.17.67', '2019-12-19 16:57:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1098, 'doctor', 111, '223.38.17.67', '2019-12-19 18:42:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1099, 'doctor', 103, '223.38.17.67', '2019-12-19 19:15:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1100, 'doctor', 103, '223.38.17.67', '2019-12-19 19:15:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1101, 'doctor', 103, '223.38.17.67', '2019-12-19 19:15:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1102, 'doctor', 103, '223.38.17.67', '2019-12-19 19:16:21');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1103, 'user', 84, '223.38.17.67', '2019-12-19 20:20:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1104, 'doctor', 111, '223.38.17.67', '2019-12-19 20:20:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1105, 'doctor', 111, '223.38.17.67', '2019-12-19 20:48:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1106, 'doctor', 111, '223.38.17.67', '2019-12-19 21:11:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1107, 'doctor', 111, '223.38.17.67', '2019-12-19 21:13:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1108, 'doctor', 111, '223.38.17.67', '2019-12-19 21:15:59');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1109, 'doctor', 111, '223.38.17.67', '2019-12-19 21:16:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1110, 'doctor', 111, '223.38.17.67', '2019-12-19 21:23:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1111, 'doctor', 111, '223.38.17.67', '2019-12-19 21:23:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1112, 'doctor', 111, '223.38.17.67', '2019-12-19 21:41:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1113, 'doctor', 111, '223.38.17.67', '2019-12-20 17:03:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1114, 'doctor', 111, '223.38.24.179', '2019-12-21 00:58:51');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1115, 'doctor', 111, '223.38.24.179', '2019-12-21 19:04:03');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1116, 'user', 84, '223.38.24.179', '2019-12-21 19:04:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1127, 'doctor', 143, '182.161.150.5', '2019-12-22 01:32:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1128, 'doctor', 143, '182.161.150.5', '2019-12-22 01:32:23');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1141, 'doctor', 111, '223.62.173.169', '2019-12-25 02:11:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1142, 'doctor', 111, '223.62.173.169', '2019-12-25 02:13:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1143, 'doctor', 111, '223.62.173.169', '2019-12-25 02:17:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1144, 'doctor', 111, '223.62.173.169', '2019-12-25 02:19:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1145, 'doctor', 111, '223.62.173.169', '2019-12-25 02:19:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1146, 'doctor', 111, '223.62.173.169', '2019-12-25 02:19:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1147, 'doctor', 111, '223.62.173.169', '2019-12-25 02:26:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1148, 'doctor', 111, '223.62.173.169', '2019-12-25 02:28:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1149, 'doctor', 111, '223.62.173.169', '2019-12-25 02:29:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1150, 'doctor', 111, '223.62.173.169', '2019-12-25 02:33:03');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1151, 'doctor', 111, '223.62.173.169', '2019-12-25 02:34:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1152, 'doctor', 111, '223.62.173.169', '2019-12-25 02:35:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1153, 'doctor', 111, '223.62.173.169', '2019-12-25 02:37:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1154, 'doctor', 111, '223.62.173.169', '2019-12-25 02:38:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1155, 'doctor', 111, '223.62.173.169', '2019-12-25 02:40:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1156, 'doctor', 111, '223.62.173.169', '2019-12-25 02:42:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1157, 'doctor', 111, '223.62.173.169', '2019-12-25 02:47:30');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1158, 'doctor', 111, '223.62.173.169', '2019-12-25 02:48:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1159, 'doctor', 111, '223.62.173.169', '2019-12-25 02:52:01');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1160, 'doctor', 111, '223.62.173.169', '2019-12-25 02:53:51');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1161, 'doctor', 111, '223.62.173.169', '2019-12-25 02:59:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1162, 'user', 84, '223.62.173.169', '2019-12-25 03:00:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1163, 'doctor', 111, '223.62.173.169', '2019-12-25 03:16:33');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1164, 'doctor', 111, '223.62.173.169', '2019-12-25 03:18:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1165, 'doctor', 111, '223.62.173.169', '2019-12-25 03:19:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1166, 'doctor', 111, '223.62.173.169', '2019-12-25 14:57:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1167, 'doctor', 103, '182.161.137.252', '2019-12-25 16:56:30');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1168, 'doctor', 103, '182.161.137.252', '2019-12-25 16:57:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1169, 'doctor', 103, '182.161.137.252', '2019-12-25 17:00:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1170, 'doctor', 103, '182.161.137.252', '2019-12-25 17:03:30');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1171, 'doctor', 170, '182.161.137.252', '2019-12-26 01:42:23');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1172, 'doctor', 170, '182.161.137.252', '2019-12-26 01:44:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1173, 'doctor', 170, '182.161.137.252', '2019-12-26 01:46:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1174, 'doctor', 170, '182.161.137.252', '2019-12-26 01:49:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1175, 'doctor', 111, '112.152.7.132', '2019-12-26 18:51:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1176, 'doctor', 111, '112.152.7.132', '2019-12-26 18:57:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1177, 'doctor', 170, '182.161.137.252', '2019-12-27 15:01:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1178, 'doctor', 170, '182.161.137.252', '2019-12-27 15:54:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1179, 'doctor', 103, '182.161.137.252', '2019-12-27 15:55:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1180, 'doctor', 103, '49.172.64.107', '2019-12-28 17:52:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1181, 'doctor', 103, '49.172.64.107', '2019-12-28 17:52:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1182, 'doctor', 103, '49.172.64.107', '2019-12-28 17:52:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1183, 'doctor', 111, '223.62.219.86', '2019-12-29 00:09:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1184, 'user', 78, '223.62.203.209', '2019-12-29 07:23:56');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1185, 'doctor', 103, '49.172.64.107', '2019-12-29 12:53:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1186, 'doctor', 143, '49.172.64.107', '2019-12-29 13:19:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1187, 'doctor', 103, '49.172.64.107', '2019-12-29 13:19:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1188, 'doctor', 103, '49.172.64.107', '2019-12-29 13:19:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1189, 'doctor', 103, '49.172.64.107', '2019-12-29 14:21:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1190, 'doctor', 170, '49.172.64.107', '2019-12-29 15:00:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1191, 'user', 84, '223.62.219.86', '2019-12-29 15:11:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1192, 'doctor', 143, '49.172.64.107', '2019-12-29 15:11:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1193, 'doctor', 143, '49.172.64.107', '2019-12-29 15:13:56');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1194, 'doctor', 143, '49.172.64.107', '2019-12-29 16:30:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1195, 'doctor', 143, '49.172.64.107', '2019-12-29 16:52:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1196, 'doctor', 103, '49.172.64.107', '2019-12-29 16:56:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1197, 'doctor', 143, '49.172.64.107', '2019-12-29 16:56:56');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1198, 'doctor', 111, '223.62.219.86', '2019-12-29 17:11:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1199, 'doctor', 143, '49.172.64.107', '2019-12-29 18:52:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1200, 'doctor', 143, '49.172.64.107', '2019-12-29 18:57:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1201, 'user', 78, '223.62.203.209', '2019-12-29 23:10:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1202, 'user', 78, '223.62.203.209', '2019-12-29 23:24:59');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1203, 'user', 78, '223.62.203.209', '2019-12-29 23:51:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1204, 'user', 78, '223.62.203.209', '2019-12-29 23:52:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1205, 'user', 78, '223.62.203.209', '2019-12-29 23:52:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1206, 'doctor', 143, '49.172.64.107', '2020-01-02 12:24:16');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1207, 'doctor', 143, '49.172.64.107', '2020-01-02 12:24:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1208, 'doctor', 143, '49.172.64.107', '2020-01-02 12:25:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1209, 'doctor', 143, '49.172.64.107', '2020-01-02 12:53:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1210, 'doctor', 143, '49.172.64.107', '2020-01-02 13:02:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1211, 'doctor', 143, '49.172.64.107', '2020-01-02 13:02:46');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1212, 'doctor', 103, '49.172.64.107', '2020-01-02 13:02:59');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1213, 'doctor', 111, '112.152.7.132', '2020-01-02 13:54:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1214, 'doctor', 103, '49.172.64.107', '2020-01-02 13:56:56');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1215, 'doctor', 103, '49.172.64.107', '2020-01-02 14:34:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1216, 'user', 78, '223.62.216.236', '2020-01-02 17:20:53');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1217, 'user', 78, '223.62.216.236', '2020-01-02 18:49:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1218, 'user', 78, '223.62.216.236', '2020-01-02 19:10:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1219, 'user', 78, '223.62.216.236', '2020-01-02 19:47:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1220, 'user', 78, '223.62.216.236', '2020-01-02 19:48:21');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1221, 'user', 85, '223.62.216.236', '2020-01-02 19:48:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1222, 'user', 85, '223.62.216.236', '2020-01-02 19:48:59');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1223, 'user', 85, '223.62.216.236', '2020-01-02 19:51:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1224, 'user', 78, '223.62.216.236', '2020-01-02 19:51:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1225, 'user', 78, '223.62.216.236', '2020-01-02 19:56:08');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1226, 'user', 78, '223.62.216.236', '2020-01-02 19:56:51');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1227, 'doctor', 171, '220.88.68.40', '2020-01-02 20:02:25');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1228, 'doctor', 171, '220.88.68.40', '2020-01-02 20:03:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1229, 'user', 78, '223.62.216.236', '2020-01-02 20:04:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1230, 'user', 78, '223.62.216.236', '2020-01-02 20:06:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1231, 'user', 78, '223.62.216.236', '2020-01-02 20:10:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1232, 'doctor', 171, '220.88.68.40', '2020-01-02 20:35:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1233, 'user', 78, '223.62.216.236', '2020-01-02 20:37:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1234, 'doctor', 171, '220.88.68.40', '2020-01-02 20:39:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1235, 'user', 78, '223.62.216.236', '2020-01-02 20:39:33');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1236, 'user', 85, '223.62.216.236', '2020-01-02 20:40:14');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1237, 'doctor', 171, '220.88.68.40', '2020-01-02 20:43:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1238, 'user', 85, '223.62.216.236', '2020-01-02 21:15:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1239, 'user', 85, '223.62.216.236', '2020-01-02 21:16:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1240, 'user', 85, '223.62.216.236', '2020-01-02 21:18:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1241, 'user', 85, '223.62.216.236', '2020-01-02 21:19:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1242, 'user', 85, '223.62.216.236', '2020-01-02 21:47:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1243, 'doctor', 172, '223.62.175.57', '2020-01-02 21:50:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1244, 'doctor', 172, '223.62.175.57', '2020-01-02 22:28:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1245, 'doctor', 172, '223.62.175.57', '2020-01-02 22:29:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1246, 'doctor', 172, '223.62.175.57', '2020-01-02 22:30:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1247, 'doctor', 171, '223.62.175.57', '2020-01-02 22:31:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1248, 'doctor', 171, '223.62.175.57', '2020-01-02 22:31:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1249, 'user', 84, '223.62.175.57', '2020-01-02 22:32:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1250, 'doctor', 171, '223.62.175.57', '2020-01-03 10:25:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1251, 'user', 77, '1.236.88.213', '2020-01-05 22:36:33');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1252, 'user', 77, '1.236.88.213', '2020-01-05 23:05:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1253, 'user', 77, '1.236.88.213', '2020-01-05 23:10:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1254, 'user', 77, '1.236.88.213', '2020-01-05 23:11:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1255, 'user', 77, '1.236.88.213', '2020-01-05 23:17:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1256, 'user', 77, '1.236.88.213', '2020-01-06 00:16:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1257, 'user', 77, '211.55.49.10', '2020-01-06 16:45:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1258, 'doctor', 103, '49.172.64.107', '2020-01-06 17:11:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1259, 'doctor', 171, '112.152.7.132', '2020-01-06 17:27:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1260, 'user', 77, '211.55.49.10', '2020-01-07 10:13:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1261, 'user', 77, '211.55.49.10', '2020-01-07 11:58:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1262, 'user', 85, '223.62.169.8', '2020-01-07 14:34:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1263, 'user', 85, '223.62.169.8', '2020-01-07 15:20:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1264, 'user', 85, '223.62.169.8', '2020-01-07 18:17:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1265, 'user', 85, '223.62.169.8', '2020-01-07 19:30:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1266, 'doctor', 103, '49.172.64.107', '2020-01-07 19:37:43');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1267, 'doctor', 143, '49.172.64.107', '2020-01-07 19:40:12');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1268, 'doctor', 170, '49.172.64.107', '2020-01-07 19:49:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1269, 'doctor', 170, '49.172.64.107', '2020-01-07 19:49:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1270, 'doctor', 170, '49.172.64.107', '2020-01-07 19:49:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1271, 'doctor', 103, '49.172.64.107', '2020-01-07 19:51:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1272, 'doctor', 171, '112.152.7.132', '2020-01-07 20:53:12');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1273, 'user', 84, '112.152.7.132', '2020-01-07 20:54:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1274, 'doctor', 171, '112.152.7.132', '2020-01-07 21:08:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1275, 'doctor', 171, '112.152.7.132', '2020-01-07 21:23:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1276, 'doctor', 103, '49.172.64.107', '2020-01-08 13:55:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1277, 'doctor', 103, '49.172.64.107', '2020-01-08 14:10:02');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1278, 'user', 85, '223.62.169.8', '2020-01-08 14:10:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1279, 'doctor', 103, '49.172.64.107', '2020-01-08 14:14:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1280, 'user', 85, '223.62.169.8', '2020-01-08 14:45:01');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1281, 'user', 85, '223.62.169.8', '2020-01-08 14:49:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1282, 'user', 85, '223.62.169.8', '2020-01-08 14:50:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1283, 'user', 85, '223.62.169.8', '2020-01-08 14:50:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1284, 'user', 85, '223.62.169.8', '2020-01-08 14:51:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1285, 'user', 85, '223.62.169.8', '2020-01-08 14:51:40');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1286, 'user', 85, '223.62.169.8', '2020-01-08 14:52:26');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1287, 'doctor', 171, '112.152.7.132', '2020-01-08 15:50:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1288, 'user', 84, '112.152.7.132', '2020-01-08 15:51:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1289, 'user', 85, '223.62.169.8', '2020-01-08 16:02:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1290, 'user', 85, '223.62.169.8', '2020-01-08 16:04:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1291, 'user', 85, '223.62.169.8', '2020-01-08 16:12:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1292, 'user', 85, '223.62.169.8', '2020-01-08 16:13:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1293, 'user', 85, '223.62.169.8', '2020-01-08 16:33:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1294, 'doctor', 103, '106.102.142.247', '2020-01-08 16:34:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1295, 'user', 85, '223.62.169.8', '2020-01-08 16:37:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1296, 'user', 85, '223.62.169.8', '2020-01-08 16:38:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1297, 'user', 77, '211.55.49.10', '2020-01-09 11:31:01');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1298, 'user', 77, '211.55.49.10', '2020-01-09 12:12:06');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1299, 'user', 77, '211.55.49.10', '2020-01-09 12:26:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1300, 'user', 77, '211.55.49.10', '2020-01-09 12:29:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1301, 'user', 77, '223.62.8.203', '2020-01-09 13:27:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1302, 'user', 85, '223.33.184.92', '2020-01-09 14:34:07');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1303, 'user', 85, '223.33.184.92', '2020-01-09 14:40:35');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1304, 'doctor', 171, '112.152.7.132', '2020-01-09 15:03:30');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1305, 'user', 85, '223.33.184.92', '2020-01-09 15:12:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1306, 'user', 85, '223.33.184.92', '2020-01-09 15:46:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1307, 'doctor', 103, '49.174.174.48', '2020-01-09 16:14:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1308, 'doctor', 103, '49.174.174.48', '2020-01-09 16:18:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1309, 'user', 84, '112.152.7.132', '2020-01-09 16:21:23');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1310, 'user', 85, '223.33.184.92', '2020-01-09 16:30:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1311, 'user', 85, '223.33.184.92', '2020-01-09 16:31:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1312, 'user', 77, '211.55.49.10', '2020-01-09 16:33:32');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1313, 'user', 85, '223.33.184.92', '2020-01-09 16:36:54');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1314, 'user', 77, '211.55.49.10', '2020-01-09 16:37:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1315, 'user', 77, '211.55.49.10', '2020-01-09 16:38:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1316, 'user', 77, '211.55.49.10', '2020-01-09 16:39:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1317, 'user', 85, '223.33.184.92', '2020-01-09 16:41:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1318, 'user', 77, '211.55.49.10', '2020-01-09 16:42:09');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1319, 'user', 77, '211.55.49.10', '2020-01-09 16:44:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1320, 'user', 77, '211.55.49.10', '2020-01-09 16:55:57');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1321, 'user', 77, '211.55.49.10', '2020-01-09 16:58:10');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1322, 'user', 85, '223.33.184.92', '2020-01-09 17:01:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1323, 'user', 77, '211.55.49.10', '2020-01-09 17:03:01');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1324, 'doctor', 103, '106.102.142.161', '2020-01-09 17:04:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1325, 'user', 77, '211.55.49.10', '2020-01-09 17:12:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1326, 'doctor', 171, '112.152.7.132', '2020-01-09 17:34:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1327, 'user', 85, '223.33.184.92', '2020-01-09 17:36:45');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1328, 'user', 77, '211.55.49.10', '2020-01-09 18:47:19');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1329, 'user', 77, '211.55.49.10', '2020-01-09 19:17:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1330, 'doctor', 171, '223.38.30.169', '2020-01-09 19:26:52');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1331, 'user', 78, '223.33.184.92', '2020-01-09 19:27:24');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1332, 'user', 78, '223.33.184.92', '2020-01-09 19:27:38');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1333, 'user', 85, '223.33.184.92', '2020-01-09 19:28:00');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1334, 'user', 85, '223.33.184.92', '2020-01-09 19:35:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1335, 'doctor', 171, '223.38.30.169', '2020-01-09 19:45:27');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1336, 'user', 85, '223.33.184.92', '2020-01-09 19:48:42');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1337, 'doctor', 171, '223.38.30.169', '2020-01-09 19:53:13');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1338, 'user', 85, '223.33.184.92', '2020-01-09 19:55:44');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1339, 'user', 85, '223.33.184.92', '2020-01-09 20:07:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1340, 'user', 85, '223.33.184.92', '2020-01-09 20:13:33');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1341, 'user', 85, '223.33.184.92', '2020-01-09 20:16:55');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1342, 'user', 85, '14.42.37.155', '2020-01-09 20:20:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1343, 'doctor', 171, '223.38.29.31', '2020-01-09 20:32:15');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1344, 'doctor', 171, '223.38.29.31', '2020-01-09 20:37:37');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1345, 'doctor', 171, '223.38.29.31', '2020-01-09 20:39:11');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1346, 'doctor', 171, '223.38.29.31', '2020-01-09 20:42:20');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1347, 'doctor', 171, '223.38.29.31', '2020-01-09 20:46:36');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1348, 'user', 85, '14.42.37.155', '2020-01-09 20:49:12');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1349, 'doctor', 171, '223.38.29.31', '2020-01-09 20:51:34');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1350, 'doctor', 171, '223.38.29.31', '2020-01-09 20:56:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1351, 'user', 77, '223.62.175.8', '2020-01-09 21:08:28');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1352, 'user', 85, '14.42.37.155', '2020-01-09 21:15:12');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1353, 'user', 85, '14.42.37.155', '2020-01-09 21:41:39');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1354, 'user', 85, '14.42.37.155', '2020-01-09 22:02:22');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1355, 'user', 85, '14.42.37.155', '2020-01-09 22:12:58');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1356, 'user', 85, '14.42.37.155', '2020-01-09 22:13:21');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1357, 'user', 77, '223.62.175.8', '2020-01-09 22:39:17');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1358, 'user', 77, '223.62.169.175', '2020-01-10 01:05:29');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1359, 'user', 85, '1.224.150.62', '2020-01-10 01:16:05');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1360, 'user', 78, '1.224.150.62', '2020-01-10 01:28:18');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1361, 'user', 78, '1.224.150.62', '2020-01-10 01:28:31');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1362, 'user', 77, '223.33.164.85', '2020-01-10 13:53:50');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1363, 'user', 78, '223.62.22.232', '2020-01-22 22:12:15');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1364, 'user', 78, '223.62.22.232', '2020-01-22 22:12:17');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1365, 'user', 78, '223.33.165.7', '2020-01-23 21:25:48');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1366, 'user', 78, '223.62.203.215', '2020-01-26 13:49:08');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1367, 'user', 78, '223.62.203.215', '2020-01-26 13:52:41');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1368, 'user', 77, '211.55.49.10', '2020-02-26 14:03:49');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1369, 'user', 62, '211.55.49.10', '2020-02-26 14:04:04');
INSERT INTO `login_log` (`id`, `id_type`, `login_id`, `ip_address`, `created_at`) VALUES
	(1370, 'user', 77, '211.55.49.10', '2020-02-26 14:04:12');
/*!40000 ALTER TABLE `login_log` ENABLE KEYS */;

-- 테이블 MerDog.passbook_account 구조 내보내기
CREATE TABLE IF NOT EXISTS `passbook_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '무통장 계좌 인덱스 번호',
  `bank_name` varchar(50) NOT NULL COMMENT '은행명',
  `bank_number` varchar(50) NOT NULL COMMENT '계좌번호',
  `bank_depo` varchar(50) NOT NULL COMMENT '예금주',
  `on/off` varchar(10) NOT NULL DEFAULT 'off' COMMENT '등록/미등록 여부',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록날짜시간',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='무통장 계좌';

-- 테이블 데이터 MerDog.passbook_account:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `passbook_account` DISABLE KEYS */;
INSERT INTO `passbook_account` (`id`, `bank_name`, `bank_number`, `bank_depo`, `on/off`, `created_at`) VALUES
	(1, '신한', '110417188220', '공지환', 'off', '2019-11-21 18:02:06');
INSERT INTO `passbook_account` (`id`, `bank_name`, `bank_number`, `bank_depo`, `on/off`, `created_at`) VALUES
	(2, '국민', '123456789', '기모링', 'off', '2019-11-21 18:09:57');
INSERT INTO `passbook_account` (`id`, `bank_name`, `bank_number`, `bank_depo`, `on/off`, `created_at`) VALUES
	(3, '우리', '987654321', '이잉', 'on', '2019-11-21 18:32:51');
/*!40000 ALTER TABLE `passbook_account` ENABLE KEYS */;

-- 테이블 MerDog.payment_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `payment_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '결제내역 인덱스 번호',
  `user_id` int(11) NOT NULL COMMENT '고객회원 번호',
  `product_id` int(11) NOT NULL COMMENT '상품 번호',
  `state` varchar(50) NOT NULL DEFAULT 'fail' COMMENT '결제 상태 -> 완료:complete / 환불:refund / 대기 : wait /실패: fail',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_payment_list_product` (`product_id`),
  KEY `FK_payment_list_user_info` (`user_id`),
  CONSTRAINT `FK_payment_list_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_payment_list_user_info` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='결제 내역';

-- 테이블 데이터 MerDog.payment_list:~101 rows (대략적) 내보내기
/*!40000 ALTER TABLE `payment_list` DISABLE KEYS */;
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(1, 62, 1, 'complete', '2019-11-24 18:17:07');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(2, 62, 1, 'refund', '2019-11-26 22:42:15');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(3, 62, 1, 'fail', '2019-11-24 18:21:36');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(4, 62, 1, 'complete', '2019-11-26 13:26:55');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(5, 62, 1, 'complete', '2019-11-26 13:26:56');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(6, 62, 1, 'complete', '2019-11-26 22:26:58');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(7, 62, 1, 'complete', '2019-11-24 18:17:41');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(8, 62, 1, 'complete', '2019-11-24 18:17:40');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(9, 62, 1, 'complete', '2019-11-24 18:17:40');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(10, 62, 1, 'complete', '2019-11-24 18:17:35');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(11, 62, 1, 'complete', '2019-11-24 18:17:34');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(12, 78, 7, 'complete', '2019-11-24 18:17:26');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(13, 78, 7, 'complete', '2019-11-26 13:26:56');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(14, 78, 1, 'complete', '2019-11-26 13:26:57');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(15, 78, 1, 'complete', '2019-11-28 14:37:08');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(16, 78, 1, 'complete', '2019-11-28 14:37:11');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(17, 78, 1, 'complete', '2019-11-28 14:37:13');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(18, 78, 5, 'complete', '2019-11-28 14:37:22');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(19, 78, 6, 'complete', '2019-11-28 14:38:42');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(20, 78, 1, 'complete', '2019-11-28 15:41:27');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(21, 78, 1, 'complete', '2019-11-28 15:41:36');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(22, 78, 5, 'complete', '2019-11-28 15:41:43');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(23, 78, 8, 'complete', '2019-11-28 15:41:51');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(24, 78, 5, 'complete', '2019-11-28 17:11:45');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(25, 78, 5, 'complete', '2019-11-28 17:11:51');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(26, 78, 5, 'complete', '2019-11-28 17:11:53');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(27, 78, 6, 'complete', '2019-11-28 17:11:56');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(33, 78, 1, 'complete', '2019-11-28 17:29:22');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(34, 78, 1, 'complete', '2019-11-28 17:36:26');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(35, 78, 1, 'complete', '2019-11-28 17:36:30');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(36, 78, 1, 'complete', '2019-11-28 17:36:33');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(37, 78, 5, 'complete', '2019-11-28 17:37:04');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(38, 78, 5, 'complete', '2019-11-28 17:37:06');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(39, 78, 1, 'complete', '2019-11-28 17:37:09');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(40, 78, 1, 'complete', '2019-11-28 17:37:10');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(41, 78, 1, 'complete', '2019-11-28 17:37:11');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(42, 78, 1, 'complete', '2019-11-28 17:37:11');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(43, 78, 1, 'complete', '2019-11-28 17:37:11');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(44, 78, 1, 'complete', '2019-11-28 17:37:11');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(45, 78, 1, 'complete', '2019-11-28 17:37:11');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(46, 78, 1, 'complete', '2019-11-28 17:37:12');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(47, 78, 1, 'complete', '2019-11-28 17:37:13');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(48, 78, 6, 'complete', '2019-11-28 18:21:52');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(49, 78, 6, 'complete', '2019-11-28 18:22:18');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(50, 78, 5, 'complete', '2019-11-29 10:18:27');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(51, 78, 7, 'complete', '2019-12-02 16:12:22');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(52, 78, 6, 'complete', '2019-12-02 16:33:53');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(53, 78, 6, 'complete', '2019-12-03 14:22:44');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(54, 77, 7, 'complete', '2019-12-03 14:33:27');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(55, 77, 8, 'complete', '2019-12-03 14:33:31');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(56, 77, 7, 'complete', '2019-12-03 14:33:37');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(57, 77, 1, 'refund', '2020-01-02 19:51:29');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(58, 78, 5, 'complete', '2019-12-04 13:06:41');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(59, 78, 5, 'complete', '2019-12-05 18:29:36');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(60, 78, 1, 'complete', '2019-12-05 18:29:40');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(61, 83, 7, 'complete', '2019-12-06 10:49:40');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(62, 83, 7, 'complete', '2019-12-06 10:49:49');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(63, 83, 7, 'complete', '2019-12-06 10:49:59');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(64, 83, 8, 'complete', '2019-12-06 10:50:20');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(65, 83, 8, 'complete', '2019-12-06 10:50:35');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(66, 83, 8, 'complete', '2019-12-06 10:50:37');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(67, 83, 5, 'complete', '2019-12-06 10:56:28');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(68, 83, 1, 'complete', '2019-12-06 10:56:30');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(69, 84, 1, 'complete', '2019-12-06 11:00:57');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(70, 83, 8, 'complete', '2019-12-06 11:02:27');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(71, 83, 8, 'complete', '2019-12-06 11:02:29');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(72, 83, 8, 'complete', '2019-12-06 11:02:30');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(73, 83, 8, 'complete', '2019-12-06 11:02:32');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(74, 83, 8, 'complete', '2019-12-06 11:02:34');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(75, 83, 1, 'complete', '2019-12-06 11:07:16');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(76, 83, 7, 'complete', '2019-12-06 11:07:22');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(77, 83, 1, 'complete', '2019-12-06 11:21:46');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(78, 77, 7, 'complete', '2019-12-06 11:22:35');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(79, 84, 7, 'complete', '2019-12-06 11:22:45');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(80, 84, 7, 'complete', '2019-12-06 11:22:48');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(81, 84, 6, 'complete', '2019-12-06 11:22:50');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(82, 84, 7, 'complete', '2019-12-06 11:22:50');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(83, 84, 7, 'complete', '2019-12-06 11:22:51');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(84, 84, 7, 'complete', '2019-12-06 11:22:52');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(85, 84, 7, 'complete', '2019-12-06 11:22:53');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(86, 84, 7, 'complete', '2019-12-06 11:22:54');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(87, 77, 9, 'complete', '2019-12-06 11:32:27');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(88, 83, 5, 'complete', '2019-12-08 10:56:55');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(89, 85, 11, 'refund', '2019-12-18 00:09:44');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(90, 84, 1, 'complete', '2019-12-12 13:29:19');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(91, 84, 9, 'complete', '2019-12-18 13:36:10');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(92, 86, 1, 'complete', '2019-12-18 13:40:25');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(93, 86, 1, 'complete', '2019-12-18 13:40:29');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(94, 86, 1, 'complete', '2019-12-18 13:43:48');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(95, 78, 9, 'complete', '2019-12-29 23:40:26');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(96, 78, 9, 'complete', '2019-12-29 23:55:29');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(97, 85, 11, 'complete', '2020-01-02 20:45:49');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(98, 85, 11, 'complete', '2020-01-02 23:53:25');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(99, 85, 12, 'complete', '2020-01-07 18:11:23');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(100, 85, 12, 'complete', '2020-01-08 16:33:22');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(101, 85, 12, 'complete', '2020-01-09 15:40:31');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(102, 85, 12, 'complete', '2020-01-09 16:29:58');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(103, 85, 12, 'complete', '2020-01-09 17:37:36');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(104, 85, 12, 'complete', '2020-01-09 19:53:58');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(105, 85, 1, 'complete', '2020-01-09 20:19:18');
INSERT INTO `payment_list` (`id`, `user_id`, `product_id`, `state`, `created_at`) VALUES
	(106, 78, 1, 'complete', '2020-01-26 13:49:25');
/*!40000 ALTER TABLE `payment_list` ENABLE KEYS */;

-- 테이블 MerDog.pet_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `pet_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '애완동물 번호',
  `user_id` int(11) NOT NULL COMMENT '사용자 번호',
  `pet_name` varchar(50) NOT NULL COMMENT '애완동물 이름',
  `pet_main_type` varchar(50) NOT NULL COMMENT '펫 종류 (ex. 강아지 고양이)',
  `pet_sub_type` varchar(50) NOT NULL COMMENT '펫 종류에 대한 종류 (ex. 포메라니안 말티즈 )',
  `pet_age` int(11) NOT NULL COMMENT '펫 나이',
  `pet_gender` varchar(50) NOT NULL COMMENT '펫 성별 (남, 여, 중성화 남, 중성화 여)',
  `pet_birth` varchar(50) NOT NULL COMMENT '펫 생년월일',
  `pet_img` varchar(100) DEFAULT NULL COMMENT '펫 이미지 이름',
  `pet_notice` varchar(50) DEFAULT NULL COMMENT '펫 특이사항',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `on/off` varchar(10) NOT NULL DEFAULT 'on' COMMENT '활성화 여부 on/off',
  PRIMARY KEY (`id`),
  KEY `FK_pet_user_info` (`user_id`),
  CONSTRAINT `FK_pet_user_info` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='애완동물 정보';

-- 테이블 데이터 MerDog.pet_info:~97 rows (대략적) 내보내기
/*!40000 ALTER TABLE `pet_info` DISABLE KEYS */;
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(34, 78, '고양시', '고양이', '짬타이거', 26, '암컷', '19940915', 'http://ccit2019.cafe24.com/storage/img/pet/(44)1574216166695.jpg', '졸려워요', '2019-11-26 18:13:03', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(35, 77, '뜗뜗뜗뜗뜗뜗뜗뜗', '강아지', '마르티즈', 2, '중성화수컷', '20190707', 'http://ccit2019.cafe24.com/storage/img/pet/20191123_150905.jpg', 'null', '2019-11-26 18:13:20', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(36, 78, '펫정규식테스트', '강아지', '마르티즈', 26, '중성화암컷', '19940915', NULL, NULL, '2019-11-26 21:07:39', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(37, 78, '펫', '강아지', '마르티즈', 9, '수컷', '19990931', NULL, '테스트', '2019-11-26 22:58:57', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(38, 78, '백죵환', '고양이', '짬타이거', 26, '암컷', '19990914', 'http://ccit2019.cafe24.com/storage/img/pet/JPEG_20191126_230042064_.jpg', '테스트', '2019-11-26 23:00:42', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(39, 80, '드소', '강아지', '마르티즈', 5, '수컷', '1995', 'http://ccit2019.cafe24.com/storage/img/pet/1570764214994.jpg', NULL, '2019-11-26 23:32:23', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(40, 80, '드소', '강아지', '마르티즈', 5, '수컷', '1995', 'http://ccit2019.cafe24.com/storage/img/pet/(93)1570764214994.jpg', NULL, '2019-11-26 23:32:24', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(41, 77, '뚜비', '강아지', '포메라니안', 18, '암컷', '19990909', 'http://ccit2019.cafe24.com/storage/img/pet/IMG_20190716_134237854.jpg', '네', '2019-12-01 20:40:35', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(42, 77, '나나', '강아지', '마르티즈', 19, '중성화수컷', '20000101', 'http://ccit2019.cafe24.com/storage/img/pet/Screenshot_20191130-114617_KakaoTalk.jpg', NULL, '2019-12-02 16:44:09', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(43, 77, '뽀', '토끼', '헬로키티', 19, '암컷', '20000220', NULL, 'null', '2019-12-02 16:44:32', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(44, 77, '나나', '고슴도치', '알비노 고슴도치', 8, '중성화수컷', '20000909', NULL, NULL, '2019-12-02 16:44:54', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(45, 77, '보라돌이', '고양이', '스코티시 폴드', 9, '암컷', '20000101', NULL, NULL, '2019-12-02 16:46:49', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(46, 77, '뚜치', '강아지', '믹스견', 3, '중성화수컷', '20100909', NULL, NULL, '2019-12-02 16:47:06', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(47, 77, '뿌꾸', '고슴도치', '플라타나 고슴도치', 6, '중성화수컷', '20101130', NULL, NULL, '2019-12-02 16:47:53', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(48, 78, '고양시', '고양이', '짬타이거', 0, '암컷', '20190315', 'http://ccit2019.cafe24.com/storage/img/pet/ㅇ.jpg', '추가정보', '2019-12-03 13:53:32', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(49, 78, '펫', '강아지', '마르티즈', 9, '중성화암컷', '20101203', NULL, '등록', '2019-12-03 14:39:46', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(50, 78, '펫', '고양이', '짬타이거', 0, '수컷', '20190315', 'http://ccit2019.cafe24.com/storage/img/pet/downloadfile-18.jpg', '23', '2019-12-03 19:30:31', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(51, 78, '고양이사진', '고양이', '짬타이거', 4, '암컷', '20151203', 'http://ccit2019.cafe24.com/storage/img/pet/20191113_143156.jpg', '사진', '2019-12-03 20:20:11', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(52, 78, '고화질', '고슴도치', '모름', 4, '중성화수컷', '20150323', 'http://ccit2019.cafe24.com/storage/img/pet/e9f4cb3052d33bc7670ba1bc4447b0cb.jpg', '정보', '2019-12-03 20:29:57', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(53, 78, '데이트피커테스트', '강아지', '마르티즈', 4, '수컷', '20150803', 'http://ccit2019.cafe24.com/storage/img/pet/20191203_210742.jpg', 'null', '2019-12-03 20:53:49', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(54, 78, '펫로딩', '햄스터', '햄토리', 1, '중성화암컷', '20181205', 'http://ccit2019.cafe24.com/storage/img/pet/20191206_091449.jpg', 'null', '2019-12-05 17:12:24', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(55, 83, '아이폰a', '토끼', '헬로키티', 69, '수컷', '19501206', 'http://ccit2019.cafe24.com/storage/img/pet/JPEG_20191206_105319336_.jpg', '귀여움', '2019-12-06 10:53:30', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(56, 83, '아이폰b', '강아지', '마르티즈', 5, '중성화암컷', '20141206', 'http://ccit2019.cafe24.com/storage/img/pet/JPEG_20191206_105524234_.jpg', '기여엄', '2019-12-06 10:55:35', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(57, 84, '시바견시바', '고슴도치', '모름', 0, '중성화암컷', '', 'http://ccit2019.cafe24.com/storage/img/pet/JPEG_20191206_105730253_.jpg', '빠끄', '2019-12-06 10:57:37', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(58, 84, '지', '고슴도치', '모름', 3, '수컷', '20161206', NULL, 'ㅣㄷ', '2019-12-06 11:24:35', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(59, 84, '^^', '강아지', '마르티즈', 40, '암컷', '19791206', NULL, 'ㄴ', '2019-12-06 11:29:06', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(60, 83, 'bb', '강아지', '코몬도르', 0, '중성화암컷', '20191110', NULL, NULL, '2019-12-06 11:42:44', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(61, 83, 't', '강아지', '마르티즈', 0, '수컷', '20191205', NULL, NULL, '2019-12-06 11:42:59', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(62, 77, '넵', '강아지', '마르티즈', 2, '중성화수컷', '20170206', 'http://ccit2019.cafe24.com/storage/img/pet/JPEG_20191206_120345900_.jpg', NULL, '2019-12-06 12:03:56', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(63, 77, '이거', '강아지', '도베르만', 0, '암컷', '20191006', 'http://ccit2019.cafe24.com/storage/img/pet/JPEG_20191206_120629307_.jpg', NULL, '2019-12-06 12:06:39', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(64, 84, '개새끼', '강아지', '마르티즈', 3, '중성화수컷', '20161206', 'http://ccit2019.cafe24.com/storage/img/pet/beauty_20191206121409.jpg', '디ㅣ지싲', '2019-12-06 12:14:50', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(65, 84, '드즈즉', '강아지', '마르티즈', 2, '중성화수컷', '20171008', 'http://ccit2019.cafe24.com/storage/img/pet/20191129_224352.jpg', '하이', '2019-12-08 17:00:12', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(66, 84, '드즈즉', '강아지', '마르티즈', 2, '중성화수컷', '20171008', 'http://ccit2019.cafe24.com/storage/img/pet/(60)20191129_224352.jpg', '하이', '2019-12-08 17:00:30', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(67, 84, '드즈즉', '강아지', '마르티즈', 2, '중성화수컷', '20171008', 'http://ccit2019.cafe24.com/storage/img/pet/(30)20191129_224352.jpg', '하이', '2019-12-08 17:00:48', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(68, 84, '드즈즉', '강아지', '마르티즈', 2, '중성화수컷', '20171008', 'http://ccit2019.cafe24.com/storage/img/pet/(87)20191129_224352.jpg', '하이', '2019-12-08 17:01:02', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(69, 78, '펫이름^^', '강아지', '마르티즈', 1, '암컷', '20181211', NULL, NULL, '2019-12-11 23:54:28', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(70, 78, '정규식', '강아지', '마르티즈', 2, '중성화암컷', '20171212', NULL, NULL, '2019-12-12 00:47:56', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(71, 78, '펫', '강아지', '마르티즈', 1, '암컷', '20181212', 'http://ccit2019.cafe24.com/storage/img/pet/JPEG_20191212_013926638_.jpg', NULL, '2019-12-12 01:39:41', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(72, 85, '혁기', '고슴도치', '실버 챠콜 고슴도치', 1, '중성화암컷', '20181212', 'http://ccit2019.cafe24.com/storage/img/pet/JPEG_20191212_014737365_.jpg', NULL, '2019-12-12 01:47:52', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(73, 85, '이용권', '강아지', '마르티즈', 1, '중성화수컷', '20181213', 'http://ccit2019.cafe24.com/storage/img/pet/2019-12-09-12-43-14-924.jpg', 'ㅇㅇ', '2019-12-13 00:19:05', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(74, 78, 'ㅇ', '강아지', '마르티즈', 2, '암컷', '20171213', 'http://ccit2019.cafe24.com/storage/img/pet/20191206_091448.jpg', NULL, '2019-12-13 01:00:34', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(75, 78, 'ㅇㅇ', '강아지', '마르티즈', 4, '수컷', '20151217', NULL, NULL, '2019-12-17 21:09:26', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(76, 78, 'ㅇㅇㅇ', '강아지', '마르티즈', 1, '암컷', '20181217', NULL, NULL, '2019-12-17 21:11:15', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(77, 86, '이잉기모링', '고슴도치', '모름', 24, '중성화수컷', '19951029', 'http://ccit2019.cafe24.com/storage/img/pet/1576588526539.jpg', NULL, '2019-12-17 22:03:42', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(78, 78, 'ㄹㄹ', '강아지', '마르티즈', 0, '중성화암컷', '20190917', 'http://ccit2019.cafe24.com/storage/img/pet/(82)2019-12-17-21-34-37-841_original.jpg', NULL, '2019-12-17 22:25:34', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(79, 78, 'ㄹㄹ', '강아지', '마르티즈', 0, '중성화암컷', '20190917', 'http://ccit2019.cafe24.com/storage/img/pet/(84)2019-12-17-21-34-37-841_original.jpg', NULL, '2019-12-17 22:25:53', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(80, 78, 'ㄹㄹ', '강아지', '마르티즈', 1, '중성화암컷', '20180917', 'http://ccit2019.cafe24.com/storage/img/pet/2019-12-17-21-34-37-887.jpg', NULL, '2019-12-17 22:26:44', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(81, 78, 'ㄹㄹ', '강아지', '마르티즈', 1, '중성화암컷', '20180917', 'http://ccit2019.cafe24.com/storage/img/pet/(66)2019-12-17-21-34-37-841_original.jpg', NULL, '2019-12-17 22:27:01', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(86, 78, '머야', '고양이', '짬타이거', 4, '중성화수컷', '20151217', 'http://ccit2019.cafe24.com/storage/img/pet/Screenshot_20191217-225125.jpg', NULL, '2019-12-17 22:53:22', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(87, 78, '등록할게유', '강아지', '마르티즈', 4, '암컷', '20151217', 'http://ccit2019.cafe24.com/storage/img/pet/(35)2019-12-17-21-34-37-841_original.jpg', NULL, '2019-12-17 23:07:49', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(88, 78, '등록할게유', '강아지', '마르티즈', 4, '암컷', '20151217', 'http://ccit2019.cafe24.com/storage/img/pet/(25)2019-12-17-21-34-37-841_original.jpg', NULL, '2019-12-17 23:08:22', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(89, 78, '등록할게유', '강아지', '마르티즈', 4, '암컷', '20151217', 'http://ccit2019.cafe24.com/storage/img/pet/(26)2019-12-17-21-34-37-887.jpg', NULL, '2019-12-17 23:09:10', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(90, 78, '등록할게유', '강아지', '마르티즈', 4, '암컷', '20151217', 'http://ccit2019.cafe24.com/storage/img/pet/(80)2019-12-17-21-34-37-887.jpg', NULL, '2019-12-17 23:09:22', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(91, 78, '머임', '강아지', '마르티즈', 4, '암컷', '20151217', 'http://ccit2019.cafe24.com/storage/img/pet/Screenshot_20191205-163838.jpg', NULL, '2019-12-17 23:10:08', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(92, 78, '머야', '강아지', '마르티즈', 5, '암컷', '20141217', 'http://ccit2019.cafe24.com/storage/img/pet/JPEG_20191217_231036126_.jpg', NULL, '2019-12-17 23:10:53', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(93, 78, '되나', '강아지', '마르티즈', 4, '암컷', '20151217', 'http://ccit2019.cafe24.com/storage/img/pet/(84)20191206_091449.jpg', NULL, '2019-12-17 23:11:49', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(94, 78, '되나', '강아지', '마르티즈', 4, '수컷', '20151217', 'http://ccit2019.cafe24.com/storage/img/pet/JPEG_20191217_232045173_.jpg', NULL, '2019-12-17 23:12:10', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(95, 78, '고용량', '강아지', '마르티즈', 3, '중성화암컷', '20161217', 'http://ccit2019.cafe24.com/storage/img/pet/(93)2019-12-09-12-43-14-924.jpg', NULL, '2019-12-17 23:26:29', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(96, 78, '고용량', '강아지', '마르티즈', 3, '중성화암컷', '20161217', 'http://ccit2019.cafe24.com/storage/img/pet/(7)2019-12-09-12-43-14-924.jpg', NULL, '2019-12-17 23:26:42', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(97, 78, '다시', '강아지', '마르티즈', 2, '중성화수컷', '20171217', 'http://ccit2019.cafe24.com/storage/img/pet/20191214_145956.jpg', NULL, '2019-12-17 23:31:09', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(98, 78, '콩이', '강아지', '마르티즈', 8, '암컷', '20111229', 'http://ccit2019.cafe24.com/storage/img/pet/20191219_192506.jpg', '백내장이있어요!', '2019-12-29 23:22:24', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(99, 78, '콩이', '강아지', '마르티즈', 10, '암컷', '20091229', 'http://ccit2019.cafe24.com/storage/img/pet/20191219_191826.jpg', '건강해요!', '2019-12-29 23:31:36', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(100, 78, '콩이', '강아지', '닥스훈트', 6, '중성화암컷', '20131229', 'http://ccit2019.cafe24.com/storage/img/pet/1576755911724.jpg', '건강해요!', '2019-12-29 23:33:06', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(101, 78, '몽이', '강아지', '마르티즈', 5, '암컷', '20141229', 'http://ccit2019.cafe24.com/storage/img/pet/20191219_191945.jpg', '건강해요!', '2019-12-29 23:59:21', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(102, 85, '몽이', '강아지', '마르티즈', 4, '암컷', '20160102', 'http://ccit2019.cafe24.com/storage/img/pet/20191219_191822.jpg', '심장사상충 예방주사 1년전에 주사', '2020-01-02 20:42:02', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(103, 85, '콩이', '강아지', '마르티즈', 3, '암컷', '20170102', 'http://ccit2019.cafe24.com/storage/img/pet/20191219_191918.jpg', '아파요', '2020-01-02 20:44:27', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(104, 85, '뽀삐', '강아지', '마르티즈', 3, '수컷', '20170102', 'http://ccit2019.cafe24.com/storage/img/pet/(13)20191219_192506.jpg', '선천적 탈골', '2020-01-02 23:55:06', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(105, 77, '나비', '고양이', '래그돌', 0, '암컷', '20200101', 'http://ccit2019.cafe24.com/storage/img/pet/(36)downloadfile.jpg', NULL, '2020-01-07 10:15:10', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(106, 85, '삐삐', '강아지', '마르티즈', 9, '중성화암컷', '20110109', 'http://ccit2019.cafe24.com/storage/img/pet/(73)20191206_091449.jpg', '건강해요', '2020-01-09 15:08:52', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(107, 85, '쿠키', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/2019-09-27-14-22-54_original.jpg', '건강해요', '2020-01-09 16:25:33', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(108, 85, '코코', '강아지', '마르티즈', 6, '중성화암컷', '20140109', 'http://ccit2019.cafe24.com/storage/img/pet/20191220_121611.jpg', '건강해요', '2020-01-09 16:28:58', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(109, 85, '콩몽', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/(14)1576755911724.jpg', '건강해요', '2020-01-09 16:33:00', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(110, 85, '누누', '강아지', '마르티즈', 9, '중성화암컷', '20110109', 'http://ccit2019.cafe24.com/storage/img/pet/20191206_091420.jpg', '귀에 염증이 있어요', '2020-01-09 16:41:31', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(111, 85, '몽이', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/1576755992570.jpg', '귀에 염증', '2020-01-09 19:30:26', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(112, 85, '몽이', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/(76)1576755992570.jpg', '귀에 염증', '2020-01-09 19:30:52', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(113, 85, '몽', '강아지', '마르티즈', 3, '중성화암컷', '20170109', 'http://ccit2019.cafe24.com/storage/img/pet/20191219_191707.jpg', '소화불량', '2020-01-09 19:33:11', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(114, 85, '몽', '강아지', '마르티즈', 3, '중성화암컷', '20170109', 'http://ccit2019.cafe24.com/storage/img/pet/(3)20191219_191707.jpg', '소화불량', '2020-01-09 19:33:38', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(115, 85, '몽이', '강아지', '마르티즈', 2, '중성화암컷', '20180109', 'http://ccit2019.cafe24.com/storage/img/pet/Screenshot_20200109-193316_Gallery.jpg', '귀에 염증', '2020-01-09 19:34:36', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(116, 85, '몽이', '강아지', '마르티즈', 2, '중성화암컷', '20180109', 'http://ccit2019.cafe24.com/storage/img/pet/(67)Screenshot_20200109-193316_Gallery.jpg', '귀에 염증', '2020-01-09 19:34:40', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(117, 85, '몽이', '강아지', '마르티즈', 2, '중성화암컷', '20180109', 'http://ccit2019.cafe24.com/storage/img/pet/(94)Screenshot_20200109-193316_Gallery.jpg', '귀에 염증', '2020-01-09 19:35:25', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(118, 85, '몽이', '강아지', '마르티즈', 2, '중성화암컷', '20180109', 'http://ccit2019.cafe24.com/storage/img/pet/(20)Screenshot_20200109-193316_Gallery.jpg', '귀에 염증', '2020-01-09 19:35:26', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(119, 85, '몽', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/(60)Screenshot_20200109-193316_Gallery.jpg', NULL, '2020-01-09 19:51:09', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(120, 85, '몽', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/(23)Screenshot_20200109-193316_Gallery.jpg', NULL, '2020-01-09 19:51:12', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(121, 85, '몽이', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/(47)Screenshot_20200109-193316_Gallery.jpg', NULL, '2020-01-09 19:52:04', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(122, 85, '몽이', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/(40)Screenshot_20200109-193316_Gallery.jpg', NULL, '2020-01-09 19:52:08', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(123, 85, '몽이', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/(27)Screenshot_20200109-193316_Gallery.jpg', NULL, '2020-01-09 19:52:39', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(124, 85, '몽이', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/JPEG_20200109_195615793_.jpg', NULL, '2020-01-09 19:56:56', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(125, 85, '뽕이', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/(99)Screenshot_20200109-193316_Gallery.jpg', '귀에 염증', '2020-01-09 20:01:35', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(126, 85, '뽕이', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/(58)Screenshot_20200109-193316_Gallery.jpg', '귀에 염증', '2020-01-09 20:01:39', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(127, 85, '뽕이', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/20191219_192337.jpg', '귀에 염증', '2020-01-09 20:03:17', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(128, 85, '뽕이', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/(70)20191219_192337.jpg', '귀에 염증', '2020-01-09 20:04:01', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(129, 85, '뿡뽕', '강아지', '마르티즈', 3, '중성화암컷', '20170109', 'http://ccit2019.cafe24.com/storage/img/pet/(85)Screenshot_20200109-193316_Gallery.jpg', '귀에 염증', '2020-01-09 20:09:25', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(130, 85, '뿡뽕', '강아지', '마르티즈', 3, '중성화암컷', '20170109', 'http://ccit2019.cafe24.com/storage/img/pet/(35)Screenshot_20200109-193316_Gallery.jpg', '귀에 염증', '2020-01-09 20:09:28', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(131, 85, '뿡뽕', '강아지', '마르티즈', 3, '중성화암컷', '20170109', 'http://ccit2019.cafe24.com/storage/img/pet/(66)Screenshot_20200109-193316_Gallery.jpg', '귀에 염증', '2020-01-09 20:11:24', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(132, 85, '뿡뽕', '강아지', '마르티즈', 3, '중성화암컷', '20170109', 'http://ccit2019.cafe24.com/storage/img/pet/(79)Screenshot_20200109-193316_Gallery.jpg', '귀에 염증', '2020-01-09 20:11:26', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(133, 85, '빵이', '강아지', '마르티즈', 4, '중성화암컷', '20160109', NULL, '귀에염증', '2020-01-09 20:14:11', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(134, 85, '뻥이', '강아지', '마르티즈', 3, '중성화암컷', '20170109', 'http://ccit2019.cafe24.com/storage/img/pet/1576755913125.jpg', NULL, '2020-01-09 20:15:43', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(135, 85, '뻥이', '강아지', '마르티즈', 3, '중성화암컷', '20170109', 'http://ccit2019.cafe24.com/storage/img/pet/(42)1576755913125.jpg', NULL, '2020-01-09 20:16:09', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(136, 85, '엘사', '강아지', '마르티즈', 3, '중성화암컷', '20170109', 'http://ccit2019.cafe24.com/storage/img/pet/20191219_191625.jpg', NULL, '2020-01-09 20:17:56', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(137, 85, '테스트', '강아지', '마르티즈', 3, '중성화암컷', '20170109', 'http://ccit2019.cafe24.com/storage/img/pet/1577789447049.jpg', '테스트', '2020-01-09 20:24:30', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(138, 85, '토토로', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/(41)20191219_191625.jpg', '건강해요', '2020-01-09 20:26:54', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(139, 85, '안나', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/(65)20191206_091449.jpg', '귀에염증', '2020-01-09 20:27:25', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(140, 85, '올라프', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/(87)20190820_135811_1.gif', '멍청', '2020-01-09 20:27:57', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(141, 85, '크리스토퍼', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/(52)20191220_121611.jpg', '눈에염증', '2020-01-09 20:28:50', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(142, 85, '엘싸', '강아지', '마르티즈', 13, '중성화암컷', '20070109', 'http://ccit2019.cafe24.com/storage/img/pet/(90)20191219_192506.jpg', '잠이많음', '2020-01-09 20:29:54', 'off');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(143, 85, '한스', '강아지', '마르티즈', 5, '중성화암컷', '20150109', 'http://ccit2019.cafe24.com/storage/img/pet/20191206_091430.jpg', NULL, '2020-01-09 21:14:44', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(144, 85, '아구몬', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/2019-09-27-14-21-41.jpg', NULL, '2020-01-09 21:41:25', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(145, 85, '피카츄', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/(98)Screenshot_20200109-193316_Gallery.jpg', NULL, '2020-01-09 22:05:51', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(146, 85, '뽀삐', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/(68)20191219_192337.jpg', NULL, '2020-01-09 22:08:53', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(147, 85, '또이', '강아지', '마르티즈', 4, '중성화암컷', '20160109', 'http://ccit2019.cafe24.com/storage/img/pet/(98)20191219_191625.jpg', 'ㅇㅇ', '2020-01-09 22:15:23', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(148, 77, '뚜비', '강아지', '마르티즈', 0, '중성화수컷', '20200107', NULL, NULL, '2020-01-09 22:39:45', 'on');
INSERT INTO `pet_info` (`id`, `user_id`, `pet_name`, `pet_main_type`, `pet_sub_type`, `pet_age`, `pet_gender`, `pet_birth`, `pet_img`, `pet_notice`, `created_at`, `on/off`) VALUES
	(149, 78, 'ㅇㅇ', '고양이', '짬타이거', 4, '중성화암컷', '20160124', 'http://ccit2019.cafe24.com/storage/img/pet/Screenshot_20200125-021943_KakaoTalk.jpg', 'ㄹㄹ', '2020-01-26 13:50:11', 'on');
/*!40000 ALTER TABLE `pet_info` ENABLE KEYS */;

-- 테이블 MerDog.product 구조 내보내기
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '상품 인덱스 번호',
  `name` varchar(50) NOT NULL COMMENT '상품 이름',
  `ticket` int(11) NOT NULL COMMENT '이용권 갯수',
  `price` int(11) NOT NULL COMMENT '상품 가격',
  `product_code` varchar(50) NOT NULL COMMENT '구글 스토어 상품 코드',
  `img` text NOT NULL COMMENT '상품 이미지',
  `on/off` varchar(50) NOT NULL DEFAULT 'off' COMMENT '활성화여부 on/off',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상품 테이블';

-- 테이블 데이터 MerDog.product:~10 rows (대략적) 내보내기
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `name`, `ticket`, `price`, `product_code`, `img`, `on/off`, `created_at`) VALUES
	(1, '기본상품', 200, 5000, 'asfas', 'box-outline-filled.png', 'on', '2019-11-13 11:11:08');
INSERT INTO `product` (`id`, `name`, `ticket`, `price`, `product_code`, `img`, `on/off`, `created_at`) VALUES
	(5, '기모링', 123, 4321, 'asf', '(73)box-outline-filled.png', 'off', '2019-11-13 17:02:21');
INSERT INTO `product` (`id`, `name`, `ticket`, `price`, `product_code`, `img`, `on/off`, `created_at`) VALUES
	(6, '4123', 124, 124, 'adg', '(41)box-outline-filled.png', 'off', '2019-11-13 18:51:52');
INSERT INTO `product` (`id`, `name`, `ticket`, `price`, `product_code`, `img`, `on/off`, `created_at`) VALUES
	(7, '테스트테스트', 23, 1000, 'asdg', '(85)box-outline-filled.png', 'off', '2019-11-16 17:29:48');
INSERT INTO `product` (`id`, `name`, `ticket`, `price`, `product_code`, `img`, `on/off`, `created_at`) VALUES
	(8, '테스트', 12414, 124124, 'OREADCE', '(53)box-outline-filled.png', 'off', '2019-11-27 00:29:37');
INSERT INTO `product` (`id`, `name`, `ticket`, `price`, `product_code`, `img`, `on/off`, `created_at`) VALUES
	(9, '12', 12, 12, '121221', 'cat.jpg', 'off', '2019-11-29 11:12:00');
INSERT INTO `product` (`id`, `name`, `ticket`, `price`, `product_code`, `img`, `on/off`, `created_at`) VALUES
	(10, '1323', 123, 123123, '123123', 'sleepli.PNG', 'off', '2019-12-01 20:45:52');
INSERT INTO `product` (`id`, `name`, `ticket`, `price`, `product_code`, `img`, `on/off`, `created_at`) VALUES
	(11, '백종환', 1, 1, '111', 'logo (2).png', 'off', '2019-12-06 11:33:51');
INSERT INTO `product` (`id`, `name`, `ticket`, `price`, `product_code`, `img`, `on/off`, `created_at`) VALUES
	(12, '체험상품', 3, 1000, '123123', '(30)(85)box-outline-filled.png', 'on', '2020-01-07 14:42:22');
INSERT INTO `product` (`id`, `name`, `ticket`, `price`, `product_code`, `img`, `on/off`, `created_at`) VALUES
	(13, '기본상품2', 100, 3000, '123123', '(93)(85)box-outline-filled.png', 'on', '2020-01-07 14:43:36');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- 테이블 MerDog.refund_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `refund_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '환불 신청번호 인덱스',
  `user_id` int(11) NOT NULL COMMENT '회원번호',
  `payment_list_id` int(11) NOT NULL COMMENT '결제 번호',
  `state` varchar(50) NOT NULL DEFAULT 'wait' COMMENT '환불 처리 상태 / 대기 : wait / 완료 : complete / 거절 : deny ',
  `order_id` varchar(50) NOT NULL COMMENT '구글 주문 번호',
  `coment` text COMMENT '답변',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_refund_list_user_info` (`user_id`),
  KEY `payment_list_id` (`payment_list_id`),
  CONSTRAINT `FK_refund_list_payment_list` FOREIGN KEY (`payment_list_id`) REFERENCES `payment_list` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_refund_list_user_info` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='환불 신청내역';

-- 테이블 데이터 MerDog.refund_list:~18 rows (대략적) 내보내기
/*!40000 ALTER TABLE `refund_list` DISABLE KEYS */;
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(4, 62, 2, 'complete', '124124', '', '2019-11-13 16:01:16');
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(5, 62, 4, 'deny', '125', '안돼!', '2019-11-13 16:01:26');
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(6, 62, 6, 'deny', '125', '돈없어서 거절', '2019-11-16 23:20:33');
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(118, 77, 57, 'wait', 'test', NULL, '2019-12-06 00:14:49');
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(119, 83, 61, 'wait', 'test', NULL, '2019-12-06 10:52:05');
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(120, 84, 69, 'wait', 'test', NULL, '2019-12-06 11:04:54');
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(121, 84, 69, 'wait', 'test', NULL, '2019-12-06 11:05:56');
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(122, 84, 69, 'wait', 'test', NULL, '2019-12-06 11:05:58');
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(123, 84, 69, 'wait', 'test', NULL, '2019-12-06 11:06:00');
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(124, 84, 69, 'wait', 'test', NULL, '2019-12-06 11:06:30');
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(125, 84, 69, 'wait', 'test', NULL, '2019-12-06 11:06:34');
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(126, 77, 57, 'complete', 'test', NULL, '2019-12-06 11:22:48');
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(127, 83, 77, 'deny', 'test', '늦었어', '2019-12-06 11:33:58');
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(128, 83, 77, 'deny', 'test', '1', '2019-12-06 11:34:02');
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(133, 85, 89, 'complete', 'test', NULL, '2019-12-13 10:54:05');
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(134, 86, 92, 'deny', 'test', 'ㄹ', '2019-12-18 13:40:53');
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(143, 78, 96, 'deny', 'test', 'g', '2019-12-29 23:55:35');
INSERT INTO `refund_list` (`id`, `user_id`, `payment_list_id`, `state`, `order_id`, `coment`, `created_at`) VALUES
	(145, 85, 99, 'deny', 'test', '보유 이용권이 지급된 이용권보다 적어 환불이 불가능 합니다.', '2020-01-07 18:15:05');
/*!40000 ALTER TABLE `refund_list` ENABLE KEYS */;

-- 테이블 MerDog.sms_log 구조 내보내기
CREATE TABLE IF NOT EXISTS `sms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'sms 종류',
  `ip_address` varchar(50) NOT NULL COMMENT 'ip 주소',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sms 기록 로그';

-- 테이블 데이터 MerDog.sms_log:~54 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sms_log` DISABLE KEYS */;
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(43, '01051816260', '본인 인증', '223.38.28.226', '2019-12-02 15:15:15');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(44, '01051816260', '본인 인증', '223.38.28.226', '2019-12-02 15:18:15');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(45, '01073756544', 'pw 변경', '211.36.130.86', '2019-12-06 10:28:41');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(46, '01096488148', '본인 인증', '14.42.86.31', '2019-12-06 10:31:37');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(47, '01020751754', '본인 인증', '14.42.86.31', '2019-12-06 10:31:48');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(48, '01044444444', '본인 인증', '211.36.130.86', '2019-12-06 10:35:44');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(49, '01020751754', '가입 승인', '14.42.86.31', '2019-12-06 10:38:41');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(50, '01096488148', '본인 인증', '223.38.28.228', '2019-12-06 10:39:07');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(51, '01096488148', '본인 인증', '223.38.28.228', '2019-12-06 10:42:23');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(52, '01096488148', 'pw 변경', '223.38.28.228', '2019-12-06 10:44:27');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(53, '01077383503', '본인 인증', '223.39.141.48', '2019-12-06 10:49:19');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(54, '0109966336', '가입 승인', '14.42.86.31', '2019-12-06 11:27:38');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(55, '01051816260', '가입 거부', '14.42.86.31', '2019-12-06 11:28:49');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(56, '01011111111', '본인 인증', '223.38.28.228', '2019-12-06 11:30:45');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(57, '01051816260', '본인 인증', '223.39.141.48', '2019-12-06 15:31:39');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(58, '01051816260', '본인 인증', '223.39.141.48', '2019-12-06 15:45:55');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(59, '01051816260', '본인 인증', '223.39.141.48', '2019-12-06 15:51:13');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(60, '01051816260', '본인 인증', '223.39.141.48', '2019-12-06 16:06:26');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(61, '01062203271', '본인 인증', '223.62.175.155', '2019-12-12 00:02:16');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(62, '01062203271', '본인 인증', '223.62.175.155', '2019-12-12 01:45:43');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(63, '01077383503', 'pw 변경', '49.172.164.80', '2019-12-13 03:25:41');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(64, '01051816260', 'pw 변경', '223.38.22.221', '2019-12-16 18:33:19');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(65, '01051816260', 'pw 변경', '223.38.22.221', '2019-12-16 20:11:01');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(66, '01073756544', '본인 인증', '112.152.195.218', '2019-12-17 22:00:35');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(67, '01051816260', '본인 인증', '112.152.7.132', '2019-12-17 22:59:42');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(68, '01051816260', '본인 인증', '112.152.7.132', '2019-12-17 23:03:25');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(69, '01051816260', '본인 인증', '112.152.7.132', '2019-12-17 23:07:28');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(70, '01051816260', '본인 인증', '112.152.7.132', '2019-12-17 23:13:01');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(71, '01051816260', '본인 인증', '112.152.7.132', '2019-12-17 23:25:15');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(72, '01051816260', '가입 승인', '112.152.7.132', '2019-12-18 01:09:50');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(73, '01029100780', '본인 인증', '223.38.24.179', '2019-12-21 19:01:17');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(74, '01029100780', '가입 승인', '112.152.195.218', '2019-12-21 19:06:13');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(75, '01051816260', '본인 인증', '112.152.7.132', '2019-12-23 22:33:25');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(76, '01051816260', '가입 승인', '112.152.7.132', '2019-12-23 22:40:21');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(77, '01077383503', '본인 인증', '182.161.137.252', '2019-12-25 18:28:40');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(78, '01077383503', '본인 인증', '182.161.137.252', '2019-12-26 01:15:23');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(79, '01077383503', '본인 인증', '182.161.137.252', '2019-12-26 01:21:22');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(80, '01077383503', '가입 승인', '182.161.137.252', '2019-12-26 01:42:13');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(81, '01077383503', '본인 인증', '49.172.64.107', '2019-12-29 15:07:18');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(82, '01091170750', '본인 인증', '223.62.216.236', '2020-01-02 19:02:46');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(83, '0105186368', '가입 승인', '203.229.113.145', '2020-01-02 19:10:22');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(84, '01051816244', '가입 거부', '203.229.113.145', '2020-01-02 19:10:57');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(85, '01051816666', '가입 거부', '203.229.113.145', '2020-01-02 19:11:20');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(86, '01051816260', '본인 인증', '220.88.68.40', '2020-01-02 19:57:42');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(87, '01051816260', '가입 승인', '220.88.68.40', '2020-01-02 20:02:15');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(88, '01051816260', '본인 인증', '223.62.175.57', '2020-01-02 21:30:46');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(89, '01051816260', '본인 인증', '223.62.175.57', '2020-01-02 21:36:31');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(90, '01051816260', '가입 승인', '223.62.175.153', '2020-01-02 21:40:51');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(91, '01051816260', '가입 거부', '223.62.175.153', '2020-01-02 21:42:59');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(92, '01051816260', '가입 거부', '223.62.175.153', '2020-01-02 21:44:53');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(93, '01051816260', '가입 거부', '223.62.175.153', '2020-01-02 21:45:24');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(94, '01051816260', '가입 거부', '223.62.175.153', '2020-01-02 21:46:31');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(95, '01051816260', '가입 승인', '223.62.175.153', '2020-01-02 21:49:56');
INSERT INTO `sms_log` (`id`, `phone`, `type`, `ip_address`, `created_at`) VALUES
	(96, '01022260313', '본인 인증', '223.33.184.92', '2020-01-09 14:41:28');
/*!40000 ALTER TABLE `sms_log` ENABLE KEYS */;

-- 테이블 MerDog.user_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '사용자 번호',
  `user_id` varchar(50) DEFAULT NULL COMMENT '사용자 아이디',
  `user_pw` text COMMENT '사용자 비밀번호',
  `user_nick` varchar(50) NOT NULL COMMENT '사용자 닉네임',
  `user_phone` varchar(50) NOT NULL COMMENT '사용자 전화번호',
  `user_kakao` varchar(50) DEFAULT NULL COMMENT '사용자 카카오계정 아이디',
  `user_naver` varchar(50) DEFAULT NULL COMMENT '사용자 네이버계정 아이디',
  `user_google` varchar(50) DEFAULT NULL COMMENT '사용자 구글계정 아이디',
  `user_facebook` varchar(50) DEFAULT NULL COMMENT '사용자 페이스북계정 아이디',
  `user_twitter` varchar(50) DEFAULT NULL COMMENT '사용자 트위터계정 아이디',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fcm_token` text,
  `user_token` text,
  `ticket` int(11) NOT NULL DEFAULT '0' COMMENT '보유한 이용권 수',
  `on/off` varchar(10) NOT NULL DEFAULT 'on' COMMENT '사용자 회원 활성화 여부 on/off',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_nick` (`user_nick`),
  UNIQUE KEY `user_phone` (`user_phone`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `user_kakao` (`user_kakao`),
  UNIQUE KEY `user_naver` (`user_naver`),
  UNIQUE KEY `user_google` (`user_google`),
  UNIQUE KEY `user_facebook` (`user_facebook`),
  UNIQUE KEY `user_twitter` (`user_twitter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='사용자 정보';

-- 테이블 데이터 MerDog.user_info:~11 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` (`id`, `user_id`, `user_pw`, `user_nick`, `user_phone`, `user_kakao`, `user_naver`, `user_google`, `user_facebook`, `user_twitter`, `created_at`, `fcm_token`, `user_token`, `ticket`, `on/off`) VALUES
	(62, 'test123', '$2y$10$HK7aFPCknYQK1tgUbTu1HeoxpaEIXG0RY23KlZ6vq295SSdZCQGVS', '민호쓰', '01034746005', NULL, NULL, NULL, NULL, NULL, '2019-10-24 22:32:51', NULL, NULL, 1560, 'on');
INSERT INTO `user_info` (`id`, `user_id`, `user_pw`, `user_nick`, `user_phone`, `user_kakao`, `user_naver`, `user_google`, `user_facebook`, `user_twitter`, `created_at`, `fcm_token`, `user_token`, `ticket`, `on/off`) VALUES
	(77, 'jh123', '$2y$10$AHOjPUN9yHqMPjLPx9hRZ.u0X3ls03ZJirMo1trdS2o2KZO9AcdMG', '조재형', '01020751754', NULL, NULL, NULL, NULL, NULL, '2019-11-06 12:07:20', 'f-py0J24JR4:APA91bE89XFXUj40xechIG0b63ayodron7rSiFnAtSXjh16qPoLpq6MFaepAVX-Stl67NJ5MiByX6RYaUW2lpnOXeXPxH5ZSRre5VbMlg07IRpuifDbncdJnFPqbg9vD0vOtRgf1rvSQ', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3N30.FALWdg9bHwpgpz0HqgnxKqR6fPwdNLC8k0zrZSYNXnM', 14234, 'on');
INSERT INTO `user_info` (`id`, `user_id`, `user_pw`, `user_nick`, `user_phone`, `user_kakao`, `user_naver`, `user_google`, `user_facebook`, `user_twitter`, `created_at`, `fcm_token`, `user_token`, `ticket`, `on/off`) VALUES
	(78, NULL, NULL, '종환', '01053050315', NULL, '55141433', NULL, NULL, NULL, '2019-11-06 12:08:36', NULL, NULL, 20133, 'on');
INSERT INTO `user_info` (`id`, `user_id`, `user_pw`, `user_nick`, `user_phone`, `user_kakao`, `user_naver`, `user_google`, `user_facebook`, `user_twitter`, `created_at`, `fcm_token`, `user_token`, `ticket`, `on/off`) VALUES
	(79, 'test100', '$2y$10$jS7bxC/cxDqzC18vcWzcI.FHqBNGuAmk9IAQxNr.7aycsak3aW1PO', '테스트', '01089059133', NULL, NULL, NULL, NULL, NULL, '2019-11-10 12:57:50', NULL, NULL, 1696, 'off');
INSERT INTO `user_info` (`id`, `user_id`, `user_pw`, `user_nick`, `user_phone`, `user_kakao`, `user_naver`, `user_google`, `user_facebook`, `user_twitter`, `created_at`, `fcm_token`, `user_token`, `ticket`, `on/off`) VALUES
	(80, 'cvcv5648', '$2y$10$Cy/NNWqVxluqxhAH7qYFiOHaC6wFqTEp0hHSHx40VHrR4X.LsVFOG', '상범', '01051816260', NULL, NULL, NULL, NULL, NULL, '2019-11-12 20:11:50', NULL, NULL, 1656, 'on');
INSERT INTO `user_info` (`id`, `user_id`, `user_pw`, `user_nick`, `user_phone`, `user_kakao`, `user_naver`, `user_google`, `user_facebook`, `user_twitter`, `created_at`, `fcm_token`, `user_token`, `ticket`, `on/off`) VALUES
	(81, 'jgn97', '$2y$10$g2SR5EA/dG7JBSv58.b.pebhOmU6uIcbhmUpJ3C64F6Uf42oUeSBq', '조경남', '01030141437', NULL, NULL, NULL, NULL, NULL, '2019-11-14 05:52:49', NULL, NULL, 747, 'on');
INSERT INTO `user_info` (`id`, `user_id`, `user_pw`, `user_nick`, `user_phone`, `user_kakao`, `user_naver`, `user_google`, `user_facebook`, `user_twitter`, `created_at`, `fcm_token`, `user_token`, `ticket`, `on/off`) VALUES
	(82, 'ollenu', '$2y$10$jLh8HxDK9BhrA1cVXEfpluf7kOqtpcNL/M2P7wi3U8aMHTvWA3wcq', '좆재', '01024832850', NULL, NULL, NULL, NULL, NULL, '2019-11-23 15:13:34', NULL, NULL, 568, 'off');
INSERT INTO `user_info` (`id`, `user_id`, `user_pw`, `user_nick`, `user_phone`, `user_kakao`, `user_naver`, `user_google`, `user_facebook`, `user_twitter`, `created_at`, `fcm_token`, `user_token`, `ticket`, `on/off`) VALUES
	(83, 'ccit2019', '$2y$10$HQblD8wocEi13XJZxAIXR.V/kqq070WeVQbg.IQ6wMgdMbLh0FmOG', '신', '01096488148', NULL, NULL, NULL, NULL, NULL, '2019-12-06 10:43:39', NULL, NULL, 101246, 'on');
INSERT INTO `user_info` (`id`, `user_id`, `user_pw`, `user_nick`, `user_phone`, `user_kakao`, `user_naver`, `user_google`, `user_facebook`, `user_twitter`, `created_at`, `fcm_token`, `user_token`, `ticket`, `on/off`) VALUES
	(84, 'test4', '$2y$10$CLvp2JP2v0iUa3NAhcW1UuNjsDS5e9meZ6R5vi9CLwvSxvgd4zWRm', '시바견사', '01077383503', NULL, NULL, NULL, NULL, NULL, '2019-12-06 10:54:33', 'dzbz54fvRGA:APA91bEI3JhIRJpo4oZoW3MTmyV-0QVBhxG5eyWT51Y3aJmz4pkvxY1sWHqeM_95MuSth2ZlT1f74WIi3vKfprksIx4wrDrv6Z9C3dOIy-C8ZghhrlDSfL_5eVgVuq86YCj-6_qD5_d9', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4NH0.TUPmEQ8NT3bG6vgVPvOxvm7-CZeDd0UPmK8LUP0nJHE', 639, 'on');
INSERT INTO `user_info` (`id`, `user_id`, `user_pw`, `user_nick`, `user_phone`, `user_kakao`, `user_naver`, `user_google`, `user_facebook`, `user_twitter`, `created_at`, `fcm_token`, `user_token`, `ticket`, `on/off`) VALUES
	(85, 'jonghwan94', '$2y$10$EL8hTmooRV9mO.W87rqeieLuSuSGKMY2Rq6c1.nMJTFgjnrw3iTh2', '종환부계정', '01022260313', NULL, NULL, NULL, NULL, NULL, '2019-12-12 01:46:53', NULL, NULL, 179, 'on');
INSERT INTO `user_info` (`id`, `user_id`, `user_pw`, `user_nick`, `user_phone`, `user_kakao`, `user_naver`, `user_google`, `user_facebook`, `user_twitter`, `created_at`, `fcm_token`, `user_token`, `ticket`, `on/off`) VALUES
	(86, 'st02219', '$2y$10$idCYzBjIW97Q/NVk.WR9guzMD7xi8CDoeywZG5sStqmDqb1RKsSni', '공지환', '01073756544', NULL, NULL, NULL, NULL, NULL, '2019-12-17 22:02:02', 'ee7LQWdZlrU:APA91bGlRbUXKm33LgdDS77c-ECQ4GfVmjEwqOIgSIrHryxuc8506W5sCXjrnGA3fLYPVVyFN-VjiNxYPbc4fXZ1kQjv2evFXXv2mc8OK8YLkVsCVPmU0kpfLx8UBHdda0ERqtDoec-o', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4Nn0.h-3URxXp-FZC9NUsY2CsgjciHPnAsyvN_Jcxl_4Q6Ug', 600, 'on');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;

-- 테이블 MerDog.withdraw_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `withdraw_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '출금 내역 인덱스 번호',
  `doctor_id` int(11) NOT NULL COMMENT '의사회원 번호',
  `price` int(11) NOT NULL COMMENT '출금할 금액',
  `fee` int(11) NOT NULL DEFAULT '30' COMMENT '수수료 퍼센트 /30% (변경가능)',
  `get_money` int(11) NOT NULL COMMENT '받을 돈 <수수료 계산후>',
  `state` varchar(50) NOT NULL DEFAULT 'wait' COMMENT '출금 내역 상태 <wait:대기 / complete:완료 / deny :거절>',
  `coment` text COMMENT '답변',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_withdraw_list_doctor_info` (`doctor_id`),
  CONSTRAINT `FK_withdraw_list_doctor_info` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_info` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='출금 내역';

-- 테이블 데이터 MerDog.withdraw_list:~29 rows (대략적) 내보내기
/*!40000 ALTER TABLE `withdraw_list` DISABLE KEYS */;
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(11, 115, 1000000, 30, 700000, 'wait', NULL, '2019-11-25 14:07:43');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(12, 115, 1000000, 30, 700000, 'wait', NULL, '2019-11-25 14:07:43');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(13, 103, 200000, 30, 140000, 'wait', NULL, '2019-11-20 16:10:46');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(14, 103, 10000, 30, 7000, 'wait', NULL, '2019-11-25 14:07:44');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(15, 115, 20000, 30, 14000, 'wait', NULL, '2019-11-25 14:07:44');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(16, 115, 8920000, 30, 6244000, 'wait', NULL, '2019-11-25 14:07:45');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(17, 103, 10000, 30, 7000, 'wait', NULL, '2019-11-25 14:07:45');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(18, 115, 49494949, 30, 34646464, 'deny', NULL, '2019-11-25 14:07:53');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(19, 115, 18188, 30, 12731, 'wait', NULL, '2019-11-25 14:07:46');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(20, 103, 89200, 30, 62440, 'deny', NULL, '2019-11-25 14:09:59');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(21, 115, 400000, 30, 280000, 'deny', NULL, '2019-11-25 23:57:53');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(22, 115, 20000, 30, 14000, 'wait', NULL, '2019-11-25 19:11:53');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(23, 115, 20000, 30, 14000, 'deny', NULL, '2019-11-26 19:52:29');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(24, 103, 20000, 30, 14000, 'wait', NULL, '2019-11-25 19:14:31');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(25, 103, 20000, 30, 14000, 'deny', 'ㅁㄴㅇ', '2019-11-26 23:10:34');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(26, 103, 99999, 30, 69999, 'deny', NULL, '2019-11-25 23:57:31');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(27, 103, 10000, 30, 7000, 'deny', NULL, '2019-11-26 19:52:58');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(28, 103, 10000, 30, 7000, 'wait', NULL, '2019-12-18 00:51:35');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(29, 103, 50000, 30, 35000, 'wait', NULL, '2019-12-18 00:52:05');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(30, 103, 50000, 30, 35000, 'wait', NULL, '2019-12-18 00:52:05');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(31, 103, 10000, 30, 7000, 'wait', NULL, '2019-12-18 01:04:48');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(32, 103, 100000, 30, 70000, 'wait', NULL, '2019-12-18 01:05:42');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(33, 111, 20000, 30, 14000, 'wait', NULL, '2019-12-18 03:32:00');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(34, 111, 20000, 30, 14000, 'wait', NULL, '2019-12-18 03:34:08');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(35, 111, 20000, 30, 14000, 'wait', NULL, '2019-12-18 03:35:03');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(36, 111, 200000, 30, 140000, 'wait', NULL, '2019-12-18 03:36:19');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(37, 111, 200000, 30, 140000, 'deny', '구냥', '2020-01-02 18:37:48');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(38, 111, 200000, 30, 140000, 'deny', '안돼!', '2020-01-09 11:41:39');
INSERT INTO `withdraw_list` (`id`, `doctor_id`, `price`, `fee`, `get_money`, `state`, `coment`, `created_at`) VALUES
	(39, 103, 10000, 30, 7000, 'complete', NULL, '2020-01-02 13:04:54');
/*!40000 ALTER TABLE `withdraw_list` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
