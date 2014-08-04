<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class User extends MZ_Controller {


    public function index() {
        if($this->session->userdata("logged_in"))
            redirect("user/account");
        else
            redirect("user/login");
    }
    
    public function login(){
        $data["page"]["title"] = "Login";
        $this->load->view("user/login", $data);
    }
    
    public function profile(){
        $data["page"]["title"] = PROFILE;
        $this->load->view("user/profile", $data);
    }
    
    public function dologin(){        
        $json = $this->request();        
        $this->authClient($json->session);
        
        $this->load->model("User_model");        
        $this->User_model->dologin($json->username, $json->password);
        if(empty($this->User_model->errors)){
            $response["success"] = TRUE;
        } else {
            $response["success"] = FALSE;
            $response["messages"] = $this->User_model->errors;
        }       
        $this->response($response);        
    }

}