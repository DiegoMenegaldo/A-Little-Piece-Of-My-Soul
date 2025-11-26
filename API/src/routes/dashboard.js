var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/kpis", function (req, res) {
    dashboardController.listarKpis(req, res);
});

router.get("/graficoQuiz", function(req, res){
    dashboardController.graficoQuiz(req, res)
});

router.get("/graficoBandaCadastro", function(req, res){
    dashboardController.graficoBandaCadastro(req, res)
});

router.get("/graficoGeneroCadastro", function(req, res){
    dashboardController.graficoGeneroCadastro(req, res)
});
module.exports = router;