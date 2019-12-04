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
                'doctor_write' => getAclIdNumber('Vaccine doctors', 'write'),
                'doctor_view' => getAclIdNumber('Vaccine doctors', 'view'),
                'nurse_write' => getAclIdNumber('Vaccine nurses', 'write'),
                'nurse_view' => getAclIdNumber('Vaccine nurses', 'view'),
                'receptionist_write' => getAclIdNumber('Vaccine receptionists', 'write'),
                'receptionist_view' => getAclIdNumber('Vaccine receptionists', 'view'),
                'epidemiology_write' => getAclIdNumber('Epidemiology', 'write'),
                'epidemiology_view' => getAclIdNumber('Epidemiology', 'view'),
                'application_manager_write' => getAclIdNumber('Application Manager', 'write'),
                'application_manager_view' => getAclIdNumber('Application Manager', 'view'),

                'rabies_receptionists_write' => getAclIdNumber('Rabies receptionists', 'write'),
                'rabies_receptionists_view' => getAclIdNumber('Rabies receptionists', 'view'),
                'rabies_nurse_write' => getAclIdNumber('Rabies nurse', 'write'),
                'rabies_nurse_view' => getAclIdNumber('Rabies nurse', 'view'),
                'rabies_doctor_write' => getAclIdNumber('Rabies doctors', 'write'),
                'rabies_doctor_view' => getAclIdNumber('Rabies doctors', 'view'),


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



