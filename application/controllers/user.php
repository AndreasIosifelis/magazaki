<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class User extends MZ_Controller {
    
    public function index() {        
        if($this->session->userdata("logged_in"))
            redirect("user/profile");
        else
            redirect("user/login");
    }
    
    public function login(){
        if($this->session->userdata("logged_in")){
            redirect("user/profile");
        } else {
            $this->data["page"]["title"] = "Login";
            $this->load->view("user/login", $this->data);
        }
        
    }
    
    public function profile(){
        if($this->session->userdata("logged_in")){
            $this->data["page"]["title"] = PROFILE;        
            $this->load->view("user/profile", $this->data);            
        } else {
            redirect("user/login");
        }
        
    }
    
    public function dologin(){    
        $json = $this->request();        
        $this->authClient($json->session);        
        $this->load->model("User_model");        
        $this->User_model->dologin($json->username, $json->password);
        if(empty($this->User_model->errors)){
            $response["success"] = TRUE;
            $response["message_type"] = "info";
            $response["redirect"] = site_url("user/profile");
        } else {
            $response["success"] = FALSE;
            $response["message_type"] = "alert";
            $response["messages"] = $this->User_model->errors;
        }       
        $this->response($response);        
    }
    
    public function logout(){
        $this->load->model("User_model");
        $this->User_model->unsetUserSession();
        redirect("user/login");
    }
    
    public function search(){
        $this->authUser(14);
        $this->data["page"]["title"] = PERSONS;
        $this->load->view("user/search", $this->data);
    }

}