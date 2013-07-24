window.Local = Backbone.Model.extend({

    urlRoot:"../locais",
    
    initialize:function () {
  //       var self = this;
		// this.partidas = new PartidaCollection();
  //       this.partidas.url = function() { return self.url() + '/' + self.id + '/partidas' };
    }

});

window.LocalCollection = Backbone.Collection.extend({

    model: Local,

    url: function () { return '../locais'; }

});