var quizModel = require("../models/quizModel");

function inserirResultado(req, res) {
    const {fkCadastro, fkQuiz, resultado} = req.body
    quizModel.inserirResultado(fkCadastro, fkQuiz, resultado)
    .then(resultado => {
        res.status(200).json({success: true, message: "Resultado registrado", data: resultado})
    })
    .catch(erro => {
        console.log(erro);
        console.log("Houve um erro ao registrar o resultado.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


function inserirPerguntas(req, res) {
    const { p1, p2, p3, p4, p5, p6, p7 } = req.body;

    quizModel.inserirPerguntas(p1, p2, p3, p4, p5, p6, p7)
        .then(resultado => {
            console.log("Resultado do INSERT:", resultado);
            const idQuiz = resultado.insertId;
            res.status(200).json({
                success: true,
                message: "Perguntas registradas",
                idQuizNovo: idQuiz
            });
        })
        .catch(erro => {
            console.log("Erro ao registrar perguntas:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    inserirResultado,
    inserirPerguntas
};