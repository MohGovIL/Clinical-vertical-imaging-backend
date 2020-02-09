


--
-- Dumping data for table `facility`

REPLACE INTO `facility` (`id`, `name`, `phone`, `fax`, `street`, `city`, `state`, `postal_code`, `country_code`, `federal_ein`, `website`, `email`, `service_location`, `billing_location`, `accepts_assignment`, `pos_code`, `x12_sender_id`, `attn`, `domain_identifier`, `facility_npi`, `tax_id_type`, `color`, `primary_business_entity`, `facility_code`, `extra_validation`, `facility_taxonomy`, `mail_street`, `mail_street2`, `mail_city`, `mail_state`, `mail_zip`, `oid`, `iban`, `info`) VALUES
(3, 'מרפאת תל אביב', '000-000-0000', '000-000-0000', '', '', '', '', '', '', '', '', 1, 1, 0, 1, '', '', '', '', 'EI', '#99FFFF', 0, '', 1, '', '', '', '', '', '', '', '', ''),
(4, 'מרפאת חיפה', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 1, NULL, '', '', '', 'EI', '#FFFF66', 0, '', 1, '', '', '', '', '', '', '', '', '');

--
--
-- Dumping data for table `fhir_healthcare_services`

INSERT INTO `fhir_healthcare_services` (`id`, `active`, `providedBy`, `category`, `type`, `name`, `comment`, `extraDetails`, `availableTime`, `notAvailable`, `availabilityExceptions`) VALUES
(1, 1, 3, 30, 1, 'אולטראסונד תל אביב', NULL, NULL, NULL, NULL, NULL),
(2, 1, 3, 30, 2, 'ממוגרפיה תל אביב', NULL, NULL, NULL, NULL, NULL),
(3, 1, 3, 30, 3, 'אולטראסונד תל אביב', NULL, NULL, NULL, NULL, NULL),
(4, 1, 3, 30, 4, 'CT תל אביב', NULL, NULL, NULL, NULL, NULL),
(5, 1, 3, 30, 5, 'MRI תל אביב', NULL, NULL, NULL, NULL, NULL),
(6, 1, 3, 30, 6, 'קרדיולוגיה תל אביב', NULL, NULL, NULL, NULL, NULL),
(7, 1, 4, 30, 2, 'ממוגרפיה חיפה', NULL, NULL, NULL, NULL, NULL),
(8, 1, 3, 30, 5, 'MRI חיפה', NULL, NULL, NULL, NULL, NULL);
