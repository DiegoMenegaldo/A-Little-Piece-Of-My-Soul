var database = require("../database/config")

function listarKpis(){
    var instrucaoSql = `SELECT * FROM vw_kpis`
    return database.executar(instrucaoSql)
}

function graficoQuiz(){
    var instrucaoSql = `SELECT * FROM vw_grafico1;`;
    return database.executar(instrucaoSql)
}

function graficoBandaCadastro(){
    var instrucaoSql = `SELECT * FROM vw_grafico2;`;
    return database.executar(instrucaoSql)
}

function graficoGeneroCadastro(){
    var instrucaoSql = `SELECT * FROM vw_grafico3;`;
    return database.executar(instrucaoSql)
}
module.exports = {
    listarKpis,
    graficoQuiz,
    graficoBandaCadastro,
    graficoGeneroCadastro
};