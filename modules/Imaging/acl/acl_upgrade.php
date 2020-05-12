<?php
// Ensure this script is not called separately
if ((empty($_SESSION['acl_setup_unique_id'])) ||
    (empty($unique_id)) ||
    ($unique_id != $_SESSION['acl_setup_unique_id'])) {
    die('Authentication Error');
}
unset($_SESSION['acl_setup_unique_id']);

use OpenEMR\Common\Acl\AclExtended;

return $ACL_UPGRADE = array(

    '0.1.0' => function () {



        AclExtended::addNewACL('Imaging Technician', 'imaging_technician', 'write', 'Things that imaging technician can modify');
        AclExtended::addNewACL('Imaging Technician', 'imaging_technician', 'view', 'Things that imaging technician can read but not modify');
        AclExtended::addNewACL('Imaging doctor', 'imaging_doctor', 'write', 'Things that imaging doctor can modify');
        AclExtended::addNewACL('Imaging doctor', 'imaging_doctor', 'view', 'Things that imaging doctor can read but not modify');
        AclExtended::addNewACL('Imaging manager', 'imaging_clinic_manager', 'write', 'Things that imaging clinic manager can modify');
        AclExtended::addNewACL('Imaging manager', 'imaging_clinic_manager', 'view', 'Things that imaging clinic manager can read but not modify');
        AclExtended::addNewACL('Imaging representative', 'imaging_call_center_representative', 'write', 'Things that imaging call center representative can modify');
        AclExtended::addNewACL('Imaging representative', 'imaging_call_center_representative', 'view', 'Things that imaging call center representative can read but not modify');
        AclExtended::addNewACL('Imaging receptionist', 'imaging_receptionist', 'write', 'Things that imaging receptionist can modify');
        AclExtended::addNewACL('Imaging receptionist', 'imaging_receptionist', 'view', 'Things that imaging receptionist can read but not modify');


        $admin_write  = AclExtended::getAclIdNumber('Administrators', 'write');

        $imaging_technician_view  = AclExtended::getAclIdNumber('Imaging Technician', 'view');
        $imaging_technician_write  = AclExtended::getAclIdNumber('Imaging Technician', 'write');

        $imaging_doctor_view  = AclExtended::getAclIdNumber('Imaging doctor', 'view');
        $imaging_doctor_write  = AclExtended::getAclIdNumber('Imaging doctor', 'write');

        $imaging_clinic_manager_view  = AclExtended::getAclIdNumber('Imaging manager', 'view');
        $imaging_clinic_manager_write  = AclExtended::getAclIdNumber('Imaging manager', 'write');

        $imaging_call_center_representative_view  = AclExtended::getAclIdNumber('Imaging representative', 'view');
        $imaging_call_center_representative_write  = AclExtended::getAclIdNumber('Imaging representative', 'write');

        $imaging_receptionist_view  = AclExtended::getAclIdNumber('Imaging receptionist', 'view');
        $imaging_receptionist_write  = AclExtended::getAclIdNumber('Imaging receptionist', 'write');



        //using BY https://matrixil.sharepoint.com/:x:/r/sites/DTG/Clinical/_layouts/15/Doc.aspx?sourcedoc=%7B49114388-8709-407B-BF08-8E8F26C8119F%7D&file=%D7%A7%D7%9C%D7%99%D7%A0%D7%99%D7%A7%D7%9C%20%D7%93%D7%99%D7%9E%D7%95%D7%AA%20-%20%D7%94%D7%A8%D7%A9%D7%90%D7%95%D7%AA%20%D7%9C%D7%A4%D7%99%20%D7%AA%D7%A4%D7%A7%D7%99%D7%93%D7%99%D7%9D%20%D7%92%D7%A8%D7%A1%D7%94%201.xlsx&action=default&mobileredirect=true&cid=6559357a-ef09-499a-b410-0a6b0078e2e7
        //OBJECT OF ACL
        AclExtended::addObjectSectionAcl('client_app', 'Client Application');
        AclExtended::addObjectAcl('client_app', 'Client Application', 'PatientTrackingInvited','Patient Tracking Invited');
        AclExtended::addObjectAcl('client_app', 'Client Application', 'PatientTrackingWaitingForExamination','Patient Tracking Waiting for Examination');
        AclExtended::addObjectAcl('client_app', 'Client Application', 'PatientTrackingWaitingForDecoding','Patient Tracking Waiting for Decoding');
        AclExtended::addObjectAcl('client_app', 'Client Application', 'PatientTrackingFinished','Patient Tracking Finished');
        AclExtended::addObjectAcl('client_app', 'Client Application', 'PatientAdmission','Patient Admission');
        AclExtended::addObjectAcl('client_app', 'Client Application', 'AddPatient','Add Patient');
        AclExtended::addObjectAcl('client_app', 'Client Application', 'AppointmentsAndEncounters','Appointments And Encounters');
        AclExtended::addObjectAcl('client_app', 'Client Application', 'EncounterSheet','Encounter Sheet');
        AclExtended::addObjectAcl('client_app', 'Client Application', 'SuperUser','Super User');


        AclExtended::updateAcl($admin_write, 'Administrators', 'client_app', 'Client Application', 'SuperUser','Super User', 'write');


        //ADMIN ACL
        /*  AclExtended::updateAcl($admin_write, 'Administrators', 'client_app', 'Client Application', 'PatientTrackingInvited','Patient Tracking Invited', 'write');
          AclExtended::updateAcl($admin_write, 'Administrators', 'client_app', 'Client Application', 'PatientTrackingWaitingForExamination','Patient Tracking Waiting for Examination', 'write');
          AclExtended::updateAcl($admin_write, 'Administrators', 'client_app', 'Client Application', 'PatientTrackingWaitingForDecoding','Patient Tracking Waiting for Decoding', 'write');
          AclExtended::updateAcl($admin_write, 'Administrators', 'client_app', 'Client Application', 'PatientTrackingFinished','Patient Tracking Finished', 'write');
          AclExtended::updateAcl($admin_write, 'Administrators', 'client_app', 'Client Application', 'PatientAdmission','Patient Admission', 'write');
          AclExtended::updateAcl($admin_write, 'Administrators', 'client_app', 'Client Application', 'AddPatient','Add Patient', 'write');
          AclExtended::updateAcl($admin_write , 'Administrators', 'client_app', 'Client Application', 'AppointmentsAndEncounters','Appointments And Encounters', 'view');
          AclExtended::updateAcl($admin_write, 'Administrators', 'client_app', 'Client Application', 'EncounterSheet','Encounter Sheet', 'write');*/


        //Receptionist ACL
        AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'client_app', 'Client Application', 'PatientTrackingInvited','Patient Tracking Invited', 'write');
        AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'client_app', 'Client Application', 'PatientTrackingWaitingForExamination','Patient Tracking Waiting for Examination', 'write');
        AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'client_app', 'Client Application', 'PatientTrackingWaitingForDecoding','Patient Tracking Waiting for Decoding', 'write');
        AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'client_app', 'Client Application', 'PatientTrackingFinished','Patient Tracking Finished', 'write');
        AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'client_app', 'Client Application', 'PatientAdmission','Patient Admission', 'write');
        AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'client_app', 'Client Application', 'AddPatient','Add Patient', 'write');
        AclExtended::updateAcl($imaging_receptionist_view,  'Imaging receptionist', 'client_app', 'Client Application', 'AppointmentsAndEncounters','Appointments And Encounters', 'view');
        AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'client_app', 'Client Application', 'EncounterSheet','Encounter Sheet', 'write');

        //Clinic manager ACL
        AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'client_app', 'Client Application', 'PatientTrackingInvited','Patient Tracking Invited', 'write');
        AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'client_app', 'Client Application', 'PatientTrackingWaitingForExamination','Patient Tracking Waiting for Examination', 'write');
        AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'client_app', 'Client Application', 'PatientTrackingWaitingForDecoding','Patient Tracking Waiting for Decoding', 'write');
        AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'client_app', 'Client Application', 'PatientTrackingFinished','Patient Tracking Finished', 'write');
        AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'client_app', 'Client Application', 'PatientAdmission','Patient Admission', 'write');
        AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'client_app', 'Client Application', 'AddPatient','Add Patient', 'write');
        AclExtended::updateAcl($imaging_clinic_manager_view,  'Imaging manager', 'client_app', 'Client Application', 'AppointmentsAndEncounters','Appointments And Encounters', 'view');
        AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'client_app', 'Client Application', 'EncounterSheet','Encounter Sheet', 'write');

        //Clinic manager ACL
        //AclExtended::updateAcl($imaging_technician_write, 'Imaging Technician', 'client_app', 'Client Application', 'PatientTrackingInvited','Patient Tracking Invited', 'write');
        AclExtended::updateAcl($imaging_technician_write, 'Imaging Technician', 'client_app', 'Client Application', 'PatientTrackingWaitingForExamination','Patient Tracking Waiting for Examination', 'write');
        AclExtended::updateAcl($imaging_technician_write, 'Imaging Technician', 'client_app', 'Client Application', 'PatientTrackingWaitingForDecoding','Patient Tracking Waiting for Decoding', 'write');
        //AclExtended::updateAcl($imaging_technician_write, 'Imaging Technician', 'client_app', 'Client Application', 'PatientTrackingFinished','Patient Tracking Finished', 'write');
        //AclExtended::updateAcl($imaging_technician_write, 'Imaging Technician', 'client_app', 'Client Application', 'PatientAdmission','Patient Admission', 'write');
        //AclExtended::updateAcl($imaging_technician_write, 'Imaging Technician', 'client_app', 'Client Application', 'AddPatient','Add Patient', 'write');
        AclExtended::updateAcl($imaging_technician_view,  'Imaging Technician', 'client_app', 'Client Application', 'AppointmentsAndEncounters','Appointments And Encounters', 'view');
        AclExtended::updateAcl($imaging_technician_write, 'Imaging Technician', 'client_app', 'Client Application', 'EncounterSheet','Encounter Sheet', 'write');

        //Doctor ACL
        //AclExtended::updateAcl($imaging_doctor_write, 'Imaging doctor', 'client_app', 'Client Application', 'PatientTrackingInvited','Patient Tracking Invited', 'write');
        //AclExtended::updateAcl($imaging_doctor_write, 'Imaging doctor', 'client_app', 'Client Application', 'PatientTrackingWaitingForExamination','Patient Tracking Waiting for Examination', 'write');
        AclExtended::updateAcl($imaging_doctor_write, 'Imaging doctor', 'client_app', 'Client Application', 'PatientTrackingWaitingForDecoding','Patient Tracking Waiting for Decoding', 'write');
        AclExtended::updateAcl($imaging_doctor_write, 'Imaging doctor', 'client_app', 'Client Application', 'PatientTrackingFinished','Patient Tracking Finished', 'write');
        //AclExtended::updateAcl($imaging_doctor_write, 'Imaging doctor', 'client_app', 'Client Application', 'PatientAdmission','Patient Admission', 'write');
        //AclExtended::updateAcl($imaging_doctor_write, 'Imaging doctor', 'client_app', 'Client Application', 'AddPatient','Add Patient', 'write');
        AclExtended::updateAcl($imaging_doctor_view,  'Imaging doctor', 'client_app', 'Client Application', 'AppointmentsAndEncounters','Appointments And Encounters', 'view');
        AclExtended::updateAcl($imaging_doctor_write, 'Imaging doctor', 'client_app', 'Client Application', 'EncounterSheet','Encounter Sheet', 'write');

        //Clinic manager ACL
        //AclExtended::updateAcl($imaging_call_center_representative_write, 'Imaging representative', 'client_app', 'Client Application', 'PatientTrackingInvited','Patient Tracking Invited', 'write');
        //AclExtended::updateAcl($imaging_call_center_representative_write, 'Imaging representative', 'client_app', 'Client Application', 'PatientTrackingWaitingForExamination','Patient Tracking Waiting for Examination', 'write');
        //AclExtended::updateAcl($imaging_call_center_representative_write, 'Imaging representative', 'client_app', 'Client Application', 'PatientTrackingWaitingForDecoding','Patient Tracking Waiting for Decoding', 'write');
        //AclExtended::updateAcl($imaging_call_center_representative_write, 'Imaging representative', 'client_app', 'Client Application', 'PatientTrackingFinished','Patient Tracking Finished', 'write');
        //AclExtended::updateAcl($imaging_call_center_representative_write, 'Imaging representative', 'client_app', 'Client Application', 'PatientAdmission','Patient Admission', 'write');
        AclExtended::updateAcl($imaging_call_center_representative_write, 'Imaging representative', 'client_app', 'Client Application', 'AddPatient','Add Patient', 'write');
        AclExtended::updateAcl($imaging_call_center_representative_view,  'Imaging representative', 'client_app', 'Client Application', 'AppointmentsAndEncounters','Appointments And Encounters', 'view');
        //AclExtended::updateAcl($imaging_call_center_representative_write, 'Imaging representative', 'client_app', 'Client Application', 'EncounterSheet','Encounter Sheet', 'write');


        AclExtended::addObjectSectionAcl('fhir_api', 'FHIR API');
        AclExtended::addObjectAcl('fhir_api', 'FHIR API', 'patient','Patient');
        AclExtended::addObjectAcl('fhir_api', 'FHIR API', 'appointment','Appointment');
        AclExtended::addObjectAcl('fhir_api', 'FHIR API', 'encounter','Encounter');
        AclExtended::addObjectAcl('fhir_api', 'FHIR API', 'practitioner','Practitioner');
        AclExtended::addObjectAcl('fhir_api', 'FHIR API', 'organization','Organization');
        AclExtended::addObjectAcl('fhir_api', 'FHIR API', 'healthcareservice','Healthcareb Service');
        AclExtended::addObjectAcl('fhir_api', 'FHIR API', 'valueset','Value Set');
        AclExtended::addObjectAcl('fhir_api', 'FHIR API', 'relatedperson','Related Person');
        AclExtended::addObjectAcl('fhir_api', 'FHIR API', 'documentreference','Document Reference');
        AclExtended::addObjectAcl('fhir_api', 'FHIR API', 'questionnaire','Questionnaire');
        AclExtended::addObjectAcl('fhir_api', 'FHIR API', 'questionnaireresponse','Questionnaire Response');



        AclExtended::updateAcl($admin_write, 'Administrators', 'fhir_api', 'FHIR API', 'patient','Patient', 'write');
        AclExtended::updateAcl($admin_write, 'Administrators', 'fhir_api', 'FHIR API', 'appointment','Appointment', 'write');
        AclExtended::updateAcl($admin_write, 'Administrators', 'fhir_api', 'FHIR API', 'encounter','Encounter', 'write');
        //AclExtended::updateAcl($admin_write, 'Administrators', 'fhir_api', 'FHIR API', 'practitioner','Practitioner', 'write');
        //AclExtended::updateAcl($admin_write, 'Administrators', 'fhir_api', 'FHIR API', 'organization','Organization', 'write');
        //AclExtended::updateAcl($admin_write, 'Administrators', 'fhir_api', 'FHIR API', 'healthcareservice','Healthcareb Service', 'write');
        AclExtended::updateAcl($admin_write, 'Administrators', 'fhir_api', 'FHIR API', 'valueset','Value Set', 'write');
        AclExtended::updateAcl($admin_write, 'Administrators', 'fhir_api', 'FHIR API', 'relatedperson','Related Person', 'write');
        AclExtended::updateAcl($admin_write, 'Administrators', 'fhir_api', 'FHIR API', 'documentreference','Document Reference', 'write');
        AclExtended::updateAcl($admin_write, 'Administrators', 'fhir_api', 'FHIR API', 'questionnaire','Questionnaire', 'write');
        AclExtended::updateAcl($admin_write, 'Administrators', 'fhir_api', 'FHIR API', 'questionnaireresponse','Questionnaire Response', 'write');

        AclExtended::updateAcl($admin_write,  'Administrators', 'fhir_api', 'FHIR API', 'patient','Patient', 'view');
        AclExtended::updateAcl($admin_write,  'Administrators', 'fhir_api', 'FHIR API', 'appointment','Appointment', 'view');
        AclExtended::updateAcl($admin_write,  'Administrators', 'fhir_api', 'FHIR API', 'encounter','Encounter', 'view');
        AclExtended::updateAcl($admin_write,  'Administrators', 'fhir_api', 'FHIR API', 'practitioner','Practitioner', 'view');
        AclExtended::updateAcl($admin_write,  'Administrators', 'fhir_api', 'FHIR API', 'organization','Organization', 'view');
        AclExtended::updateAcl($admin_write,  'Administrators', 'fhir_api', 'FHIR API', 'healthcareservice','Healthcareb Service', 'view');
        AclExtended::updateAcl($admin_write,  'Administrators', 'fhir_api', 'FHIR API', 'valueset','Value Set', 'view');
        AclExtended::updateAcl($admin_write,  'Administrators', 'fhir_api', 'FHIR API', 'relatedperson','Related Person', 'view');
        AclExtended::updateAcl($admin_write,  'Administrators', 'fhir_api', 'FHIR API', 'documentreference','Document Reference', 'view');
        AclExtended::updateAcl($admin_write,  'Administrators', 'fhir_api', 'FHIR API', 'questionnaire','Questionnaire', 'view');
        AclExtended::updateAcl($admin_write,  'Administrators', 'fhir_api', 'FHIR API', 'questionnaireresponse','Questionnaire Response', 'view');

        /**********************************************************/

        AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'fhir_api', 'FHIR API', 'patient','Patient', 'write');
        AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'fhir_api', 'FHIR API', 'appointment','Appointment', 'write');
        AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'fhir_api', 'FHIR API', 'encounter','Encounter', 'write');
        //AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'fhir_api', 'FHIR API', 'practitioner','Practitioner', 'write');
        //AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'fhir_api', 'FHIR API', 'organization','Organization', 'write');
        //AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'fhir_api', 'FHIR API', 'healthcareservice','Healthcareb Service', 'write');
        AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'fhir_api', 'FHIR API', 'valueset','Value Set', 'write');
        AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'fhir_api', 'FHIR API', 'relatedperson','Related Person', 'write');
        AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'fhir_api', 'FHIR API', 'documentreference','Document Reference', 'write');
        AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'fhir_api', 'FHIR API', 'questionnaire','Questionnaire', 'write');
        AclExtended::updateAcl($imaging_receptionist_write, 'Imaging receptionist', 'fhir_api', 'FHIR API', 'questionnaireresponse','Questionnaire Response', 'write');

        AclExtended::updateAcl($imaging_receptionist_view,  'Imaging receptionist', 'fhir_api', 'FHIR API', 'patient','Patient', 'view');
        AclExtended::updateAcl($imaging_receptionist_view,  'Imaging receptionist', 'fhir_api', 'FHIR API', 'appointment','Appointment', 'view');
        AclExtended::updateAcl($imaging_receptionist_view,  'Imaging receptionist', 'fhir_api', 'FHIR API', 'encounter','Encounter', 'view');
        AclExtended::updateAcl($imaging_receptionist_view,  'Imaging receptionist', 'fhir_api', 'FHIR API', 'practitioner','Practitioner', 'view');
        AclExtended::updateAcl($imaging_receptionist_view,  'Imaging receptionist', 'fhir_api', 'FHIR API', 'organization','Organization', 'view');
        AclExtended::updateAcl($imaging_receptionist_view,  'Imaging receptionist', 'fhir_api', 'FHIR API', 'healthcareservice','Healthcareb Service', 'view');
        AclExtended::updateAcl($imaging_receptionist_view,  'Imaging receptionist', 'fhir_api', 'FHIR API', 'valueset','Value Set', 'view');
        AclExtended::updateAcl($imaging_receptionist_view,  'Imaging receptionist', 'fhir_api', 'FHIR API', 'relatedperson','Related Person', 'view');
        AclExtended::updateAcl($imaging_receptionist_view,  'Imaging receptionist', 'fhir_api', 'FHIR API', 'documentreference','Document Reference', 'view');
        AclExtended::updateAcl($imaging_receptionist_view,  'Imaging receptionist', 'fhir_api', 'FHIR API', 'questionnaire','Questionnaire', 'view');
        AclExtended::updateAcl($imaging_receptionist_view,  'Imaging receptionist', 'fhir_api', 'FHIR API', 'questionnaireresponse','Questionnaire Response', 'view');


        /**********************************************************/

        AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'fhir_api', 'FHIR API', 'patient','Patient', 'write');
        AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'fhir_api', 'FHIR API', 'appointment','Appointment', 'write');
        AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'fhir_api', 'FHIR API', 'encounter','Encounter', 'write');
        //AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'fhir_api', 'FHIR API', 'practitioner','Practitioner', 'write');
        //AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'fhir_api', 'FHIR API', 'organization','Organization', 'write');
        //AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'fhir_api', 'FHIR API', 'healthcareservice','Healthcareb Service', 'write');
        AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'fhir_api', 'FHIR API', 'valueset','Value Set', 'write');
        AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'fhir_api', 'FHIR API', 'relatedperson','Related Person', 'write');
        AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'fhir_api', 'FHIR API', 'documentreference','Document Reference', 'write');
        AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'fhir_api', 'FHIR API', 'questionnaire','Questionnaire', 'write');
        AclExtended::updateAcl($imaging_clinic_manager_write, 'Imaging manager', 'fhir_api', 'FHIR API', 'questionnaireresponse','Questionnaire Response', 'write');

        AclExtended::updateAcl($imaging_clinic_manager_view,  'Imaging manager', 'fhir_api', 'FHIR API', 'patient','Patient', 'view');
        AclExtended::updateAcl($imaging_clinic_manager_view,  'Imaging manager', 'fhir_api', 'FHIR API', 'appointment','Appointment', 'view');
        AclExtended::updateAcl($imaging_clinic_manager_view,  'Imaging manager', 'fhir_api', 'FHIR API', 'encounter','Encounter', 'view');
        AclExtended::updateAcl($imaging_clinic_manager_view,  'Imaging manager', 'fhir_api', 'FHIR API', 'practitioner','Practitioner', 'view');
        AclExtended::updateAcl($imaging_clinic_manager_view,  'Imaging manager', 'fhir_api', 'FHIR API', 'organization','Organization', 'view');
        AclExtended::updateAcl($imaging_clinic_manager_view,  'Imaging manager', 'fhir_api', 'FHIR API', 'healthcareservice','Healthcareb Service', 'view');
        AclExtended::updateAcl($imaging_clinic_manager_view,  'Imaging manager', 'fhir_api', 'FHIR API', 'valueset','Value Set', 'view');
        AclExtended::updateAcl($imaging_clinic_manager_view,  'Imaging manager', 'fhir_api', 'FHIR API', 'relatedperson','Related Person', 'view');
        AclExtended::updateAcl($imaging_clinic_manager_view,  'Imaging manager', 'fhir_api', 'FHIR API', 'documentreference','Document Reference', 'view');
        AclExtended::updateAcl($imaging_clinic_manager_view,  'Imaging manager', 'fhir_api', 'FHIR API', 'questionnaire','Questionnaire', 'view');
        AclExtended::updateAcl($imaging_clinic_manager_view,  'Imaging manager', 'fhir_api', 'FHIR API', 'questionnaireresponse','Questionnaire Response', 'view');


        /**********************************************************/

        AclExtended::updateAcl($imaging_doctor_write, 'Imaging doctor', 'fhir_api', 'FHIR API', 'appointment','Appointment', 'write');
        AclExtended::updateAcl($imaging_doctor_write, 'Imaging doctor', 'fhir_api', 'FHIR API', 'encounter','Encounter', 'write');
        //AclExtended::updateAcl($imaging_doctor_write, 'Imaging doctor', 'fhir_api', 'FHIR API', 'practitioner','Practitioner', 'write');
        //AclExtended::updateAcl($imaging_doctor_write, 'Imaging doctor', 'fhir_api', 'FHIR API', 'organization','Organization', 'write');
        //AclExtended::updateAcl($imaging_doctor_write, 'Imaging doctor', 'fhir_api', 'FHIR API', 'healthcareservice','Healthcareb Service', 'write');
        AclExtended::updateAcl($imaging_doctor_write, 'Imaging doctor', 'fhir_api', 'FHIR API', 'valueset','Value Set', 'write');
        AclExtended::updateAcl($imaging_doctor_write, 'Imaging doctor', 'fhir_api', 'FHIR API', 'relatedperson','Related Person', 'write');
        AclExtended::updateAcl($imaging_doctor_write, 'Imaging doctor', 'fhir_api', 'FHIR API', 'documentreference','Document Reference', 'write');
        AclExtended::updateAcl($imaging_doctor_write, 'Imaging doctor', 'fhir_api', 'FHIR API', 'questionnaire','Questionnaire', 'write');
        AclExtended::updateAcl($imaging_doctor_write, 'Imaging doctor', 'fhir_api', 'FHIR API', 'questionnaireresponse','Questionnaire Response', 'write');

        AclExtended::updateAcl($imaging_doctor_view,  'Imaging doctor', 'fhir_api', 'FHIR API', 'appointment','Appointment', 'view');
        AclExtended::updateAcl($imaging_doctor_view,  'Imaging doctor', 'fhir_api', 'FHIR API', 'encounter','Encounter', 'view');
        AclExtended::updateAcl($imaging_doctor_view,  'Imaging doctor', 'fhir_api', 'FHIR API', 'practitioner','Practitioner', 'view');
        AclExtended::updateAcl($imaging_doctor_view,  'Imaging doctor', 'fhir_api', 'FHIR API', 'organization','Organization', 'view');
        AclExtended::updateAcl($imaging_doctor_view,  'Imaging doctor', 'fhir_api', 'FHIR API', 'healthcareservice','Healthcareb Service', 'view');
        AclExtended::updateAcl($imaging_doctor_view,  'Imaging doctor', 'fhir_api', 'FHIR API', 'valueset','Value Set', 'view');
        AclExtended::updateAcl($imaging_doctor_view,  'Imaging doctor', 'fhir_api', 'FHIR API', 'relatedperson','Related Person', 'view');
        AclExtended::updateAcl($imaging_doctor_view,  'Imaging doctor', 'fhir_api', 'FHIR API', 'documentreference','Document Reference', 'view');
        AclExtended::updateAcl($imaging_doctor_view,  'Imaging doctor', 'fhir_api', 'FHIR API', 'questionnaire','Questionnaire', 'view');
        AclExtended::updateAcl($imaging_doctor_view,  'Imaging doctor', 'fhir_api', 'FHIR API', 'questionnaireresponse','Questionnaire Response', 'view');

        /**********************************************************/

        AclExtended::updateAcl($imaging_technician_write, 'Imaging technician', 'fhir_api', 'FHIR API', 'appointment','Appointment', 'write');
        AclExtended::updateAcl($imaging_technician_write, 'Imaging technician', 'fhir_api', 'FHIR API', 'encounter','Encounter', 'write');
        //AclExtended::updateAcl($imaging_technician_write, 'Imaging technician', 'fhir_api', 'FHIR API', 'practitioner','Practitioner', 'write');
        //AclExtended::updateAcl($imaging_technician_write, 'Imaging technician', 'fhir_api', 'FHIR API', 'organization','Organization', 'write');
        //AclExtended::updateAcl($imaging_technician_write, 'Imaging technician', 'fhir_api', 'FHIR API', 'healthcareservice','Healthcareb Service', 'write');
        AclExtended::updateAcl($imaging_technician_write, 'Imaging technician', 'fhir_api', 'FHIR API', 'valueset','Value Set', 'write');
        AclExtended::updateAcl($imaging_technician_write, 'Imaging technician', 'fhir_api', 'FHIR API', 'relatedperson','Related Person', 'write');
        AclExtended::updateAcl($imaging_technician_write, 'Imaging technician', 'fhir_api', 'FHIR API', 'documentreference','Document Reference', 'write');
        AclExtended::updateAcl($imaging_technician_write, 'Imaging technician', 'fhir_api', 'FHIR API', 'questionnaire','Questionnaire', 'write');
        AclExtended::updateAcl($imaging_technician_write, 'Imaging technician', 'fhir_api', 'FHIR API', 'questionnaireresponse','Questionnaire Response', 'write');

        AclExtended::updateAcl($imaging_technician_view,  'Imaging technician', 'fhir_api', 'FHIR API', 'appointment','Appointment', 'view');
        AclExtended::updateAcl($imaging_technician_view,  'Imaging technician', 'fhir_api', 'FHIR API', 'encounter','Encounter', 'view');
        AclExtended::updateAcl($imaging_technician_view,  'Imaging technician', 'fhir_api', 'FHIR API', 'practitioner','Practitioner', 'view');
        AclExtended::updateAcl($imaging_technician_view,  'Imaging technician', 'fhir_api', 'FHIR API', 'organization','Organization', 'view');
        AclExtended::updateAcl($imaging_technician_view,  'Imaging technician', 'fhir_api', 'FHIR API', 'healthcareservice','Healthcareb Service', 'view');
        AclExtended::updateAcl($imaging_technician_view,  'Imaging technician', 'fhir_api', 'FHIR API', 'valueset','Value Set', 'view');
        AclExtended::updateAcl($imaging_technician_view,  'Imaging technician', 'fhir_api', 'FHIR API', 'relatedperson','Related Person', 'view');
        AclExtended::updateAcl($imaging_technician_view,  'Imaging technician', 'fhir_api', 'FHIR API', 'documentreference','Document Reference', 'view');
        AclExtended::updateAcl($imaging_technician_view,  'Imaging technician', 'fhir_api', 'FHIR API', 'questionnaire','Questionnaire', 'view');
        AclExtended::updateAcl($imaging_technician_view,  'Imaging technician', 'fhir_api', 'FHIR API', 'questionnaireresponse','Questionnaire Response', 'view');
        AclExtended::updateAcl($imaging_technician_view,  'Imaging technician', 'fhir_api', 'FHIR API', 'patient','Patient', 'view');
        /**********************************************************/

        AclExtended::updateAcl($imaging_call_center_representative_write, 'Imaging representative', 'fhir_api', 'FHIR API', 'patient','Patient', 'write');
        AclExtended::updateAcl($imaging_call_center_representative_write, 'Imaging representative', 'fhir_api', 'FHIR API', 'appointment','Appointment', 'write');

        AclExtended::updateAcl($imaging_call_center_representative_view,  'Imaging representative', 'fhir_api', 'FHIR API', 'patient','Patient', 'view');
        AclExtended::updateAcl($imaging_call_center_representative_view,  'Imaging representative', 'fhir_api', 'FHIR API', 'appointment','Appointment', 'view');

        /**********************************************************/


        AclExtended::addObjectSectionAcl('clinikal_api', 'Clinikal API');
        AclExtended::addObjectAcl('clinikal_api', 'Clinikal API', 'general_settings','General settings');
        AclExtended::addObjectAcl('clinikal_api', 'Clinikal API', 'lists','Lists');

        AclExtended::updateAcl($admin_write,  'Administrators',                                    'clinikal_api', 'Clinikal API', 'general_settings','General settings', 'view');
        AclExtended::updateAcl($imaging_receptionist_view,  'Imaging receptionist',               'clinikal_api', 'Clinikal API', 'general_settings','General settings', 'view');
        AclExtended::updateAcl($imaging_clinic_manager_view,  'Imaging manager',                  'clinikal_api', 'Clinikal API', 'general_settings','General settings', 'view');
        AclExtended::updateAcl($imaging_doctor_view,  'Imaging doctor',                           'clinikal_api', 'Clinikal API', 'general_settings','General settings', 'view');
        AclExtended::updateAcl($imaging_technician_view,  'Imaging technician',                   'clinikal_api', 'Clinikal API', 'general_settings','General settings', 'view');
        AclExtended::updateAcl($imaging_call_center_representative_view,'Imaging representative', 'clinikal_api', 'Clinikal API', 'general_settings','General settings', 'view');


        AclExtended::updateAcl($admin_write,  'Administrators',                                    'clinikal_api', 'Clinikal API', 'lists','lists', 'view');
        AclExtended::updateAcl($imaging_receptionist_view,  'Imaging receptionist',               'clinikal_api', 'Clinikal API', 'lists','lists', 'view');
        AclExtended::updateAcl($imaging_clinic_manager_view,  'Imaging manager',                  'clinikal_api', 'Clinikal API', 'lists','lists', 'view');
        AclExtended::updateAcl($imaging_doctor_view,  'Imaging doctor',                           'clinikal_api', 'Clinikal API', 'lists','lists', 'view');
        AclExtended::updateAcl($imaging_technician_view,  'Imaging technician',                   'clinikal_api', 'Clinikal API', 'lists','lists', 'view');
        AclExtended::updateAcl($imaging_call_center_representative_view,'Imaging representative', 'clinikal_api', 'Clinikal API', 'lists','lists', 'view');

    }
);


