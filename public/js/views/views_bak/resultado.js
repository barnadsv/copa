window.ResultadoView = Backbone.View.extend({

    tagName:"div",

    nomeFase: '',

    session: null,

    initialize:function () {
        this.session = new SessionModel;
    },

    render:function () {
        $('#buttons').html("");
        if (!this.resultadoButtonView) {
            this.resultadoButtonView = new ResultadoButtonView();
        }
        $('#buttons').html(this.resultadoButtonView.render().el);

        if (this.options.nomeFase === 'Todas as Fases') {
           new ResultadoGridViewTodasFases().render();
        } else {
            new ResultadoGridViewFase({nomeFase: this.options.nomeFase}).render();
        }
    }

});

window.ResultadoButtonView = Backbone.View.extend({

    tagName:"div",

    className:'row',

    initialize:function () {

    },

    render:function () {
        $(this.el).empty();
        $(this.el).html(this.template());
        return this;
    }

});

window.ResultadoGridViewFase = Backbone.View.extend({

    tagName:'table',

    className:'table table-striped-blue table-condensed',

    //session: null,

    nomeFase: '',

    initialize:function () {
        //this.session = new SessionModel();
    },

    render:function () {
        $(this.el).empty();
        var self = this;
        var faseFiltered = '';
        var partidas = new PartidaCollection();
        partidas.fetch({
            success: function (data, response, options) {
                var me = this;
                var colSpan = 0, fase = '', faseAnterior = '', numPartida = '', resultado = '';
                var equipe1 = '', equipe2 = '', qtdGolsEquipe1 = '', qtdGolsEquipe2 = '';
                var dados = {};
                dados.partidas = [];
                dados.usuarios = [];
                 _.each(data.models, function (partida) {
                    fase = partida.attributes.fase.nom_fase;
                    if (fase === self.options.nomeFase) {
                        dados.fase = fase;
                        if (faseFiltered === '') {
                            faseFiltered = fase.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '_').toLowerCase();
                            dados.faseFiltered = faseFiltered;
                        }
                        numPartida = partida.attributes.num_partida;
                        equipe1 = partida.attributes.equipe_1.nom_equipe;
                        equipe2 = partida.attributes.equipe_2.nom_equipe;
                        qtdGolsEquipe1 = partida.attributes.qtd_gols_equipe_1 ? partida.attributes.qtd_gols_equipe_1 : "--";
                        qtdGolsEquipe2 = partida.attributes.qtd_gols_equipe_2 ? partida.attributes.qtd_gols_equipe_2 : "--";
                        resultado = qtdGolsEquipe1 + ' x ' + qtdGolsEquipe2;
                        colSpan += 4;

                        dados.partidas.push(new Object({numpartida: numPartida, resultado: resultado, equipe1: equipe1, equipe2: equipe2}));
                    }
                }, this);

                colSpan += 3;

                var palpites = new PalpiteCollection();
                palpites.fetch({
                    success: function (data, response, options) {
                        var pontos, subTotal = 0, pontosUsuario = [], colocacao = [], contribuicao = 0, contribuicaoTotal = 0;
                        var htmlPalpitesUsuario = '';
                        var nomUsuario = '', nomUsuarioAntigo = '', qtdGolsPalpiteEquipe1 = '', qtdGolsPalpiteEquipe2 = '';
                        var indiceArray = 0;
                        var i, j, achou;

                        _.sortBy(data.models, function(palpite){ return palpite.usuario.attributes.nome; });

                        i = 0;
                        for (; i < data.models.length; i += 1) {
                            fase = data.models[i].partida.attributes.fase.nom_fase;
                            if (fase == self.options.nomeFase) {
                                nomUsuario = data.models[i].usuario.attributes.nome;
                                contribuicao = data.models[i].usuario.attributes.contribuicao ? retornaContribuicao(fase, parseFloat(data.models[i].usuario.attributes.contribuicao)) : 0;
                                if (nomUsuario !== nomUsuarioAntigo) {
                                    if (nomUsuarioAntigo !== '') {
                                        pontosUsuario.push(subTotal);
                                        subTotal = 0;
                                    }
                                    contribuicaoTotal += contribuicao;
                                }
                                pontos = data.models[i].attributes.qtd_pontos;
                                subTotal += parseInt(pontos, 10);
                                nomUsuarioAntigo = nomUsuario;
                            }
                        }
                        pontosUsuario.push(subTotal);
                        colocacao = ordenaColocacao(pontosUsuario);

                        nomUsuario = '';
                        nomUsuarioAntigo = '';
                        i = 0;
                        for (; i < data.models.length; i += 1) {
                            achou = -1;
                            fase = data.models[i].partida.attributes.fase.nom_fase;
                            if (fase === self.options.nomeFase) {
                                nomUsuario = data.models[i].usuario.attributes.nome;
                                if (nomUsuario !== nomUsuarioAntigo) {
                                    if (nomUsuarioAntigo !== '') {
                                        //###########################################################
                                        j = 0;
                                        for (; j < dados.usuarios.length; j += 1) {
                                            if (dados.usuarios[j].usuario === nomUsuarioAntigo) {
                                                achou = j;
                                            }
                                        }
                                        if (achou >= 0) {
                                            dados.usuarios[achou].total = pontosUsuario[indiceArray];
                                            dados.usuarios[achou].colocacao = colocacao[indiceArray];
                                            achou = -1;
                                        }
                                        //#############################################################
                                        indiceArray++;
                                    }
                                }
                                qtdGolsPalpiteEquipe1 = data.models[i].attributes.qtd_gols_equipe_1 ? data.models[i].attributes.qtd_gols_equipe_1 : "--";
                                qtdGolsPalpiteEquipe2 = data.models[i].attributes.qtd_gols_equipe_2 ? data.models[i].attributes.qtd_gols_equipe_2 : "--";
                                resultado = qtdGolsPalpiteEquipe1 + ' x ' + qtdGolsPalpiteEquipe2;
                                pontos = data.models[i].attributes.qtd_pontos;
                                //###########################################################
                                j = 0;
                                for (j = 0; j < dados.usuarios.length; j += 1) {
                                    if (dados.usuarios[j].usuario === nomUsuario) {
                                        achou = j;
                                    }
                                }
                                if (achou < 0) {
                                    dados.usuarios.push(new Object({usuario: nomUsuario, palpites: [{palpite: resultado, pontos: pontos}]}));
                                } else {
                                    dados.usuarios[achou].palpites.push(new Object({palpite: resultado, pontos: pontos}));
                                    achou = -1;
                                }
                                //#############################################################
                                nomUsuarioAntigo = nomUsuario;
                            }
                        }
                        //###########################################################
                        i = 0;
                        for (; i < dados.usuarios.length; i++) {
                            if (dados.usuarios[i].usuario === nomUsuario) {
                                achou = i;
                            }
                        }
                        if (achou >= 0) {
                            // dados.usuarios[achou].palpites.push(new Object({palpite: resultado, pontos: pontos}));
                            dados.usuarios[achou].total = pontosUsuario[indiceArray];
                            dados.usuarios[achou].colocacao = colocacao[indiceArray];
                            achou = -1;
                        }
                        //#############################################################
                        dados.contribuicao = contribuicaoTotal;
                        dados.colspan = colSpan;
                        //#############################################################

                        $('#content').html($(self.el).html(self.template(dados)));

                    },
                    error: function(model, xhr, options) {
                        if (xhr.statusText === "Bad Request" || xhr.statusText === "Internal Server Error") {
                            //console.log('Erro! ' + xhr.getResponseHeader('X-Status-Reason'));
                            $.logThis('Erro! ' + xhr.getResponseHeader('X-Status-Reason'));
                            humane.log("Erro no servidor! Favor entrar em contato com o suporte.", {addnCls: 'humane-boldlight-error'});
                        } else {
                            humane.log(xhr.getResponseHeader('X-Status-Reason'), {addnCls: 'humane-boldlight-error'});
                        }
                    }
                });

            },
            error: function(model, xhr, options) {
                if (xhr.statusText === "Bad Request" || xhr.statusText === "Internal Server Error") {
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

window.ResultadoGridViewTodasFases = Backbone.View.extend({

    tagName:'table',

    className:'table table-striped-blue table-condensed',

    //session: null,

    initialize:function () {
        //this.session = new SessionModel();
    },

    render:function () {
        var self = this;
        var faseFiltered = '';
        $(this.el).empty();
            var palpites = new PalpiteCollection();
            palpites.fetch({
                success: function (data, response, options) {
                    var fase = '', faseAnterior = '', faseFiltered = '', colSpan = 0, fases = [];
                    var pontos, subTotal = 0, pontosUsuario = [], colocacao = [], contribuicao = 0, contribuicaoFase = 0, contribuicaoTotal = 0;
                    var nomUsuario = '', nomUsuarioAntigo = '', qtdGolsPalpiteEquipe1 = '', qtdGolsPalpiteEquipe2 = '';
                    var indiceArray = 0;
                    var i, j, k;
                    var dados = {};
                    dados.fases = [];
                    dados.usuarios = [];

                    _.each(data.models, function (palpite) {
                        fase = palpite.partida.attributes.fase.nom_fase;
                        if (fase !== faseAnterior) {
                            if (fases.indexOf(fase) === -1) {
                                faseFiltered = fase.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '_').toLowerCase();
                                fases.push(fase);
                                colSpan++;
                                dados.fases.push({fase: fase, fasefiltered: faseFiltered});
                            }
                            contribuicao = palpite.usuario.attributes.contribuicao ? retornaContribuicao(fase, parseFloat(palpite.usuario.attributes.contribuicao)) : 0;
                            contribuicaoTotal += contribuicao;
                        }
                        nomUsuario = palpite.usuario.attributes.nome;
                        if (nomUsuario !== nomUsuarioAntigo) {
                            if (nomUsuarioAntigo !== '') {
                                pontosUsuario.push(subTotal);
                                subTotal = 0;
                            }
                        }
                        pontos = palpite.attributes.qtd_pontos;
                        subTotal += parseInt(pontos, 10);
                        nomUsuarioAntigo = nomUsuario;
                        faseAnterior = fase;
                    }, this);
                    pontosUsuario.push(subTotal);
                    colSpan += 3;

                    dados.colspan = colSpan;
                    dados.contribuicao = contribuicaoTotal;

                    colocacao = ordenaColocacao(pontosUsuario);

                    nomUsuario = '';
                    nomUsuarioAntigo = '';
                    fase = '';
                    faseAnterior = '';
                    faseFiltered = 'todas-fases';
                    fases = [];
                    subTotal = 0;
                    indiceArray = 0;
                    _.each(data.models, function (palpite) {
                        fase = palpite.partida.attributes.fase.nom_fase;
                        if (fase !== faseAnterior && faseAnterior !== '') {
                            //###########################################################
                            j = 0;
                            achou = -1;
                            for (; j < dados.usuarios.length; j += 1) {
                                if (dados.usuarios[j].usuario === (nomUsuario !== nomUsuarioAntigo ? nomUsuarioAntigo : nomUsuario)) {
                                    achou = j;
                                }
                            }
                            if (achou >= 0) {
                                dados.usuarios[achou].pontosFases.push(new Object({fase: faseAnterior, pontos: subTotal}));
                                achou = -1;
                            }
                            //#############################################################
                            subTotal = 0;
                        }
                        nomUsuario = palpite.usuario.attributes.nome;
                        if (nomUsuario !== nomUsuarioAntigo) {
                            if (nomUsuarioAntigo !== '') {
                                //###########################################################
                                j = 0;
                                achou = -1;
                                for (; j < dados.usuarios.length; j += 1) {
                                    if (dados.usuarios[j].usuario === nomUsuarioAntigo) {
                                        achou = j;
                                    }
                                }
                                if (achou >= 0) {
                                    dados.usuarios[achou].total = pontosUsuario[indiceArray];
                                    dados.usuarios[achou].colocacao = colocacao[indiceArray];
                                    achou = -1;
                                }
                                //#############################################################
                                indiceArray++;
                            }
                            //###########################################################
                            j = 0;
                            achou = -1;
                            for (; j < dados.usuarios.length; j += 1) {
                                if (dados.usuarios[j].usuario === nomUsuario) {
                                    achou = j;
                                }
                            }
                            if (achou < 0) {
                                dados.usuarios.push(new Object({usuario: nomUsuario, pontosFases: []}));
                            }
                            //#############################################################
                        }
                        pontos = palpite.attributes.qtd_pontos;
                        subTotal += parseInt(pontos, 10);
                        nomUsuarioAntigo = nomUsuario;
                        faseAnterior = fase;
                    }, this);

                    //###########################################################
                    j = 0;
                    achou = -1;
                    for (; j < dados.usuarios.length; j += 1) {
                        if (dados.usuarios[j].usuario === nomUsuario) {
                            achou = j;
                        }
                    }
                    if (achou >= 0) {
                        dados.usuarios[achou].pontosFases.push(new Object({fase: fase, pontos: subTotal}));
                        dados.usuarios[achou].total = pontosUsuario[indiceArray];
                        dados.usuarios[achou].colocacao = colocacao[indiceArray];
                        achou = -1;
                    }
                    //#############################################################

                    $('#content').html($(self.el).html(self.template(dados)));

                },
                error: function(model, xhr, options) {
                    if (xhr.statusText === "Bad Request" || xhr.statusText === "Internal Server Error") {
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

function ordenaColocacao(arr) {
    var index = [], colocacao = [];
    var arrVazio = true;
    var i = arr.length;

    while (i--) {
      index.push(arr.length - i - 1);
      colocacao.push(0);
    }

    for (i = 0; i < arr.length; i++) {
        if (arr[i] !== 0) {
            arrVazio = false;
        }
    }

    if (!arrVazio) {
        var comparator = function(a, b) {
            var need_a = arr[a];
            var need_b = arr[b];

            // For robustness - non-numbers get sorted last:
            if (typeof need_a !== 'number' || isNaN(need_a)) { need_a = -Infinity; }
            if (typeof need_b !== 'number' || isNaN(need_b)) { need_b = -Infinity; }

            if (need_a < need_b) { return 1; }
            if (need_b < need_a) { return -1; }
            return 0;
            //return need_a - need_b;
        };
        var compareNumbers = function compareNumbers(a, b)
        {
          return a - b;
        };
        index.sort(comparator);
        var arrClone = arr.slice();
        arrClone.sort(compareNumbers);
        arrClone.reverse();

        var pontosAnterior = 999999;
        var posicao = 0;
        for (i = 0; i < index.length; i++) {
            if (arrClone[i] < pontosAnterior) {
                posicao++;
            }
            colocacao[index[i]] = posicao;
            pontosAnterior = arrClone[i];
        }
    }
    return colocacao;
}

function retornaContribuicao(nomeFase, contribuicao) {
    var valor = 5;
    switch (nomeFase) {
        case 'Fase de Grupos - 1ª Rodada':
            if (contribuicao < 50) {
                return 0;
            } else {
                return valor;
            }
            break;
        case 'Fase de Grupos - 2ª Rodada':
            if (contribuicao < 40) {
                return 0;
            } else {
                return valor;
            }
            break;
        case 'Fase de Grupos - 3ª Rodada':
            if (contribuicao < 30) {
                return 0;
            } else {
                return valor;
            }
            break;
        case 'Semifinais':
            if (contribuicao < 20) {
                return 0;
            } else {
                return valor;
            }
            break;
        case 'Finais':
            if (contribuicao < 10) {
                return 0;
            } else {
                return valor;
            }
            break;
        default:
            return 0;
    }
}

function resultadoGrafico() {

    var colors = [];
    var palpites = new PalpiteCollection();
    var totalUsuarios = [];
    palpites.fetch({
        success: function (data, response, options) {

            var fase = '', faseAnterior = '', faseFiltered = '', colSpan = 0, fases = [];
            var pontos = 0, subTotal = 0, subTotalUsuario = 0, pontosUsuario = [], colocacao = [], contribuicao = 0, contribuicaoFase = 0, contribuicaoTotal = 0;
            var nomUsuario = '', nomUsuarioAntigo = '', qtdGolsPalpiteEquipe1 = '', qtdGolsPalpiteEquipe2 = '', usuarios = [];
            var indiceArray = 0, indiceFase = 0;
            var resultadoPalpites = [];
            var total, subTotalAnterior;

            _.each(data.models, function (palpite) {
                var key;
                subTotalUsuario = subTotal;
                nomUsuario = palpite.usuario.attributes.nome;
                fase = palpite.partida.attributes.fase.nom_fase;
                if (fase !== faseAnterior) {
                    subTotal = 0;
                    if (fases.indexOf(fase) === -1) {
                        resultadoPalpites.push(new Object({fase: fase, values: []}));
                        fases.push(fase);
                    }
                    if (faseAnterior !== '') {
                        indiceFase = fases.indexOf(faseAnterior);
                        if (usuarios.indexOf(nomUsuario) === -1) {
                            usuarios.push(nomUsuario);
                        }
                        if (nomUsuario !== nomUsuarioAntigo) {
                            resultadoPalpites[indiceFase].values.push(new Object({x: usuarios.indexOf(nomUsuario), y: subTotalUsuario}));
                        } else {
                            resultadoPalpites[indiceFase].values.push(new Object({x: usuarios.indexOf(nomUsuarioAntigo), y: subTotalUsuario}));
                        }
                    }
                    if (nomUsuario !== nomUsuarioAntigo) {
                        for (key in totalUsuarios) {
                            if (totalUsuarios[key].usuario === nomUsuarioAntigo) {
                                total = totalUsuarios[key].total;
                                total += subTotalAnterior;
                                totalUsuarios[key].total = total;
                            }
                        }
                        totalUsuarios.push(new Object({usuario: nomUsuario, total: 0}));
                    } else {
                        for (key in totalUsuarios) {
                            if (totalUsuarios[key].usuario === nomUsuario) {
                                total = totalUsuarios[key].total;
                                total += subTotalUsuario;
                                totalUsuarios[key].total = total;
                            }
                        }

                    }
                }
                pontos = palpite.attributes.qtd_pontos;
                subTotal += parseInt(pontos, 10);
                subTotalAnterior = subTotal;
                nomUsuarioAntigo = nomUsuario;
                faseAnterior = fase;
            }, this);
            indiceFase = fases.indexOf(fase);
            resultadoPalpites[indiceFase].values.push(new Object({x: usuarios.indexOf(nomUsuario), y: subTotalUsuario}));

            for (var key in totalUsuarios) {
                if (totalUsuarios[key].usuario === nomUsuario) {
                    total = totalUsuarios[key].total;
                    total += subTotalUsuario;
                    totalUsuarios[key].total = total;
                }
            }

            var maxText = d3.max(usuarios, function(usuario) {
                return usuario.length;
            });

            var stack = d3.layout.stack()
                //.offset("wiggle")
                .values(function(d) { return d.values; });

            var margin = {top: 50, right: 20, bottom: 50, left: maxText*9},
                width = 940 - margin.left - margin.right,
                // height = 500 - margin.top - margin.bottom;
                height = Math.max(usuarios.length*20, 500 - margin.top - margin.bottom);

            var layers = stack(resultadoPalpites);
            var xGroupMax = d3.max(layers, function(layer) {
                    return d3.max(layer.values, function(d) {
                        return d.y;
                    });
                }),
                xStackMax = d3.max(layers, function(layer) {
                    return d3.max(layer.values, function(d) {
                        return d.y0 + d.y;
                    });
                });

            var y = d3.scale.ordinal()
                .domain(usuarios)
                //.domain(d3.range(m))
                .rangeRoundBands([0, height], 0.08);

            var x = d3.scale.linear()
                .domain([0, xStackMax])
                .range([0, width]);

            colors = ["#0055cc", "#5bbdd8", "#5fbe60", "#fbb14e", "#e95b57"];

            var xAxis = d3.svg.axis()
                .scale(x)
                .tickSize(0)
                .tickPadding(6)
                .orient("bottom");

            var svg = d3.select("#content").append("svg")
                .attr("width", width + margin.left + margin.right)
                .attr("height", height + margin.top + margin.bottom)
              .append("g")
                .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

            var layer = svg.selectAll(".layer")
                .data(layers)
              .enter().append("g")
                .attr("class", "layer")
                //.style("fill", function(d, i) { return colors[i]; });
                //.style("fill", function(d, i) { return color(i); });
                .style("fill", function(d, i) { return colors[i]; });

            var rect = layer.selectAll("rect")
                .data(function(d) {
                    return d.values;
                })
              .enter().append("rect")
                .attr("x", function(d) {
                    //return x(d.y0);
                    return 0;
                })
                .attr("y", function(d, i) {
                    return y(i);
                })
                .attr("width", function(d) {
                    //return x(d.y);
                    return 0;
                })
                .attr("height", y.rangeBand())
                .attr('class', function(d, i){return "rect";})
                .attr("index_value", function(d, i) {
                    return usuarios[i] + "-rect";
                })
                .on('mousemove', showTooltip)
                .on("mouseout", hideTooltip);

            rect.transition()
                .delay(function(d, i) { return i * 10; })
                .attr("x", function(d) { return x(d.y0); })
                .attr("width", function(d) { return x(d.y); });

            svg.append("g")
                .attr("class", "x axis")
                .attr("transform", "translate(0," + height + ")")
                .call(xAxis);

            var yTitulo = height + 30;

            svg.append("g")
                .attr("transform", "translate(" + width/2 + "," + yTitulo + ")")
                .append("svg:text")
                .attr("class", "title")
                .text("Pontos");

            var yText = function(i) {
                return y(i) +  y.rangeBand() / 2 + 5;
            };

            for (i = 0; i < usuarios.length; i++) {
                svg.append("g")
                    .attr("transform", "translate(-6," + yText(i) + ")")
                    .append("svg:text")
                    .attr("text-anchor", "end")
                    .attr("class", "title")
                    .text(function(d) {
                        return usuarios[i];
                    });
            }

            var textValue = layer.selectAll(".textValue")
                .data(function(d) {
                    return d.values;
                })
              .enter().append("text")
                .attr("x", function(d) {
                    return x(d.y0 + d.y);
                })
                .attr("y", function(d, i) {
                    return y(i);
                })
                .attr("dx", function(d) {
                    return -20;
                })
                .attr("dy", y.rangeBand()/2 + 5)
                .attr("fill", "White")
                .style("font-size", "1.0em")
                .text(function(d) {
                    if (d.y !== 0) {
                        return d.y;
                    }
                });

            d3.selectAll("input").on("change", change);

            var timeout = setTimeout(function() {
              d3.select("input[value=\"grouped\"]").property("checked", true).each(change);
            }, 2000);

            function change() {
              clearTimeout(timeout);
              if (this.value === "grouped") {
                  transitionGrouped();
              } else {
                transitionStacked();
              }
            }

            function transitionGrouped() {
              x.domain([0, xGroupMax]);

              rect.transition()
                  .duration(500)
                  .delay(function(d, i) { return i * 10; })
                  .attr("y", function(d, i, j) { return y(d.x) + y.rangeBand() / n * j; })
                  .attr("height", y.rangeBand() / n)
                .transition()
                  .attr("x", function(d) { return x(d.y); })
                  .attr("width", function(d) { return x(d.y); });
            }

            function transitionStacked() {
              x.domain([0, xStackMax]);

              rect.transition()
                  .duration(500)
                  .delay(function(d, i) { return i * 10; })
                  .attr("x", function(d) { return x(d.y0 + d.y); })
                  .attr("width", function(d) { return x(d.y0) - x(d.y0 + d.y); })
                .transition()
                  .attr("y", function(d) { return y(d.x); })
                  .attr("height", y.rangeBand());
            }

            svg.append("g")
                .append("svg:rect")
                .attr("class", "custom-tooltip-bg")
                .attr("x", 0)
                .attr("y", 0)
                .attr("rx", 4)
                .attr("ry", 4)
                .attr("width", 60)
                .attr("height", 18)
                .attr("visibility", "hidden");


            svg.append("g")
                .append("svg:text")
                .attr("x", 0)
                .attr("y", 0)
                .attr("class", "custom-tooltip")
                .attr("visibility", "hidden")
                .text("Tooltip")
                .attr("fill", "Black")
                .style("font-size", "1.0em");


            function showTooltip(evt)
            {
              var total = 0;
              var indexNomUsuario = this.attributes.index_value.value.slice(0,-5);
              for (var key in totalUsuarios) {
                 if (totalUsuarios[key].usuario === indexNomUsuario) {
                    total = totalUsuarios[key].total;
                 }
              }
              var tooltip_bg = d3.selectAll('.custom-tooltip-bg')[0][0];
              var tooltip = d3.selectAll('.custom-tooltip')[0][0];
              var texto = indexNomUsuario + " - Total: " + total + " pontos";
              var tamanhoTexto = tooltip.getComputedTextLength();
              tooltip_bg.attributes.x.value = d3.mouse(this)[0] - 11;
              tooltip_bg.attributes.y.value = d3.mouse(this)[1] - 30;
              tooltip_bg.attributes.width.value = tamanhoTexto + 10;
              tooltip_bg.attributes.visibility.value = 'visible';
              tooltip.attributes.x.value = d3.mouse(this)[0] - 8;
              tooltip.attributes.y.value = d3.mouse(this)[1] - 16;
              tooltip.textContent = texto;
              tooltip.attributes.visibility.value = 'visible';
            }

            function hideTooltip()
            {
              var tooltip_bg = d3.selectAll('.custom-tooltip-bg')[0][0];
              tooltip_bg.attributes.visibility.value = 'hidden';
              var tooltip = d3.selectAll('.custom-tooltip')[0][0];
              tooltip.attributes.visibility.value = 'hidden';
            }

            // Inspired by Lee Byron's test data generator.
            function bumpLayer(n, o) {

              function bump(a) {
                var x = 1 / (0.1 + Math.random()),
                    y = 2 * Math.random() - 0.5,
                    z = 10 / (0.1 + Math.random());
                for (var i = 0; i < n; i++) {
                  var w = (i / n - y) * z;
                  a[i] += x * Math.exp(-w * w);
                }
              }

              var a = [], i;
              for (i = 0; i < n; ++i) { a[i] = o + o * Math.random(); }
              for (i = 0; i < 5; ++i) { bump(a); }
              return a.map(function(d, i) { return {x: i, y: Math.max(0, d)}; });
            }
        },
        error: function(model, xhr, options) {
            if (xhr.statusText === "Bad Request" || xhr.statusText === "Internal Server Error") {
                //console.log('Erro! ' + xhr.getResponseHeader('X-Status-Reason'));
                $.logThis('Erro! ' + xhr.getResponseHeader('X-Status-Reason'));
                humane.log("Erro no servidor! Favor entrar em contato com o suporte.", {addnCls: 'humane-boldlight-error'});
            } else {
                humane.log(xhr.getResponseHeader('X-Status-Reason'), {addnCls: 'humane-boldlight-error'});
            }
        }
    });
}

