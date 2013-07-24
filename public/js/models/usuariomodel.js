BolaoCopa.Usuario = Backbone.Model.extend({

    urlRoot:"../usuarios",

    defaults: {
        email: "",
        nome: "",
        senha: "",
        papel: ""
    },
    // validation: {
    //     email: {
    //         pattern: 'email',
    //         required: true,
    //         msg: 'Por favor digite um e-mail válido.'
    //     },        
    //     nome: {
    //         required: true,
    //         max: 100,
    //         msg: 'O nome é obrigatório.'
    //     },
    //     senha: {
    //         required: true,
    //         min: 6,
    //         msg: 'A senha é obrigatória e deve ter pelo menos 6 caracteres.'
    //     },
    //     papel: function(value) {
    //         if(value !== 'admin' && value !== 'user') {
    //             return 'O papel deve ser user ou admin!';
    //         }
    //     }
    // },
    
    initialize:function () {
        var self = this;
        this.palpites = new PalpiteCollection();
        this.palpites.url = function() { return self.url() + '/palpites' };
    }

});

BolaoCopa.UsuarioCollection = Backbone.Collection.extend({

    model: BolaoCopa.Usuario,

    url: function () { return '../usuarios'; }
    
    // findById:function (key) {
    //     var url = (key == '') ? '../usuarios' : "../usuarios/" + key;
    //     console.log('findById: ' + key);
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