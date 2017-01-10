<?php
/**
 * Created by PhpStorm.
 * User: Marion
 * Date: 01/01/2017
 * Time: 14:25
 */

require_once("const.php");
header('Location: accueil');
exit();

$url='https://www.youtube.com/playlist?list=PL3JEr2e7z_IhuP2_xWlgPfeOWO1SZHgOb';
$url2 = 'https://www.youtube.com/browse_ajax?action_continuation=1&amp;continuation=4qmFsgIuEiRWTFBMM0pFcjJlN3pfSWh1UDJfeFdsZ1BmZU9XTzFTWkhnT2IaBkNHVSUzRA%253D%253D';

$lines_array = file($url2);

$lines_string = implode('',$lines_array);

$decoded = json_decode($lines_string);

echo $decoded->content_html;

file_put_contents('content.txt', $decoded->content_html);


require_once("const.php");
header('Location: home');
exit();
