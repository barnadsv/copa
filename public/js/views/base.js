// The Base View from which (almost) all views inherit
BolaoCopa.View = Backbone.View.extend({
    render: function () {
    	if (this.model) {
    		var compiled = this.template(this.model.toJSON());
    	} else {
    		var source = $(this.template()).html();
    		var compiled = _.template(source);
    	}
        // var source = $(this.template()).html();
        // var data = {};
        // if (this.model)
        //    data = this.model.toJSON();
        // var compiled = _.template(source, data);
        this.$el.html(compiled);
        return this;
    }
});

//Items for a list
BolaoCopa.ItemView = BolaoCopa.View.extend({
    remove: function () {
        var confirmed = confirm("Você deseja realmente remover este item?");
        if (confirmed) {
            this.model.destroy();
        }
    }
}); 

//Typical ListView functionality kept here
BolaoCopa.ListView = Backbone.View.extend({
    initialize: function () {

        //this.collection.bind("reset", this.render, this);
        //this.collection.bind("add", this.render, this);
        //this.collection.bind("remove", this.render, this);
    },

    render: function () {
        var self = this;
        var els = [];
        new this.collection().fetch({
            success: function (data, response, options) {
                 _.each(data.models, function (item) {
                    var itemView = new self.ItemView({ model: item });
                    els.push(itemView.render().el);
                });
                self.$el.append(els);
                return self;
            },
            error: function(model, xhr, options) {
                if (xhr.statusText == "Bad Request" || xhr.statusText == "Internal Server Error") {
                  //console.log('Erro! ' + xhr.getResponseHeader('X-Status-Reason'));
                    $.logThis('Erro! ' + xhr.getResponseHeader('X-Status-Reason'));
                    humane.log("Erro no servidor! Favor entrar em contato com o suporte.", {addnCls: 'humane-boldlight-error'});
                } else {
                    humane.log(xhr.getResponseHeader('X-Status-Reason'), {addnCls: 'humane-boldlight-error'});
                }
            }
        });
     }
});