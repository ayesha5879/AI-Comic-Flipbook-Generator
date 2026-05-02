<?php

include_once("loadenv.php");

$server = getenv('SERVER');
$user = getenv('USER');
$pass = getenv('PASS');
$db = getenv('DB');

$conn = mysqli_connect($server, $user, $pass, $db);

if(!$conn){
    die("Unable to connect server");
}

?>