<?php
    $examId = $_GET['exam_id'];
    $exmne_id = $_GET['exmne_id'];

    $conn = mysqli_connect("localhost","root","","cee_db");
    $qury = mysqli_query($conn,"SELECT * FROM examinee_tbl WHERE exmne_id='$exmne_id'");
    $row = mysqli_fetch_array($qury);
    $cource_id = $row['exmne_course'];
    $c_query = mysqli_query($conn,"SELECT * FROM course_tbl WHERE cou_id='$cource_id'");
    $c_row = mysqli_fetch_array($c_query);
    $e_query = mysqli_query($conn,"SELECT * FROM exam_img WHERE exmne_id='$exmne_id' AND examId='$examId'");
    $e_row = mysqli_fetch_array($e_query);
    $output_e = 0;
    

?>
<div class="app-main__outer">
    <div class="app-main__inner">
        <div class="app-page-title">
            <div class="page-title-wrapper">
                <div class="page-title-heading">
                    <div>EXAMINEE SCREENSHOT</div>
                </div>
            </div>
        </div> 
        
        <div class="col-md-12">
            <table class="table table-striped">
                <thead>
                    <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Year</th>
                    <th scope="col">Course</th>
                    <th scope="col">IMG</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row"><?php echo $row['exmne_fullname']; ?></th>
                        <td><?php echo $row['exmne_email']; ?></td>
                        <td><?php echo $row['exmne_year_level']; ?></td>
                        <td><?php echo $c_row['cou_name']; ?></td>
                        <td>
                            <?php
                                if(mysqli_num_rows($e_query)==0){
                                    echo "Not answer yet";
                                }else{
                            ?>
                            <img src='<?php echo $e_row['img_src']; ?>' />
                            <?php
                                }
                            ?>
                        </td>
                        </tr>
                    <tr>
                </tbody>
            </table>
        </div>
        
    </div>
</div>