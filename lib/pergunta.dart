class Pergunta {
  late String pergunta;
  late String alternativa1;
  late String alternativa2;
  late String alternativa3;
  late String alternativa4;
  late String alternativaCorreta;
  late String categoria;


}
class Quiz{
 List<Pergunta> perguntasCadastradas = [];

  cadastrarPergunta(Pergunta perg) {
    perguntasCadastradas.add(perg);
  }
}
