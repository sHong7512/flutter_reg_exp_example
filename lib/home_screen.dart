import 'package:flutter/material.dart';
import 'package:reg_exp_example/reg_exp_vowel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textFormController = TextEditingController();
  final _regExpVowel = RegExpVowel();

  String _resultText = '';
  String _checkKeyText = RegExpVowel.neverCheckString;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _textFormController.text = 'https://github.com/sHong7512';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('RegExp Example'),
          centerTitle: true,
          titleTextStyle: const TextStyle(fontSize: 18),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _baseContainer(child: _resultBody()),
              const SizedBox(height: 10),
              _baseContainer(child: _inputBody()),
              const SizedBox(height: 10),
              Expanded(child: _baseContainer(child: _patternBody())),
            ],
          ),
        ),
      ),
    );
  }

  Widget _resultBody() {
    return Column(
      children: [
        Text(_checkKeyText, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 10),
        Text(_resultText, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, color: Colors.red)),
      ],
    );
  }

  Widget _inputBody() {
    return TextFormField(
      maxLines: 1,
      controller: _textFormController,
      decoration: const InputDecoration(hintText: 'Edit text for check'),
    );
  }

  Widget _patternBody() {
    return SingleChildScrollView(
      child: Column(
        children: _regExpVowel.patterns.entries
            .map((e) => ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _checkKeyText = 'Check <${e.key}>';
                      _resultText = _regExpVowel.check(_textFormController.text, e.value);
                    });
                  },
                  child: Text('Check <${e.key}>', style: TextStyle(fontSize: 12),),
                ))
            .toList(),
      ),
    );
  }

  Widget _baseContainer({required Widget child}){
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}
