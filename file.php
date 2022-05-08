<?php
    session_start();
    $exmne_id = $_SESSION['examineeSession']['exmne_id'];
    $img =  $_POST['img'];
    $examId = $_POST['examId']; 

    $conn = mysqli_connect("localhost","root","","cee_db");

    $check = mysqli_query($conn,"SELECT * FROM exam_img WHERE exmne_id='$exmne_id' AND examId='$examId'");
    if (mysqli_num_rows($check) > 0) {
        $update_img = mysqli_query($conn,"UPDATE exam_img SET img_src='$img' WHERE exmne_id='$exmne_id' AND examId='$examId'");
        if($update_img){
            echo "updated";
        }
    }
    else{
        $run =  mysqli_query($conn,"INSERT INTO exam_img (exmne_id,examId,img_src) VALUES ('$exmne_id','$examId','$img')");
        if($run){
            echo "done";    
        }
    }
    

?>