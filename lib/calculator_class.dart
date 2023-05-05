import 'package:flutter/material.dart';
import 'package:flutter_class_calculator/styles.dart';

class Cal extends StatefulWidget {
  const Cal({Key? key}) : super(key: key);

  @override
  State<Cal> createState() => _CalState();
}

class _CalState extends State<Cal> {
  String result = "";
  var num1;
  var num2;
  String operand = "";

  buttonPressed(String buttonText) {
    try {
      if (buttonText == "c") {
        result = "";
        num1 = '';
        num2 = '';
        operand = "";
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "*" ||
          buttonText == "/") {
        num1 = int.parse(result);
        operand = buttonText;
        result = "";
      } else if (buttonText == "=") {
        num2 = int.parse(result);
        if (operand == "+") {
          result = (num1 + num2).toString();
        }
        if (operand == "-") {
          result = (num1 - num2).toString();
        }
        if (operand == "*") {
          result = (num1 * num2).toString();
        }
        if (operand == "/") {
          result = (num1 / num2).toString();
        }
        num1 = '';
        num2 = '';
        operand = "";
      } else if (buttonText == ".") {
        if (result.contains(".")) {
          return;
        } else {
          result += buttonText;
        }
      } else {
        result += buttonText;
      }
      setState(() {});
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Warning'),
          content: Text('Invalid Number'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  Text(
                    num1 == null ? '' : num1.toString(),
                    style: const TextStyle(fontSize: 48.0,color: Colors.white),
                  ),
                  Text(
                    num2 == null ? '' : num2.toString(),
                    style: const TextStyle(fontSize: 48.0),
                  ),
                  Text(
                    result,
                    style: const TextStyle(fontSize: 48.0),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        button('c', kBgColor, kTextColorII),
                        button('.', kBgColor, kTextColor),
                        button('00', kBgColor, kTextColor),
                        button('+', kBgColor, kTextColor),
                      ],
                    ),
                    sizeHeight(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        button('7', kBgColor, kTextWhiteColor),
                        button('8', kBgColor, kTextWhiteColor),
                        button('9', kBgColor, kTextWhiteColor),
                        button('/', kBgColor, kTextColor),
                      ],
                    ),
                    sizeHeight(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        button('4', kBgColor, kTextWhiteColor),
                        button('5', kBgColor, kTextWhiteColor),
                        button('6', kBgColor, kTextWhiteColor),
                        button('-', kBgColor, kTextColor),
                      ],
                    ),
                    sizeHeight(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        button('1', kBgColor, kTextWhiteColor),
                        button('2', kBgColor, kTextWhiteColor),
                        button('3', kBgColor, kTextWhiteColor),
                        button('=', kTextColor, kTextWhiteColor),
                      ],
                    ),
                    sizeHeight(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  sizeHeight() => const SizedBox(
        height: 20,
      );

  button(String buttonText, Color bgColor, Color textColor) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size(70, 70)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
        backgroundColor: MaterialStateColor.resolveWith((states) => bgColor),
      ),
      onPressed: () => buttonPressed(buttonText),
      child: Text(
        buttonText,
        style: TextStyle(
            fontSize: 35, fontWeight: FontWeight.w600, color: textColor),
      ),
    );
  }
}
