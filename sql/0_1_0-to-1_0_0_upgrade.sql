--
--  Comment Meta Language Constructs:
--
--  #IfNotTable
--    argument: table_name
--    behavior: if the table_name does not exist,  the block will be executed

--  #IfTable
--    argument: table_name
--    behavior: if the table_name does exist, the block will be executed

--  #IfColumn
--    arguments: table_name colname
--    behavior:  if the table and column exist,  the block will be executed

--  #IfMissingColumn
--    arguments: table_name colname
--    behavior:  if the table exists but the column does not,  the block will be executed

--  #IfNotColumnType
--    arguments: table_name colname value
--    behavior:  If the table table_name does not have a column colname with a data type equal to value, then the block will be executed

--  #IfNotRow
--    arguments: table_name colname value
--    behavior:  If the table table_name does not have a row where colname = value, the block will be executed.

--  #IfNotRow2D
--    arguments: table_name colname value colname2 value2
--    behavior:  If the table table_name does not have a row where colname = value AND colname2 = value2, the block will be executed.

--  #IfNotRow3D
--    arguments: table_name colname value colname2 value2 colname3 value3
--    behavior:  If the table table_name does not have a row where colname = value AND colname2 = value2 AND colname3 = value3, the block will be executed.

--  #IfNotRow4D
--    arguments: table_name colname value colname2 value2 colname3 value3 colname4 value4
--    behavior:  If the table table_name does not have a row where colname = value AND colname2 = value2 AND colname3 = value3 AND colname4 = value4, the block will be executed.

--  #IfNotRow2Dx2
--    desc:      This is a very specialized function to allow adding items to the list_options table to avoid both redundant option_id and title in each element.
--    arguments: table_name colname value colname2 value2 colname3 value3
--    behavior:  The block will be executed if both statements below are true:
--               1) The table table_name does not have a row where colname = value AND colname2 = value2.
--               2) The table table_name does not have a row where colname = value AND colname3 = value3.

--  #IfRow2D
--    arguments: table_name colname value colname2 value2
--    behavior:  If the table table_name does have a row where colname = value AND colname2 = value2, the block will be executed.

--  #IfRow3D
--        arguments: table_name colname value colname2 value2 colname3 value3
--        behavior:  If the table table_name does have a row where colname = value AND colname2 = value2 AND colname3 = value3, the block will be executed.

--  #IfIndex
--    desc:      This function is most often used for dropping of indexes/keys.
--    arguments: table_name colname
--    behavior:  If the table and index exist the relevant statements are executed, otherwise not.

--  #IfNotIndex
--    desc:      This function will allow adding of indexes/keys.
--    arguments: table_name colname
--    behavior:  If the index does not exist, it will be created

--  #EndIf
--    all blocks are terminated with a #EndIf statement.

--  #IfNotListReaction
--    Custom function for creating Reaction List

--  #IfNotListOccupation
--    Custom function for creating Occupation List

--  #IfTextNullFixNeeded
--    desc: convert all text fields without default null to have default null.
--    arguments: none

--  #IfTableEngine
--    desc:      Execute SQL if the table has been created with given engine specified.
--    arguments: table_name engine
--    behavior:  Use when engine conversion requires more than one ALTER TABLE

--  #IfInnoDBMigrationNeeded
--    desc: find all MyISAM tables and convert them to InnoDB.
--    arguments: none
--    behavior: can take a long time.

--  #IfTranslationNeeded
--    desc: find all MyISAM tables and convert them to InnoDB.
--    arguments: constant_name english hebrew
--    behavior: can take a long time.


