<?php
/**
 * Classe para trabalhar com os usuarios atletas
 * @author barnabe
 *
 */
class Atleta extends ActiveRecord\Model {

    static $table_name = 'atleta';

    static $primary_key = 'cod_atleta';

    static $has_many = array(
        array('usuarios', 'class_name' => 'Usuario', 'foreign_key' => 'cod_usuario', 'primary_key' => 'cod_usuario'),
        
    );

    static $belongs_to = array(
        array('treinador', 'class_name' => 'Treinador', 'foreign_key' => 'cod_treinador', 'primary_key' => 'cod_treinador'),
    );

    static $before_destroy = array('excluir_macrociclos');

    public function excluir_macrociclos()
    {
        $macrociclosExcluidos = Macrociclo::excluirMacrociclosDoAtleta($this->cod_atleta);
    }

    
    public function listarAtletas($inicio=null, $limite=null, $ordem=null, $conditions=null)
    {
        return Atleta::find('all', array(
            'limit' => $limite,
            'offset' => $inicio,
            'order' => $ordem,
            'conditions' => $conditions,
            'joins' => array('usuarios', 'treinador'),
            //A função find usa o include de maneira diferente de to_json em AtletaAction.php
            'include' => array('usuarios', 'treinador' => array('usuarios'))));
        
    }

    public function totalAtletas($conditions=null)
    {
        return Atleta::count('all', array('conditions' => $conditions, 'joins' => array('usuarios')));
    }

    public function cadastrarAtleta($cod_atleta, $cod_usuario, $cod_treinador)
    {
        
        $atleta = Atleta::find(array('cod_usuario' => $cod_usuario, 'cod_treinador' => $cod_treinador));
        if($atleta)
        {
            $atletaInserido = null;
            $msg = 'Atleta já foi cadastrado.' ;
        }
        else
        {
            $atleta = Atleta::find(array('cod_atleta' => $cod_atleta));

            $cLog = Log::connection();

            if ($cLog->hasActiveTransaction)
                $alreadyHadActiveTransaction = true;
            else
                $alreadyHadActiveTransaction = false;

            $cLog->transaction();

            if($atleta)
            {
                $atleta->cod_usuario = $cod_usuario;
                $atleta->cod_treinador = $cod_treinador;
                try 
                {
                    $logInicio = Log::cadastrarLog('Update - Inicio',
                                                   'atleta',
                                                    null,
                                                    null, null, null, null);
                    $atletaEditado = $atleta->save();
                    $logFim = Log::cadastrarLog('Update - Fim',
                                                'usuario',
                                                null,
                                                null, null, null, null);

                    if (!$alreadyHadActiveTransaction)
                        $cLog->commit();

                }
                catch (\Exception $e)
                {
                   $cLog->rollback();
                }

                $msg = $atletaEditado ? 'Atleta editado com sucesso.' : 'Erro ao editar Atleta.';
                $atletaSalvo = $atletaEditado;
            }
            else
            {
                $atleta = new Atleta();
                $atleta->cod_usuario = $cod_usuario;
                $atleta->cod_treinador = $cod_treinador;
                try
                {
                    $logInicio = Log::cadastrarLog('Insert - Inicio',
                                                   'atleta',
                                                   null,
                                                   null, null, null, null);
                    $atletaInserido = $atleta->save();
                    $logFim = Log::cadastrarLog('Insert - Fim',
                                                  'usuario',
                                                  null,
                                                  null, null, null, null);

                    if (!$alreadyHadActiveTransaction)
                        $cLog->commit();

                }
                catch (\Exception $e)
                {
                   $cLog->rollback();
                }

                $msg = $atletaInserido ? 'Atleta cadastrado com sucesso.' : 'Erro ao cadastrar atleta.';
                $atletaSalvo = $atletaInserido;
            }
        }

        return array('atletaSalvo' => $atletaSalvo, 'mensagem' => $msg);

    }

    public function excluirAtletas($arrCodAtleta)
    {
        $cLog = Log::connection();

        if ($cLog->hasActiveTransaction)
            $alreadyHadActiveTransaction = true;
        else
            $alreadyHadActiveTransaction = false;

        $cLog->transaction();

        try
        {
            $logInicio = Log::cadastrarLog('Delete - Inicio',
                                           'atleta',
                                           null,
                                           null, null, null, null);

            foreach($arrCodAtleta as $codAtleta)
            {
                $atleta = Atleta::find(array('cod_atleta' => $codAtleta));
                if($atleta)
                {
                    try
                    {
                        $atletaExcluido = $atleta->delete();
                    }
                    catch (Exception $e)
                    {
                        # se houve erro, sai do foreach
                        $atletaExcluido = null;
                        $mensagemErro = $e->getMessage();
                        break;
                    }
                    # se houve erro em algum, sai do foreach
                    //if(!$atletaExcluido)
                    //        break;
                }
            }

            $logFim = Log::cadastrarLog('Delete - Fim',
                                        'atleta',
                                        null,
                                        null, null, null, null);

            if (!$alreadyHadActiveTransaction)
                    $cLog->commit();

         }
         catch (\Exception $e)
         {
            $cLog->rollback();
         }

         if ($atletaExcluido)
         {
             $msg = 'Registro(s) excluído(s) com sucesso';
         }
         else
         {
            //$msg = $mensagemErro;
            //if (substr($msg, 7, 4)  == '1451') //Este código representa erro de constraint. A chave primária é uma chave estrangeira em outra tabela.
            //    $msg = 'Há atleta(s) vinculado(s) a este(a) atleta. Portanto, sua exclusão não é permitida.';
            //else
                 $msg = 'Erro ao excluir, tente novamente.';
         }
        
         return array('atletaExcluido' => $atletaExcluido, 'mensagem' => $msg);
    }

}
?>