window.Equipe = Backbone.Model.extend({

    urlRoot:"../equipes",
    
    initialize:function () {
        var self = this;
		this.partidas = new PartidaCollection();
        this.partidas.url = function() { return self.url() + '/' + this.id + '/partidas' };
    }

});

window.EquipeCollection = Backbone.Collection.extend({

    model: Equipe,
    url: function () { return '../equipes'; }

});