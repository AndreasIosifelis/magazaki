<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Page_model extends CI_Model {

    public function getPage($slug) {
        
        $this->db->where("slug", $slug);
        $this->db->limit(1);
        $query = $this->db->get("content");
        $page = $query->result();
        return $query->num_rows > 0 ? $page[0] : null;
    }

}