#IfNotTable fhir_rest_elements
 CREATE TABLE `fhir_rest_elements` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `fhir_rest_elements`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `fhir_rest_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
#EndIf

#IfNotRow fhir_rest_elements name Organization
INSERT INTO `fhir_rest_elements` (`name`, `active`) VALUES
('Organization', 1);
#EndIf

#IfNotRow fhir_rest_elements name Patient
INSERT INTO `fhir_rest_elements` (`name`, `active`) VALUES
('Patient', 1);
#EndIf

#IfNotRow fhir_rest_elements name Appointment
INSERT INTO `fhir_rest_elements` (`name`, `active`) VALUES
('Appointment', 1);
#EndIf

#IfNotRow fhir_rest_elements name HealthcareService
INSERT INTO `fhir_rest_elements` (`name`, `active`) VALUES
('HealthcareService', 1);
#EndIf

#IfNotTable fhir_healthcare_services
RENAME TABLE `healthcare_services` TO `fhir_healthcare_services`;
#EndIf

#IfMissingColumn fhir_healthcare_services id
ALTER TABLE `fhir_healthcare_services` CHANGE `identifier` `id` INT NOT NULL AUTO_INCREMENT;
#EndIf


#IfMissingColumn openemr_postcalendar_events pc_priority
ALTER TABLE `openemr_postcalendar_events` ADD `pc_priority` INT NOT NULL DEFAULT '1' AFTER `pc_gid`;
#EndIf

#IfMissingColumn openemr_postcalendar_events pc_service_type
ALTER TABLE `openemr_postcalendar_events` ADD `pc_service_type` INT NULL DEFAULT NULL AFTER `pc_priority`;
#EndIf

#IfMissingColumn openemr_postcalendar_events pc_healthcare_service_id
ALTER TABLE `openemr_postcalendar_events` ADD `pc_healthcare_service_id` INT NULL DEFAULT NULL AFTER `pc_service_type`;
#EndIf

#IfNotTable encounter_reasoncode_map
CREATE TABLE encounter_reasoncode_map (
eid INT(6) UNSIGNED,
reason_code  INT(6) UNSIGNED
);
#EndIf

#IfMissingColumn facility active
ALTER TABLE facility ADD active int DEFAULT 1;
#EndIf

#IfNotTable fhir_value_sets
CREATE TABLE `fhir_value_sets` (
    `id` VARCHAR(125) NOT NULL,
    `title` VARCHAR(125) NOT NULL,
    `active` BOOLEAN NOT NULL DEFAULT 1,
    PRIMARY KEY(`id`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;
#EndIf

#IfNotTable fhir_value_set_systems
CREATE TABLE `fhir_value_set_systems` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `vs_id` VARCHAR(125) NOT NULL,
    `system` VARCHAR(125) NOT NULL,
    `type` ENUM('All', 'Partial', 'Exclude', 'Filter') NOT NULL,
    `filter` VARCHAR(125) DEFAULT NULL,
    PRIMARY KEY(`id`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;
#EndIf

#IfNotTable fhir_value_set_codes
CREATE TABLE `fhir_value_set_codes` (
    `vss_id` INT NOT NULL,
    `code` VARCHAR(125) NOT NULL,
    PRIMARY KEY(`vss_id`, `code`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;
#EndIf

-- no appropriate condition
UPDATE `list_options` SET `notes` = ''
    WHERE `list_id` IN ('clinikal_service_categories', 'clinikal_service_types') OR `option_id` IN ('clinikal_service_categories', 'clinikal_service_types');

#IfNotRow2D list_options list_id clinikal_service_types option_id 7
INSERT INTO `list_options` (`list_id`, `option_id`, `title`, `seq`, `is_default`, `option_value`, `mapping`, `notes`, `codes`, `toggle_setting_1`, `toggle_setting_2`, `activity`, `subtype`, `edit_options`) VALUES
('clinikal_service_types', '7', 'Biopsy', 15, 0, 0, '', '', '', 0, 0, 1, '', 1);
#EndIf

#IfNotRow2D list_options list_id lists option_id clinikal_reason_codes
INSERT INTO `list_options` (`list_id`, `option_id`, `title`, `seq`, `is_default`, `option_value`, `mapping`, `notes`, `codes`, `toggle_setting_1`, `toggle_setting_2`, `activity`, `subtype`, `edit_options`) VALUES
('lists', 'clinikal_reason_codes', 'Clinikal Reason Codes', 0, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '1', 'Shoulder', 10, 0, 0, '', '1', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '2', 'Ankle', 20, 0, 0, '', '1', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '3', 'Foot', 30, 0, 0, '', '1', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '4', 'Hand', 40, 0, 0, '', '1', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '5', 'Upper Abdomen', 50, 0, 0, '', '1', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '6', 'Upper And Lower Abdomen', 60, 0, 0, '', '1', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '7', 'Lower Abdomen And Kidney And Urinary Tract', 70, 0, 0, '', '1', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '8', 'Head And Neck', 80, 0, 0, '', '1', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '9', 'Breast', 90, 0, 0, '', '1', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '10', '3D Breast', 100, 0, 0, '', '1', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '11', 'Breast', 10, 0, 0, '', '7', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '12', 'Mammography', 10, 0, 0, '', '2', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '13', 'Shoulder', 10, 0, 0, '', '3', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '14', 'Ankle', 20, 0, 0, '', '3', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '15', 'Foot', 30, 0, 0, '', '3', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '16', 'Lung', 10, 0, 0, '', '4', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '17', 'Blood Vessel', 20, 0, 0, '', '4', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '18', 'Backbone', 10, 0, 0, '', '5', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '19', 'Brain', 20, 0, 0, '', '5', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '20', 'Echocardiography', 10, 0, 0, '', '6', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '21', 'Echo In Effort', 20, 0, 0, '', '6', '', 0, 0, 1, '', 1),
('clinikal_reason_codes', '22', 'Holter Blood Pressure', 30, 0, 0, '', '6', '', 0, 0, 1, '', 1);
#EndIf

#IfNotRow fhir_value_sets id service_types
INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('service_types', 'Service Types');
#EndIf

#IfNotRow2D fhir_value_set_systems vs_id service_types system clinikal_service_types
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`) VALUES ('service_types', 'clinikal_service_types', 'All');
#EndIf

