<?php
/**
 * Created by PhpStorm.
 * User: amiel
 * Date: 24/12/17
 * Time: 10:39
 */

class Roles_ids{

    public $all_roles_ids;
    private static $instance;

    static function instance()
    {
        if(is_null(self::$instance)){
            self::$instance = new self();

            self::$instance->all_roles_ids = array(
                'admin_write' => getAclIdNumber('Administrators', 'write'),
                'application_manager_write' => getAclIdNumber('Application Manager', 'write'),
                'application_manager_view' => getAclIdNumber('Application Manager', 'view'),
                //EXAMPLE
                'imaging_receptionist_write' => getAclIdNumber('Imaging receptionist', 'write'),
                'imaging_receptionist_view' => getAclIdNumber('Imaging receptionist', 'view'),

                'imaging_technician_write' => getAclIdNumber('Imaging Technician', 'write'),
                'imaging_technician_view' => getAclIdNumber('Imaging Technician', 'view'),

                'imaging_doctor_write' => getAclIdNumber('Imaging doctor', 'write'),
                'imaging_doctor_view' => getAclIdNumber('Imaging doctor', 'view'),

                'imaging_clinic_manager_write' => getAclIdNumber('Imaging clinic manager', 'write'),
                'imaging_clinic_manager_view' => getAclIdNumber('Imaging clinic manager', 'view'),

                'imaging_call_center_representative_write' => getAclIdNumber('Imaging call center representative', 'write'),
                'imaging_call_center_representative_view' => getAclIdNumber('Imaging call center representative', 'view'),
            );
            return self::$instance;

        }  else {
            return self::$instance;
        }

    }

    static function removeInstance()
    {
        self::$instance = null;
    }

    public function __get($name)
    {
        // TODO: Implement __get() method.
        return $this->all_roles_ids[$name];
    }

}




