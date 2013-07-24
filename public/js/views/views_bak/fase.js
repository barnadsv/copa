window.FaseListView = Backbone.View.extend({

    tagName:'table',

    className:'table table-striped table-condensed',

    session: null,

    render:function () {
      var self = this;
        $(this.el).empty();

    var fases = new FaseCollection();
        fases.fetch({
            success: function (data, response, options) {
                $(self.el).append(new FaseListItemViewHeader().render().el);
                $(self.el).append(new FaseListItemViewAddHeader().render().el);
                $(self.el).append('<tr><td colspan="2" class="td-right td-left">&nbsp;</td></tr>');
                $(self.el).append(new FaseListItemViewHeader().render().el);
                _.each(data.models, function (fase) {
                    $(self.el).append(new FaseListItemView({model: fase}).render().el);
                }, this);
                $('.faseeditablenew').editable({
                    placement: 'bottom',
                    url: '/post',
                    emptytext: 'Vazio'
                });
                $('.faseeditablenew').on('save.newfase', function(){
                    var that = this;
                    setTimeout(function() {
                        $(that).closest('tr').next().find('.faseeditablenew').editable('show');
                    }, 200);
                });
                $('#fase-nome').editable('option', 'validate', function(v) {
                    if(!v) return 'Campo obrigatório!';
                });
                $('#novafase').click(function() {
                   $('.faseeditablenew').editable('submit', {
                       url: '/fases',
                       ajaxOptions: {
                           dataType: 'json'
                       },

                       success: function(data, config) {
                           if(data && data.id) {
                               var fase = new Fase();
                               fase.attributes = data;
                               //$(this).removeClass('editable-unsaved');
                               $('.faseeditablenew').editable('setValue', "").editable('option', 'pk', null);
                               //show messages
                               humane.log('Salvo com sucesso!', {addnCls: 'humane-boldlight-success'});
                               $(this).off('save.newfase');

                               $(self.el).append(new FaseListItemView({model: fase}).render().el);
                               configura_FaseEditable_BtnApagar();
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
                configura_FaseEditable_BtnApagar();
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

window.FaseListItemView = Backbone.View.extend({

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

window.FaseListItemViewHeader = Backbone.View.extend({

    tagName:"tr",

    initialize:function () {

    },

    render:function () {
        $(this.el).html(this.template());
        return this;
    }

});

window.FaseListItemViewAddHeader = Backbone.View.extend({

    tagName:"tr",

    initialize:function () {

    },

    render:function () {
        $(this.el).html(this.template());
        return this;
    }

});

window.FaseView = Backbone.View.extend({

    tagName:"div",

    initialize:function () {

    },

    render:function () {
        $(this.el).empty();
        $(this.el).html(this.template());
        $(this.el).append(new FaseListView().render().el);
        return this;
    }

});

window.configura_FaseEditable_BtnApagar = function() {

    $('.faseeditable').editable({
        placement: 'bottom',
        url: '/fases',
        emptytext: '?'
    });
    $('.btn-apagar').click(function() {
        var self = this;
        $fase = new Fase();
        $fase.set('id', this.dataset.pk);
        $fase.destroy({
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