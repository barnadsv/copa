<?php

require_once('partida.php');

function getPalpites($chamadaInterna = false) {
    $app = \Slim\Slim::getInstance();
    try {

        $palpites = ORM::for_table('palpite')->find_array();
        array_walk($palpites, function(&$palpite, $key) {
             $partida_ORM = ORM::for_table('partida')->find_one($palpite['partida_id']);
             if ($partida_ORM) {
                $partida = $partida_ORM->as_array();
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
                $palpite['partida'] = $partida;
            }
            $usuario_ORM = ORM::for_table('usuario')->find_one($palpite['usuario_id']);
            if ($usuario_ORM) {
                $usuario = $usuario_ORM->as_array();
                $palpite['usuario'] = $usuario;
            }
        });

        //arrayToUtf8($palpites); //Quando está no XAMPP, não é necessário...
        // Include support for JSONP requests
        if ($chamadaInterna) {
            return $palpites;
        } else {
            $app->response()->header('Content-Type', 'application/json');
            if (!isset($_GET['callback'])) {
                echo json_encode($palpites);
            } else {
                echo $_GET['callback'] . '(' . json_encode($palpites) . ');';
            }
        }

    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
    }

}

function getPalpitesByUsuario($id, $chamadaInterna = false) {
    $app = \Slim\Slim::getInstance();
    try {
        $palpites = ORM::for_table('palpite')->where('usuario_id', $id)->find_array();
        array_walk($palpites, function(&$palpite, $key) {
             $partida_ORM = ORM::for_table('partida')->find_one($palpite['partida_id']);
             if ($partida_ORM) {
                $partida = $partida_ORM->as_array();
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
                $palpite['partida'] = $partida;
            }
         });

        //aasort($palpites, "num_partida");

        //arrayToUtf8($palpites); //Quando está no XAMPP, não é necessário...
        // Include support for JSONP requests
        //$app->response()->status(200);
        if ($chamadaInterna) {
            return $palpites;
        } else {
            $app->response()->header('Content-Type', 'application/json');
            if (!isset($_GET['callback'])) {
                echo json_encode($palpites);
            } else {
                echo $_GET['callback'] . '(' . json_encode($palpites) . ');';
            }
        }
    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
        //$app->response()->status(400);
        //echo '{"error":{"text":'. $e->getMessage() .'}}';
    }

}

