<?php

    include "../connection.php";

    $email = $_POST['user_email'];
   
    $dbQuary = "SELECT * FROM user WHERE email='$email'";
    $result = mysqli_query($con,$dbQuary);

    if($result->num_rows>0)
        // currently this email used already someone
        echo json_encode(array("emailFound"=>true));
    else
        // currently this email not used already someone
        // signup succesfully
        echo json_encode(array("emailFound"=>false));

?>