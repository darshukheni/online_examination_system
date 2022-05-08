<?php 
session_start();

if(!isset($_SESSION['admin']['adminnakalogin']) == true) header("location:index.php");



 ?>



 <head>
 <script src=
"https://code.jquery.com/jquery-3.3.1.min.js">
  </script>
 </head>




<?php include("../../conn.php"); ?>
<!--  HEADER -->
<?php include("includes/header.php"); ?>      

<!-- UI THEME -->
<?php  //include("includes/ui-theme.php");?>

<div class="app-main">
<!-- sidebar  -->
<?php include("includes/sidebar.php"); ?>



<!-- Condition If page click -->
<?php 
   @$page = $_GET['page'];


   if($page != '')
   {
     if($page == "add-course")
     {
     include("pages/add-course.php");
     }
     else if($page == "manage-course")
     {
     	include("pages/manage-course.php");
     }
     else if($page == "manage-exam")
     {
      include("pages/manage-exam.php");
     }
     else if($page == "manage-examinee")
     {
      include("pages/manage-examinee.php");
     }
     else if($page == "ranking-exam")
     {
      include("pages/ranking-exam.php");
     }
     else if($page == "feedbacks")
     {
      include("pages/feedbacks.php");
     }
     else if($page == "examinee-result")
     {
      include("pages/examinee-result.php");
     }
     else if($page == "add-multiple")
     {
       include("pages/addmultiple-examinee.php");
     }
     else if($page == "add-multipleq")
     {
       include("pages/addmultiple-questions.php");
     }
     else if($page == "viewss")
     {
       include("pages/viewss.php");
     }

       
   }
   // Else ang home nga page mo display
   else
   {
     include("pages/home.php"); 
   }


 ?> 


<!-- MAO NI IYA FOOTER -->
<?php include("includes/footer.php"); ?>

<?php include("includes/modals.php"); ?>












<!-- For Esc  -->
<!-- <script>
    $(document).on(
      'keydown', function(event) {
        if (event.key == "Escape") {
            alert('Esc key pressed.');
        }
        if (event.ctrlKey) {
        alert("The CTRL key was pressed!");
        } 
    });
</script> -->

<!-- F5 key desaible -->
<!-- <script type="text/javascript">

    $(document).ready(function() {
      $(window).keydown(function(event){
          if(event.keyCode == 116) {
            event.preventDefault();
            return false;
          }
      });
    });
</script> -->