window.TabelaView = Backbone.View.extend({

    tagName:'table',

    className:'table table-striped table-condensed',
    
    initialize:function () {
        //console.log('Initializing Regras View');
        $.logThis('Initializing Tabela View');
//        this.template = _.template(directory.utils.templateLoader.get('home'));
//        this.template = templates['Home'];
    },

    events:{
        "click #showMeBtn":"showMeBtnClick"
    },

    render:function () {
        $(this.el).html(this.template());
        return this;
    },

    showMeBtnClick:function () {
        app.headerView.search();
    }

});
