import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() =>
    runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final salario = TextEditingController();
  final prestacao = TextEditingController();
  String teste1 = '';
  String teste2 = '';
  final texto = [''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(hintText: 'Salário'),
                controller: salario,
                onChanged: (text) {
                  teste1 = text;
                }),
            TextField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(hintText: 'Prestação'),
                controller: prestacao,
                onChanged: (text) {
                  teste2 = text;
                }),
            Text(
              texto[0],
              style: TextStyle(fontSize: 20, color: Colors.amber),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
                label: Text('Calcular'),
                onPressed: () {
                  final sal = double.parse(teste1);
                  final prest = double.parse(teste2);
                  final valor = sal * 30 / 100;
                  print('Valor $valor');
                  print('Prestação $prest');
                  print('sal $sal');
                  if (prest <= valor) {
                    print('$prest < $valor');
                    setState(() {
                      texto.clear();
                      texto.add('Você pode fazer o empréstimo');
                    });
                  } else if (prest > valor) {
                    print('$prest < $valor');
                    setState(() {
                      texto.clear();
                      texto.add('Você não fazer o empréstimo');
                    });
                  } else if (prest == valor + 1) {
                    print('$prest == $valor');
                    setState(() {
                      texto.clear();
                      texto.add('Você pode fazer o empréstimo');
                    });
                  }

                  salario.clear();
                  prestacao.clear();
                },
                icon: Icon(Icons.save)),
          ],
        ),
      ),
    );
  }
}
