window.LoginView = Backbone.View.extend({

    initialize:function () {
        var self = this;
        //console.log('Initializing Login View');
        $.logThis('Initializing Login View');
//        this.template = templates['Contact'];
    },

    events: {
    	"click #loginButton": "login"
    },

    render:function () {
        $(this.el).html(this.template());
        return this;
    },

    login:function(event) {
    	event.preventDefault();
    	$('.alert-error').hide();
    	var url = '../login';
        // Este hash é usado para passar a senha pela rede sem ser identificada.
        // Do lado servidor é feita outragem cifra para armazenar na base de dados.
        var hash = CryptoJS.SHA3($('#senha').val(), { outputLength: 512 }).toString(CryptoJS.enc.Base64);
        // var hash256hex = CryptoJS.SHA256(hash).toString(CryptoJS.enc.Hex);
        console.log('Logging in...');
        $.logThis('Logging in...');
    	var formValues = {
    		email: $('#email').val(),
            //senha: $('#senha').val()
            senha: hash
        };
    	$.ajax({
    		url: url,
    		type: 'POST',
    		datatype: 'json',
    		data: formValues,
    		success:function(data, text, jqXhr) {
                //console.log(["Login request details: ", data]);
    			$.logThis(["Login request details: ", data]);
                if (data.error) {
    				$('.alert-error').text(data.error.text).show();
    			} else {
                    $.cookie('usuario_id', data.usuario_id, { expires: 2, path: '/' });
    				$.cookie('session_id', data.session_id, { expires: 2, path: '/' });
                    $.cookie('usuario_nome', data.nome, { expires: 2, path: '/' });
                    $.cookie('papel', data.papel, { expires: 2, path: '/' });
                    templateLoader.load(["RegrasView"],
                    function () {
                        window.location.replace('#regras');
                    });
                    //window.location.replace('#regras');
                }
    		},
            error: function(jqXhr, status, error) {
                if (error == "Bad Request" || error == "Internal Server Error") {
                    //console.log('Erro! ' + jqXhr.getResponseHeader('X-Status-Reason'));
                    $.logThis('Erro! ' + jqXhr.getResponseHeader('X-Status-Reason'));
                    humane.log("Erro de servidor! Favor entrar em contato com o suporte.", {addnCls: 'humane-boldlight-error'});
                } else {
                    humane.log(jqXhr.getResponseHeader('X-Status-Reason'), {addnCls: 'humane-boldlight-error'});
                }
            }
    	});
    }

});
