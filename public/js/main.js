// BolaoCopa = {
//     init: function() {
        
//         //router
//         BolaoCopa.router = new BolaoCopa.Router();

//         //data
//         BolaoCopa.usuarios = new BolaoCopa.UsuarioCollection();
//         // Congo.databases = new Congo.DatabaseCollection();
//         // Congo.currentCollection = new Congo.MongoCollections();
//         // Congo.currentDocuments = new Congo.MongoDocuments();

//         //views
//         BolaoCopa.usuarioView = new BolaoCopa.UsuarioView();
//         // Congo.breadcrumbs = new Congo.BreadcrumbView({el: "#nav"});
//         // Congo.collectionLayout = new Congo.CollectionLayoutView({collection: Congo.currentCollection});
//         // Congo.dbLayout = new Congo.DatabaseLayoutView({collection: Congo.databases});
//         // Congo.documentLayout = new Congo.DocumentLayoutView({collection: Congo.currentDocuments});

//         //the App Layout
//         // Congo.appLayout = new Congo.AppLayout({
//         //     el: "#app",
//         //     detailRegion: "#details",
//         //     editorRegion: '#editor',
//         //     navigatorView: Congo.breadcrumbs
//         // })
//     },
//     start: function() {
        
//         //initialize the app
//         BolaoCopa.init();
        
//         //BolaoCopa.router = new BolaoCopa.Router();
//         Backbone.history.start();

//         // templateLoader.load(["LoginView", "RegrasView", "HeaderView", "AdminHeaderView", "EmployeeView", "IdentificationView",
//         //              "PalpiteListView", "PalpiteListItemView", "PalpiteListItemViewFaseHeader", "PalpiteListItemViewHeader",
//         //              "UsuarioListView", "UsuarioItemView", "UsuarioListItemViewHeader", "UsuarioListItemViewAddHeader",
//         //              "PartidaView", "PartidaListView", "PartidaListItemView", "PartidaListItemViewHeader", "PartidaListItemViewAddHeader",
//         //              "LocalView", "LocalListView", "LocalListItemView", "LocalListItemViewHeader", "LocalListItemViewAddHeader",
//         //              "EquipeView", "EquipeListView", "EquipeListItemView", "EquipeListItemViewHeader", "EquipeListItemViewAddHeader",
//         //              "FaseView", "FaseListView", "FaseListItemView", "FaseListItemViewHeader", "FaseListItemViewAddHeader",
//         //              "ResultadoButtonView", "ResultadoGridViewFase", "ResultadoGridViewTodasFases"],
//         // function () {
//         //     BolaoCopa.router = new BolaoCopa.Router();
//         //     Backbone.history.start();
//         // });
//     },
    
// }

// BolaoCopa.Router = Backbone.Router.extend({

//     routes: {
//         "": "index",
//         ":db": "showDatabase",
//         ":db/:collection": "showCollection",
//         ":db/:collection/:id": "showEditor"
//     },
//     showEditor: function(db, collection, id) {
//         Congo.currentDatabase = db;
//         Congo.selectedCollection = collection;
//         Congo.selectedId = id;
//         Congo.appLayout.renderEditor({message: 'Hello!'});
//     },
//     showDatabase: function(db) {
//         Congo.currentDatabase = db;
//         Congo.appLayout.renderDetails(Congo.collectionLayout);
//         Congo.currentCollection.fetch();
//     },
//     showCollection: function(db, collection) {
//         Congo.selectedCollection = collection;
//         Congo.currentDatabase = db;
//         Congo.appLayout.renderDetails(Congo.documentLayout);
//         Congo.currentDocuments.fetch();
//     },
//     index: function() {
//         Congo.appLayout.renderDetails(Congo.dbLayout);
//         Congo.databases.fetch();
//     }
// });



