<?php

//require_once('partida.php');

function login() {
    $app = \Slim\Slim::getInstance();
    if (!empty($_POST['email']) && !empty($_POST['senha'])) {
        $email = $_POST['email'];
        $senha = $_POST['senha'];
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

function getUsuario($id) {
    $app = \Slim\Slim::getInstance();
    $sql = "select u.id, u.email, u.nome, u.papel " .
            "from usuario u " .
            "where u.id=:id";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("id", $id);
        $stmt->execute();
        $usuario = $stmt->fetchObject();
        $db = null;

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

function setUsuarios() {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    // O retorno está vindo em json!!!!
    $id = $requestBody['id'];
    $email = $requestBody['email'];
    $nome = $requestBody['nome'];
    $senha = $requestBody['senha'];
    $papel = $requestBody['papel'];

    try {
        $usuario_ORM = ORM::for_table('usuario')->find_one($id);
        $usuario_ORM->set('email', $email);
        $usuario_ORM->set('nome', $nome);
        $usuario_ORM->set('senha', $senha);
        $usuario_ORM->set('papel', $papel);
        $usuario_ORM->save();
        $usuario = $usuario_ORM->as_array();
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

function newUsuario() {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    // O retorno está vindo em json!!!!
    //$id = $requestBody['id'];
    $email = $requestBody['email'];
    $nome = $requestBody['nome'];
    $senha = $requestBody['senha'];
    $papel = $requestBody['papel'];

    try {
        $usuario_ORM = ORM::for_table('usuario')->create();
        $usuario_ORM->set('email', $email);
        $usuario_ORM->set('nome', $nome);
        $usuario_ORM->set('senha', $senha);
        $usuario_ORM->set('papel', $papel);
        $usuario_ORM->save();
        $usuario = $usuario_ORM->as_array();
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
        $usuario_ORM = ORM::for_table('usuario')->find_one($id);
        $usuario_ORM->delete();
        $usuario = $usuario_ORM->as_array();
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

