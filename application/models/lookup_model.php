<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Lookup_model extends CI_Model{
    
    protected $table = "lookup";
    
    public function getLookupTypes(){        
        $this->db->where("parent", 1);
        $this->db->where("editable", 1);
        $query = $this->db->get($this->table);
        return $query->result();       
    }
    
    public function getLookup($parent){
        $this->db->where("parent", $parent);
        $query = $this->db->get($this->table);
        return $query->result();   
    }
    
    
    public function getLookups($parent, $searchText){       
        $this->db->where("parent", $parent);
        $this->db->like("description", $searchText);        
        $this->db->where("editable", 1);
        $query = $this->db->get($this->table);
        return $query->result();
    }
   
    
}

