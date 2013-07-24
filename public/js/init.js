BolaoCopa = {
    init: function() {
        
        //router
        BolaoCopa.router = new BolaoCopa.Router();

        //data
        //BolaoCopa.usuarios = new BolaoCopa.UsuarioCollection();
        // Congo.databases = new Congo.DatabaseCollection();
        // Congo.currentCollection = new Congo.MongoCollections();
        // Congo.currentDocuments = new Congo.MongoDocuments();

        //views
        //BolaoCopa.usuarioView = new BolaoCopa.UsuarioView({collection: BolaoCopa.usuarios});
        // Congo.breadcrumbs = new Congo.BreadcrumbView({el: "#nav"});
        // Congo.collectionLayout = new Congo.CollectionLayoutView({collection: Congo.currentCollection});
        // Congo.dbLayout = new Congo.DatabaseLayoutView({collection: Congo.databases});
        // Congo.documentLayout = new Congo.DocumentLayoutView({collection: Congo.currentDocuments});

        //the App Layout
        // Congo.appLayout = new Congo.AppLayout({
        //     el: "#app",
        //     detailRegion: "#details",
        //     editorRegion: '#editor',
        //     navigatorView: Congo.breadcrumbs
        // })
    },
    start: function() {
        
        //initialize the app
        BolaoCopa.init();
        
        //BolaoCopa.router = new BolaoCopa.Router();
        Backbone.history.start();

        // templateLoader.load(["LoginView", "RegrasView", "HeaderView", "AdminHeaderView", "EmployeeView", "IdentificationView",
        //              "PalpiteListView", "PalpiteListItemView", "PalpiteListItemViewFaseHeader", "PalpiteListItemViewHeader",
        //              "UsuarioListView", "UsuarioItemView", "UsuarioListItemViewHeader", "UsuarioListItemViewAddHeader",
        //              "PartidaView", "PartidaListView", "PartidaListItemView", "PartidaListItemViewHeader", "PartidaListItemViewAddHeader",
        //              "LocalView", "LocalListView", "LocalListItemView", "LocalListItemViewHeader", "LocalListItemViewAddHeader",
        //              "EquipeView", "EquipeListView", "EquipeListItemView", "EquipeListItemViewHeader", "EquipeListItemViewAddHeader",
        //              "FaseView", "FaseListView", "FaseListItemView", "FaseListItemViewHeader", "FaseListItemViewAddHeader",
        //              "ResultadoButtonView", "ResultadoGridViewFase", "ResultadoGridViewTodasFases"],
        // function () {
        //     BolaoCopa.router = new BolaoCopa.Router();
        //     Backbone.history.start();
        // });
    },
    
}