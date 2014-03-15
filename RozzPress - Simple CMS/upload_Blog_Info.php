<?php 

$file = 'blog_settings.txt';
$current = file_get_contents($file);
$postName = $_POST["Blog_Name_Input"];
$postBio = $_POST["Blog_Bio_Input"];
$postAbout = $_POST["Blog_About_Input"];

if ($postName != ""){
$pattern = '/(?:BLOG_NAME:)(.*)(?:;)/';
$replacement = "BLOG_NAME:". $postName .";\n";
$current = preg_replace($pattern, $replacement, $current);
}

if ($postBio != ""){
$pattern = '/(?:BLOG_BIO:)(.*)(?:;)/';
$replacement = "BLOG_BIO:". $postBio .";\n";
$current  = preg_replace($pattern, $replacement, $current);
}

if ($postAbout != ""){
$pattern = '/(?:BLOG_ABOUT:)(.*)(?:;)/';
$replacement = "BLOG_ABOUT:". $postAbout .";\n";
$current  = preg_replace($pattern, $replacement, $current);
}


file_put_contents($file, $current);
header( 'Location: http://rozzles.com/RozzPress' ) ;
?>