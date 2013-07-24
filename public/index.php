<?php

require '../vendor/autoload.php';
//require_once('../vendor/NotORM/NotORM.php');
require_once('../vendor/idiorm-master/idiorm.php');
require_once('../php/utils.php');
require_once('../php/usuario.php');
require_once('../php/partida.php');
require_once('../php/palpite.php');
require_once('../php/local.php');
require_once('../php/equipe.php');
require_once('../php/fase.php');

initORM();

session_start();

date_default_timezone_set('America/Sao_Paulo');

$app = new \Slim\Slim();
//$app->contentType('application/json;charset=utf-8');
$app->config(array( 'templates.path' => '.' ));
$app->add(new \Slim\Middleware\ContentTypes());

//$app->get('/employees', authorize('user'), 'getEmployees');
$app->get('/', function() use ($app) {
	$app->render('index.html');
});

$app->post('/login', 'login');
$app->get('/usuarios', authorize('user'), 'getUsuarios');
$app->get('/usuarios/:id', authorize('user'), 'getUsuario');
$app->put('/usuarios', authorize('user'), 'setUsuarios');
$app->post('/usuarios', authorize('admin'), 'newUsuario');
$app->delete('/usuarios/:id', authorize('admin'), 'removeUsuario');
$app->get('/usuarios/:id/palpites', authorize('user'), 'getPalpitesByUsuario');
$app->get('/partidas', authorize('user'), 'getPartidas');
$app->get('/partidas/:id', authorize('user'), 'getPartida');
$app->get('/partidas/:id/palpites', authorize('user'), 'getPalpitesByPartida');
$app->put('/partidas', authorize('admin'), 'setPartidas');
$app->post('/partidas', authorize('admin'), 'newPartida');
$app->delete('/partidas/:id', authorize('admin'), 'removePartida');
$app->get('/palpites', authorize('user'), 'getPalpites');
$app->get('/palpites/:id', authorize('user'), 'getPalpite');
$app->put('/palpites', authorize('user'), 'setPalpites');
$app->get('/locais', authorize('user'), 'getLocais');
$app->put('/locais', authorize('admin'), 'setLocais');
$app->post('/locais', authorize('admin'), 'newLocal');
$app->delete('/locais/:id', authorize('admin'), 'removeLocal');
$app->get('/equipes', authorize('user'), 'getEquipes');
$app->put('/equipes', authorize('admin'), 'setEquipes');
$app->post('/equipes', authorize('admin'), 'newEquipe');
$app->delete('/equipes/:id', authorize('admin'), 'removeEquipe');
$app->get('/fases', authorize('user'), 'getFases');
$app->put('/fases', authorize('admin'), 'setFases');
$app->post('/fases', authorize('admin'), 'newFase');
$app->delete('/fases/:id', authorize('admin'), 'removeFase');
$app->post('/logoff', 'logoff');
$app->run();

// // front-controller, for Symfony2 application it's web/app_dev.php

// // Do not use application autoloader for the following files
// include  '../vendor/lisachenko/go-aop-php/src/Go/Core/AspectKernel.php';
// include  '../php/ApplicationAspectKernel.php';

// // Initialize an application aspect container
// $applicationAspectKernel = ApplicationAspectKernel::getInstance();
// $applicationAspectKernel->init(array(
//         // Configuration for autoload namespaces
//         'autoload' => array(
//             'Go'               => realpath(__DIR__ . '/../vendor/lisachenko/go-aop-php/src/'),
//             'TokenReflection'  => realpath(__DIR__ . '/../vendor/andrewsville/php-token-reflection/'),
//             'Doctrine\\Common' => realpath(__DIR__ . '/../vendor/doctrine/common/lib/')
//         ),
//         // Application root directory
//         'appDir' => __DIR__ . '/../',
//         // Cache directory should be disabled for now
//         'cacheDir' => null,
//         // Include paths restricts the directories where aspects should be applied, or empty for all source files
//         'includePaths' => array(
//             __DIR__ . '/../src/'
//         )
// ));


