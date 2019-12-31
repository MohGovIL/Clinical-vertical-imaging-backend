<?php

return $ACL_UPGRADE = array(

    //example
    '0.2.0' => function () {
        //addObjectAcl('admin', 'Administration', 'test', 'Test');
        //updateAcl(Roles_ids::instance()->admin_write, 'Administrators', 'admin', 'Administration', 'test', 'Test', 'write');
    },
    '0.5.0' => function () {
        @addNewACL('Imaging technician', 'imaging_technician', 'write', 'Things that imaging technician can modify');
        @addNewACL('Imaging technician', 'imaging_technician', 'view', 'Things that imaging technician can read but not modify');
        @addNewACL('Imaging doctor', 'imaging_doctor', 'write', 'Things that imaging doctor can modify');
        @addNewACL('Imaging doctor', 'imaging_doctor', 'view', 'Things that imaging doctor can read but not modify');
        @addNewACL('Imaging clinic manager', 'imaging_clinic_manager', 'write', 'Things that imaging clinic manager can modify');
        @addNewACL('Imaging clinic manager', 'imaging_clinic_manager', 'view', 'Things that imaging clinic manager can read but not modify');
        @addNewACL('Imaging call center representative', 'imaging_call_center_representative', 'write', 'Things that imaging call center representative can modify');
        @addNewACL('Imaging call center representative', 'imaging_call_center_representative', 'view', 'Things that imaging call center representative can read but not modify');
    },
);
