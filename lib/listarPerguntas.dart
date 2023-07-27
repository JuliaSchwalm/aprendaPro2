import 'package:flutter/material.dart';
import 'package:flutter_application_1/pergunta.dart';
import 'main.dart';

class ListarPergunta extends StatefulWidget {
  const ListarPergunta({super.key});
  @override
  State<ListarPergunta> createState() => _ListarPerguntaState();
}

// This widget is the root of your application.
class _ListarPerguntaState extends State<ListarPergunta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      appBar: barraSuperior(),
      body: Container(
        color: Colors.deepPurple.shade300,
        child: corpo(),
      ),
    );
  }

  corpo() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 30),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: listagem(),
      ),
    );
  }

  barraSuperior() {
    return AppBar(
      title: const Text("Aprenda Pro"),
      backgroundColor: Colors.deepPurple,
      centerTitle: true,
    );
  }

  listagem() {
    return ListView.builder(
      itemCount: quiz.perguntasCadastradas.length,
      itemBuilder: (context, index) {
        return itemdaLista(quiz.perguntasCadastradas[index]);
      },
    );
  }

  itemdaLista(Pergunta pergunta) {
    return ListTile(
      leading: Icon(Icons.question_answer),
      title: Text(pergunta.pergunta),
      subtitle: Text('Categoria ${pergunta.categoria}'),
      trailing: botaoEditar(),
    );
  }

  botaoEditar() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.edit),
    );
  }
}
