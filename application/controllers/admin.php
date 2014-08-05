<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Admin extends MZ_Controller {
    
    
    public function index(){
        $this->authUser(14);
        $data["page"]["title"] = ADMINISTRATION;
        $data["instance"] = $this;
        $this->load->view("admin/panel", $data);
    }
    
}

