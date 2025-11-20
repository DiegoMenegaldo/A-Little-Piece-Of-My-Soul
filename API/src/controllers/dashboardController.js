var dashboardModel = require("../models/dashboardModel")

function listarKpis(req, res){
    dashboardModel.listarKpis()
        .then(resultado =>{
            res.status(200).json(resultado);
        })
}
module.exports = {
    listarKpis
} 