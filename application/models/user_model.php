<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');


class User_model extends CI_Model{
    
    
    public $errors = [];
    
    public function dologin($username, $password){
        
        if(empty($username) || empty($password)){
            $this->errors[] = WRONG_USERNAME_OR_PASSWORD;
        }
        
        if(strlen($username) < 6 || strlen($username) > 25){
            $this->errors[] = WRONG_USERNAME_OR_PASSWORD;
        }
        
        if(strlen($password) !== 128){
            $this->errors[] = WRONG_USERNAME_OR_PASSWORD;
        }
        
        $this->db->where("username", $username);
        $this->db->limit(1);
        $query = $this->db->get("user");
        $count = $query->num_rows;
        if($count !== 1){
            $this->errors[] = WRONG_USERNAME_OR_PASSWORD;
        } else {
            
            $user = $query->result()[0];
            $idc = $user->idc;
            $dbUsername = $user->username;
            $dbPassword = $user->password;
            $salt = $user->salt;
            $saltedPassword = hash("sha512", $salt.$password);
            
            if($saltedPassword !== $dbPassword){
                $this->errors[] = empty($this->errors) ? WRONG_USERNAME_OR_PASSWORD : "";
            } else {
                $this->setUserSession($user);
            }           
        }      
        
    }
    
    public function unsetUserSession(){
        $this->session->unset_userdata("logged_in");
        $this->session->unset_userdata("user_id");
        $this->session->unset_userdata("user_fullname");        
        $this->session->unset_userdata("user_access_level");
    }
    
    
    private function setUserSession($user){        
        $userdata = [
            "logged_in"=>TRUE,
            "user_id"=>$user->idc,
            "user_fullname"=>$user->firstName." ".$user->lastName,
            "user_access_level"=>$user->group
        ];      

        $this->session->set_userdata($userdata);       
    }
    
    
}