#IfNotRow fhir_value_sets id reason_codes_1
INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('reason_codes_1', 'Ultrasound Reason Codes');
#EndIf

#IfNotRow2D fhir_value_set_systems vs_id reason_codes_1 system clinikal_reason_codes
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`, `filter`) VALUES ('reason_codes_1', 'clinikal_reason_codes', 'Filter', '1');
#EndIf

#IfNotRow fhir_value_sets id reason_codes_2
INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('reason_codes_2', 'Mammography Reason Codes');
#EndIf

#IfNotRow2D fhir_value_set_systems vs_id reason_codes_2 system clinikal_reason_codes
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`, `filter`) VALUES ('reason_codes_2', 'clinikal_reason_codes', 'Filter', '2');
#EndIf

#IfNotRow fhir_value_sets id reason_codes_3
INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('reason_codes_3', 'X-ray Reason Codes');
#EndIf

#IfNotRow2D fhir_value_set_systems vs_id reason_codes_3 system clinikal_reason_codes
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`, `filter`) VALUES ('reason_codes_3', 'clinikal_reason_codes', 'Filter', '3');
#EndIf

#IfNotRow fhir_value_sets id reason_codes_4
INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('reason_codes_4', 'CT Reason Codes');
#EndIf

#IfNotRow2D fhir_value_set_systems vs_id reason_codes_4 system clinikal_reason_codes
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`, `filter`) VALUES ('reason_codes_4', 'clinikal_reason_codes', 'Filter', '4');
#EndIf

#IfNotRow fhir_value_sets id reason_codes_5
INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('reason_codes_5', 'MRI Reason Codes');
#EndIf

#IfNotRow2D fhir_value_set_systems vs_id reason_codes_5 system clinikal_reason_codes
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`, `filter`) VALUES ('reason_codes_5', 'clinikal_reason_codes', 'Filter', '5');
#EndIf

#IfNotRow fhir_value_sets id reason_codes_6
INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('reason_codes_6', 'Cardiology Reason Codes');
#EndIf

#IfNotRow2D fhir_value_set_systems vs_id reason_codes_6 system clinikal_reason_codes
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`, `filter`) VALUES ('reason_codes_6', 'clinikal_reason_codes', 'Filter', '6');
#EndIf

#IfNotRow fhir_value_sets id reason_codes_7
INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('reason_codes_7', 'Biopsy Reason Codes');
#EndIf

#IfNotRow2D fhir_value_set_systems vs_id reason_codes_7 system clinikal_reason_codes
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`, `filter`) VALUES ('reason_codes_7', 'clinikal_reason_codes', 'Filter', '7');
#EndIf

#IfNotRow2D list_options list_id lists option_id clinikal_enc_statuses
INSERT INTO `list_options` (`list_id`, `option_id`, `title`, `seq`, `is_default`, `option_value`, `mapping`, `notes`, `codes`, `toggle_setting_1`, `toggle_setting_2`, `activity`, `subtype`, `edit_options`) VALUES
('lists', 'clinikal_enc_statuses', 'Clinikal Encounter Statuses', 0, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_enc_statuses', '1', 'Planned', 10, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_enc_statuses', '2', 'Arrived', 20, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_enc_statuses', '3', 'Triaged', 30, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_enc_statuses', '4', 'In Progress', 40, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_enc_statuses', '5', 'Waiting For Results', 50, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_enc_statuses', '6', 'Finished', 60, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_enc_statuses', '7', 'Cancelled', 15, 0, 0, '', '', '', 0, 0, 1, '', 1);
#EndIf

#IfNotRow fhir_value_sets id encounter_statuses
INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('encounter_statuses', 'Encounter Statuses');
#EndIf

#IfNotRow2D fhir_value_set_systems vs_id encounter_statuses system clinikal_enc_statuses
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`) VALUES ('encounter_statuses', 'clinikal_enc_statuses', 'All');
#EndIf