function getPalpite($id) {
    $sql = "select p.id, p.usuario_id, p.partida_id, p.dth_palpite, p.qtd_gols_equipe_1, p.qtd_gols_equipe_2, p.qtd_pontos " .
           "from palpite p " .
           "where p.id=:id";
    try {
        $db = getConnection();
        $stmt = $db->prepare($sql);
        $stmt->bindParam("id", $id);
        $stmt->execute();
        $palpite = $stmt->fetchObject();
        $db = null;

        // Include support for JSONP requests
        if (!isset($_GET['callback'])) {
            echo json_encode($palpite);
        } else {
            echo $_GET['callback'] . '(' . json_encode($palpite) . ');';
        }

    } catch(PDOException $e) {
        echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}

function setPalpites() {
    $app = \Slim\Slim::getInstance();
    $requestBody = urldecode($app->request()->getBody());
    $params = explode("&", $requestBody);
    $name = explode("=", $params[0]);
    $value = explode("=", $params[1]);
    $pk = explode("=", $params[2]);

    try {
        cadastrarLog('Update - Inicio', 'palpite', null, null, null, null, null);
        $id = $pk[1];
        $palpite_ORM = ORM::for_table('palpite')->find_one($id);
        if ($name[1] == 'qtd_gols_equipe_1' || $name[1] == 'qtd_gols_equipe_2') {
            $partida = getPartida($palpite_ORM->get('partida_id'), true);
            if ($partida['status'] != 'A iniciar') {
                $app->response()->status(403);
                $app->response()->header('X-Status-Reason', 'Esta partida já foi inciada. <br /><br />Você não pode mais mudar seu palpite.');
            } else  {
                $palpite_ORM->set($name[1], $value[1]);
                $palpite_ORM->set('dth_palpite', date('Y-m-d H:i:s'));
                $palpite_ORM->save();
                cadastrarLog('Update - Fim', 'palpite', null, null, null, null, null);
                $palpite = $palpite_ORM->as_array();
                //arrayToUtf8($palpite);

                // Include support for JSONP requests
                $app->response()->header('Content-Type', 'application/json');
                if (!isset($_GET['callback'])) {
                    echo json_encode($palpite);
                } else {
                    echo $_GET['callback'] . '(' . json_encode($palpite) . ');';
                }
            }
        }
        
    } catch(PDOException $e) {
        $app->response()->status(400);
        $app->response()->header('X-Status-Reason', preg_replace('/\s\s+/', ' ', Encoding::toUTF8($e->getMessage())));
        //echo '{"error":{"text":'. $e->getMessage() .'}}';
    }
}

function populaPalpitesUsuario($id) {
    $partidas = getPartidas(true);
    array_walk($partidas, function(&$partida, $key) use ($id) {
         if ($partida) {
            $palpite_ORM = ORM::for_table('palpite')->create();
            $palpite_ORM->set('usuario_id', $id);
            $palpite_ORM->set('partida_id', $partida['id']);
            $palpite_ORM->set('dth_palpite', date('Y-m-d H:i:s'));
            $palpite_ORM->save();
        }
     });
}

function removePalpitesUsuario($id) {
    cadastrarLog('Delete - Inicio', 'palpite', null, null, null, null, null);
    $palpite_ORM = ORM::for_table('palpite')->where_equal('usuario_id', $id)->delete_many();
    cadastrarLog('Delete - Fim', 'palpite', null, null, null, null, null);
}

function atualizaPontosPalpites($id, $qtd_gols_equipe_1, $qtd_gols_equipe_2) {
    $palpites = ORM::for_table('palpite')->where_equal('partida_id', $id)->find_array();
    array_walk($palpites, function(&$palpite, $key) use ($qtd_gols_equipe_1, $qtd_gols_equipe_2) {
        if ($palpite) {
            $pontos = 0;
            if ($palpite['qtd_gols_equipe_1'] != '' && $palpite['qtd_gols_equipe_1'] != null && $palpite['qtd_gols_equipe_2'] != '' && $palpite['qtd_gols_equipe_2'] != null && $qtd_gols_equipe_1 != '' && $qtd_gols_equipe_2 != '') {
                $resultado_partida = null;
                if ($qtd_gols_equipe_1 > $qtd_gols_equipe_2) {
                    $resultado_partida = 'vitoria_equipe_1';
                } else {
                    if ($qtd_gols_equipe_1 == $qtd_gols_equipe_2) {
                        $resultado_partida = 'empate';
                    } else {
                        $resultado_partida = 'vitoria_equipe_2';
                    }
                }
                if ($palpite['qtd_gols_equipe_1'] > $palpite['qtd_gols_equipe_2']) {
                    $resultado_palpite = 'vitoria_equipe_1';
                } else {
                    if ($palpite['qtd_gols_equipe_1'] == $palpite['qtd_gols_equipe_2']) {
                        $resultado_palpite = 'empate';
                    } else {
                        $resultado_palpite = 'vitoria_equipe_2';
                    }
                }
                if ($resultado_partida == $resultado_palpite) {
                    $pontos += 2;
                }
                if ($qtd_gols_equipe_1 == $palpite['qtd_gols_equipe_1']) {
                    $pontos += 1;
                }
                if ($qtd_gols_equipe_2 == $palpite['qtd_gols_equipe_2']) {
                    $pontos += 1;
                }
                if ($qtd_gols_equipe_1 == $palpite['qtd_gols_equipe_1'] && $qtd_gols_equipe_2 == $palpite['qtd_gols_equipe_2']) {
                    $pontos += 1;
                }
            }
            $palpite_ORM = ORM::for_table('palpite')->find_one($palpite['id']);
            $palpite_ORM->set('qtd_pontos', $pontos);
            $palpite_ORM->save();
        }
    });
}

function aasort (&$array, $key) {
    $sorter=array();
    $ret=array();
    reset($array);
    foreach ($array as $ii => $va) {
        $sorter[$ii]=$va[$key];
    }
    asort($sorter);
    foreach ($sorter as $ii => $va) {
        $ret[$ii]=$array[$ii];
    }
    $array=$ret;
}
