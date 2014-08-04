<!doctype html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title><?= empty($page->title) ? $page["title"] : $page->title ?></title>
        <?= css("public/css/foundation") ?>
        <?= js("public/js/vendor/modernizr") ?>
    </head>
    <body>
        <div class="contain-to-grid sticky">
            <nav class="top-bar" data-topbar>
                <ul class="title-area">
                    <li class="name">
                        <h1><a href="#">My Site</a></h1>
                    </li>
                    <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
                    <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
                </ul>
                 <?php $this->load->view("widgets/menu"); ?> 
            </nav>
        </div>
        <div class="row">
            <div class="large-12 columns">                
              