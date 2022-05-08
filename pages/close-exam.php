<?php


$e_id =  $_GET['id'];
$exmne_id = $_SESSION['examineeSession']['exmne_id'];
echo $exmne_id;
$conn = mysqli_connect("localhost","root","","cee_db");
$run =  mysqli_query($conn,"INSERT INTO exam_attempt (exmne_id,exam_id,examat_status) VALUES ('$exmne_id','$e_id','used')");
if($run){

    echo "<script type='text/javascript'>
            alert('Closing exam soon...');
            window.location='home.php?page=result&id=$e_id';
        </script>";

}
?>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>OES</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />

</head>

<div class="app-main__outer">
    <div id="refreshData">
    <!-- <div class="jumbotron jumbotron-fluid"> -->
        <div class="container">
            <h3 class="display-5 mt-5">Closing exam soon...</h3>
            <p class="lead">Have Nice day! </p>
        </div>
    <!-- </div> -->
</div>