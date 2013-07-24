window.PartidaListView = Backbone.View.extend({

    tagName:'table',

    className:'table table-striped table-condensed',

    session: null,

    initialize:function () {
        $.mockjax({
            url: '/status',
            responseText: {
                'A iniciar': 'A iniciar',
                'Em andamento': 'Em andamento',
                'Encerrado': 'Encerrado'
            }
        });
    },

    render:function () {
    	var self = this;
        $(this.el).empty();

		var partidas = new PartidaCollection();
        partidas.fetch({
            success: function (data, response, options) {
                $(self.el).append(new PartidaListItemViewHeader().render().el);
                $(self.el).append(new PartidaListItemViewAddHeader().render().el);
                $(self.el).append('<tr><td colspan="14" class="td-right td-left">&nbsp;</td></tr>');
                $(self.el).append(new PartidaListItemViewHeader().render().el);
                _.each(data.models, function (partida) {
                    $(self.el).append(new PartidaListItemView({model: partida}).render().el);
                }, this);
                $('.partidaeditablenew').editable({
                    format: 'YYYY-MM-DD HH:mm:00',
                    viewformat: 'DD/MM/YYYY HH:mm',
                    template: 'DD/MM/YYYY HH:mm',
                    combodate: {
                        minYear: 2000,
                        maxYear: 2015,
                        minuteStep: 10
                    },
                    placement: 'bottom',
                    url: '/post',
                    emptytext: 'Vazio'
                });
                $('.partidaeditablenew').on('save.newpartida', function(){
                    var that = this;
                    setTimeout(function() {
                        $(that).closest('tr').next().find('.partidaeditablenew').editable('show');
                    }, 200);
                });
                $('#partida-fase').editable('option', 'validate', function(v) {
                    if(!v) return 'Campo obrigatório!';
                });
                $('#partida-grupo').editable('option', 'validate', function(v) {
                    if(!v) return 'Campo obrigatório!';
                });
                $('#partida-numero').editable('option', 'validate', function(v) {
                    if(!v) return 'Campo obrigatório!';
                });
                $('#partida-data').editable('option', 'validate', function(v) {
                    if(!v) return 'Campo obrigatório!';
                });
                $('#partida-local').editable('option', 'validate', function(v) {
                    if(!v) return 'Campo obrigatório!';
                });
                $('#partida-equipe-1').editable('option', 'validate', function(v) {
                    if(!v) return 'Campo obrigatório!';
                });
                $('#partida-equipe-2').editable('option', 'validate', function(v) {
                    if(!v) return 'Campo obrigatório!';
                });
                $('#partida-status').editable('option', 'validate', function(v) {
                    if(!v) return 'Campo obrigatório!';
                });
                $('#novapartida').click(function() {
                   $('.partidaeditablenew').editable('submit', {
                       url: '/partidas',
                       ajaxOptions: {
                           dataType: 'json'
                       },

                       success: function(data, config) {
                           if(data && data.id) {
                               var partida = new Partida();
                               partida.attributes = data;
                               //$(this).removeClass('editable-unsaved');
                               $('.partidaeditablenew').editable('setValue', "").editable('option', 'pk', null);
                               //show messages
                               humane.log('Salvo com sucesso!', {timeout: 500, clickToClose: true, addnCls: 'humane-boldlight-success'});
                               $(this).off('save.newpartida');

                               $(self.el).append(new PartidaListItemView({model: partida}).render().el);
                               configura_PartidaEditable_BtnApagar();
                           } else if(data && data.errors){
                               //humane.log(jqXhr.getResponseHeader('X-Status-Reason'), {addnCls: 'humane-boldlight-error'});
                               config.error.call(this, data.errors);
                           }
                       },
                       error: function(errors) {
                           var msg = '';
                           if(errors && errors.responseText) { //ajax error, errors = xhr object
                               msg = errors.getResponseHeader('X-Status-Reason')
                               //msg = errors.responseText;
                           } else { //validation error (client-side or server-side)
                               $.each(errors, function(k, v) { msg += k+": "+v+"<br>"; });
                           }
                           humane.log(msg, {addnCls: 'humane-boldlight-error'});
                           //$('#msg').removeClass('alert-success').addClass('alert-error').html(msg).show();
                       }
                   });
                });
                configura_PartidaEditable_BtnApagar();
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

        return self;
    }
});

window.PartidaListItemView = Backbone.View.extend({

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

window.PartidaListItemViewHeader = Backbone.View.extend({

    tagName:"tr",

    initialize:function () {

    },

    render:function () {
        $(this.el).html(this.template());
        return this;
    }

});

window.PartidaListItemViewAddHeader = Backbone.View.extend({

    tagName:"tr",

    initialize:function () {

    },

    render:function () {
        $(this.el).html(this.template());
        return this;
    }

});

window.PartidaView = Backbone.View.extend({

    tagName:"div",

    initialize:function () {

    },

    render:function () {
        $(this.el).empty();
        $(this.el).html(this.template());
        $(this.el).append(new PartidaListView().render().el);
        return this;
    }

});

window.configura_PartidaEditable_BtnApagar = function() {

    $('.partidaeditable').editable({
        format: 'YYYY-MM-DD HH:mm:00',
        viewformat: 'DD/MM/YYYY HH:mm',
        template: 'DD/MM/YYYY HH:mm',
        combodate: {
            minYear: 2000,
            maxYear: 2015,
            minuteStep: 10
        },
        placement: 'bottom',
        url: '/partidas',
        emptytext: '?'//,
    });
    $('.btn-apagar').click(function() {
        var self = this;
        $partida = new Partida();
        $partida.set('id', this.dataset.pk);
        $partida.destroy({
            success: function(model, response) {
                if (response.error) {
                    //console.log('Erro! ' + response.responseText);
                    $.logThis('Erro! ' + response.responseText);
                } else {
                    humane.log('Removido com sucesso!', {addnCls: 'humane-boldlight-success'});
                    $(self).closest("tr").remove();
                }
            },
            error: function(model, response) {
                //console.log('Erro! ' + response.responseText);
                $.logThis('Erro! ' + response.responseText);
                humane.log('Erro ao remover! Entre em contato com o suporte. ', {addnCls: 'humane-boldlight-error'});
            }
        });
    });
    
}
