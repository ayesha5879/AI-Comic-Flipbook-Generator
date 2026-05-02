<?php

include_once("loadenv.php");

function p_hash($password){
    return hash_hmac('sha256', $password, getenv('HASHING_KEY'));
}

?>