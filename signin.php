<?php
    $page_title = "SiginIn";
    session_start();
    if(!isset($_SESSION["user_status"]) || $_SESSION["user_status"]==""){
    include_once("./includes/header.php");
?>

<div class="container-fluid wrapper sigin_bg" data-barba="container" data-barba-namespace="signin">
    <div class="col-12 col-sm-10 col-md-8 col-lg-6 form_box morph">
        <h1 class="text-center mt-5">Sign In</h1>
        <div class="container d-flex justify-content-center">
            <form id="signin_form" class="col-11 col-lg-10" method="post">
                <input type="email" class="form-control mt-5" name="email" id="email" placeholder="Email">
                <input type="password" class="form-control mt-3" name="password" id="password" placeholder="Password">
                <button class="btn btn-primary col-6 mx-auto mt-5 d-block">SignIn</button>
                <a href="signup">signup</a>
            </form>
        </div>
    </div>
</div>

<?php
    include_once("./includes/footer.php");
    }else{
        header("Location: index");
    }

?>