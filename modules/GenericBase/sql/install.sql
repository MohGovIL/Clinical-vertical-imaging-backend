--
-- Table structure for table `moh_import_data`
--

DROP TABLE IF EXISTS `moh_import_data`;
CREATE TABLE `moh_import_data` (
  `id` int(11) NOT NULL,
  `external_name` varchar(100) NOT NULL,
  `clinikal_name` varchar(100) NOT NULL COMMENT 'table / list',
  `static_name` varchar(100) NOT NULL,
  `source` enum('EDM','CSV') NOT NULL,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
--
-- Dumping data for table `moh_import_data`
--

INSERT INTO `moh_import_data` (`id`, `external_name`, `clinikal_name`, `static_name`, `source`, `update_at`) VALUES
(1, 'country', 'moh_country', 'countries', 'EDM', '2017-03-02 09:09:32'),
(2, 'gender', 'sex', 'gender', 'EDM', '2017-03-29 00:00:00'),
(3, 'language', 'language', 'language', 'EDM', '2017-03-29 00:00:00'),
(4, 'city', 'mh_cities', 'city', 'EDM', '2017-03-29 00:00:00'),
(5, 'street', 'mh_streets', 'street', 'EDM', '2017-03-02 09:10:01'),
(6, 'death_situation', 'mh_reason_of_death', 'death', 'EDM', '2017-03-29 00:00:00'),
(7, 'ExtendedLogicalStatus', 'mh_medic_approval', 'elsList', 'EDM', '2017-03-29 00:00:00'),
(8, 'SocialSecurityOffices', 'mh_ss_branches', 'sso', 'EDM', '2017-04-20 00:00:00'),
(9, 'HMO', 'mh_ins_organizations', 'hmo', 'EDM', '2017-03-29 00:00:00'),
(10, 'title', 'titles', 'title', 'EDM', '2017-03-29 00:00:00'),
(11, 'icd_type', 'occurrence', 'frequency', 'EDM', '2017-03-29 00:00:00'),
(12, 'institute_type', 'moh_institute_type', 'institutetype', 'EDM', '2017-03-29 00:00:00'),
(13, 'institute', 'moh_institutes', 'institute', 'EDM', '2017-03-29 00:00:00'),
(14, 'id_type', 'userlist3', 'idtype', 'EDM', '2000-03-29 00:00:00'),
(15, 'expertise', 'physician_type', 'expertise', 'EDM', '2017-03-29 00:00:00'),
(16, 'family_status', 'marital', 'famillystatus', 'EDM', '2017-03-29 00:00:00'),
(17, 'ICD10', 'codes', 'icd10', 'EDM', '2017-03-29 00:00:00'),
(18, 'ICD9', 'codes', 'icd9', 'EDM', '2017-03-02 09:11:01'),
(19, 'MOH_KUPAT_CHOLIM_BRANCHES', 'MOH_KUPAT_CHOLIM_BRANCHES', 'mkcb', 'CSV', '2017-03-29 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `moh_import_data_log`
--

DROP TABLE IF EXISTS `moh_import_data_log`;
CREATE TABLE `moh_import_data_log` (
  `id` int(11) NOT NULL,
  `table` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `affected_records` int(11) DEFAULT NULL,
  `info` text DEFAULT NULL,
  `update_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



UPDATE `categories` SET `name` = 'HPatient Photograph', `lft` = '105', `rght` = '106' WHERE `id` = '4';
UPDATE `categories` SET `name` = 'EMedical Record', `lft` = '101', `rght` = '102' WHERE `id` = '2';
UPDATE `categories` SET `rght` = '271' WHERE `id` = '1';
UPDATE `categories` SET `name` = 'FLab Report', `lft` = '103', `rght` = '104' WHERE `id` = '3';

DELETE FROM `categories` WHERE `id` = '19';
DELETE FROM `categories` WHERE `id` = '22';
DELETE FROM `categories` WHERE `id` = '15';
DELETE FROM `categories` WHERE `id` = '14';
DELETE FROM `categories` WHERE `id` = '11';
DELETE FROM `categories` WHERE `id` = '21';
DELETE FROM `categories` WHERE `id` = '25';
DELETE FROM `categories` WHERE `id` = '20';
DELETE FROM `categories` WHERE `id` = '27';
DELETE FROM `categories` WHERE `id` = '6';
DELETE FROM `categories` WHERE `id` = '12';
DELETE FROM `categories` WHERE `id` = '24';
DELETE FROM `categories` WHERE `id` = '9';
DELETE FROM `categories` WHERE `id` = '10';
DELETE FROM `categories` WHERE `id` = '5';
DELETE FROM `categories` WHERE `id` = '8';
DELETE FROM `categories` WHERE `id` = '16';
DELETE FROM `categories` WHERE `id` = '17';
DELETE FROM `categories` WHERE `id` = '18';
DELETE FROM `categories` WHERE `id` = '13';
DELETE FROM `categories` WHERE `id` = '28';
DELETE FROM `categories` WHERE `id` = '7';
DELETE FROM `categories` WHERE `id` = '29';
DELETE FROM `categories` WHERE `id` = '26';
DELETE FROM `categories` WHERE `id` = '23';

DELETE FROM `categories_seq` WHERE `id` = '29';
INSERT INTO `categories_seq` (`id`) VALUES('9');


-- FOR EVERY LIST FROM LIST OPTIONS WE USED IN THE FHIR API/ CLINIKAL API WE NEED ADD -
-- FOR EXAMPLE - INSERT INTO `list_options` (`list_id`, `option_id`, `title`, `seq`, `is_default`, `option_value`, `mapping`, `notes`, `codes`, `toggle_setting_1`, `toggle_setting_2`, `activity`, `subtype`, `edit_options`, `timestamp`) VALUES ('lists','mh_cities','moh cities',311,1,0,'','','',0,0,1,'',1,'2017-03-02 07:07:44');


-- FOR EVERY NEW COLUNMS IN PATIENT_DATA WE USED IN THE FHIR API/ CLINIKAL API WE NEED ADD -

--ALTER TABLE `patient_data`
  ADD COLUMN <COLUMN> text NULL DEFAULT NULL