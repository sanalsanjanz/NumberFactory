// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:numberfact/const.dart';
import 'package:numberfact/number_class/number_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final numberController = TextEditingController();
  getData({required String number}) async {
    http.Response response = await http.get(
      Uri.parse("http://numbersapi.com/$number?json"),
    );
    final value = jsonDecode(response.body) as Map<String, dynamic>;
    final data = NumberClass.fromJson(value);
    return data;
  }

  bool loading = false;
  String resultText = "Enter a number and check";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.black,
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Number Factory", style: kTitleStyle),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(20)),
              margin: kMargin,
              padding: kPadding,
              //height: 150,
              // width: 150,
              child: Center(
                child: loading
                    ? const SpinKitCircle(
                        color: Colors.white,
                      )
                    // ? const CircularProgressIndicator(
                    //     color: Colors.greenAccent,
                    //   )
                    : Text(
                        resultText,
                        style: kResultStyle,
                        textAlign: TextAlign.center,
                      ),
              ),
            ),
          ),
          Container(
            margin: kTextFieldMargin,
            child: TextField(
              keyboardType: TextInputType.number,
              controller: numberController,
              decoration: kTextFieldDecoration,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 40),
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey),
              ),
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () async {
                loading = true;

                var number = numberController.text;
                final result = await getData(number: number);
                // print(result.text);
                Timer(const Duration(seconds: 3), () {
                  setState(() {
                    loading = false;
                  });
                });
                setState(() {
                  resultText = result.text;
                });
              },
              label: const Text(
                'FIND',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
