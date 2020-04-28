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
      home: MyHomePage(title: 'Зиверт-Конвертер'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String sivert="";
  final String textCpm="Конвертировать";
  final String errorReturnSomething="Пожалуйста, введите что-нибудь";
  final String errorEnterANumber="Пожалуйста, введите номер";
  final String textConvert="Конвертировать";
  final String mSv="Милли Зиверт";
  TextEditingController inputC=TextEditingController();
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ), 
            body: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox()
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      style: TextStyle(
                        fontSize: 40
                      ),
                      decoration: InputDecoration(
                        hoverColor: Colors.green,
                        hintText: textCpm
                      ),
                      controller: inputC,
                      validator: (value) {
                        if (value.isEmpty) {
                          return errorReturnSomething;
                        }
                        if(double.tryParse(inputC.text)==null) {
                          return errorEnterANumber;
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: RaisedButton(
                          onPressed: () {
                            
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                
                                sivert=(double.parse(inputC.text)/18).toString();
                              });
                            }
                          },
                          child: Text(textConvert, style: TextStyle(fontSize: 30))
                        ),
                      ),
                    ),
                    Text(
                      "$mSv: $sivert",
                  style: TextStyle(
                      fontSize: 50
                  )
                )
              ],
          ),
            ),
          ]
        ),
      ),
    );
  }
}
