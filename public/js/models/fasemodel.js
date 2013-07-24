window.Fase = Backbone.Model.extend({

    urlRoot:"../fases",
    
    initialize:function () {
  //       var self = this;
		// this.partidas = new PartidaCollection();
  //       this.partidas.url = function() { return self.url() + '/' + self.id + '/partidas' };
    }

});

window.FaseCollection = Backbone.Collection.extend({

    model: Fase,

    url: function () { return '../fases'; }

});