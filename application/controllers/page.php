<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Page extends MZ_Controller {


    public function index($slug="home") {
        $this->load->model("Page_model");
        $page = $this->Page_model->getPage($slug);
        if(empty($page)){
           redirect("page/home");
           die();
        }
        $data["page"] = $page;
        $this->load->view("page/page_view", $data);
    }

}