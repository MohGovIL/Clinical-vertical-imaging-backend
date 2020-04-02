-- Queries for imaging vertical - settup and data

INSERT INTO `list_options` (`list_id`, `option_id`, `title`, `seq`, `is_default`, `option_value`, `mapping`, `notes`, `codes`, `toggle_setting_1`, `toggle_setting_2`, `activity`, `subtype`, `edit_options`, `timestamp`) VALUES ('apps', 'react-dev', '../client-app/dev-mode/build', '100', '1', '0', '', NULL, '', '0', '0', '1', '', '1', '2017-07-23 09:33:02');
UPDATE globals SET gl_value = 'style_clinikal_generic.css' WHERE gl_name = 'css_header';
UPDATE globals SET gl_value = '1' WHERE gl_name = 'rest_api';
INSERT INTO `modules` (`mod_id`, `mod_name`, `mod_directory`, `mod_parent`, `mod_type`, `mod_active`, `mod_ui_name`, `mod_relative_link`, `mod_ui_order`, `mod_ui_active`, `mod_description`, `mod_nick_name`, `mod_enc_menu`, `permissions_item_table`, `directory`, `date`, `sql_run`, `type`) VALUES (NULL, 'ClinikalAPI', 'ClinikalAPI', '', '', '1', 'ClinikalAPI', '', '15', '0', '', '', '', NULL, '', '2019-12-04 00:26:40', '1', '1');
INSERT INTO `modules` (`mod_id`, `mod_name`, `mod_directory`, `mod_parent`, `mod_type`, `mod_active`, `mod_ui_name`, `mod_relative_link`, `mod_ui_order`, `mod_ui_active`, `mod_description`, `mod_nick_name`, `mod_enc_menu`, `permissions_item_table`, `directory`, `date`, `sql_run`, `type`) VALUES (NULL, 'FhirAPI', 'FhirAPI', '', '', '1', 'FhirAPI', '', '15', '0', '', '', '', NULL, '', '2019-12-04 00:26:40', '1', '1');






-- ----------------------------------------------------------------------------FHIR ----------------------------------------------------------------------

-- Generic queries for fhir api - new tables and generic data
ALTER TABLE `form_encounter` ADD `status` VARCHAR(100) NULL AFTER `parent_encounter_id`, ADD `eid` INT NULL AFTER `status`, ADD `priority` INT DEFAULT 1 AFTER `status`, ADD `service_type` INT DEFAULT NULL AFTER `priority`;

CREATE TABLE `fhir_healthcare_services` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `active` BOOLEAN NOT NULL DEFAULT 1,
    `providedBy` INT NOT NULL,
    `category` INT NOT NULL,
    `type` INT NOT NULL,
    `name` VARCHAR(125) NOT NULL,
    `comment` TEXT,
    `extraDetails` TEXT,
    `availableTime` JSON,
    `notAvailable` JSON,
    `availabilityExceptions` TEXT,
    CONSTRAINT time_json CHECK (Json_valid(`availableTime`)),
    CONSTRAINT tn_avlbl_json CHECK (Json_valid(`notAvailable`)),
    PRIMARY KEY (`id`)
) ENGINE = innodb;



