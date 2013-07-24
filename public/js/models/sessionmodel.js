
window.SessionModel = Backbone.Model.extend({
  
  defaults: {
    access_token: null,
    usuario_id: null
  },
  
  initialize: function() {
    return this.load();
  },
  
  authenticated: function() {
    return Boolean(this.get("access_token"));
  },
  
  save: function(auth_hash) {
    $.cookie('usuario_id', auth_hash.usuario_id);
    return $.cookie('access_token', auth_hash.session_id);
  },
  
  load: function() {
    return this.set({
      usuario_id: $.cookie('usuario_id'),
      access_token: $.cookie('session_id')
    });
  },

  reset: function() {
    return this.set({
      usuario_id: null,
      access_token :null
    })
  }

});
