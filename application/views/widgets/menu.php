<section class="top-bar-section">
    
        <!-- Left Nav Section -->
    <ul class="left">
        <li><?= anchor("page/home", HOME) ?></li>       
        <li><?= anchor("product", PRODUCTS) ?></li>       
    </ul>
    
    
    <!-- Right Nav Section -->
    <ul class="right">
        <li class="has-dropdown">
            <?=anchor("#", PROFILE)?>
            <ul class="dropdown">
                <li><?= anchor("page/contact", CONTACT) ?></li>
                <li><?= anchor("page/terms", TERMS) ?></li>
            </ul>
        </li>
        <li><?=anchor("cart", CART)?></li>                       
        <li <?=$this->session->userdata("logged_in")?"class='has-dropdown'":""?>>
            <?=anchor("user", MY_ACCOUNT)?>
            <ul class="dropdown">
                
                <?php if($this->session->userdata("logged_in") &&
                    ($this->session->userdata("is_super_admin") || 
                     $this->session->userdata("is_admin") || 
                     $this->session->userdata("is_editor") ||
                     $this->session->usedata("is_author"))): ?>
                    <li><?=anchor("admin/index", ADMINISTRATION)?></li>
                <?php endif; ?>              
                
                
                <?php if($this->session->userdata("logged_in")): ?>
                <li><?=anchor("user/logout", "Logout")?></li>
                <?php endif; ?>                
            </ul>
        </li>
        
    </ul>
</section>

