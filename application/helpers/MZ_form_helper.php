<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

if (!function_exists("lookup")) {

    function lookup($name, $options, $selected=null, $submit=false) {
        $ret = "<select name='{$name}' id='{$name}' ";
        if($submit){
            $ret .= "onchange='this.form.submit()'";
        }
        $ret .= ">";
        
        foreach ($options as $row) {
            $ret .= "<option value='{$row->idc}' ";
            $ret .= !empty($selected) && $row->idc == $selected ? " selected='selected' " : "";
            $ret .= ">{$row->description}</option>";
        }
        $ret .= "</select>";
        return $ret;
    }
}



