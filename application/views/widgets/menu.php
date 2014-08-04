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
        <li><?=anchor("user", MY_ACCOUNT)?></li>
        <?php if($this->session->userdata("logged_in") &&
                    ($this->session->userdata("isSuperAdmin") || 
                     $this->session->userdata("isAdmin") || 
                     $this->session->userdata("isEditor") ||
                     $this->session->usedata("isAuthor"))): ?>
        <li><?=anchor("admin/index", ADMINISTRATION)?></li>
        <?php endif; ?>
    </ul>
</section>

