<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Product extends MZ_Controller {


    public function index() {                
        $data["page"]["title"] = "Products";
        $this->load->view("product/list", $data);
    }
}