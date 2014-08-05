<?php $this->load->view("widgets/header", $page); ?>
<div class="row">
    <ul class="large-block-grid-3 small-block-grid-1">

        <li>
            <ul class="side-nav">
                <li><a href="#"><h6><?=ADMINISTRATION?></h6></a></li>
                <li><?=anchor("user/search", PERSONS)?></li>
                <li><?=anchor("lookup/3", LOOKUPS)?></li>
                <li><a href="#">Link 3</a></li>
                <li><a href="#">Link 4</a></li>
            </ul>
        </li>   


    </ul>
</div>

<?php $this->load->view("widgets/footer"); ?>

