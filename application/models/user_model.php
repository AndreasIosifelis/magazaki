<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');


class User_model extends CI_Model{
    
    
    public $errors = [];
    
    public function dologin($username, $password){
        
        if(empty($username) || empty($password)){
            $this->errors[] = 102;
        }
        
        if(strlen($username) < 6 || strlen($username) > 25){
            $this->errors[] = 103;
        }
        
        if(strlen($password) !== 128){
            $this->errors[] = 104;
        }
        
        $this->db->where("username", $username);
        $this->db->limit(1);
        $query = $this->db->get("user");
        $count = $query->num_rows;
        if($count !== 1){
            $this->errors[] = 105;
        } else {
            
            $user = $query->result()[0];
            $idc = $user->idc;
            $dbUsername = $user->username;
            $dbPassword = $user->password;
            $salt = $user->salt;
            $saltedPassword = hash("sha512", $salt.$password);
            
            if($saltedPassword !== $dbPassword){
                $this->errors[] = 106;
            } else {
                $this->setUserSession($user);
            }           
        }      
        
    }
    
    public function unsetUserSession(){
        $this->session->unset_userdata("user_id");
        $this->session->unset_userdata("user_fullname");
    }
    
    
    private function setUserSession($user){        
        $userdata = [
            "logged_in"=>TRUE,
            "user_id"=>$user->idc,
            "user_fullname"=>$user->firstName." ".$user->lastName 
        ];
        
        $userdata[$this->definePermission($user)] = TRUE;
        $this->session->set_userdata($userdata);       
    }
    
    private function definePermission($user){
        switch($user->group){
            case 11:
                return "is_super_admin";
            case 12:
                return "is_admin";
            case 13:
                return "is_editor";
            case 14:
                return "is_author";
            case 15:
                return "is_customer";
            default :
                return "is_customer";
        }
    }
    
    
}

