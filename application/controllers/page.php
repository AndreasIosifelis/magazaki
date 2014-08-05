<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Page extends MZ_Controller {


    public function index($slug="home") {
        $this->load->model("Page_model");
        $content = $this->Page_model->getPage($slug);
        if(empty($content)){
           redirect("page/home");
           die();
        }
        $this->data["page"] = $content;        
        $this->load->view("page/page_view", $this->data);
    }

}