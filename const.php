<?php
/**
 * Created by PhpStorm.
 * User: Marion
 * Date: 09/01/2017
 * Time: 18:38
 */

if($_SERVER['HTTP_HOST'] == 'localhost') {
    ini_set("display_errors", 1);
    define('BASE_URL', 'localhost/Music/');
    define('BASE_PATH', 'F:/wamp/www/Music/');
    define('HOSTNAME', 'localhost');
    define('DBNAME', 'ColiGo');
    define('DBLOGIN', 'root');
    define('DBPWD', 'root');
    define('DEBUG', 1);
}
