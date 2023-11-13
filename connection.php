<?php
$servername = "good-reptile-7164.8nk.cockroachlabs.cloud";
$username = "b032110124_student_u";
$password = "enCcxuUbXClUEOQ7jkXMCg";
$dbname = "defaultdb";

//create connection
$conn = new mysqli($servername,$username,$password,$dbname);

//check connection
if ($conn->connect_error){
    die("Connection failed: " . $conn->connect_error);
}
?>