-- fhir routing rest api builders table

 CREATE TABLE `fhir_rest_elements` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `fhir_rest_elements`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `fhir_rest_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

INSERT INTO `fhir_rest_elements` (`name`, `active`) VALUES
('Organization', 1),
('Patient', 1),
('Appointment', 1),
('HealthcareService', 1),
('Encounter', 1),
('ValueSet', 1),
('DocumentReference', 1);

ALTER TABLE facility
ADD active int DEFAULT 1;

CREATE TABLE encounter_reasoncode_map (
eid INT(6) UNSIGNED,
reason_code  INT(6) UNSIGNED
);

-- --------------------------------------------------------------------------END OF FHIR -------------------------------------------------------------

CREATE TABLE `fhir_value_sets` (
    `id` VARCHAR(125) NOT NULL,
    `title` VARCHAR(125) NOT NULL,
    `status` ENUM('active', 'retired') NOT NULL DEFAULT 'active',
    PRIMARY KEY(`id`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE `fhir_value_set_systems` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `vs_id` VARCHAR(125) NOT NULL,
    `system` VARCHAR(125) NOT NULL,
    `type` ENUM('All', 'Partial', 'Exclude', 'Filter') NOT NULL,
    `filter` VARCHAR(125) DEFAULT NULL,
    PRIMARY KEY(`id`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

CREATE TABLE `fhir_value_set_codes` (
    `vss_id` INT NOT NULL,
    `code` VARCHAR(125) NOT NULL,
    PRIMARY KEY(`vss_id`, `code`)
) ENGINE=INNODB DEFAULT CHARSET=UTF8;

INSERT INTO `list_options` (`list_id`, `option_id`, `title`, `seq`, `is_default`, `option_value`, `mapping`, `notes`, `codes`, `toggle_setting_1`, `toggle_setting_2`, `activity`, `subtype`, `edit_options`) VALUES
('lists', 'clinikal_service_categories', 'Clinikal Service Categories', 0, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_service_categories', '30', 'Specialist Radiology/Imaging', 10, 0, 0, '', '', '', 0, 0, 1, '', 1);

INSERT INTO `list_options` (`list_id`, `option_id`, `title`, `seq`, `is_default`, `option_value`, `mapping`, `notes`, `codes`, `toggle_setting_1`, `toggle_setting_2`, `activity`, `subtype`, `edit_options`) VALUES
('lists', 'clinikal_service_types', 'Clinikal Service Types', 0, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_service_types', '1', 'Ultrasound', 10, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_service_types', '2', 'Mammography', 20, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_service_types', '3', 'X-ray', 30, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_service_types', '4', 'CT', 40, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_service_types', '5', 'MRI', 50, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_service_types', '6', 'Cardiology', 60, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_service_types', '7', 'Biopsy', 15, 0, 0, '', '', '', 0, 0, 1, '', 1);

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

INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('service_types', 'Service Types');
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`) VALUES ('service_types', 'clinikal_service_types', 'All');

INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('reason_codes_1', 'Ultrasound Reason Codes');
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`, `filter`) VALUES ('reason_codes_1', 'clinikal_reason_codes', 'Filter', '1');
INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('reason_codes_2', 'Mammography Reason Codes');
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`, `filter`) VALUES ('reason_codes_2', 'clinikal_reason_codes', 'Filter', '2');
INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('reason_codes_3', 'X-ray Reason Codes');
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`, `filter`) VALUES ('reason_codes_3', 'clinikal_reason_codes', 'Filter', '3');
INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('reason_codes_4', 'CT Reason Codes');
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`, `filter`) VALUES ('reason_codes_4', 'clinikal_reason_codes', 'Filter', '4');
INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('reason_codes_5', 'MRI Reason Codes');
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`, `filter`) VALUES ('reason_codes_5', 'clinikal_reason_codes', 'Filter', '5');
INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('reason_codes_6', 'Cardiology Reason Codes');
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`, `filter`) VALUES ('reason_codes_6', 'clinikal_reason_codes', 'Filter', '6');
INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('reason_codes_7', 'Biopsy Reason Codes');
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`, `filter`) VALUES ('reason_codes_7', 'clinikal_reason_codes', 'Filter', '7');

INSERT INTO `list_options` (`list_id`, `option_id`, `title`, `seq`, `is_default`, `option_value`, `mapping`, `notes`, `codes`, `toggle_setting_1`, `toggle_setting_2`, `activity`, `subtype`, `edit_options`) VALUES
('lists', 'clinikal_enc_statuses', 'Clinikal Encounter Statuses', 0, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_enc_statuses', 'planned', 'Planned', 10, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_enc_statuses', 'arrived', 'Admitted', 20, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_enc_statuses', 'triaged', 'Triaged', 30, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_enc_statuses', 'in-progress', 'In Progress', 40, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_enc_statuses', 'waiting-for-results', 'Waiting For Results', 50, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_enc_statuses', 'finished', 'Finished', 60, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_enc_statuses', 'cancelled', 'Cancelled', 15, 0, 0, '', '', '', 0, 0, 1, '', 1);

INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('encounter_statuses', 'Encounter Statuses');
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`) VALUES ('encounter_statuses', 'clinikal_enc_statuses', 'All');

