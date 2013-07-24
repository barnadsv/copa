<?php

function getLocais() {
    $app = \Slim\Slim::getInstance();
    try {

        $locais = ORM::for_table('local')->find_array();
        array_walk($locais, function(&$local, $key) {
        	$local['value'] = $local['id'];
        	$local['text']  = $local['nom_cidade'];
        });
        arrayToUtf8($locais); //Quando está no XAMPP, não é necessário...
        // Include support for JSONP requests
        $app->response()->header('Content-Type', 'application/json');
        if (!isset($_GET['callback'])) {
            echo json_encode($locais);
        } else {
            echo $_GET['callback'] . '(' . json_encode($locais) . ');';
        }

    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }

}

function getLocal($id, $chamadaInterna = false) {
    $app = \Slim\Slim::getInstance();
    try {
        $local = ORM::for_table('local')->find_one($id)->as_array();
        if ($chamadaInterna) {
            return $local;
        } else {
            $app->response()->header('Content-Type', 'application/json');
            // Include support for JSONP requests
            if (!isset($_GET['callback'])) {
                echo json_encode($local);
            } else {
                echo $_GET['callback'] . '(' . json_encode($local) . ');';
            }
        }
    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }
}

function setLocais() {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    $params = explode("&", $requestBody);
    $name = explode("=", $params[0]);
    $value = explode("=", $params[1]);
    $pk = explode("=", $params[2]);

    try {
        cadastrarLog('Update - Inicio', 'local', null, null, null, null, null);
        $id = $pk[1];
        $local_ORM = ORM::for_table('local')->find_one($id);
        $local_ORM->set($name[1], urldecode($value[1]));
        $local_ORM->save();
        cadastrarLog('Update - Fim', 'local', null, null, null, null, null);
        $local = $local_ORM->as_array();

        arrayToUtf8($local);
        $app->response()->header('Content-Type', 'application/json');
        // Include support for JSONP requests
        if (!isset($_GET['callback'])) {
            echo json_encode($local);
        } else {
            echo $_GET['callback'] . '(' . json_encode($local) . ');';
        }

    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }

}


function newLocal() {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    $params = explode("&", $requestBody);
    foreach($params as $param) {
        $subparams = explode("=", $param);
        $nome[] = $subparams[0];
        $valor[] = $subparams[1];
    }

    $nom_cidade = $valor[0];

    try {
        cadastrarLog('Insert - Inicio', 'local', null, null, null, null, null);
        $local_ORM = ORM::for_table('local')->create();
        $local_ORM->set('nom_cidade', $nom_cidade);
        $local_ORM->save();
        cadastrarLog('Insert - Fim', 'local', null, null, null, null, null);
        $local = getLocal($local_ORM->get('id'), true);
        arrayToUtf8($local);
        // Include support for JSONP requests
        $app->response()->header('Content-Type', 'application/json');
        if (!isset($_GET['callback'])) {
            echo json_encode($local);
        } else {
            echo $_GET['callback'] . '(' . json_encode($local) . ');';
        }
    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }
}

function removeLocal($id) {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    // O retorno está vindo em json!!!!
    //$id = $requestBody['id'];

    try {
        cadastrarLog('Delete - Inicio', 'local', null, null, null, null, null);
        $local_ORM = ORM::for_table('local')->find_one($id);
        $local_ORM->delete();
        cadastrarLog('Delete - Inicio', 'local', null, null, null, null, null);
        $local = $local_ORM->as_array();
        arrayToUtf8($local);
        // Include support for JSONP requests
        $app->response()->header('Content-Type', 'application/json');
        if (!isset($_GET['callback'])) {
            echo json_encode($local);
        } else {
            echo $_GET['callback'] . '(' . json_encode($local) . ');';
        }
    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }
}
