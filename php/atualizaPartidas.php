#!/usr/bin/php
<?php

require_once('/var/www/html/bolao-copa-refatorado-minified/vendor/autoload.php');
require_once('/var/www/html/bolao-copa-refatorado-minified/vendor/idiorm-master/idiorm.php');
require_once('utils.php');
require_once('usuario.php');
require_once('partida.php');
require_once('palpite.php');
require_once('local.php');
require_once('equipe.php');
require_once('fase.php');

initORM();

date_default_timezone_set('America/Sao_Paulo');

$partidas = getPartidas(true);

//array_walk($partidas, function(&$partida, $key) {
//	$myFile = "/home/leonardo/logDate.txt";
//	$fh = fopen($myFile, 'a') or die("can't open file");
//	$date = date('Y-m-d H:i:s', time());
//	$stringData = $date . " - " . $partida['dth_partida'] . "\n";
// 	fwrite($fh, $stringData);
//	fclose($fh);
//});

array_walk($partidas, function(&$partida, $key) {
	$date = date('Y-m-d H:i:s', time());
	if ($partida['dth_partida'] < $date && $partida['status'] == 'A iniciar') {
		$id = $partida['id'];
		$partida_ORM = ORM::for_table('partida')->find_one($id);
		$partida_ORM->set('status', 'Em andamento');
		$partida_ORM->save();
	}
});

$palpites = getPalpites(true);

array_walk($palpites, function(&$palpite, $key) {


});