<?php

include_once("connection.php");
include_once("functions.php");

session_start();

if(isset($_POST["siginup"])){

    $first_name = $_POST["first_name"];
    $last_name = $_POST["last_name"];
    $email = $_POST["email"];
    $password = $_POST["password"];
    $phone = $_POST["phone"];

    $hash_pass = p_hash($password);

    $sql = "SELECT email FROM user WHERE email LIKE '$email' ";
    $res = mysqli_query($conn, $sql);

    if(mysqli_num_rows($res) == 0){
        $sql = mysqli_query($conn, "INSERT INTO user (`first_name`, `last_name`, `email`, `phone`, `password`) VALUES ('$first_name', '$last_name', '$email', '$phone', '$hash_pass'); ");
        echo $sql ? "successfully" : "Failed to insert data";
    }else{
        echo "User already exist with that email";
    }

}

if(isset($_POST["siginIn"])){

    $email = $_POST["email"];
    $password = $_POST["password"];

    $hash_pass = p_hash($password);

    $sql = "SELECT email, first_name FROM user WHERE `email`='$email' AND `password`='$hash_pass' ";
    $res = mysqli_query($conn, $sql);

    if(mysqli_num_rows($res) == 0){
       echo "Invalid Credentials";
    }else{
        echo "successfully";
        $_SESSION["user_status"] = "logged";
        while($row = mysqli_fetch_assoc($res)){
            $_SESSION["user_name"] = $row["first_name"];
            $_SESSION["user_email"] = $row["email"];
        }
    }

}

if(isset($_POST["logout"])){
    session_destroy();
    echo "successfully";
}

if(isset($_POST['fetch_history'])){
    header('Content-Type: application/json');

    $email = $_SESSION['user_email'] ?? '';
    if (!$email) {
        echo json_encode([]);
        exit;
    }

    $userQuery = "SELECT id FROM user WHERE email = '$email'";
    $userResult = mysqli_query($conn, $userQuery);
    if (!$userResult || mysqli_num_rows($userResult) == 0) {
        echo json_encode([]);
        exit;
    }

    $user = mysqli_fetch_assoc($userResult);
    $userId = $user['id'];

    $query = "SELECT id, object_response, created_at FROM prompt WHERE user_id = $userId ORDER BY id DESC LIMIT 10";
    $result = mysqli_query($conn, $query);

    $history = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $object = json_decode($row['object_response'], true);
        $fullContent = $object['choices'][0]['message']['content'] ?? 'N/A';

        // Extract chapter 1 preview
        $chapterText = '';
        $parts = preg_split('/Chapter\s*\d+:/i', $fullContent);
        if (isset($parts[1])) {
            $chapterLines = explode("\n", trim($parts[1]));
            $chapterText = implode(" ", array_slice($chapterLines, 0, 2));
            $chapterText = substr($chapterText, 0, 50) . '...';
        }

        $history[] = [
            'id' => $row['id'],
            'prompt' => $chapterText,
            'date' => $row['created_at']
        ];
    }

    echo json_encode($history);

}

if(isset($_POST["delete_prompt"])){
    $id = (int) $_POST['id'];
    $email = $_SESSION['user_email'] ?? '';

    $userQuery = "SELECT id FROM user WHERE email = '$email'";
    $userResult = mysqli_query($conn, $userQuery);
    if (!$userResult || mysqli_num_rows($userResult) == 0) {
        echo "User not found";
        exit;
    }
    $user = mysqli_fetch_assoc($userResult);
    $userId = $user['id'];

    mysqli_query($conn, "DELETE FROM prompt WHERE id = $id AND user_id = $userId");

    echo "Deleted";
}

if (isset($_POST['get_book_by_history'])) {

    $id = $_POST["id"];

    // Get the most recent prompt record
    $query = "SELECT id, object_response FROM prompt WHERE id = $id ORDER BY id DESC LIMIT 1";
    $result = mysqli_query($conn, $query);
    if (!$result || mysqli_num_rows($result) == 0) {
        echo json_encode([]);
        exit;
    }

    $row = mysqli_fetch_assoc($result);

    $id = $row["id"];

    $object = json_decode($row['object_response'], true);
    $storyText = $object['choices'][0]['message']['content'];

    $chapters = explode("Chapter", $storyText);
    array_shift($chapters);
    
    $getimg = "SELECT image_name FROM `image` WHERE prompt_id = $id";

    $index = 0;

    $results = [];

    $res = mysqli_query($conn, $getimg);
    if(mysqli_num_rows($res) > 0){
        while($row = mysqli_fetch_assoc($res)){
            
            $chapterTitle = "Chapter " . trim(substr($chapters[$index], 0, strpos($chapters[$index], "\n")));
            $chapterBody = trim(substr($chapters[$index], strpos($chapters[$index], "\n")));

            $results[] = [
                'chapter' => $chapterTitle . "\n" . $chapterBody,
                'image' => $row["image_name"]
            ];

        }
    }

    header('Content-Type: application/json');
    echo json_encode($results, JSON_PRETTY_PRINT);

}

if(isset($_POST["update_profile"])){

    $email = $_SESSION['user_email'] ?? '';
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $pass = $_POST['pass'];
    $phone = $_POST['phone'];
    $email = "";

    if(isset($_SESSION["user_email"])){
        $email = $_SESSION["user_email"];
    }


    $sql = "UPDATE user SET first_name='$fname', last_name='$lname', phone='$phone'";

    if ($pass !== '') {
        $hash_pass = p_hash($pass);
        $sql .= ", password='$hash_pass'";
    }

    $sql .= " WHERE email='$email'";

    if (mysqli_query($conn, $sql)) {
        echo "updated";
    }

}

?>