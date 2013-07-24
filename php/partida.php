<?php

require_once('palpite.php');

function getPartidas($chamadaInterna = false) {
    $app = \Slim\Slim::getInstance();
    try {

        $partidas = ORM::for_table('partida')->find_array();
        array_walk($partidas, function(&$partida, $key) {
             if ($partida) {
                //$partida = $partida_ORM->as_array();
                $local_ORM = ORM::for_table('local')->find_one($partida['local_id']);
                $local = $local_ORM->as_array();
                $fase_ORM = ORM::for_table('fase')->find_one($partida['fase_id']);
                $fase = $fase_ORM->as_array();
                $equipe_1_ORM = ORM::for_table('equipe')->find_one($partida['equipe_1_id']);
                $equipe_1 = $equipe_1_ORM->as_array();
                $equipe_2_ORM = ORM::for_table('equipe')->find_one($partida['equipe_2_id']);
                $equipe_2 = $equipe_2_ORM->as_array();
                $partida['local'] = $local;
                $partida['fase'] = $fase;
                $partida['equipe_1'] = $equipe_1;
                $partida['equipe_2'] = $equipe_2;
            }
         });
        arrayToUtf8($partidas); //Quando está no XAMPP, não é necessário...
        // Include support for JSONP requests
         if ($chamadaInterna) {
            return $partidas;
        } else {
            $app->response()->header('Content-Type', 'application/json');
            if (!isset($_GET['callback'])) {
                echo json_encode($partidas);
            } else {
                echo $_GET['callback'] . '(' . json_encode($partidas) . ');';
            }
        }
    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }

}

function getPartida($id, $chamadaInterna = false) {
    $app = \Slim\Slim::getInstance();
    try {
        $partida = ORM::for_table('partida')->find_one($id)->as_array();
        if ($partida) {
            $local_ORM = ORM::for_table('local')->find_one($partida['local_id']);
            $local = $local_ORM->as_array();
            $fase_ORM = ORM::for_table('fase')->find_one($partida['fase_id']);
            $fase = $fase_ORM->as_array();
            $equipe_1_ORM = ORM::for_table('equipe')->find_one($partida['equipe_1_id']);
            $equipe_1 = $equipe_1_ORM->as_array();
            $equipe_2_ORM = ORM::for_table('equipe')->find_one($partida['equipe_2_id']);
            $equipe_2 = $equipe_2_ORM->as_array();
            $partida['local'] = $local;
            $partida['fase'] = $fase;
            $partida['equipe_1'] = $equipe_1;
            $partida['equipe_2'] = $equipe_2;
        }
        if ($chamadaInterna) {
            return $partida;
        } else {
            $app->response()->header('Content-Type', 'application/json');
            // Include support for JSONP requests
            if (!isset($_GET['callback'])) {
                echo json_encode($partida);
            } else {
                echo $_GET['callback'] . '(' . json_encode($partida) . ');';
            }
        }
    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }
}

function getPalpitesByPartida($id) {

    $sql = "SELECT pl.id, pl.usuario_id, pl.partida_id, pl.dth_palpite, pl.qtd_gols_equipe_1, pl.qtd_gols_equipe_2, pl.qtd_pontos
    		FROM partida pr join palpite pl ON pr.id = pl.partida_id
			WHERE pr.id = :id
    		ORDER BY pl.partida_id";

    try {
        $db = getConnection();
    	$stmt = $db->prepare($sql);
    	$stmt->bindParam("id", $id);
    	$stmt->execute();
    	$palpites = $stmt->fetchAll(PDO::FETCH_OBJ);
		$db = null;

        // Include support for JSONP requests
        if (!isset($_GET['callback'])) {
            echo json_encode($palpites);
        } else {
            echo $_GET['callback'] . '(' . json_encode($palpites) . ');';
        }

	} catch(PDOException $e) {
		echo '{"error":{"text":'. $e->getMessage() .'}}';
	}
}

function setPartidas() {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    $params = explode("&", $requestBody);
    $name = explode("=", $params[0]);
    $value = explode("=", $params[1]);
    $pk = explode("=", $params[2]);

    try {
        cadastrarLog('Update - Inicio', 'partida', null, null, null, null, null);
        $id = $pk[1];
        $partida_ORM = ORM::for_table('partida')->find_one($id);
        $partida_ORM->set($name[1], urldecode($value[1]));
        $partida_ORM->save();
        cadastrarLog('Update - Fim', 'partida', null, null, null, null, null);
        $partida = $partida_ORM->as_array();

        if ($name[1] == 'qtd_gols_equipe_1' || $name[1] == 'qtd_gols_equipe_2') {
            atualizaPontosPalpites($id, $partida_ORM->get('qtd_gols_equipe_1'), $partida_ORM->get('qtd_gols_equipe_2'));
        }

        arrayToUtf8($partida);
        // Include support for JSONP requests
        if (!isset($_GET['callback'])) {
            echo json_encode($partida);
        } else {
            echo $_GET['callback'] . '(' . json_encode($partida) . ');';
        }

    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }

}

function newPartida() {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    $params = explode("&", $requestBody);
    foreach($params as $param) {
        $subparams = explode("=", $param);
        $nome[] = $subparams[0];
        $valor[] = $subparams[1];
    }

    $fase_id = $valor[0];
    $grupo = $valor[1];
    $num_partida = $valor[2];
    $dth_partida = $valor[3];
    $local_id = $valor[4];
    $equipe_1_id = $valor[5];
    $qtd_gols_equipe_1 = $valor[6];
    $qtd_gols_equipe_2 = $valor[7];
    $equipe_2_id = $valor[8];
    $status = $valor[9];

    try {
        cadastrarLog('Insert - Inicio', 'partida', null, null, null, null, null);
        $partida_ORM = ORM::for_table('partida')->create();
        $partida_ORM->set('fase_id', $fase_id);
        $partida_ORM->set('grupo', $grupo);
        $partida_ORM->set('num_partida', $num_partida);
        $partida_ORM->set('dth_partida', $dth_partida);
        $partida_ORM->set('local_id', $local_id);
        $partida_ORM->set('equipe_1_id', $equipe_1_id);
        $partida_ORM->set('qtd_gols_equipe_1', $qtd_gols_equipe_1);
        $partida_ORM->set('qtd_gols_equipe_2', $qtd_gols_equipe_2);
        $partida_ORM->set('equipe_2_id', $equipe_2_id);
        $partida_ORM->set('status', $status);
        $partida_ORM->save();
        cadastrarLog('Insert - Fim', 'partida', null, null, null, null, null);
        $partida = getPartida($partida_ORM->get('id'), true);
        arrayToUtf8($partida);
        // Include support for JSONP requests
        $app->response()->header('Content-Type', 'application/json');
        if (!isset($_GET['callback'])) {
            echo json_encode($partida);
        } else {
            echo $_GET['callback'] . '(' . json_encode($partida) . ');';
        }
    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }
}

function removePartida($id) {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    // O retorno está vindo em json!!!!
    //$id = $requestBody['id'];

    try {
        cadastrarLog('Delete - Inicio', 'partida', null, null, null, null, null);
        $partida_ORM = ORM::for_table('partida')->find_one($id);
        $partida_ORM->delete();
        cadastrarLog('Delete - Fim', 'partida', null, null, null, null, null);
        $partida = $partida_ORM->as_array();
        arrayToUtf8($partida);
        // Include support for JSONP requests
        $app->response()->header('Content-Type', 'application/json');
        if (!isset($_GET['callback'])) {
            echo json_encode($partida);
        } else {
            echo $_GET['callback'] . '(' . json_encode($partida) . ');';
        }
    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }
}
