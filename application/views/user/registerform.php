<?=  form_open("user/doregister", ["data-formtype"=>"ajax"])?>
<?=  form_hidden("session", $this->session->userdata("session_id"))?>
<div class="row">
    <div class="large-6 large-offset-3 columns"><h4><?=CREATE_ACCOUNT?></h4></div>
</div>
<div class="row">
    
    <div class="large-6 large-offset-3 columns">
        <?=  form_input([
            "name"=>"username", 
            "id"=>"username", 
            "placeholder"=>USERNAME,
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
       <?=  form_button(["type"=>"submit","content"=>CREATE_ACCOUNT, "class"=>"button expand"])?>
    </div> 
</div>
<?=  form_close()?>

