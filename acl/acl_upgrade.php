<?php

return $ACL_UPGRADE = array(

    '0.1.0' => function () {
        @addNewACL('Imaging Technician', 'imaging_technician', 'write', 'Things that imaging technician can modify');
        @addNewACL('Imaging Technician', 'imaging_technician', 'view', 'Things that imaging technician can read but not modify');
        @addNewACL('Imaging doctor', 'imaging_doctor', 'write', 'Things that imaging doctor can modify');
        @addNewACL('Imaging doctor', 'imaging_doctor', 'view', 'Things that imaging doctor can read but not modify');
        @addNewACL('Imaging clinic manager', 'imaging_clinic_manager', 'write', 'Things that imaging clinic manager can modify');
        @addNewACL('Imaging clinic manager', 'imaging_clinic_manager', 'view', 'Things that imaging clinic manager can read but not modify');
        @addNewACL('Imaging call center representative', 'imaging_call_center_representative', 'write', 'Things that imaging call center representative can modify');
        @addNewACL('Imaging call center representative', 'imaging_call_center_representative', 'view', 'Things that imaging call center representative can read but not modify');
    },
);
