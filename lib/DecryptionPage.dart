import 'package:flutter/material.dart';

class DecryptionPage extends StatefulWidget {
  @override
  _DecryptionPageState createState() => _DecryptionPageState();
}

class _DecryptionPageState extends State<DecryptionPage> {
  String _inputText = "";
  String _outputText = "";

  void _decryptText() {
    setState(() {
      _outputText = "";
      List<String> numbers = _inputText.split(" ");
      for (String number in numbers) {
        int ascii = int.parse(number) + 96;
        _outputText += String.fromCharCode(ascii);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(hintText: "Enter text to decrypt"),
            onChanged: (String text) {
              setState(() {
                _inputText = text;
              });
            },
          ),
          SizedBox(height: 30),
          ElevatedButton(
            child: Text("Decrypt"),
            onPressed: _decryptText,
          ),
          Text(_outputText),
        ],
      ),
    );
  }
}
