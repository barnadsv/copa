<?php
/**
 * Classe para trabalhar com os usuarios administradores
 * @author barnabe
 *
 */
class Log extends ActiveRecord\Model {

    static $table_name = 'log';

    static $primary_key = 'cod_log';

    public function listarLogs($inicio=null, $limite=null, $ordem=null, $conditions=null)
    {
        return Log::find('all', array(
            'limit' => $limite,
            'offset' => $inicio,
            'order' => $ordem,
            'conditions' => $conditions));
    }

    public function totalLogs($conditions=null)
    {
        return Log::count('all', array('conditions' => $conditions));
    }

    public function cadastrarLog($nom_acao=null, $nom_tabela=null, $nom_campo=null,
                                 $old_txt_value=null, $new_txt_value=null, $old_blob_value=null, $new_blob_value=null)
    {
        $log = new Log();
        $log->nom_usuario = $_SESSION['nomLogin'];
        $log->num_ip = $_SERVER['REMOTE_ADDR'];
        $log->nom_acao = $nom_acao;
        $log->nom_tabela = $nom_tabela;
        $log->nom_campo = $nom_campo;
        $log->old_txt_value = $old_txt_value;
        $log->new_txt_value = $new_txt_value;
        $log->old_blob_value = $old_blob_value;
        $log->new_blob_value = $new_blob_value;
        $logInserido = $log->save();
        $msg = $logInserido ? 'Log cadastrado com sucesso.' : 'Erro ao cadastrar log.';
       
        return array('logInserido' => $logInserido, 'mensagem' => $msg);

    }
   
}
?>