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
                'receptionist_write' => getAclIdNumber('Vaccine receptionists', 'write'),
                'receptionist_view' => getAclIdNumber('Vaccine receptionists', 'view'),

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




