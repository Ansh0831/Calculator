import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: const Color.fromARGB(255, 255, 106, 0),
      ),
      darkTheme: ThemeData(
        // Define the default brightness and colors for dark mode.
        brightness: Brightness.dark,
        primaryColor: const Color.fromARGB(255, 255, 106, 0),
      ),
      themeMode: ThemeMode.system, // Use system theme mode.
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  double output_ = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "*") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        if (kDebugMode) {
          print("Already contains a decimals");
        }
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
        output_ = (num1 + num2);
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
        output_ = (num1 - num2);
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
        output_ = (num1 * num2);
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    if (kDebugMode) {
      print(_output);
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(12.0),
          side: const BorderSide(
              width: 1.0, color: Color.fromARGB(255, 182, 189, 81)),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontFamily: 'Digital',
            fontSize: 50.0,
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Calculator'),
      ),
      body: Column(children: <Widget>[
        Container(
            alignment: Alignment.centerRight,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Text(output,
                style: const TextStyle(fontSize: 70.0, fontFamily: 'Digital'))),
        const Expanded(
          child: Divider(),
        ),
        Column(children: [
          Row(children: [
            buildButton("7"),
            buildButton("8"),
            buildButton("9"),
            buildButton("/"),
          ]),
          Row(children: [
            buildButton("4"),
            buildButton("5"),
            buildButton("6"),
            buildButton("*"),
          ]),
          Row(children: [
            buildButton("1"),
            buildButton("2"),
            buildButton("3"),
            buildButton("-"),
          ]),
          Row(children: [
            buildButton("."),
            buildButton("0"),
            buildButton("00"),
            buildButton("+"),
          ]),
          Row(children: [
            buildButton("AC"),
            buildButton("="),
          ])
        ])
      ]),
    );
  }
}