BolaoCopa.Router = Backbone.Router.extend({

    routes: {
        "": "login",
        "regras": "regras",
        "tabela": "tabela",
        "seuspalpites": "palpites",
        "seusdados": "dados",
        "admin": "admin",
        "usuarios": "usuarios",
        "partidas": "partidas",
        "locais": "locais",
        "equipes": "equipes",
        "fases": "fases",
        "voltar": "voltar",
        "sair": "sair",
        "resultados": "resultados",
        "resultados/:fase": "resultados",
        "resultados-grafico": "resultados_grafico"
    },

    session: null,

    initialize: function () {
        var self = this;
        jQuery.logThis = function( text ){
            // if( (window['console'] !== undefined) ){
            //     console.log( text );
            // }
        }
        // jQuery(window).bind(
        //     "beforeunload", function() {
        //         self.sair();
        //     }
        // )
        $.fn.editable.defaults.mode = 'popup';
        $.fn.editable.defaults.ajaxOptions = {
            type: 'put',
            dataType: 'json',
            success: function(data, text, jqXhr) {
                humane.log('Atualização realizada com sucesso!', {addnCls: 'humane-boldlight-success'});
            },
            error: function(jqXhr, textStatus, error) {
                if (error == "Bad Request" || error == "Internal Server Error") {
                    $.logThis('Erro! ' + jqXhr.getResponseHeader('X-Status-Reason'));
                    humane.log("Erro de servidor! Favor entrar em contato com o suporte.", {addnCls: 'humane-boldlight-error'});
                } else {
                    humane.log(jqXhr.getResponseHeader('X-Status-Reason'), {addnCls: 'humane-boldlight-error'});
                }
            }
        };
        this.session = new SessionModel();
        var update, x;
        
        update = function() {
            $.logThis(moment().format('hh:mm:ss a'));
            if ($("#time").length){ 
                $("#time").text("Brasília, " + moment().format('DD/MM/YYYY HH:mm:ss'))
            }
        };

        x = setInterval(update, 1000);
     },

    login: function () {
        if (!this.session.authenticated()) {
            $('.header').html("");
            $('#buttons').html("");
            if (!this.loginView) {
                this.loginView = new LoginView();
                this.loginView.render();
            }
            $('#content').html(this.loginView.el);
            $('#email').focus();
        } else {
            debugger;
            templateLoader.load(["RegrasView"],
                function () {
                    window.location.replace('#regras');
                });
            //window.location.replace('#regras');
        }
    },

    regras: function () {
        this.session.load();
        if (this.session.authenticated()) {
            $('#buttons').html("");
            if (!this.regrasView) {
                this.headerView = new HeaderView();
                $('.header').html(this.headerView.render().el);
            }
            if (!this.identificationView) {
                this.identificationView = new IdentificationView();
                $('.identification').html(this.identificationView.render().el);
            }
            // debugger;
            if (!this.regrasView) {
                this.regrasView = new RegrasView();
                this.regrasView.render();
            } else {
                this.regrasView.delegateEvents(); // delegate events when the view is recycled
            }
            $("#content").html(this.regrasView.el);
            this.headerView.select('regras-menu');
        } else {
            window.location.replace('');
        }
    },

    tabela: function () {
        if (this.session.authenticated()) {
            $('#buttons').html("");
            if (!this.regrasView) {
                this.headerView = new HeaderView();
                $('.header').html(this.headerView.render().el);
            }
            $('#content').html(new TabelaView().render().el);
            this.headerView.select('tabela-menu');
        } else {
            window.location.replace('');
        }
    },

    palpites: function () {
        if (this.session.authenticated()) {
            $('#buttons').html("");
            if (!this.regrasView) {
                this.headerView = new HeaderView();
                $('.header').html(this.headerView.render().el);
            }
            $('#content').html(new PalpiteListView().render().el);
            this.headerView.select('palpites-menu');
        } else {
            window.location.replace('');
        }
    },

    partidas: function () {
        if (this.session.authenticated()) {
            $('#buttons').html("");
            if (!this.adminHeaderView) {
                this.adminHeaderView = new AdminHeaderView();
                $('.header').html(this.adminHeaderView.render().el);
            }
            $('#content').html(new PartidaView().render().el);
            this.adminHeaderView.select('partidas-menu');
        } else {
            window.location.replace('');
        }
    },

    locais: function () {
        if (this.session.authenticated()) {
            $('#buttons').html("");
            if (!this.adminHeaderView) {
                this.adminHeaderView = new AdminHeaderView();
                $('.header').html(this.adminHeaderView.render().el);
            }
            $('#content').html(new LocalView().render().el);
            this.adminHeaderView.select('locais-menu');
        } else {
            window.location.replace('');
        }
    },

    equipes: function () {
        if (this.session.authenticated()) {
            $('#buttons').html("");
            if (!this.adminHeaderView) {
                this.adminHeaderView = new AdminHeaderView();
                $('.header').html(this.adminHeaderView.render().el);
            }
            $('#content').html(new EquipeView().render().el);

            this.adminHeaderView.select('equipes-menu');
        } else {
            window.location.replace('');
        }
    },

    fases: function () {
        if (this.session.authenticated()) {
            $('#buttons').html("");
            if (!this.adminHeaderView) {
                this.adminHeaderView = new AdminHeaderView();
                $('.header').html(this.adminHeaderView.render().el);
            }
            $('#content').html(new FaseView().render().el);

            this.adminHeaderView.select('fases-menu');
        } else {
            window.location.replace('');
        }
    },

    resultados: function (fase) {
        if (this.session.authenticated()) {
            if (!fase) {
                if ($.cookie('ultimoResultado')) {
                    fase = $.cookie('ultimoResultado');
                } else {
                    fase = 'Fase de Grupos - 1ª Rodada';
                }
            } else {
                $.cookie('ultimoResultado', fase, { expires: 2, path: '/' });
            }

            if (!this.headerView) {
                this.headerView = new HeaderView();
                $('.header').html(this.headerView.render().el);
            }

            $('#content').html('');

            new ResultadoView({nomeFase: fase}).render();

            this.headerView.select('resultados-menu');

        } else {
            window.location.replace('');
        }
    },

    resultados_grafico: function (fase) {
        fase = fase || 'Fase de Grupos - 1ª Rodada';
        if (this.session.authenticated()) {
            $('#buttons').html("");
            if (!this.headerView) {
                this.headerView = new HeaderView();
                $('.header').html(this.headerView.render().el);
            }
            if (!this.resultadoButtonView) {
                this.resultadoButtonView = new ResultadoButtonView();
            }
            $('#buttons').html(this.resultadoButtonView.render().el);
            $('#content').html('');
            resultadoGrafico();

            this.headerView.select('resultados-menu');
        } else {
            window.location.replace('');
        }
    },

    dados: function () {
        if (this.session.authenticated()) {
            $('#buttons').html("");
            if (!this.regrasView) {
                this.headerView = new HeaderView();
                $('.header').html(this.headerView.render().el);
            }
            $('#content').html(new BolaoCopa.UsuarioView().render().el);
            this.headerView.select('dados-menu');
        } else {
            window.location.replace('');
        }
    },

    admin: function () {
        if (this.session.authenticated()) {
            $('#buttons').html("");
            if (!this.adminHeaderView) {
                this.adminHeaderView = new AdminHeaderView();
            }
            $('.header').html(this.adminHeaderView.render().el);
            //this.adminHeaderView.select('usuario-menu');
            //this.usuarios();
            window.location.replace('#usuarios');
        } else {
            //this.login();
            window.location.replace('');
        }
    },

    usuarios: function () {
        $('#buttons').html("");
        if (!this.adminHeaderView) {
            this.adminHeaderView = new AdminHeaderView();
            $('.header').html(this.adminHeaderView.render().el);
        }
        $('#content').html(new BolaoCopa.UsuarioView().render().el);

        this.adminHeaderView.select('usuario-menu');
    },

    voltar: function () {
        if (!this.headerView) {
            this.headerView = new HeaderView();
        }
        $('.header').html(this.headerView.render().el);
        this.regras();
        //window.location.replace('#/regras');
    },

    sair: function () {
        $.cookie('usuario_id', null);
        $.cookie('session_id', null);
        $.cookie('usuario_nome', null);
        $.cookie('papel', null);
        $.cookie('ultimoResultado', null);
        this.session.reset();
        window.location.replace('');
        $.ajax({
            url: '/logoff',
            type: 'POST',
            success:function(data, text, jqXhr) {
                //console.log(["Login request details: ", data]);
                $.logThis(["Login request details: ", data]);
            }
        });
    }

});

// templateLoader.load(["LoginView", "RegrasView", "HeaderView", "AdminHeaderView", "EmployeeView", "IdentificationView",
//                      "PalpiteListView", "PalpiteListItemView", "PalpiteListItemViewFaseHeader", "PalpiteListItemViewHeader",
//                      "UsuarioView", "UsuarioListView", "UsuarioItemView", "UsuarioListItemViewHeader", "UsuarioListItemViewAddHeader",
//                      "PartidaView", "PartidaListView", "PartidaListItemView", "PartidaListItemViewHeader", "PartidaListItemViewAddHeader",
//                      "LocalView", "LocalListView", "LocalListItemView", "LocalListItemViewHeader", "LocalListItemViewAddHeader",
//                      "EquipeView", "EquipeListView", "EquipeListItemView", "EquipeListItemViewHeader", "EquipeListItemViewAddHeader",
//                      "FaseView", "FaseListView", "FaseListItemView", "FaseListItemViewHeader", "FaseListItemViewAddHeader",
//                      "ResultadoButtonView", "ResultadoGridViewFase", "ResultadoGridViewTodasFases"],
//     function () {
//         app = new Router();
//         Backbone.history.start();
//     });

