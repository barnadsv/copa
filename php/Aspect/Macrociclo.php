<?php
require_once 'Mesociclo.php';
/**
 * Classe para trabalhar com os macrociclos
 * @author barnabe
 *
 */
class Macrociclo extends ActiveRecord\Model {

    static $table_name = 'macrociclo';

    static $primary_key = 'cod_macrociclo';

    static $has_many = array(
        array('mesociclos', 'class_name' => 'Mesociclo', 'foreign_key' => 'cod_macrociclo', 'primary_key' => 'cod_macrociclo'),
    );

    static $belongs_to = array(
        array('atleta', 'class_name' => 'Atleta', 'foreign_key' => 'cod_atleta', 'primary_key' => 'cod_atleta'),
        array('treinador', 'class_name' => 'Treinador', 'foreign_key' => 'cod_treinador', 'primary_key' => 'cod_treinador'),
    );

    static $before_destroy = array('excluir_mesociclos');

    public function excluir_mesociclos()
    {
        $mesociclosExcluidos = Mesociclo::excluirMesociclosDoMacrociclo($this->cod_macrociclo);
    }

    public function listarMacrociclos($inicio, $limite, $ordem, $conditions)
    {
        return Macrociclo::find('all', array('limit' => $limite, 
                                             'offset' => $inicio,
                                             'conditions' => $conditions,
                                             'order' => $ordem,
                                             'joins' => array('treinador', 'atleta'),
                                             'include' => array('treinador' => array('usuarios'), 'atleta' => array('usuarios'))));
    }

    public function totalMacrociclos($inicio, $limite, $ordem)
    {
        return Macrociclo::count('all', array('limit' => $limite, 'offset' => $inicio));
    }

    public function cadastrarMacrociclo($cod_macrociclo,
                                        $cod_treinador,
                                        $cod_atleta,
                                        $nom_macrociclo,
                                        $dat_inicio,
                                        $dat_fim,
                                        $qtd_microciclos_macrociclo,
                                        $tip_macrociclo,
                                        $des_objetivo,
                                        $cod_primeiro_dia_semana,
                                        $ind_executado)
    {
        $macrociclo = Macrociclo::find(array('cod_macrociclo' => $cod_macrociclo));

        $cLog = Log::connection();

        if ($cLog->hasActiveTransaction)
            $alreadyHadActiveTransaction = true;
        else
            $alreadyHadActiveTransaction = false;

        $cLog->transaction();

        if($macrociclo)
        {
            $macrociclo->cod_treinador = $cod_treinador;
            $macrociclo->cod_atleta = $cod_atleta;
            $macrociclo->nom_macrociclo = $nom_macrociclo;
            $macrociclo->dat_inicio = $dat_inicio;
            $macrociclo->dat_fim = $dat_fim;
            $macrociclo->qtd_microciclos_macrociclo = $qtd_microciclos_macrociclo;
            $macrociclo->tip_macrociclo = $tip_macrociclo;
            $macrociclo->des_objetivo = $des_objetivo;
            $macrociclo->cod_primeiro_dia_semana = $cod_primeiro_dia_semana;
            $macrociclo->ind_executado = $ind_executado;
            try
            {
                $logInicio = Log::cadastrarLog('Update - Inicio',
                                                  'macrociclo',
                                                  null,
                                                  null, null, null, null);
                $macrocicloInserido = $macrociclo->save();
                $logFim = Log::cadastrarLog('Update - Fim',
                                             'macrociclo',
                                             null,
                                             null, null, null, null);

                if (!$alreadyHadActiveTransaction)
                    $cLog->commit();

            }
            catch (\Exception $e)
            {
               $cLog->rollback();
            }
            $msg = $macrocicloInserido ? 'Macrociclo editado com sucesso.' : 'Erro ao editar Macrociclo.';
        }
        else
        {
            $macrociclo = new Macrociclo();
            $macrociclo->cod_macrociclo = $cod_macrociclo;
            $macrociclo->cod_treinador = $cod_treinador;
            $macrociclo->cod_atleta = $cod_atleta;
            $macrociclo->nom_macrociclo = $nom_macrociclo;
            $macrociclo->dat_inicio = $dat_inicio;
            $macrociclo->dat_fim = $dat_fim;
            $macrociclo->qtd_microciclos_macrociclo = $qtd_microciclos_macrociclo;
            $macrociclo->tip_macrociclo = $tip_macrociclo;
            $macrociclo->des_objetivo = $des_objetivo;
            $macrociclo->cod_primeiro_dia_semana = $cod_primeiro_dia_semana;
            $macrociclo->ind_executado = $ind_executado;
            try
            {
                $logInicio = Log::cadastrarLog('Insert - Inicio',
                                                  'macrociclo',
                                                  null,
                                                  null, null, null, null);

                $macrocicloInserido = $macrociclo->save();
                
                $logFim = Log::cadastrarLog('Insert - Fim',
                                             'macrociclo',
                                             null,
                                             null, null, null, null);

                if (!$alreadyHadActiveTransaction)
                    $cLog->commit();

            }
             catch (\Exception $e)
             {
                $cLog->rollback();
             }
             $msg = $macrocicloInserido ? 'Macrociclo cadastrado com sucesso.' : 'Erro ao cadastrar Macrociclo.';
        }
        
        return array('macrocicloInserido' => $macrocicloInserido, 'mensagem' => $msg);
    }

    public function excluirMacrociclos($arrCodMacrociclo)
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
                                           'macrociclo',
                                           null,
                                           null, null, null, null);
            foreach($arrCodMacrociclo as $codMacrociclo)
            {
                $macrociclo = Macrociclo::find(array('cod_macrociclo' => $codMacrociclo));
                if($macrociclo)
                {
                    $macrocicloExcluido = $macrociclo->delete();
                    # se houve erro em algum, sai do foreach
                    if(!$macrocicloExcluido)
                            break;
                }
            }

            $logFim = Log::cadastrarLog('Delete - Fim',
                                        'macrociclo',
                                        null,
                                        null, null, null, null);
            
            if (!$alreadyHadActiveTransaction)
                    $cLog->commit();

         }
         catch (\Exception $e)
         {
            $cLog->rollback();
         }

         $msg = $macrocicloExcluido ? 'Registro(s) excluído(s) com sucesso' : 'Erro ao excluir, tente novamente.';

         return array('macrocicloExcluido' => $macrocicloExcluido, 'mensagem' => $msg);
    }


    /*
     * Método para deletar o(s) Microciclo(s) pertencentes a um Mesociclo determinado
     */
    public function excluirMacrociclosDoAtleta($cod_atleta){

            $arrCodMacrociclo = array();

            $conditions = array('cod_atleta' => $cod_atleta);
            $macrociclos = Macrociclo::listarMacrociclos($inicio, $limite, $ordem, $conditions);

            foreach ($macrociclos as $macrociclo)
                $arrCodMacrociclo[] = $macrociclo->cod_macrociclo;

            return Macrociclo::excluirMacrociclos($arrCodMacrociclo);

            /*$resposta = Microciclo::excluirMicrociclos($arrCodMicrociclo);

            # retorna o resultado da execução do SQL
            echo json_encode(array(
                    "success" => $resposta['microcicloExcluido'],
                    "msg" => $resposta['mensagem'],
            ));*/
    }
}
?>