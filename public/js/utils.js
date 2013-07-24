// The Template Loader. Used to asynchronously load templates located in separate .html files
window.templateLoader = {

    load: function(views, callback) {

        var deferreds = [];

        $.each(views, function(index, view) {
            if (window[view]) {
                deferreds.push($.get('tpl/' + view + '.html', function(data) {
                    window[view].prototype.template = _.template(data);
                }, 'html'));
            } else {
                if (BolaoCopa[view]) {
                    deferreds.push($.get('tpl/' + view + '.html', function(data) {
                        BolaoCopa[view].prototype.template = _.template(data);
                    }, 'html'));
                } else {
                    alert(view + " not found");
                }
            }
        });

        $.when.apply(null, deferreds).done(callback);
    }

};

window.utils = {

    // O formato que vem do MySQL é yyyy-mm-dd, e não é suportado pela função new Date() do javascript.
    // Esta função converte o formato yyyy-mm-dd para dd/mm/yyyy.
    getDate: function(datetime) {

        var s = '2011-06-21T14:27:28.593Z';
        var arrDatetime = datetime.split(/[^0-9]/);
        var newDatetime = new Date(arrDatetime[0],arrDatetime[1]-1,arrDatetime[2],arrDatetime[3],arrDatetime[4],arrDatetime[5]);
        return newDatetime;
    }
};

