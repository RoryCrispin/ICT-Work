<?php 
$_POST["Post_Title_Input"]; 

$file = 'blog_settings.txt';
$errorFile = 'errorLog.txt';
$current = file_get_contents($file);

$current .= "
\nPOST_ID:" . time() . ";
POST_TITLE:" . $_POST["Post_Title_Input"] . "; 
POST_AUTHOR:" . $_POST["Post_Author_Input"] . ";
POST_DATE:" . date("F j, Y, g:i a") . "; 
POST_CONTENT:" . $_POST["Post_Content_Input"] . ";";

if (strpos($current, '$') !== false) { 

$errorLogCurrent = file_get_contents($errorFile);
$errorLogCurrent .= "\nIllegal characters detected! From IP: " . $_SERVER['REMOTE_ADDR'] . " at time " . time();
file_put_contents($errorFile, $errorMessage);
header( 'Location: http://rozzles.com/RozzPress' );
echo "<script type='text/javascript'>alert('Illegal characters detected! This offense has been noted');</script>";
} else {
file_put_contents($file, $current);
header( 'Location: http://rozzles.com/RozzPress' );
}

?>