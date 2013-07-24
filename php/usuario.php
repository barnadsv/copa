<?php

require_once('palpite.php');

function login() {
    $app = \Slim\Slim::getInstance();
    if (!empty($_POST['email']) && !empty($_POST['senha'])) {
        $email = $_POST['email'];
        $senha = hash('sha256', $_POST['senha']);
        try {
        	$usuarioORM = ORM::for_table('usuario')->where('email', $email)->find_one();
            if ($usuarioORM) {
        		$usuario = $usuarioORM->as_array();
                if ($usuario["senha"] == $senha) {
                    $usuario = array("usuario_id"=>$usuario["id"], "email"=>$email, "nome"=>$usuario["nome"], "papel"=>$usuario["papel"], "session_id"=>session_id());
        			$_SESSION['usuario'] = $usuario;
                    arrayToUtf8($usuario); //Quando está no XAMPP, não é necessário...
        			$app->response()->header('Content-Type', 'application/json');
                    echo json_encode($usuario);
        		} else {
        			$app->response()->status(403);
                    $app->response()->header('X-Status-Reason', 'Senha não confere.');
                }
        	} else {
                $app->response()->status(403);
                $app->response()->header('X-Status-Reason', 'Usuário não existente.');
        	}
        } catch(PDOException $e) {
        	$app->response()->status(400);
            $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
        }
    } else {
        $app->response()->status(403);
        $app->response()->header('X-Status-Reason', 'E-mail e senha são obrigatórios.');
    }
}

function getUsuarios() {
    $app = \Slim\Slim::getInstance();
    try {

        $usuarios = ORM::for_table('usuario')->find_array();
        arrayToUtf8($usuarios); //Quando está no XAMPP, não é necessário...
        // Include support for JSONP requests
        $app->response()->header('Content-Type', 'application/json');
        if (!isset($_GET['callback'])) {
            echo json_encode($usuarios);
        } else {
            echo $_GET['callback'] . '(' . json_encode($usuarios) . ');';
        }

    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }

}

function getUsuario($id, $chamadaInterna = false) {
    $app = \Slim\Slim::getInstance();
    try {
        $usuario = ORM::for_table('usuario')->find_one($id)->as_array();
        if ($chamadaInterna) {
            return $usuario;
        } else {
            $app->response()->header('Content-Type', 'application/json');
            // Include support for JSONP requests
            if (!isset($_GET['callback'])) {
                echo json_encode($usuario);
            } else {
                echo $_GET['callback'] . '(' . json_encode($usuario) . ');';
            }
        }
    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }
}

function setUsuarios() {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    $params = explode("&", $requestBody);
    $name = explode("=", $params[0]);
    $value = explode("=", $params[1]);
    $pk = explode("=", $params[2]);

    $usuario = $_SESSION['usuario'];
    if ($usuario["usuario_id"] == $pk[1] || $usuario["papel"] == 'admin') {
        if ($name[1] == 'senha') {
            $value[1] = hash('sha256', $value[1]);
        }
        try {
            cadastrarLog('Update - Inicio', 'usuario', null, null, null, null, null);
            $sem_palpites = false;
            $id = $pk[1];
            $usuario_ORM = ORM::for_table('usuario')->find_one($id);
            if ($usuario_ORM->papel == 'guest') {
                $sem_palpites = true;
            }
            $usuario_ORM->set($name[1], urldecode($value[1]));
            //$usuario_ORM->set($name[1], mb_convert_encoding($value[1], "UTF-8", "HTML-ENTITIES"));
            $usuario_ORM->save();
            cadastrarLog('Update - Fim', 'usuario', null, null, null, null, null);
            $usuario = $usuario_ORM->as_array();

            if ($name[1] == 'papel') {
                if ($sem_palpites) {
                    if ($value[1] == 'user' || $value[1] == 'admin') {
                        populaPalpitesUsuario($usuario_ORM->id);
                    }
                } else {
                    if ($value[1] == 'guest') {
                        removePalpitesUsuario($usuario_ORM->id);
                    }
                }
            }

            arrayToUtf8($usuario);
            $app->response()->header('Content-Type', 'application/json');
            // Include support for JSONP requests
            if (!isset($_GET['callback'])) {
                echo json_encode($usuario);
            } else {
                echo $_GET['callback'] . '(' . json_encode($usuario) . ');';
            }

        } catch(PDOException $e) {
            $app->response()->status(400);
            $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
        }
    } else {
        $app->response()->status(403);
        $app->response()->header('X-Status-Reason', 'Acesso não permitido.');
    }
}


function newUsuario() {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    $params = explode("&", $requestBody);
    foreach($params as $param) {
        $subparams = explode("=", $param);
        $nome[] = $subparams[0];
        $valor[] = $subparams[1];
    }

    $email = $valor[0];
    $nome = $valor[1];
    $senha = hash('sha256', $valor[2]);
    $papel = $valor[3];
    $contribuicao = $valor[4];

    try {
        cadastrarLog('Insert - Inicio', 'usuario', null, null, null, null, null);
        $usuario_ORM = ORM::for_table('usuario')->create();
        $usuario_ORM->set('email', $email);
        $usuario_ORM->set('nome', $nome);
        $usuario_ORM->set('senha', $senha);
        $usuario_ORM->set('papel', $papel);
        $usuario_ORM->set('contribuicao', $contribuicao);
        $usuario_ORM->save();
        cadastrarLog('Insert - Fim', 'usuario', null, null, null, null, null);
        $usuario = getUsuario($usuario_ORM->get('id'), true);

        if ($papel == 'user'|| $papel == 'admin') {
            populaPalpitesUsuario($usuario["id"]);
        }

        arrayToUtf8($usuario);
        // Include support for JSONP requests
        $app->response()->header('Content-Type', 'application/json');
        if (!isset($_GET['callback'])) {
            echo json_encode($usuario);
        } else {
            echo $_GET['callback'] . '(' . json_encode($usuario) . ');';
        }
    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }
}

function removeUsuario($id) {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    // O retorno está vindo em json!!!!
    //$id = $requestBody['id'];

    try {
        cadastrarLog('Delete - Inicio', 'usuario', null, null, null, null, null);
        removePalpitesUsuario($id);
        $usuario_ORM = ORM::for_table('usuario')->find_one($id);
        $usuario_ORM->delete();
        cadastrarLog('Delete - Fim', 'usuario', null, null, null, null, null);
        $usuario = $usuario_ORM->as_array();
        //arrayToUtf8($usuario);
        // Include support for JSONP requests
        $app->response()->header('Content-Type', 'application/json');
        if (!isset($_GET['callback'])) {
            echo json_encode($usuario);
        } else {
            echo $_GET['callback'] . '(' . json_encode($usuario) . ');';
        }
    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }
}

