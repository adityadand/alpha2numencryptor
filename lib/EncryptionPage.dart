import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EncryptionPage extends StatefulWidget {
  @override
  _EncryptionPageState createState() => _EncryptionPageState();
}

class _EncryptionPageState extends State<EncryptionPage> {
  String _inputText = "";
  String _outputText = "";

  void _encryptText() {
    setState(() {
      _outputText = "";
      for (int i = 0; i < _inputText.length; i++) {
        int ascii = _inputText.codeUnitAt(i);
        _outputText += (ascii - 96).toString() + " ";
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
            decoration: InputDecoration(hintText: "Enter text to encrypt"),
            onChanged: (String text) {
              setState(() {
                _inputText = text;
              });
            },
          ),
          SizedBox(height: 30),
          ElevatedButton(
            child: Text("Encrypt"),
            onPressed: _encryptText,
          ),
        SizedBox(height: 10),
        Text(_outputText),
        SizedBox(height: 10),
        ElevatedButton(
        child: Text("Copy"),
         onPressed: () {
           Clipboard.setData(ClipboardData(text: _outputText));
         },
        )
        ],
      ),
    );
  }
}
