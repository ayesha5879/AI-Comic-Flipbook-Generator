<?php
session_start();
include_once("./includes/header.php"); 
include_once("./handler/connection.php");

if (!isset($_SESSION["user_email"])) {
    header("Location: signin.php");
    exit();
}

$email = $_SESSION["user_email"];

$sql = "SELECT * FROM USER WHERE email = '$email' ";
$res = mysqli_query($conn, $sql);

$fname = "";
$lname = "";
$phone = "";

if(mysqli_num_rows($res) > 0){
    while($row = mysqli_fetch_assoc($res)){
        $fname = $row["first_name"];
        $lname = $row["last_name"];
        $phone = $row["phone"];
 }
}
else{
    header("Location: /efest");
}
?>

<div class="main_box main_bg" data-barba="container" data-barba-namespace="settings">
    <?php
        include_once("./includes/navbar.php");
    ?>
    <div class="container-fluid wrapper" >
        <div class="col-12 col-sm-10 col-md-8 col-lg-6 form_box morph">
            <h1 class="text-center mt-5">Account Settings</h1>
            <div class="container d-flex justify-content-center">
                <form id="settings_form" class="col-11 col-lg-10" method="post">
                    <h5 class="text-center mb-4">Welcome, <?php echo $fname; ?>!</h5>

                    <label for="firstname">First Name</label>
                    <input type="text" class="form-control mt-1 mb-3" name="fname" id="fname"
                        value="<?php echo $fname; ?>" placeholder="First Name">

                    <label for="username">Last Name</label>
                    <input type="text" class="form-control mt-1 mb-3" name="lname" id="lname"
                        value="<?php echo $lname; ?>" placeholder="Last Name">

                    <label for="password">Change Password</label>
                    <input type="password" class="form-control mt-1 mb-3" name="password" id="password"
                        placeholder="New Password (leave blank to keep current)">

                    <label for="phone">Change Phone Number</label>
                    <input type="text" class="form-control mt-1 mb-4" name="phone" id="phone"
                        value="<?php echo $phone; ?>" placeholder="Phone Number">

                    <button type="submit" id="update_user" class="btn btn-success col-6 mx-auto d-block">Save Changes</button>
                </form>
            </div>
        </div>
    </div>
</div>

<?php 

include_once("./includes/footer.php"); 

?>
