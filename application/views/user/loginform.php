<?=  form_open("user/dologin", ["data-formtype"=>"ajax"])?>
<?=  form_hidden("session", $this->session->userdata("session_id"))?>
<div class="row">
    <div class="large-6 large-offset-3 columns"><h4><?=LOGIN?></h4></div>
</div>
<div class="row">    
    <div class="large-6 large-offset-3 columns">
        <?=  form_input([
            "name"=>"username", 
            "id"=>"username", 
            "placeholder"=>USERNAME, 
            "required"=>"required",
            "maxlength"=>25,
            "autocomplete"=>"off"
            ])?>
    </div>  
</div>
<div class="row">    
    <div class="large-6 large-offset-3 columns">
        <?=  form_password([
            "name"=>"password", 
            "id"=>"password", 
            "placeholder"=>PASSWORD,
            "maxlength"=>25,
            "autocomplete"=>"off"
            ])?>
    </div>  
</div>
<div class="row">
    <div class="large-6 large-offset-3 columns">
       <?=  form_button(["type"=>"submit","content"=>LOGIN, "class"=>"button expand radius"])?>
    </div> 
</div>
<div class="row">
    <div class="large-6  large-offset-3 columns" id="response">
        
    </div>
</div>


<?=  form_close()?>