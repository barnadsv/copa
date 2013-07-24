  window.PalpiteListView = Backbone.View.extend({

    tagName:'table',

    className:'table table-striped table-condensed',

    session: null,

    initialize:function () {
        var self = this;
        this.session = new SessionModel;
    },

    render:function () {
    	var self = this;
        $(this.el).empty();
        //$(this.el).html(this.template());

		var id = this.session.get('usuario_id');
        var usuario = new BolaoCopa.Usuario({id: id});
        usuario.palpites.fetch({
            success: function (data, response, options) {
                // Note that we could also 'recycle' the same instance of EmployeeFullView
                // instead of creating new instances
                //$('#content').html(new PalpiteListView({model: data}).render().el);
                var fase = '', faseAnterior = '', pontos = 0, total = 0, index = 0;

                data.models.sort(function(a, b) {
                    return a.partida.attributes.num_partida - b.partida.attributes.num_partida;
                });

                _.each(data.models, function (palpite) {
                    fase = palpite.partida.attributes.fase.nom_fase;
                    if (fase != faseAnterior) {
                        if (faseAnterior != '') {
                            $(self.el).append('<tr><th colspan="19" class="td-right td-left th-right">Sub-total</th><th class="td-right">' + pontos + '</th></tr>');
                            total += pontos;
                            pontos = 0;
                        }
                        $(self.el).append(new PalpiteListItemViewFaseHeader({model: palpite}).render().el);
                        $(self.el).append(new PalpiteListItemViewHeader().render().el);
                        faseAnterior = fase;
                    }
                	pontos += parseInt(palpite.attributes.qtd_pontos);
                    $(self.el).append(new PalpiteListItemView({model: palpite}).render().el);
                    if (palpite.collection.length == ++index) {
                        $(self.el).append('<tr><th colspan="19" class="td-right th-right">Sub-total</th><th class="td-right">' + pontos + '</th></tr>');
                        total += pontos;
                    }
                }, this);
                $(self.el).append('<tr><th colspan="19" class="td-right td-left th-right">Total</th><th class="td-right">' + total + '</th></tr>');
                $('.qtd_gols_equipe_1').editable({
                    type: 'text',
                    placement: 'left',
                    name: 'qtd_gols_equipe_1',
                    title: 'Gols da equipe 1',
                    url: '/palpites',
                    emptytext: '?'
                });
                $('.qtd_gols_equipe_2').editable({
                    type: 'text',
                    placement: 'right',
                    name: 'qtd_gols_equipe_2',
                    title: 'Gols da equipe 2',
                    url: '/palpites',
                    emptytext: '?'
                });
                $('.qtd_gols_equipe_1').editable('option', 'validate', function(v) {
                    if(!v) return 'Campo obrigatório!';
                    if (!(!isNaN(parseFloat(v)) && isFinite(v) && (v - parseInt(v)) == 0)) {
                        return 'Deve ser um número inteiro!';
                    }
                });
                $('.qtd_gols_equipe_2').editable('option', 'validate', function(v) {
                    if(!v) return 'Campo obrigatório!';
                    if (!(!isNaN(parseFloat(v)) && isFinite(v) && (v - parseInt(v)) == 0)) {
                        return 'Deve ser um número inteiro!';
                    }
                });
            },
            error: function(model, xhr, options) {
                if (xhr.statusText == "Bad Request" || xhr.statusText == "Internal Server Error") {
                    //console.log('Erro! ' + xhr.getResponseHeader('X-Status-Reason'));
                    $.logThis('Erro! ' + xhr.getResponseHeader('X-Status-Reason'));
                    humane.log("Erro no servidor! Favor entrar em contato com o suporte.", {addnCls: 'humane-boldlight-error'});
                } else {
                    humane.log(xhr.getResponseHeader('X-Status-Reason'), {addnCls: 'humane-boldlight-error'});
                }
            }
        });

        // _.each(this.model.models, function (palpite) {
        //     $(this.el).append(new PalpiteListItemView({model:palpite}).render().el);
        // }, this);
        return self;
    }
});

window.PalpiteListItemView = Backbone.View.extend({

    tagName:"tr",

    initialize:function () {
        this.model.bind("change", this.render, this);
        this.model.bind("destroy", this.close, this);
    },

    render:function () {
        $(this.el).html(this.template(this.model.toJSON()));
        return this;
    }

});

window.PalpiteListItemViewFaseHeader = Backbone.View.extend({

    tagName:"tr",

    initialize:function () {

    },

    render:function () {
        $(this.el).html(this.template(this.model.toJSON()));
        return this;
    }

});

window.PalpiteListItemViewHeader = Backbone.View.extend({

    tagName:"tr",

    initialize:function () {

    },

    render:function () {
        $(this.el).html(this.template());
        return this;
    }

});

