<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>


/* File upload in file sharing */


.file-upload {
  background-color: #ffffff;
  /* width: 600px; */
  margin: 0 auto;
  padding: 20px;
}

.file-upload-btn {
  width: 100%;
  margin: 0;
  color: #fff;
  background: #1FB264;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: 4px solid #15824B;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.file-upload-btn:hover {
  background: #1AA059;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.file-upload-btn:active {
  border: 0;
  transition: all .2s ease;
}

.file-upload-content {
  display: none;
  text-align: center;
}

.file-upload-input {
  position: absolute;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  outline: none;
  opacity: 0;
  cursor: pointer;
}

.image-upload-wrap {
  margin-top: 20px;
  border: 4px dashed #1FB264;
  position: relative;
}

.image-dropping,
.image-upload-wrap:hover {
  background-color: #1FB264;
  border: 4px dashed #ffffff;
}

.image-title-wrap {
  padding: 0 15px 15px 15px;
  color: #222;
}

.drag-text {
  text-align: center;
}

.drag-text h3 {
  font-weight: 100;
  text-transform: uppercase;
  color: #15824B;
  padding: 60px 0;
}

.file-upload-image {
  max-height: 200px;
  /* max-width: 200px; */
  margin: auto;
  padding: 20px;
}

.remove-image {
  width: 200px;
  margin: 0;
  color: #fff;
  background: #cd4535;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: 4px solid #b02818;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.remove-image:hover {
  background: #c13b2a;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.remove-image:active {
  border: 0;
  transition: all .2s ease;
}

/* __________________________________________________- */
</style>

<?php

    $exId = $_GET['id'];
    $conn = mysqli_connect("localhost","root","","cee_db");

    if(isset($_POST['importCsv'])){
        $file=$_FILES['csv_file']['tmp_name'];
        
        $ext=pathinfo($_FILES['csv_file']['name'],PATHINFO_EXTENSION);
        if($ext=='xlsx'){
            require('PHPExcel/PHPExcel.php');
            require('PHPExcel/PHPExcel/IOFactory.php');
            
            
            $obj=PHPExcel_IOFactory::load($file);
            foreach($obj->getWorksheetIterator() as $sheet){
                $getHighestRow=$sheet->getHighestRow();
                for($i=1;$i<=$getHighestRow;$i++){

                    $ex_id=$sheet->getCellByColumnAndRow(0,$i)->getValue();
                    $ex_question=$sheet->getCellByColumnAndRow(1,$i)->getValue();
                    $ex_ch1=$sheet->getCellByColumnAndRow(2,$i)->getValue();
                    $ex_ch2=$sheet->getCellByColumnAndRow(3,$i)->getValue();
                    $ex_ch3=$sheet->getCellByColumnAndRow(4,$i)->getValue();
                    $ex_ch4=$sheet->getCellByColumnAndRow(5,$i)->getValue();
                    $ex_ans=$sheet->getCellByColumnAndRow(6,$i)->getValue();

                    if($ex_id!=''){
                       $run =  mysqli_query($conn,"INSERT INTO exam_question_tbl (exam_id,exam_question,exam_ch1,exam_ch2,exam_ch3,exam_ch4,exam_answer) VALUES ('$ex_id','$ex_question','$ex_ch1','$ex_ch2','$ex_ch3','$ex_ch4','$ex_ans')");
                       echo "<script type='text/javascript'>
                                  window.location='manage-exam.php?id=$exId';
                              </script>";
                    }
                }
            }
        }else{
            echo "Invalid file format";
        }
    }


?>


<link rel="stylesheet" type="text/css" href="css/mycss.css">

<div class="app-main__outer">
        <div class="app-main__inner">
            <div class="app-page-title">
                <div class="page-title-wrapper">
                    <div class="page-title-heading">
                        <div>ADD MULTIPLE QUESTIONS</div>
                    </div>
                </div>
            </div>        
            
            <div class="col-md-12">

            
                <!-- For file upload -->
            <div class="row">
                <div class="col-md-2"></div>
                
                <div class="col-md-8">
                    <div class="file-upload">
                        <button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger( 'click' )">Add CSV</button>

                            <form enctype="multipart/form-data" id="file_upload" method="POST" name="uploadCsv">
                                <div class="image-upload-wrap">
                                    <input class="file-upload-input" type='file' id="report" name="csv_file" onchange="readURL(this);" />
                                    <div class="drag-text">
                                        <h3>Drag and drop a CSV or select add CSV</h3>
                                    </div>
                                </div>
                                
                            <div class="file-upload-content">
                                <div class="file-upload-image" src="#" alt="your image"></div>
                                    <div class="image-title-wrap">
                                    <button type="button" onclick="removeUpload()" class="remove-image">Remove <span class="image-title">Uploaded Image</span></button>
                                </div>
                            </div>
                            <span class="text-muted text-center"> Only Excel allowed</span><br>
                            <input type="submit" name="importCsv" class="text-center btn btn-success" value="Add Questions">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-2"></div>    
            </div>



            </div>
      
        
</div>
         
<!-- _________________________________________________________ -->
<!-- For file upload -->

<script type="text/javascript">

  function readURL(input) {
  if (input.files && input.files[0]) {

    var reader = new FileReader();

    reader.onload = function(e) {
      $('.image-upload-wrap').hide();

      $('.file-upload-image').attr('src', e.target.result);
      $('.file-upload-content').show();


      $('.image-title').html(input.files[0].name);
    };

    reader.readAsDataURL(input.files[0]);

  } else {
    removeUpload();
  }
}

function removeUpload() {
  $('.file-upload-input').replaceWith($('.file-upload-input').clone());
  $('.file-upload-content').hide();
  $('.image-upload-wrap').show();
}
$('.image-upload-wrap').bind('dragover', function () {
  $('.image-upload-wrap').addClass('image-dropping');
});
$('.image-upload-wrap').bind('dragleave', function () {
  $('.image-upload-wrap').removeClass('image-dropping');
});
</script>
<!-- __________________________________________ -->