import 'package:flutter/material.dart';
import 'package:flutter_application_1/pergunta.dart';
import 'listarPerguntas.dart';
import 'main.dart';

class CadastrarPergunta extends StatefulWidget {
  const CadastrarPergunta({super.key});
  @override
  State<CadastrarPergunta> createState() => _CadastrarPerguntaState();
}

// This widget is the root of your application.
class _CadastrarPerguntaState extends State<CadastrarPergunta> {
  final _formKey = GlobalKey<FormState>();
  //variaveis para acessar as entradas dos campos
  final TextEditingController _pergunta = TextEditingController();
  final TextEditingController _alternativa1 = TextEditingController();
  final TextEditingController _alternativa2 = TextEditingController();
  final TextEditingController _alternativa3 = TextEditingController();
  final TextEditingController _alternativa4 = TextEditingController();
  final TextEditingController _alternativaCorreta = TextEditingController();
  //variavel selecionada no radio buttom
  String _radioSelecionado = "Iniciante";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      appBar: barraSuperior(),
      body: Container(
        color: Colors.deepPurple.shade300,
        child: corpo(),
      ),
      floatingActionButton: enviar(),
    );
  }

  corpo() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 30, top: 30, right: 30, bottom: 80),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      //barra de rolagem
      //preciso mudar de cor para aparecer
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: formulario(),
        ),
      ),
    );
  }

  formulario() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text('Adicione uma pergunta',
              style: TextStyle(
                fontSize: 19,
              )),
          pergunta(_pergunta, 'Pergunta', 'Digite a pergunta aqui',
              Icons.question_answer),
          pergunta(_alternativa1, 'Alternativa 1', 'Digite a alternativa 1',
              Icons.abc),
          pergunta(_alternativa2, 'Alternativa 2', 'Digite a alternativa 2',
              Icons.abc),
          pergunta(_alternativa3, 'Alternativa 3', 'Digite a alternativa 3',
              Icons.abc),
          pergunta(_alternativa4, 'Alternativa 4', 'Digite a alternativa 4',
              Icons.abc),
          pergunta(_alternativaCorreta, 'Alternativa Correta',
              'Digite a alternativa correta', Icons.abc),
          //preciso mudar fonte, espacamento etc
          categoria(),
        ],
      ),
    );
  }

  categoria() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text('Selecione uma categoria para pergunta',
              style: TextStyle(
                fontSize: 17,
              ),
              textAlign: TextAlign.center),
          nivelDificuldade('Iniciante', Icons.abc),
          nivelDificuldade('Intermediario', Icons.abc),
          nivelDificuldade('Avançado', Icons.abc),
        ],
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

  pergunta(TextEditingController controller, String label, String dica,
      IconData icone) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(icone),
        hintText: dica,
        labelText: label,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Preenchimento obrigatório!';
        }
        return null;
      },
    );
  }

  nivelDificuldade(String nivel, IconData icone) {
    return RadioListTile<String>(
        value: nivel,
        groupValue: _radioSelecionado,
        title: Text(nivel),
        secondary: Icon(icone),
        activeColor: Colors.purple,
        onChanged: (value) {
          setState(() {
            _radioSelecionado = value!;
          });
        });
  }

  enviar() {
    return ElevatedButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.deepPurple,
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                duration: Duration(seconds: 7),
                content: Text('Pergunta Cadastrada!')),
          );
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ListarPergunta()),
        );
        Pergunta pergunta = Pergunta();
        pergunta.pergunta = _pergunta.text;
        pergunta.alternativa1 = _alternativa1.text;
        pergunta.alternativa2 = _alternativa2.text;
        pergunta.alternativa3 = _alternativa3.text;
        pergunta.alternativa4 = _alternativa4.text;
        pergunta.alternativaCorreta = _alternativaCorreta.text;
        pergunta.categoria = _radioSelecionado;

        quiz.cadastrarPergunta(pergunta);
      },
      child: const Text('Cadastrar'),
    );
  }
}
