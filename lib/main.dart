//Viviana Katherine Vásquez Fonseca
//Grupo 1 Desarrollo de Aplicaciones híbridas Nivel 1
//PROYECTO FINAL

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Converter',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Conversión de divisas'),
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
  final _countmoney = TextEditingController();
  int _convertirde = 1;
  int _convertira = 1;
  double _result = 0;
  String _result2 = '';
  String _message='';
  void _converter() {
    setState(() {
      if(_convertirde == 1){
        if(_convertira == 1){
          _result=double.parse(_countmoney.text);
          _message= '1 COP equivale a 1 COP';
        }
        else if(_convertira == 2){
          _result= 0.00023*double.parse(_countmoney.text);
          _message= '1 COP equivale a 0.00023 EUR';
        }
        else if(_convertira == 3){
          _result= 0.00024*double.parse(_countmoney.text);
          _message= '1 COP equivale a 0.00024 USD';
        }
      }
      else if(_convertirde == 2){
        if(_convertira == 1){
          _result= 4372.36*double.parse(_countmoney.text);
          _message= '1 EUR equivale a 4372.36 COP';
        }
        else if(_convertira == 2){
          _result=double.parse(_countmoney.text);
          _message= '1 EUR equivale a 1 EUR';
        }
        else if(_convertira == 3){
          _result= 1.06*double.parse(_countmoney.text);
          _message= '1 EUR equivale a 1.06 USD';
        }
      }
      else if(_convertirde == 3){
        if(_convertira == 1){
          _result= 4138.75*double.parse(_countmoney.text);
          _message= '1 USD equivale a 4138.75 COP';
        }
        else if(_convertira == 2){
          _result= 0.95*double.parse(_countmoney.text);
          _message= '1 USD equivale a 0.95 EUR';
        }
        else if(_convertira == 3){
          _result=double.parse(_countmoney.text);
          _message= '1 USD equivale a 1 USD';
        }
      }
      _result2 = _result.toStringAsFixed(2);
    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:30,vertical:26),
        child: Center(

          child: Column(

            children: <Widget>[
              const Icon(
                Icons.monetization_on,
                color: Colors.blueGrey,
                size: 150,

              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: DropdownButton <int>(
                      //initialValue: selectedMenu,
                      // Callback that sets the selected popup menu item.
                      value: _convertirde,
                      icon: Icon(Icons.arrow_drop_down),
                      style: const TextStyle(color: Colors.black87, fontSize: 20),
                      underline: Container(
                        height: 2,
                        color: Colors.amber,
                      ),
                      onChanged: (newMoney){
                        setState(() {
                          _convertirde = newMoney!;
                        });
                      },
                      items: const [
                        DropdownMenuItem<int>(
                          value: 1,
                          child: Text('Pesos   '),
                        ),
                        DropdownMenuItem<int>(
                          value: 2,
                          child: Text('Euros   '),
                        ),
                        DropdownMenuItem<int>(
                          value: 3,
                          child: Text('Dólares  '),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 40.0,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: _countmoney,
                      decoration:const InputDecoration(
                          border:OutlineInputBorder(),
                          labelText: 'Ingrese el valor       '),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: DropdownButton <int>(
                      //initialValue: selectedMenu,
                      // Callback that sets the selected popup menu item.
                      value: _convertira,
                      icon: Icon(Icons.arrow_drop_down),
                      style: const TextStyle(color: Colors.black87, fontSize: 20),
                      underline: Container(
                        height: 2,
                        color: Colors.lightGreen,
                      ),
                      onChanged: (newMoney){
                        setState(() {
                          _convertira = newMoney!;
                        });
                      },
                      items: const [
                        DropdownMenuItem<int>(
                          value: 1,
                          child: Text('Pesos   '),
                        ),
                        DropdownMenuItem<int>(
                          value: 2,
                          child: Text('Euros   '),
                        ),
                        DropdownMenuItem<int>(
                          value: 3,
                          child: Text('Dólares  '),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 40.0,
                  ),
                  Flexible(
                    child: Container(
                      width: 450,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color:Colors.black45),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal:10,vertical:16),
                      child: Text(
                        ' $_result2',
                        style: const TextStyle(
                          fontSize: 20,
                          fontStyle:FontStyle.italic,
                          color: Colors.black87,
                          backgroundColor: Colors.white38,

                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                '$_message',
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      color: Colors.black87,
                      fontSize: 20),
                  backgroundColor: Colors.orange[200],
                ),
                onPressed: (){
                  _converter();
                },
                child: const Text(
                  "Convertir",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20
                  ),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
