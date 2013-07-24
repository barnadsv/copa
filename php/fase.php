<?php

function getFases() {
    $app = \Slim\Slim::getInstance();
    try {

        $fases = ORM::for_table('fase')->find_array();
        array_walk($fases, function(&$fase, $key) {
        	$fase['value'] = $fase['id'];
        	$fase['text']  = $fase['nom_fase'];
        });
        arrayToUtf8($fases); //Quando está no XAMPP, não é necessário...
        // Include support for JSONP requests
        $app->response()->header('Content-Type', 'application/json');
        if (!isset($_GET['callback'])) {
            echo json_encode($fases);
        } else {
            echo $_GET['callback'] . '(' . json_encode($fases) . ');';
        }

    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }

}


function getFase($id, $chamadaInterna = false) {
    $app = \Slim\Slim::getInstance();
    try {
        $fase = ORM::for_table('fase')->find_one($id)->as_array();
        if ($chamadaInterna) {
            return $fase;
        } else {
            $app->response()->header('Content-Type', 'application/json');
            // Include support for JSONP requests
            if (!isset($_GET['callback'])) {
                echo json_encode($fase);
            } else {
                echo $_GET['callback'] . '(' . json_encode($fase) . ');';
            }
        }
    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }
}



function setFases() {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    $params = explode("&", $requestBody);
    $name = explode("=", $params[0]);
    $value = explode("=", $params[1]);
    $pk = explode("=", $params[2]);

    try {
        cadastrarLog('Update - Inicio', 'fase', null, null, null, null, null);
        $id = $pk[1];
        $fase_ORM = ORM::for_table('fase')->find_one($id);
        $fase_ORM->set($name[1], urldecode($value[1]));
        $fase_ORM->save();
        cadastrarLog('Update - Fim', 'fase', null, null, null, null, null);
        $fase = $fase_ORM->as_array();

        arrayToUtf8($fase);
        // Include support for JSONP requests
        if (!isset($_GET['callback'])) {
            echo json_encode($fase);
        } else {
            echo $_GET['callback'] . '(' . json_encode($fase) . ');';
        }

    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }

}


function newFase() {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    $params = explode("&", $requestBody);
    foreach($params as $param) {
        $subparams = explode("=", $param);
        $nome[] = $subparams[0];
        $valor[] = $subparams[1];
    }

    $nom_fase = $valor[0];

    try {
        cadastrarLog('Insert - Inicio', 'fase', null, null, null, null, null);
        $fase_ORM = ORM::for_table('fase')->create();
        $fase_ORM->set('nom_fase', $nom_fase);
        $fase_ORM->save();
        cadastrarLog('Insert - Fim', 'fase', null, null, null, null, null);
        $fase = getLocal($fase_ORM->get('id'), true);
        arrayToUtf8($fase);
        // Include support for JSONP requests
        $app->response()->header('Content-Type', 'application/json');
        if (!isset($_GET['callback'])) {
            echo json_encode($fase);
        } else {
            echo $_GET['callback'] . '(' . json_encode($fase) . ');';
        }
    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }
}

function removeFase($id) {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    // O retorno está vindo em json!!!!
    //$id = $requestBody['id'];

    try {
        cadastrarLog('Delete - Inicio', 'fase', null, null, null, null, null);
        $fase_ORM = ORM::for_table('fase')->find_one($id);
        $fase_ORM->delete();
        cadastrarLog('Delete - Fim', 'fase', null, null, null, null, null);
        $fase = $fase_ORM->as_array();
        arrayToUtf8($fase);
        // Include support for JSONP requests
        $app->response()->header('Content-Type', 'application/json');
        if (!isset($_GET['callback'])) {
            echo json_encode($fase);
        } else {
            echo $_GET['callback'] . '(' . json_encode($fase) . ');';
        }
    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }
}
