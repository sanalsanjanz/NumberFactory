import 'package:flutter/material.dart';

TextStyle kResultStyle = const TextStyle(color: Colors.white, fontSize: 35);
const kMargin = EdgeInsets.all(10);
const kPadding = EdgeInsets.all(10);
const kTextFieldDecoration = InputDecoration(
  suffixIcon: Icon(Icons.check),
  hintText: "Enter a number",
  hintStyle: TextStyle(color: Colors.grey),
  icon: Icon(
    Icons.sentiment_satisfied_sharp,
    color: Colors.white,
    size: 50,
  ),
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);
const kTextFieldMargin = EdgeInsets.symmetric(horizontal: 36, vertical: 10);
const kTitleStyle = TextStyle(color: Colors.white);
