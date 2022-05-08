<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/webcamjs/1.0.25/webcam.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
    />
</head>
<script type="text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null};


</script>
 <?php 
    $examId = $_GET['id'];
    $selExam = $conn->query("SELECT * FROM exam_tbl WHERE ex_id='$examId' ")->fetch(PDO::FETCH_ASSOC);
    $selExamTimeLimit = $selExam['ex_time_limit'];
    $exDisplayLimit = $selExam['ex_questlimit_display'];
 ?>



<div class="app-main__outer"  >
    <div class="app-main__inner">
        <div class="col-md-12" >
            <div class="app-page-title" >
                <div class="page-title-wrapper">


                        <div class="text-center mr-3">
                            <!-- <video id="video" autoplay="true"></video>
                            <canvas id="canvas" width="60" height="60"></canvas>-->
                            <!-- <button type="button" class="btn btn-xlg btn-warning p-3 pl-4 pr-4 text-center" id="snap" onclick="openFullscreen()">Click</button>  -->
                            <div id="my_camera"></div>
                        </div>


                        <div class="page-title-heading">
                            <div>
                                <?php echo $selExam['ex_title']; ?>
                                <div class="page-title-subheading">
                                <?php echo $selExam['ex_description']; ?>
                                </div>
                            </div>
                        </div>

                        

                        <div class="page-title-actions mr-5" style="font-size: 20px;">
                            <form name="cd">
                            <input type="hidden" name="" id="timeExamLimit" value="<?php echo $selExamTimeLimit; ?>">
                            <label>Remaining Time : </label>
                            <input style="border:none;background-color: transparent;color:blue;font-size: 25px;" name="disp" type="text" class="clock" id="txt" value="00:00" size="5" readonly="true" />
                        </form> 
                        </div>   

                </div>
            </div> 
            


            <div class="container mt-5 mb-5" id="snap">
                <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="modal-content p-4" style="align-items: center;border-radius: 30px;">
                    <div class="modal-header mb-2" style="border-radius: 15px;">
                        <div class="modal-title" id="exampleModalLabel" style="">
                            <div><h5 class="text-primary">Rules to follow during all online proctored exams:</h5></div><br>
                            </div>
                            <ul>
                                <li><h6 style="color:#808080">If you trying to switch tab, minimize browser, open another application and other unfair means, Exam will submit automatically</h6></li>
                                <li><h6 style="color:#808080">You must use a functioning webcam and microphone</h6></li>
                                <li><h6 style="color:#808080">No cell phones or other secondary devices in the room or test area</h6></li>
                                <li><h6 style="color:#808080">No one else can be in the room with you</h6></li>
                                <li><h6 style="color:#808080">The testing room must be well-lit and you must be clearly visible</h6></li>
                                <li><h6 style="color:#808080">Do not leave the camera</h6></li>
                            </ul>

                        
                    </div>
                    <div class="modal-body"> 
                    <button type="button" class="btn btn-xlg btn-warning p-3 pl-4 pr-4  text-center" id="snap" onclick="openFullscreen()">Load Exam Questions</button>
                    </div>
                    </div>
                </div>
                <div class="col-md-2 mb-lg-5"> </div>
            </div>


        </div>

    <div class="col-md-12 p-0 mb-4" id="show_exam">
        <form method="post" id="submitAnswerFrm">
            <input type="hidden" name="exam_id" id="exam_id" value="<?php echo $examId; ?>">
            <input type="hidden" name="examAction" id="examAction" >
        <table class="align-middle mb-0 table table-borderless table-striped table-hover" id="tableList">
        <?php 
            $selQuest = $conn->query("SELECT * FROM exam_question_tbl WHERE exam_id='$examId' ORDER BY rand() LIMIT $exDisplayLimit ");
            if($selQuest->rowCount() > 0)
            {
                $i = 1;
                while ($selQuestRow = $selQuest->fetch(PDO::FETCH_ASSOC)) { ?>
                      <?php $questId = $selQuestRow['eqt_id']; ?>
                    <tr>
                        <td>
                            <p><b><?php echo $i++ ; ?> .) <?php echo $selQuestRow['exam_question']; ?></b></p>
                            <div class="col-md-4 float-left">
                              <div class="form-group pl-4 ">
                                <input name="answer[<?php echo $questId; ?>][correct]" value="<?php echo $selQuestRow['exam_ch1']; ?>" class="form-check-input" type="radio" value="" id="invalidCheck" required >
                               
                                <label class="form-check-label" for="invalidCheck">
                                    <?php echo $selQuestRow['exam_ch1']; ?>
                                </label>
                              </div>  

                              <div class="form-group pl-4">
                                <input name="answer[<?php echo $questId; ?>][correct]" value="<?php echo $selQuestRow['exam_ch2']; ?>" class="form-check-input" type="radio" value="" id="invalidCheck" required >
                               
                                <label class="form-check-label" for="invalidCheck">
                                    <?php echo $selQuestRow['exam_ch2']; ?>
                                </label>
                              </div>   
                            </div>
                            <div class="col-md-8 float-left">
                             <div class="form-group pl-4">
                                <input name="answer[<?php echo $questId; ?>][correct]" value="<?php echo $selQuestRow['exam_ch3']; ?>" class="form-check-input" type="radio" value="" id="invalidCheck" required >
                               
                                <label class="form-check-label" for="invalidCheck">
                                    <?php echo $selQuestRow['exam_ch3']; ?>
                                </label>
                              </div>  

                              <div class="form-group pl-4">
                                <input name="answer[<?php echo $questId; ?>][correct]" value="<?php echo $selQuestRow['exam_ch4']; ?>" class="form-check-input" type="radio" value="" id="invalidCheck" required >
                               
                                <label class="form-check-label" for="invalidCheck">
                                    <?php echo $selQuestRow['exam_ch4']; ?>
                                </label>
                              </div>   
                            </div>
                            </div>
                             

                        </td>
                    </tr>


                <?php }
                ?>
                       <tr>
                             <td style="padding: 20px;">
                                 <button type="button" class="btn btn-xlg btn-warning p-3 pl-4 pr-4" id="resetExamFrm">Reset</button>
                                 <input name="submit" type="submit" value="Submit" class="btn btn-xlg btn-primary p-3 pl-4 pr-4 float-right" id="submitAnswerFrmBtn"  onClick="take_snapshot()" >
                             </td>
                         </tr>

                <?php
            }
            else
            { ?>
                <b>No question at this moment</b>
            <?php }
         ?>   
              </table>

        </form>
    </div>
