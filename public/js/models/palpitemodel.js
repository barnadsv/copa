window.Palpite = Backbone.Model.extend({

    urlRoot:"../palpites",

    defaults: {
        usuario: null,
        partida: null
    },

    initialize:function () {
        var self = this;

        this.usuario = new BolaoCopa.Usuario(this.get('usuario'));
        this.partida = new Partida(this.get('partida'));

        //this.partidas = new PartidaCollection(this.get('partidas'));
        //this.partidas.url() = function() { return self.url() + '/partidas'; };

        //this.user.palpites.add(this);

        //this.partida = new PartidaCollection();
        //this.partida.url = '../palpites/' + this.id + '/partidas';
    }

});

window.PalpiteCollection = Backbone.Collection.extend({

    model: Palpite,

    url: function () { return '../palpites'; },

    comparator: function(item) {
        if (item.get("usuario")) {
            return [ item.get("usuario").nome, item.get("partida").fase_id, item.get("partida").num_partida ];
        } else {
            return [item.get("partida").fase_id, item.get("partida").num_partida];
        }

    }

});
