var dashboardModel = require("../models/dashboardModel")

function listarKpis(req, res){
    dashboardModel.listarKpis()
        .then(resultado =>{
            res.status(200).json(resultado);
        })
}

function graficoQuiz(req, res){
    dashboardModel.graficoQuiz()
        .then(function(resultado){
            if(resultado.length > 0){
                res.status(200).json(resultado);
            } else{
                res.status(204).send("Não foram encontrados dados para exibição do gráfico. Atualize a página!")
            }
        });
}

function graficoBandaCadastro(req, res){
    dashboardModel.graficoBandaCadastro()
        .then(function(resultado){
            if(resultado.length > 0){
                res.status(200).json(resultado);
            } else{
                res.status(204).send("Não foram encontrados dados para exibição do gráfico. Atualize a página!")
            }
        });
}

function graficoGeneroCadastro(req, res){
    dashboardModel.graficoGeneroCadastro()
        .then(function(resultado){
            if(resultado.length > 0){
                res.status(200).json(resultado);
            } else{
                res.status(204).send("Não foram encontrados dados para exibição do gráfico. Atualize a página!")
            }
        });
}
module.exports = {
    listarKpis,
    graficoQuiz,
    graficoBandaCadastro,
    graficoGeneroCadastro
} 