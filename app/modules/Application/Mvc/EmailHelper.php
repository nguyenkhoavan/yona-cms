<?php
/**
 * Created by PhpStorm.
 * User: @VanNguyen: nguyenkhoavan@outlook.com
 * Date: 8/10/2015
 * Time: 8:55 PM
 */
namespace Application\Mvc;

use Phalcon\DI;
use Phalcon\DI\InjectionAwareInterface;
use Phalcon\Exception;

/**
 * Class ExcelHelper
 * @package Classes
 */
class EmailHelper implements InjectionAwareInterface
{
    protected $_di;

    public function setDI(\Phalcon\DiInterface  $dependencyInjector)
    {
        $this->_di = $dependencyInjector;
    }

    public function getDI()
    {
        return $this->_di;
    }

    public function sendForgotpassword($user) {

        $config         = $this->getMandrillConfig();

        $mandrillKey    = $config['key'];
        $from           = $config['fromEmail'];

        try {
            $mandrill   = new \Mandrill($mandrillKey);
            $content    = $this->getDI()->getHelper()->modulePartial(
                $this->getTemplate('forgotPassword'), ['user' => $user]);
            $html       = ob_get_contents();
            ob_clean();
            $message    = array(
                'html'          => $html,
                'subject'       => "Forgot password link",
                'from_email'    => $from['email'],
                'from_name'     => $from['name'],
                'to'            => [['email'    =>   $user->getEmail()]]
            );
            $result     = $mandrill->messages->send($message);
            return true;
        } catch (Mandrill_Error $e) {
            echo 'A mandrill error occurred: ' . get_class($e) . ' - ' . $e->getMessage();
            throw $e;
        }
    }

    public function getTemplate($templateName){
        return "../../../views/partials/mail/".$templateName;
    }

    public function getMandrillConfig(){
        $config         = $this->getDI()->getConfig();
        if(array_key_exists('mandrill', $config))
        {            return $config['mandrill'];        }

        throw new Exception('Not have mandrill key');
    }

    public function sendNotifPasswordChange($user){
        $config         = $this->getMandrillConfig();
        $mandrillKey    = $config['key'];
        $from           = $config['fromEmail'];

        try {
            $mandrill   = new \Mandrill($mandrillKey);
            $content    = $this->getDI()->getHelper()->modulePartial(
                $this->getTemplate('newPassword'), ['user' => $user]);
            $html       = ob_get_contents();
            ob_clean();
            $message = array(
                'html'          => $html,
                'subject'       => "Your password has changed",
                'from_email'    => $from['email'],
                'from_name'     => $from['name'],
                'to'            => [['email'=> $user->getEmail()]]
            );
            $result     = $mandrill->messages->send($message);
            return true;
        } catch (Mandrill_Error $e) {
            echo 'A mandrill; error occurred: ' . get_class($e) . ' - ' . $e->getMessage();
            throw $e;
        }
    }

}