#IfNotRow2D list_options list_id lists option_id clinikal_app_statuses
INSERT INTO `list_options` (`list_id`, `option_id`, `title`, `seq`, `is_default`, `option_value`, `mapping`, `notes`, `codes`, `toggle_setting_1`, `toggle_setting_2`, `activity`, `subtype`, `edit_options`) VALUES
('lists', 'clinikal_app_statuses', 'Clinikal Appointment Statuses', 0, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_app_statuses', '1', 'Pending', 10, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_app_statuses', '2', 'Booked', 20, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_app_statuses', '3', 'Arrived', 30, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_app_statuses', '4', 'Cancelled', 40, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_app_statuses', '5', 'No Show', 50, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_app_statuses', '6', 'Waitlisted', 60, 0, 0, '', '', '', 0, 0, 1, '', 1);
#EndIf

#IfNotRow fhir_value_sets id patient_tracking_statuses
INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('patient_tracking_statuses', 'Appointment Statuses For Patients Tracking');
#EndIf

#IfNotRow2D fhir_value_set_systems vs_id patient_tracking_statuses system clinikal_app_statuses
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`) VALUES ('patient_tracking_statuses', 'clinikal_app_statuses', 'Partial');
INSERT INTO `fhir_value_set_codes` (`vss_id`, `code`) VALUES
(LAST_INSERT_ID(), 1),
(LAST_INSERT_ID(), 2),
(LAST_INSERT_ID(), 4),
(LAST_INSERT_ID(), 5);
#EndIf

-- no appropriate condition
UPDATE `list_options` SET `list_id` = 'clinikal_service_categories' WHERE list_id = 'fhir_service_categories';

-- no appropriate condition
UPDATE `list_options` SET `option_id` = 'clinikal_service_categories' WHERE option_id = 'fhir_service_categories';

#IfNotRow fhir_rest_elements name ValueSet
INSERT INTO `fhir_rest_elements` (`name`, `active`) VALUES
('ValueSet', 1);
#EndIf

#IfNotRow fhir_rest_elements name Encounter
INSERT INTO `fhir_rest_elements` (`name`, `active`) VALUES
('Encounter', 1);
#EndIf

#IfMissingColumn form_encounter status
ALTER TABLE form_encounter ADD status VARCHAR(100) NULL  AFTER `parent_encounter_id`;
#EndIf

#IfMissingColumn form_encounter eid
ALTER TABLE form_encounter ADD eid INT NULL  AFTER `status`;
#EndIf

#IfMissingColumn form_encounter priority
ALTER TABLE form_encounter ADD priority INT DEFAULT 0 AFTER `eid`;
#EndIf

#IfMissingColumn form_encounter service_type
ALTER TABLE form_encounter ADD service_type INT DEFAULT NULL  AFTER `priority`;
#EndIf


#IfNotTable encounter_reasoncode_map
CREATE TABLE encounter_reasoncode_map (
event_id INT(6),
option_id  INT(6) UNSIGNED
);
#EndIf

ALTER TABLE form_encounter MODIFY COLUMN priority INT DEFAULT 1;
ALTER TABLE `openemr_postcalendar_events` MODIFY COLUMN `pc_priority` INT NOT NULL DEFAULT 1;
ALTER TABLE `fhir_rest_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

#IfNotTable event_codeReason_map
CREATE TABLE `event_codeReason_map` (
  `event_id` int(11) NOT NULL,
  `option_id` varchar(100) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE event_codeReason_map ADD PRIMARY KEY (event_id, option_id);
#EndIf

#IfTable event_codeReason_map
ALTER TABLE event_codeReason_map DROP PRIMARY KEY;
ALTER TABLE event_codeReason_map ADD PRIMARY KEY (event_id, option_id);
#EndIf

ALTER TABLE `fhir_value_sets` CHANGE `active` `status` ENUM('active', 'retired') NOT NULL DEFAULT 'active';

ALTER TABLE `openemr_postcalendar_events` CHANGE
`pc_healthcare_service_id` `pc_healthcare_service_id` INT NULL DEFAULT NULL COMMENT 'fhir_healthcare_services.id';

ALTER TABLE `fhir_healthcare_services` CHANGE
`providedBy` `providedBy` INT NULL DEFAULT NULL COMMENT 'facility.id';
