window.LocalListView = Backbone.View.extend({

    tagName:'table',

    className:'table table-striped table-condensed',

    session: null,

    render:function () {
      var self = this;
        $(this.el).empty();

    var locais = new LocalCollection();
        locais.fetch({
            success: function (data, response, options) {
                $(self.el).append(new LocalListItemViewHeader().render().el);
                $(self.el).append(new LocalListItemViewAddHeader().render().el);
                $(self.el).append('<tr><td colspan="2" class="td-right td-left">&nbsp;</td></tr>');
                $(self.el).append(new LocalListItemViewHeader().render().el);
                _.each(data.models, function (local) {
                    $(self.el).append(new LocalListItemView({model: local}).render().el);
                }, this);
                $('.localeditablenew').editable({
                    placement: 'bottom',
                    url: '/post',
                    emptytext: 'Vazio'
                });
                $('.localeditablenew').on('save.newlocal', function(){
                    var that = this;
                    setTimeout(function() {
                        $(that).closest('tr').next().find('.localeditablenew').editable('show');
                    }, 200);
                });
                $('#local-nome').editable('option', 'validate', function(v) {
                    if(!v) return 'Campo obrigatório!';
                });
                $('#novolocal').click(function() {
                   $('.localeditablenew').editable('submit', {
                       url: '/locais',
                       ajaxOptions: {
                           dataType: 'json'
                       },

                       success: function(data, config) {
                           if(data && data.id) {
                               var local = new Local();
                               local.attributes = data;
                               //$(this).removeClass('editable-unsaved');
                               $('.localeditablenew').editable('setValue', "").editable('option', 'pk', null);
                               //show messages
                               humane.log('Salvo com sucesso!', {addnCls: 'humane-boldlight-success'});
                               $(this).off('save.newlocal');

                               $(self.el).append(new LocalListItemView({model: local}).render().el);
                               configura_LocalEditable_BtnApagar();
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
                configura_LocalEditable_BtnApagar();
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

window.LocalListItemView = Backbone.View.extend({

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

window.LocalListItemViewHeader = Backbone.View.extend({

    tagName:"tr",

    initialize:function () {

    },

    render:function () {
        $(this.el).html(this.template());
        return this;
    }

});

window.LocalListItemViewAddHeader = Backbone.View.extend({

    tagName:"tr",

    initialize:function () {

    },

    render:function () {
        $(this.el).html(this.template());
        return this;
    }

});

window.LocalView = Backbone.View.extend({

    tagName:"div",

    initialize:function () {

    },

    render:function () {
        $(this.el).empty();
        $(this.el).html(this.template());
        $(this.el).append(new LocalListView().render().el);
        return this;
    }

});

window.configura_LocalEditable_BtnApagar = function() {

  $('.localeditable').editable({
      placement: 'bottom',
      url: '/locais',
      emptytext: '?'
  });
  $('.btn-apagar').click(function() {
      var self = this;
      $local = new Local();
      $local.set('id', this.dataset.pk);
      $local.destroy({
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
