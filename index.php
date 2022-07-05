<?php

$db_host = "localhost";
$db_name = "transport_company";
$db_user = "root";
$db_pass = "";



$conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);

if ($conn) {
    echo "Connected successfully!";

    for ($i = 0; $i < 10; $i++) {
        $insert = "INSERT INTO `bus`(`id`, `plate_number`, `model`, `capacity`) 
    VALUES (null,$i,$i, $i);";

        $results = mysqli_query($conn, $insert);
        if ($results === false) {
            echo mysqli_error($conn);
        }
    }

    /* $insert = "INSERT INTO `bus`(`id`, `plate_number`, `model`, `capacity`) 
VALUES (null,'[value-2]','[value-3]','[value-4]');"; */





    $sql = "SELECT *
        FROM bus;";

    $results = mysqli_query($conn, $sql);
    if ($results === false) {
        echo mysqli_error($conn);
    } else {
        $articles = mysqli_fetch_all($results, MYSQLI_ASSOC);

        echo var_dump($articles);
    }
} else {
    echo "Can't connect!!!!!!!!!!";
}