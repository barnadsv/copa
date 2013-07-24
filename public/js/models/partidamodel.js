window.Partida = Backbone.Model.extend({

    urlRoot:"../partidas",
    
    initialize:function () {
        // var self = this;
        // this.equipe1 = new EquipeCollection(this.get('equipe1'));
        // this.equipe1.url = function() { return self.url() + '/' + self.id + '/equipe1' };
        // this.equipe2 = new EquipeCollection(this.get('equipe2'));
        // this.equipe2.url = '../partidas/' + this.id + '/equipe2';
        // this.local = new LocalCollection(this.get('local'));
        // this.local.url = '../partidas/' + this.id + '/local';
        // this.fase = new FaseCollection(this.get('fase'));
        // this.fase.url = '../partidas/' + this.id + '/fase';
        //this.equipes = new EquipeCollection();
        //this.equipes.url = '../partidas/' + this.id + '/equipes';
    }

});

window.PartidaCollection = Backbone.Collection.extend({

    model: Partida,

    url: function () { return '../partidas'; }
    
    // findById:function (key) {
    //     var url = (key == '') ? '../employees' : "../employees/" + key;
    //     console.log('findByIde: ' + key);
    //     var self = this;
    //     $.ajax({
    //         url:url,
    //         dataType:"json",
    //         success:function (data) {
    //             console.log("search success: " + data.length);
    //             self.reset(data);
    //         }
    //     });
    // }

});