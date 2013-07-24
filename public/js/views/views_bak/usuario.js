BolaoCopa.UsuarioView = BolaoCopa.View.extend({

    tagName:"div",

    initialize:function () {
        this.session = new SessionModel;
    },

    render:function () {
        $(this.el).empty();
        if ($.cookie('papel') == 'admin' || $.cookie('papel') == 'user') {
            BolaoCopa.View.prototype.render.call(this);
            $(this.el).append(new BolaoCopa.UsuarioListView().render().el);
            // var source = $(this.template()).html();
            // var data = {};
            // if (this.model) {
            //   data = this.model.toJSON();
            // }            // var compiled = _.template(source, data);
            // $(this.el).html(compiled);
        }
        //$(this.el).append(new UsuarioListView().render().el);
        return this;
    }

});

BolaoCopa.UsuarioListView = BolaoCopa.ListView.extend({

    tagName:'table',

    //ItemView: BolaoCopa.UsuarioItemView,

    className:'table table-striped table-condensed',

    session: null,

    initialize: function() {
        BolaoCopa.ListView.prototype.initialize.call(this);
        var self = this;
        $.mockjax({
            url: '/papeis',
            responseText: {
                'user': 'user',
                'guest': 'guest',
                'admin': 'admin'
            }
        });
        this.ItemView = BolaoCopa.UsuarioItemView;
        this.collection = BolaoCopa.UsuarioCollection;
    },

    render:function () {
        var self = this;
        $(this.el).empty();

      var usuarios = new BolaoCopa.UsuarioCollection();
      if ($.cookie('papel') == 'admin' && typeof $('.dados-menu').attr('class') === "undefined") {

        //this.collection.fetch({
        usuarios.fetch({
            success: function (data, response, options) {
                  $(self.el).append(new UsuarioListItemViewHeader().render().el);
                  $(self.el).append(new UsuarioListItemViewAddHeader().render().el);
                  $(self.el).append('<tr><td colspan="5" class="td-right td-left">&nbsp;</td></tr>');
                  $(self.el).append(new UsuarioListItemViewHeader().render().el);

                  //BolaoCopa.ListView.prototype.render.call(self);
                  
                  // var els = [];
                  // self.collection.each(function (item) {
                  //     var itemView = new self.ItemView({ model: item });
                  //     els.push(itemView.render().el);
                  // });
                  // self.$el.append(els);

                  _.each(data.models, function (usuario) {
                      $(self.el).append(new BolaoCopa.UsuarioItemView({model: usuario}).render().el);
                  }, this);

                  $('.usuarioeditablenew').editable({
                      placement: 'bottom',
                      url: '/post',
                      emptytext: 'Vazio'
                  });
                  $('.usuarioeditablenew').on('save.newusuario', function(){
                      var that = this;
                      setTimeout(function() {
                          $(that).closest('tr').next().find('.usuarioeditablenew').editable('show');
                      }, 200);
                  });
                  $('#novousuario').click(function() {
                      // var hash = CryptoJS.SHA3($('#usuario-senha').val(), { outputLength: 512 }).toString(CryptoJS.enc.Base64);
                      $('.usuarioeditablenew').editable('submit', {
                         url: '/usuarios',
                         ajaxOptions: {
                             dataType: 'json'
                         },
                         // var formValues = {
                         //     email: $('#email').val(),
                         //     senha: hash
                         // };
                         success: function(data, config) {
                             if(data && data.id) {
                                 var usuario = new BolaoCopa.Usuario();
                                 usuario.attributes = data;
                                 //$(this).removeClass('editable-unsaved');
                                 $('.usuarioeditablenew').editable('setValue', "").editable('option', 'pk', null);
                                 //show messages
                                 humane.log('Salvo com sucesso!', {addnCls: 'humane-boldlight-success'});
                                 $(this).off('save.newusuario');

                                 $(self.el).append(new BolaoCopa.UsuarioItemView({model: usuario}).render().el);
                                 configura_UsuarioEditable_BtnApagar();
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
                  configura_UsuarioEditable_BtnApagar();
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
        } else {
            var usuario_id = $.cookie('usuario_id');
            var usuario = new BolaoCopa.Usuario({id: usuario_id});
            usuario.fetch({
                success: function (data, response, options) {
                    $(self.el).append("<h5>Modifique o seu nome e a sua senha aqui.</h5>");
                    $(self.el).append(new UsuarioListItemViewHeader().render().el);
                    $(self.el).append(new BolaoCopa.UsuarioItemView({model: new BolaoCopa.Usuario(data.attributes)}).render().el);
                    $('.usuarioeditable').editable({
                        placement: 'bottom',
                        url: '/usuarios',
                        emptytext: '-',
                        ajaxOptions: {
                            type: 'put',
                            dataType: 'json',
                            success: function(data, text, jqXhr) {
                                humane.log('Atualização realizada com sucesso!', {addnCls: 'humane-boldlight-success'});
                                $('.nome').text('Usuário: ' + data.nome);
                            },
                            error: function(jqXhr, textStatus, error) {
                                if (error == "Bad Request" || error == "Internal Server Error") {
                                    //console.log('Erro! ' + jqXhr.getResponseHeader('X-Status-Reason'));
                                    $.logThis('Erro! ' + jqXhr.getResponseHeader('X-Status-Reason'));
                                    humane.log("Erro de servidor! Favor entrar em contato com o suporte.", {addnCls: 'humane-boldlight-error'});
                                } else {
                                    humane.log(jqXhr.getResponseHeader('X-Status-Reason'), {addnCls: 'humane-boldlight-error'});
                                }
                            }
                        }
                    });
                    $('.usuarioeditable').editable('option', 'validate', function(v) {
                      if(!v) return 'Campo obrigatório!';
                      if (this.className.indexOf("usuario-nome") !== -1) {
                        if (v.length > 20) return 'Máximo 20 caracteres!';
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

        }
        return self;
    }
});

BolaoCopa.UsuarioItemView = BolaoCopa.ItemView.extend({

    tagName:"tr",

    initialize:function () {
        this.model.bind("change", this.render, this);
        this.model.bind("destroy", this.close, this);
    }//,

    // render:function () {
    //     $(this.el).html(this.template(this.model.toJSON()));
    //     return this;
    // }

});

window.UsuarioListItemViewHeader = Backbone.View.extend({

    tagName:"tr",

    initialize:function () {

    },

    render:function () {
        $(this.el).html(this.template());
        return this;
    }

});

window.UsuarioListItemViewAddHeader = Backbone.View.extend({

    tagName:"tr",

    initialize:function () {

    },

    render:function () {
        $(this.el).html(this.template());
        return this;
    }

});

window.configura_UsuarioEditable_BtnApagar = function() {

  $('.usuarioeditable').editable({
      placement: 'bottom',
      url: '/usuarios',
      emptytext: '-',
      params: {
          value: function() {
              return CryptoJS.SHA3($('.editable-open').val(), { outputLength: 512 }).toString(CryptoJS.enc.Base64);
          }
      },
      ajaxOptions: {
          type: 'put',
          dataType: 'json',
          // data: {
          //     name: function() {
          //       return $('.editable-open').data().name;
          //     },
          //     value: function() {
          //       return CryptoJS.SHA3($('.editable-open').val(), { outputLength: 512 }).toString(CryptoJS.enc.Base64);
          //     },
          //     pk: function() {
          //       return $('.editable-open').data().pk;
          //     }
          // },
          success: function(data, text, jqXhr) {
              humane.log('Atualização realizada com sucesso!', {addnCls: 'humane-boldlight-success'});
          },
          error: function(jqXhr, textStatus, error) {
              if (error == "Bad Request" || error == "Internal Server Error") {
                  $.logThis('Erro! ' + xhr.getResponseHeader('X-Status-Reason'));
                  humane.log("Erro de servidor! Favor entrar em contato com o suporte.", {addnCls: 'humane-boldlight-error'});
              } else {
                  humane.log(jqXhr.getResponseHeader('X-Status-Reason'), {addnCls: 'humane-boldlight-error'});
              }
          }
      }
  });
  $('.usuarioeditable').editable('option', 'validate', function(v) {
      if(!v) return 'Campo obrigatório!';
      if (this.className.indexOf("usuario-nome") !== -1) {
        if (v.length > 20) return 'O nome pode ter no máximo 20 caracteres!';
      }
  });
  //$('.usuarioeditable').editable('option', 'params', function(v) {
  //    if(v) return 'Campo obrigatório!';
  //});
  $('.btn-apagar').click(function() {
      var self = this;
      $usuario = new BolaoCopa.Usuario();
      $usuario.set('id', this.dataset.pk);
      $usuario.destroy({
          success: function(model, response) {
              if (response.error) {
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