INSERT INTO `list_options` (`list_id`, `option_id`, `title`, `seq`, `is_default`, `option_value`, `mapping`, `notes`, `codes`, `toggle_setting_1`, `toggle_setting_2`, `activity`, `subtype`, `edit_options`) VALUES
('lists', 'clinikal_app_statuses', 'Clinikal Appointment Statuses', 0, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_app_statuses', 'pending', 'Pending Approval', 10, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_app_statuses', 'booked', 'Booked', 20, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_app_statuses', 'arrived', 'Arrived', 30, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_app_statuses', 'cancelled', 'Cancelled', 40, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_app_statuses', 'noshow', 'No Show', 50, 0, 0, '', '', '', 0, 0, 1, '', 1),
('clinikal_app_statuses', 'waitlist', 'Waitlisted', 60, 0, 0, '', '', '', 0, 0, 1, '', 1);

INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('appointment_statuses', 'Appointment Statuses');
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`) VALUES ('appointment_statuses', 'clinikal_app_statuses', 'All');

INSERT INTO `fhir_value_sets` (`id`, `title`) VALUES ('patient_tracking_statuses', 'Appointment Statuses For Patients Tracking');
INSERT INTO `fhir_value_set_systems` (`vs_id`, `system`, `type`) VALUES ('patient_tracking_statuses', 'clinikal_app_statuses', 'Partial');
INSERT INTO `fhir_value_set_codes` (`vss_id`, `code`) VALUES
(LAST_INSERT_ID(), 'pending'),
(LAST_INSERT_ID(), 'booked'),
(LAST_INSERT_ID(), 'cancelled'),
(LAST_INSERT_ID(), 'noshow');

ALTER TABLE `openemr_postcalendar_events`
ADD `pc_priority` INT NOT NULL DEFAULT '1' AFTER `pc_gid`,
ADD `pc_service_type` INT NULL DEFAULT NULL AFTER `pc_priority`,
ADD `pc_healthcare_service_id` INT NULL DEFAULT NULL AFTER `pc_service_type`;


CREATE TABLE `event_codeReason_map` (
  `event_id` int(11) NOT NULL,
  `option_id` varchar(100) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE event_codeReason_map ADD PRIMARY KEY (event_id, option_id);

ALTER TABLE `openemr_postcalendar_events` CHANGE
`pc_healthcare_service_id` `pc_healthcare_service_id` INT NULL DEFAULT NULL COMMENT 'fhir_healthcare_services.id';


ALTER TABLE `fhir_healthcare_services` CHANGE
`providedBy` `providedBy` INT NULL DEFAULT NULL COMMENT 'facility.id';

CREATE TABLE `related_person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) DEFAULT NULL,
  `identifier_type` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pid` bigint(20) NOT NULL,
  `relationship` varchar(255) DEFAULT NULL,
  `phone_home` varchar(255) DEFAULT NULL,
  `phone_cell` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `fhir_rest_elements` (`id`, `name`, `active`) VALUES (NULL, 'RelatedPerson', '1');

ALTER TABLE `form_encounter` ADD `escort_id` BIGINT(20) NULL DEFAULT NULL COMMENT 'related_person.id' AFTER `service_type`;


REPLACE INTO `facility` (`id`, `name`, `phone`, `fax`, `street`, `city`, `state`, `postal_code`, `country_code`, `federal_ein`, `website`, `email`, `service_location`, `billing_location`, `accepts_assignment`, `pos_code`, `x12_sender_id`, `attn`, `domain_identifier`, `facility_npi`, `tax_id_type`, `color`, `primary_business_entity`, `facility_code`, `extra_validation`, `facility_taxonomy`, `mail_street`, `mail_street2`, `mail_city`, `mail_state`, `mail_zip`, `oid`, `iban`, `info`, `active`)
VALUES
('5', 'כללית', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '1', '0', '0', '71', NULL, NULL, NULL, NULL, '', '#91AFFF', '0', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1'),
('6', 'מכבי', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '1', '0', '0', '71', NULL, NULL, NULL, NULL, '', '#92AFFF', '0', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1'),
('7', 'מאוחדת', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '1', '0', '0', '71', NULL, NULL, NULL, NULL, '', '#93AFFF', '0', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1'),
('8', 'לאומית', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '1', '0', '0', '71', NULL, NULL, NULL, NULL, '', '#94AFFF', '0', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1'),
('9', 'צה"ל', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '1', '0', '0', '71', NULL, NULL, NULL, NULL, '', '#95AFFF', '0', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '1');

UPDATE `list_options` SET `option_id` = '5' WHERE `list_options`.`list_id` = 'mh_ins_organizations' AND `list_options`.`option_id` = 'hmo_1';
UPDATE `list_options` SET `option_id` = '6' WHERE `list_options`.`list_id` = 'mh_ins_organizations' AND `list_options`.`option_id` = 'hmo_2';
UPDATE `list_options` SET `option_id` = '7' WHERE `list_options`.`list_id` = 'mh_ins_organizations' AND `list_options`.`option_id` = 'hmo_3';
UPDATE `list_options` SET `option_id` = '8' WHERE `list_options`.`list_id` = 'mh_ins_organizations' AND `list_options`.`option_id` = 'hmo_4';

INSERT INTO `list_options` (`list_id`, `option_id`, `title`, `seq`, `is_default`, `option_value`, `notes`,`activity`)
VALUES
('mh_ins_organizations', 'idf', 'IDF', '0', '0', '0','' ,'1');

ALTER TABLE facility AUTO_INCREMENT = 17;


INSERT INTO `fhir_rest_elements` ( `name`, `active`) VALUES ( 'Questionnaire', '1');
INSERT INTO `fhir_rest_elements` (`name`, `active`) VALUES ('QuestionnaireResponse', '1');

CREATE TABLE form_commitment_questionnaire(
    id bigint(20) NOT NULL AUTO_INCREMENT,
    encounter varchar(255) DEFAULT NULL,
    form_id bigint(20) NOT NULL,
    question_id int(11) NOT NULL,
    answer text,
    PRIMARY KEY (`id`)
);

ALTER TABLE `form_commitment_questionnaire` ADD UNIQUE `unique_index`( `form_id`, `question_id`);


CREATE TABLE questionnaires_schemas(
    qid int(11) NOT NULL AUTO_INCREMENT,
    form_name varchar(255) NOT NULL,
    form_table varchar(255) NOT NULL,
    column_name varchar(255) NOT NULL,
    column_type varchar(255) NOT NULL,
    question varchar(255) DEFAULT NULL,
    PRIMARY KEY (`qid`)
);


INSERT INTO `questionnaires_schemas` (`qid`, `form_name`,`form_table`, `column_type`, `question`)
VALUES
('1', 'commitment_questionnaire','form_commitment_questionnaire', 'integer', 'Commitment number'),
('2', 'commitment_questionnaire','form_commitment_questionnaire', 'date', 'Commitment date'),
('3', 'commitment_questionnaire','form_commitment_questionnaire', 'date', 'Commitment expiration date'),
('4', 'commitment_questionnaire','form_commitment_questionnaire', 'integer', 'Signing doctor'),
('5', 'commitment_questionnaire','form_commitment_questionnaire', 'integer', 'doctor license number');


CREATE TABLE `questionnaire_response`(
    id bigint(20) NOT NULL AUTO_INCREMENT,
    form_name varchar(255) NOT NULL,
    encounter bigint(20) NOT NULL,
    subject bigint(20) NOT NULL,
    subject_type VARCHAR(255) NOT NULL DEFAULT 'Patient',
    create_date datetime DEFAULT current_timestamp,
    update_date datetime DEFAULT current_timestamp,
    create_by bigint(20) NOT NULL,
    update_by bigint(20) NOT NULL,
    source  bigint(20) NOT NULL,
    source_type VARCHAR(255) NOT NULL DEFAULT 'Patient',
    status  varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
);


INSERT INTO `registry` (`name`, `state`, `directory`, `sql_run`, `unpackaged`, `date`, `priority`, `category`, `nickname`, `patient_encounter`, `therapy_group_encounter`, `aco_spec`) VALUES
('Commitment questionnaire', 1, 'commitment_questionnaire', 1, 1, '2020-03-14 00:00:00', 0, 'Clinical', '', 0, 0, 'encounters|notes');



INSERT INTO `fhir_rest_elements` (`name`, `active`) VALUES ('Practitioner', 1);




DELETE FROM `list_options` WHERE `list_id` like "userlist3";
INSERT INTO `list_options` (`list_id`, `option_id`, `title`, `seq`, `is_default`, `option_value`, `notes`,`activity`)
VALUES
('userlist3', 'teudat_zehut', 'Teudat zehut', '10', '1', '0','','1'),
('userlist3', 'passport', 'Passport', '20', '0', '0','', '1'),
('userlist3', 'temporary', 'Temporary', '30', '0', '0','' ,'1');



DELETE FROM `list_options` WHERE `list_id` like "sex";
INSERT INTO `list_options` (`list_id`, `option_id`, `title`, `seq`, `is_default`, `option_value`, `notes`,`activity`)
VALUES
('sex', 'male', 'Male', '10', '1', '0','','1'),
('sex', 'female', 'Female', '20', '0', '0','', '1'),
('sex', 'other', 'Other', '30', '0', '0','', '1'),
('sex', 'unknown', 'Unknown', '40', '0', '0','' ,'0');



