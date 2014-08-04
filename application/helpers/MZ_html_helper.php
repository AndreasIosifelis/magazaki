<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


if(!function_exists("js")){
    
    function js($file){
        $file = ENVIRONMENT == "development" ? "{$file}.js" : "{$file}.min.js";
        return "<script src='".base_url($file)."' type='text/javascript'></script>";
    }
    
}

if(!function_exists("css")){
    
    function css($file){
        $file = ENVIRONMENT == "development" ? "{$file}.css" : "{$file}.min.css";
        return "<link rel='stylesheet' href='".base_url($file)."' type='text/css' />";
    }
    
}

