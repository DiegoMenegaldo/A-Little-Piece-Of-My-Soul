var database = require("../database/config")

function listarKpis(){
    var instrucaoSql = `SELECT * FROM vw_kpis`
    return database.executar(instrucaoSql)
}

module.exports = {
    listarKpis
};