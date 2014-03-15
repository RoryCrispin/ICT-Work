<?php
$configFile = file_get_contents('blog_settings.txt');

preg_match('/(?:BLOG_NAME:)(.*)(?:;)/', $configFile, $BLOG_NAME);
$BLOG_NAME = $BLOG_NAME[1];

preg_match('/(?:BLOG_BIO:)(.*)(?:;)/', $configFile, $BLOG_BIO);
$BLOG_BIO = $BLOG_BIO[1];

preg_match('/(?:BLOG_ABOUT:)(.*)(?:;)/', $configFile, $BLOG_ABOUT);
$BLOG_ABOUT = $BLOG_ABOUT[1];

preg_match_all('/(?:POST_TITLE:)(.*)(?:;)/', $configFile, $POST_TITLE);
$POST_COUNT = count($POST_TITLE[1]);

preg_match_all('/(?:POST_AUTHOR:)(.*)(?:;)/', $configFile, $POST_AUTHOR);

preg_match_all('/(?:POST_DATE:)(.*)(?:;)/', $configFile, $POST_DATE);

preg_match_all('/(?:POST_CONTENT:)(.*)(?:;)/', $configFile, $POST_CONTENT);


?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title><?php echo $BLOG_NAME;?></title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/index.css" rel="stylesheet">
  </head>

  <body>

  <div class="blog-masthead">
    <div class="container">
      <nav class="blog-nav">
        <a class="blog-nav-item active" href="#">Home</a>
        <a class="blog-nav-item" href="new_post.php">New Post</a>
        <a class="blog-nav-item" href="blog_info.php">Blog info</a>
      </nav>
    </div>
  </div>

    <div class="container">

      <div class="blog-header">
        <h1 class="blog-title"><?php echo $BLOG_NAME;?></h1>
        <p class="lead blog-description"><?php echo $BLOG_BIO ?></p>
      </div>

      <div class="row">

        <div class="col-sm-8 blog-main">

          
          <?php
          for($i = $POST_COUNT -1; $i >= 0; $i--){
          echo " 
                    <div class='blog-post'>
                      <h2 class='blog-post-title'> ". $POST_TITLE[1][$i] . "</h2>
                      <p class='blog-post-meta'> Posted on " . $POST_DATE[1][$i] ." by <a href='#'>" . $POST_AUTHOR[1][$i] . "</a></p> " . $POST_CONTENT[1][$i] . "
                    </div><!-- /.blog-post -->
                    ";
                    }
                    ?>

          <ul class="pager">
            <li><a href="#">Previous</a></li>
            <li><a href="#">Next</a></li>
          </ul>

        </div><!-- /.blog-main -->

        <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
          <div class="sidebar-module sidebar-module-inset">
            <h4>About</h4>
            <p> <?php echo $BLOG_ABOUT; ?></p>
          </div>
          
           <div class="sidebar-module">
            <h4>Elsewhere</h4>
            <ol class="list-unstyled">
              <li><a href="#">GitHub</a></li>
              <li><a href="#">Twitter</a></li>
              <li><a href="#">Facebook</a></li>
            </ol>
          </div>
        </div><!-- /.blog-sidebar -->

      </div><!-- /.row -->

    </div><!-- /.container -->

    <div class="blog-footer">
      <p>Blog template built for <a href="http://getbootstrap.com">Bootstrap</a> by <a href="https://twitter.com/mdo">@mdo</a>.</p>
      <p>
        <a href="#">Back to top</a>
      </p>
    </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <?php
    $file = 'ViewStats.txt';
    $current = file_get_contents($file);
    $current .= "USER STATS:" . "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]" . "*" . time() . "*" . $_SERVER['REMOTE_ADDR'] . "*" . $_SERVER['HTTP_REFERER'] . ";\n";
    // Write the contents back to the file
    file_put_contents($file, $current);
    ?>
    
  </body>
</html>
