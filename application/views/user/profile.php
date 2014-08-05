<?php $this->load->view("widgets/header", $page); ?>
<h4><?=PROFILE?></h4>
<div class="row">
    <div class="large-3">
        <ul class="side-nav">
            <li><a href="#"><h6>My Menou</h6></a></li>
            <li><?=anchor("address/{$this->session->userdata("user_id")}", "My Addresses")?></li>
        </ul>
    </div>
</div>


<?php $this->load->view("widgets/footer"); ?>



