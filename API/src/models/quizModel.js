var database = require("../database/config");

function inserirResultado(fkCadastro, fkQuiz, resultado) {

    var instrucaoSql = `
        INSERT INTO ResultadosQuiz (fkCadastro, fkQuiz, resultado)
        VALUES ('${fkCadastro}', '${fkQuiz}', '${resultado}');
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function inserirPerguntas(p1, p2, p3, p4, p5, p6, p7) {

    var instrucaoSql = `
        INSERT INTO Quiz (p1, p2, p3, p4, p5, p6, p7)
        VALUES ('${p1}', '${p2}', '${p3}', '${p4}', '${p5}', '${p6}', '${p7}');
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    inserirResultado,
    inserirPerguntas
};