</div>


<script>

    document.addEventListener("visibilitychange",function(){

        document.title = document.visibilityState;

        if(document.visibilityState=="hidden"){
            alert("Violence detection!! Closing exam...");
            var url = new URL(window.location.href);
            var c = url.searchParams.get("id");
            window.location.href = "home.php?page=closeexam&id="+c;
        }
    })




    // Full screen
    $(document).ready(function() {
        $("#show_exam").css("display", "none");
        $("#sidebar_hide").css("display", "block");

        document.addEventListener('keydown', function(event){
            if(event.key === "Escape"){
                // alert("Hello");
            }
            if (event.ctrlKey) {
                event.preventDefault();
            } 
            if (event.keyCode == 18) {
                event.preventDefault();
            }
        });


    });
    
    $( "#snap" ).click(function() {
        $("#show_exam").css("display", "block");
        $("#snap").css("display", "none");
        $("#sidebar_hide").css("display", "none");


        $(window).keydown(function(event){
            if(event.keyCode == 116) {
                 event.preventDefault();
                return false;
            }

      });

    });

    var elem = document.documentElement;
    function openFullscreen() {
        // alert("hello");
        if (elem.requestFullscreen) {
            elem.requestFullscreen();
        } else if (elem.webkitRequestFullscreen) { /* Safari */
            elem.webkitRequestFullscreen();
        } else if (elem.msRequestFullscreen) { /* IE11 */
            elem.msRequestFullscreen();
        }
    }

   

      Webcam.set({
        width: 100,
        height: 100,
        image_format: "jpeg",
        jpeg_quality: 90,
      });

      Webcam.attach("#my_camera");
 
      function take_snapshot() {
        Webcam.snap(function (data_uri) {


            var files = data_uri
            var url = new URL(window.location.href);
            var examId = url.searchParams.get("id");

            // Save SS into DB using Ajax

            $.ajax({
                type: 'POST',
                url: 'file.php',
                data: {
                    img:files,
                    examId:examId
                },
                success: function(response){

                    if(response == 'updated'){

                    }else if(response == 'done'){
                        
                    }
                    else{
                        alert('Somthing Went Wrong!');                    
                    }
                },
            });

        });

      }

    

</script>
