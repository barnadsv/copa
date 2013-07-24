window.RegrasView = Backbone.View.extend({

    initialize:function () {
        //console.log('Initializing Regras View');
        $.logThis('Initializing Regras View');
//        this.template = _.template(directory.utils.templateLoader.get('home'));
//        this.template = templates['Home'];
    },

    events:{
        "click #showMeBtn":"showMeBtnClick",
        "click #btn-exemplo": "showExemplo"
    },

    render:function () {
        // debugger;
        $(this.el).html(this.template());
        return this;
    },

    showMeBtnClick:function () {
        app.headerView.search();
    },

    showExemplo:function() {
        $table = '<table class="table table-striped table-bordered table-hover table-condensed table-left"><thead><tr><th>Resultado</th><th>Palpite</th><th>Pontos</th><th>Descrição</th></tr></thead>';
        $table = $table + '<tbody><tr><td>2 x 1</td><td>0 x 0</td><td>0</td><td>Nenhum ponto</td></tr>';
        $table = $table + '<tr class="info"><td>2 x 1</td><td>2 x 3</td><td>1</td><td>1(um) ponto por acertar o número de gols do primeiro time</td></tr>';
        $table = $table + '<tr><td>2 x 1</td><td>3 x 0</td><td>2</td><td>2(dois) pontos por acertar o tipo de resultado (vitória do primeiro time)</td></tr>';
        $table = $table + '<tr class="info"><td>2 x 1</td><td>3 x 1</td><td>3</td><td>2(dois) pontos por acertar o tipo de resultado e <br />1(um) ponto por acertar o número de gols do segundo time</td></tr>';
        $table = $table + '<tr><td>2 x 1</td><td>2 x 1</td><td>5</td><td style="text-align: left;">2(dois) pontos por acertar o tipo de resultado, <br />2(dois) pontos por acertar o número de gols do primeiro e do segundo time e <br />1(um) ponto para o resultado idêntico</td></tr></tbody></table>';
        humane.log($table, {timeout: 20000, clickToClose: true, addnCls: 'humane-jackedup'});
    }

});
