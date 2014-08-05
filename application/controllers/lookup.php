<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Lookup extends MZ_Controller {
    
    
    public function index($idc){
        $this->authUser(12);
        $this->data["page"]["title"] = LOOKUPS;
        $this->data["idc"] = $idc;
        $this->load->view("lookup/search", $this->data);
    }
    
}


