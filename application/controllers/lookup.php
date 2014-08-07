<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Lookup extends MZ_Controller {
    
    
    public function index(){
        $this->authUser(12);
        $parent = $this->input->get("parent");
        $searchText = $this->input->get("searchText");
        $this->load->model("Lookup_model");
        $this->data["page"]["title"] = LOOKUPS;
        $this->data["parent"] = $parent;
        $this->data["searchText"] = $searchText;
        $this->data["lookupTypes"] = $this->Lookup_model->getLookupTypes();
        $this->data["lookups"] = $this->Lookup_model->getLookups($parent, $searchText);
        $this->load->view("lookup/search", $this->data);
    }
    
}


