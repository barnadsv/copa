<?php

function getEquipes() {
    $app = \Slim\Slim::getInstance();
    try {

        $equipes = ORM::for_table('equipe')->find_array();
        array_walk($equipes, function(&$equipe, $key) {
        	$equipe['value'] = $equipe['id'];
        	$equipe['text']  = $equipe['nom_equipe'];
        });
        arrayToUtf8($equipes); //Quando está no XAMPP, não é necessário...
        // Include support for JSONP requests
        $app->response()->header('Content-Type', 'application/json');
        if (!isset($_GET['callback'])) {
            echo json_encode($equipes);
        } else {
            echo $_GET['callback'] . '(' . json_encode($equipes) . ');';
        }

    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }

}

function getEquipe($id, $chamadaInterna = false) {
    $app = \Slim\Slim::getInstance();
    try {
        $equipe = ORM::for_table('equipe')->find_one($id)->as_array();
        if ($chamadaInterna) {
            return $equipe;
        } else {
            $app->response()->header('Content-Type', 'application/json');
            // Include support for JSONP requests
            if (!isset($_GET['callback'])) {
                echo json_encode($equipe);
            } else {
                echo $_GET['callback'] . '(' . json_encode($equipe) . ');';
            }
        }
    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }
}

function setEquipes() {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    $params = explode("&", $requestBody);
    $name = explode("=", $params[0]);
    $value = explode("=", $params[1]);
    $pk = explode("=", $params[2]);

    try {
        cadastrarLog('Update - Inicio', 'equipe', null, null, null, null, null);
        $id = $pk[1];
        $equipe_ORM = ORM::for_table('equipe')->find_one($id);
        $equipe_ORM->set($name[1], urldecode($value[1]));
        $equipe_ORM->save();
        cadastrarLog('Update - Fim', 'equipe', null, null, null, null, null);
        $equipe = $equipe_ORM->as_array();
        arrayToUtf8($equipe);
        // Include support for JSONP requests
        if (!isset($_GET['callback'])) {
            echo json_encode($equipe);
        } else {
            echo $_GET['callback'] . '(' . json_encode($equipe) . ');';
        }

    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }

}

function newEquipe() {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    $params = explode("&", $requestBody);
    foreach($params as $param) {
        $subparams = explode("=", $param);
        $nome[] = $subparams[0];
        $valor[] = $subparams[1];
    }

    $nom_equipe = $valor[0];
    $img_bandeira = $valor[1];

    try {
        cadastrarLog('Insert - Inicio', 'equipe', null, null, null, null, null);
        $equipe_ORM = ORM::for_table('equipe')->create();
        $equipe_ORM->set('nom_equipe', $nom_equipe);
        $equipe_ORM->set('img_bandeira', $img_bandeira);
        $equipe_ORM->save();
        cadastrarLog('Insert - Fim', 'equipe', null, null, null, null, null);
        
        $equipe = getEquipe($equipe_ORM->get('id'), true);
        arrayToUtf8($equipe);
        // Include support for JSONP requests
        $app->response()->header('Content-Type', 'application/json');
        if (!isset($_GET['callback'])) {
            echo json_encode($equipe);
        } else {
            echo $_GET['callback'] . '(' . json_encode($equipe) . ');';
        }
    } catch(PDOException $e) {
        //ORM::get_db()->rollBack();
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }
}

function removeEquipe($id) {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    // O retorno está vindo em json!!!!
    //$id = $requestBody['id'];

    try {
        cadastrarLog('Delete - Inicio', 'equipe', null, null, null, null, null);
        $equipe_ORM = ORM::for_table('equipe')->find_one($id);
        $equipe_ORM->delete();
        cadastrarLog('Delete - Fim', 'equipe', null, null, null, null, null);
        $equipe = $equipe_ORM->as_array();
        arrayToUtf8($equipe);
        // Include support for JSONP requests
        $app->response()->header('Content-Type', 'application/json');
        if (!isset($_GET['callback'])) {
            echo json_encode($equipe);
        } else {
            echo $_GET['callback'] . '(' . json_encode($equipe) . ');';
        }
    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }
}
