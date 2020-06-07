import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        backgroundColor: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String sivert = "";
  String selectedLanguage;

  //0...Russisch, 1...Deutsch, 2...Englisch
  int index = 0;

  final List title = ["Зиверт-Конвертер", "Sievert Konvertierer", "Sievert Converter"];
  final List textCpm = ["Считает в минуту", "CPM", "CPM"];
  final List errorReturnSomething = [
    "Пожалуйста, введите что-нибудь",
    "Bitte geben Sie etwas ein",
    "please enter something"
  ];
  final List errorEnterANumber = [
    "Пожалуйста, введите номер",
    "Bitte geben Sie eine Nummer ein",
    "Please enter a number"
  ];
  final List textConvert = ["Конвертировать", "Konvertieren", "Convert"];
  final List mSv = ["микросивертах", "Micro Sievert", "Micro Sievert"];
  TextEditingController inputC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title[index]),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: DropdownButton<String>(
                items: <String>["русский", "Deutsch", "English"]
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                value: selectedLanguage,
                hint: Text("русский"),
                onChanged: (String val) {
                  selectedLanguage = val;

                  if (val == "русский") {
                    setState(() {
                      index = 0;
                    });
                  }
                  if (val == "Deutsch") {
                    setState(() {
                      index = 1;
                    });
                  }
                  if (val == "English") {
                    setState(() {
                      index = 2;
                    });
                  }
                },
              ),
            ),
            Expanded(
              flex: 5,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(children: [
                      Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                        flex: 9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              style: TextStyle(fontSize: 40),
                              decoration: InputDecoration(
                                  hoverColor: Colors.green,
                                  hintText: textCpm[index]),
                              controller: inputC,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return errorReturnSomething[index];
                                }
                                if (double.tryParse(inputC.text) == null) {
                                  return errorEnterANumber[index];
                                }
                                return null;
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Center(
                                child: RaisedButton(
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        setState(() {
                                          sivert =
                                              (double.parse(inputC.text) / 120)
                                                  .toString();
                                        });
                                      }
                                    },
                                    child: Text(textConvert[index],
                                        style: TextStyle(fontSize: 30))),
                              ),
                            ),
                            Text("${mSv[index]}: $sivert",
                                style: TextStyle(fontSize: 50))
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
