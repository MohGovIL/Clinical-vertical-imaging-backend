<?php
//EXAMPLE
/* Vaccines groups */
//$receptionist_view = @addNewACL('Vaccine receptionists', 'receptionist', 'view', 'Things that receptionists can read but not modify');
//$receptionist_write = @addNewACL('Vaccine receptionists', 'receptionist', 'write', 'Things that receptionists can modify');

$imaging_receptionist_write = @addNewACL('Imaging receptionist', 'imaging_receptionist', 'write', 'Things that imaging receptionist can modify');
$imaging_receptionist_view = @addNewACL('Imaging receptionist', 'imaging_receptionist', 'view', 'Things that imaging receptionist can read but not modify');
$imaging_technician_write = @addNewACL('Imaging technician', 'imaging_technician', 'write', 'Things that imaging technician can modify');
$imaging_technician_view = @addNewACL('Imaging technician', 'imaging_technician', 'view', 'Things that imaging technician can read but not modify');
$imaging_doctor_write = @addNewACL('Imaging doctor', 'imaging_doctor', 'write', 'Things that imaging doctor can modify');
$imaging_doctor_view = @addNewACL('Imaging doctor', 'imaging_doctor', 'view', 'Things that imaging doctor can read but not modify');
$imaging_clinic_manager_write =  @addNewACL('Imaging clinic manager', 'imaging_clinic_manager', 'write', 'Things that imaging clinic manager can modify');
$imaging_clinic_manager_view =  @addNewACL('Imaging clinic manager', 'imaging_clinic_manager', 'view', 'Things that imaging clinic manager can read but not modify');
$imaging_call_center_representative_write = @addNewACL('Imaging call center representative', 'imaging_call_center_representative', 'write', 'Things that imaging call center representative can modify');
$imaging_call_center_representative_view =  @addNewACL('Imaging call center representative', 'imaging_call_center_representative', 'view', 'Things that imaging call center representative can read but not modify');

//Insert the 'notes' object from the 'patients' section
//updateAcl($receptionist_write, 'Vaccine receptionists', 'patients', 'Patients', 'notes', 'Patient Notes (write,addonly optional)', 'write');

