window.IdentificationView = Backbone.View.extend({

    initialize: function() {
        update = function() {
          //console.log(moment().format('hh:mm:ss a'));
          $.logThis(moment().format('hh:mm:ss a'));
          $("#time").text("Brasília, " + moment().format('DD/MM/YYYY HH:mm:ss'))
        };

        x = setInterval(update, 1000);

        setTimeout((function() {
          return clearInterval(x);
        }), 10000);
    },

    render: function () {
        $(this.el).html(this.template());
        return this;
    }

});

