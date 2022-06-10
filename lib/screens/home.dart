// ignore_for_file: prefer_const_constructors

import 'package:bmi_calci/constants/app_constants.dart';
import 'package:bmi_calci/widgets/left_bar.dart';
import 'package:bmi_calci/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  // HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: TextStyle(
                color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.blue[200],
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: Colors.lightBlue[900]),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                            color: Colors.black.withOpacity(.8)),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _weightController,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: Colors.lightBlue[900]),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                            color: Colors.black.withOpacity(.8)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = _w / (_h * _h);
                    if (_bmiResult > 25) {
                      _textResult = "You are over weight";
                      //Image.asset('over.jpg');
                    } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                      _textResult = "You have normal weight";
                      //Image.asset('normal.jpg');
                    } else {
                      _textResult = "You are under weight";
                      //Image.asset('assets/under.jpg');
                    }
                  });
                },
                child: Container(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue[900]),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text(
                  _bmiResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 90, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                  visible: _textResult.isNotEmpty,
                  child: Container(
                    child: Text(
                      _textResult,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueAccent),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              LeftBar(
                barWidth: 40,
              ),
              SizedBox(
                height: 20,
              ),
              LeftBar(
                barWidth: 70,
              ),
              SizedBox(
                height: 20,
              ),
              LeftBar(
                barWidth: 40,
              ),
              SizedBox(
                height: 20,
              ),
              RightBar(
                barWidth: 70,
              ),
              SizedBox(
                height: 50,
              ),
              RightBar(
                barWidth: 70,
              ),
            ],
          ),
        ));
  }
}
