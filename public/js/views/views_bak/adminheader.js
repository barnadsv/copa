window.AdminHeaderView = Backbone.View.extend({

    // initialize: function () {
    //     //this.searchResults = new EmployeeCollection();
    //     //this.searchresultsView = new EmployeeListView({model: this.searchResults, className: 'dropdown-menu'});
    // },

    render: function () {
        $(this.el).html(this.template());
        return this;
    },

    select: function(menuItem) {
        $('.nav li').removeClass('active');
        $('.' + menuItem).addClass('active');
    }

});
