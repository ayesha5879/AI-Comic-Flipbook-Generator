<?php
    $page_title = "Home";
    session_start();
    if(isset($_SESSION["user_status"]) && $_SESSION["user_status"] == "logged"){
    include_once("./includes/header.php");
?>

<div id="render_pages" style="position: absolute; top: 0; z-index: -99999;"></div>

<div class="home_wrapper main_bg" data-barba="container" data-barba-namespace="home">
    <?php
        include_once("./includes/navbar.php");
    ?>
    <div class="content_wrapper">
        <div class="sidebar morph" id="history_bar">

        </div>
        <main class="main_content">
            <div class="prompt_box morph col-8">
                <div class="loading"></div>
                <div id="book_container" style="z-index: -99">
                    
                </div>
                
                <textarea name="prompt_msg" id="prompt_msg" class="form-control" placeholder="Prompt...."></textarea>
                <button class="btn btn-danger mx-auto d-block mt-4 col-4" id="prompt_btn">SUBMIT</button>
            </div>
        </main>
    </div>
</div>

<?php
    include_once("./includes/footer.php");
    }else{
        header("Location: signin");
    }

?>