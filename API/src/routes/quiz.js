var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

router.post("/inserirResultado", function (req, res) {
    quizController.inserirResultado(req, res);
});

router.post("/inserirPerguntas", function (req, res) {
    quizController.inserirPerguntas(req, res);
});

module.exports = router;