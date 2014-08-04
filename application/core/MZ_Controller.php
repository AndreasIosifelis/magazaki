<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class MZ_Controller extends CI_Controller {

    protected $lang = "greek";
    protected $invalidClientError = 101;

    public function __construct() {
        parent::__construct();
        require_once $this->session->userdata("lang_id") ? "application/language/{$this->session->userdata("lang_id")}.php" : "application/language/greek.php";
    }
    
    public function authUser(){
        if(!$this->session->userdata("logged_in"))
            die();
    }
    
    public function authClient($session){        
        if($this->session->userdata("session_id") !== $session){
            $this->errorResponse($this->invalidClientError);
            die();
        }
    }

    public function request($json = "json") {
        return json_decode($this->input->post($json));
    }

    public function response($response) {
        $this->output->set_header("x-frame-origin:SAMEORIGIN");
        $this->output->set_content_type("application/json");
        echo json_encode($response);
    }

    public function errorResponse($error) {
        $response["success"] = FALSE;
        $response["messages"] = is_array($error) ? $error : array($error);
        $this->response($response);
        die();
    }

}
