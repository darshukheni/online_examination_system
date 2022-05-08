
<!-- Youtube https://www.youtube.com/watch?v=3lPhraiNVcw&t=567s -->
<div class="app-main__outer">
    <div id="refreshData">
    <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <h3 class="display-5">Trendy News</h3>
            <p class="lead">Have Nice day! </p>
        </div>
    </div>
    <div class="container">
        <div class="row mb-3 col-md-12 ">

    <?php
        $url = 'https://newsapi.org/v2/everything?q=Apple&from=2022-04-22&sortBy=popularity&apiKey=a67993ce54cd459f8573aebd04f45b8c';
        $responese = file_get_contents($url);
        $NewsData = json_decode($responese);

        foreach($NewsData->articles as $news){

            ?>   
                <div class="col-md-4 mb-3 ">
                    <div class="card mr-1">
                        <img class="card-img-top" src="<?php echo $news->urlToImage; ?>" alt="Card image cap">
                        <div class="card-body">
                            <p class="card-text">
                                
                                <h5 class="mb-3"><?php  echo $news->title; ?></h5>
                                <p>Desc : <?php  echo $news->description; ?></p>
                                <p>Content : <?php  echo $news->content; ?></p>
                                <p>Author : <?php  echo $news->author; ?></p>
                            </p>
                        </div>
                    </div>
                </div>
           
            <?php
        }
    ?>
        </div>
    </div>
</div>


<script>
// document.onkeydown = function(evt) {
//     evt = evt || window.event;
//     var isEscape = false;
//     if ("key" in evt) {
//         isEscape = (evt.key === "Escape" || evt.key === "Esc");
//     } else {
//         isEscape = (evt.keyCode === 27);
//     }
//     if (isEscape) {
//         alert("Escape");
//     }

//     if (evt.ctrlKey) {
//         alert("The CTRL key was pressed!");
//     }

//     if (evt.altKey) {
//         alert("The ALT key was pressed!");
//     }

//     $(window).keydown(function(event){
//         if(event.keyCode == 116) {
//           event.preventDefault();
//           return false;
//         }
//       });
// };


</script>