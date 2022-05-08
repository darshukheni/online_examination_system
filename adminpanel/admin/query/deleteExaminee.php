deleting...
<?php

if(isset($_GET['id'])){

    $conn = mysqli_connect("localhost","root","","cee_db");
    $id=$_GET['id'];
    $query="DELETE FROM  examinee_tbl WHERE exmne_id='$id'";
    $res = mysqli_query($conn,$query);
    if($res){
        echo "<script type='text/javascript'>
                window.location='../home.php?page=manage-examinee';
            </script>";
    }

}else{
    echo "bad req";
}
?>