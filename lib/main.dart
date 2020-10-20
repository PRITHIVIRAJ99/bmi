import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height = 170.0;
  double _weight = 60.0;
  int _bmi = 0;
  String _condition = "Select data";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
              height: size.height * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.orange),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BMI",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Calculator",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                    ),
                  ),
                  SizedBox(
                    height: 9.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text(
                        "$_bmi",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 9.0,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Condition : ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                        children: [
                          TextSpan(
                            text: "$_condition",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    "Choose Data",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Height :  ",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 30.0,
                        ),
                        children: [
                          TextSpan(
                            text: "$_height cm",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Slider(
                    value: _height,
                    max: 250,
                    min: 50,
                    onChanged: (height) {
                      setState(() {
                        _height = height;
                      });
                    },
                    label: "$_height",
                    divisions: 200,
                    activeColor: Colors.black54,
                    inactiveColor: Colors.black26,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Weight :  ",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 30.0,
                        ),
                        children: [
                          TextSpan(
                            text: "$_weight kg",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Slider(
                    value: _weight,
                    max: 300,
                    min: 0,
                    onChanged: (weight) {
                      setState(() {
                        _weight = weight;
                      });
                    },
                    label: "$_weight",
                    divisions: 300,
                    activeColor: Colors.black54,
                    inactiveColor: Colors.black26,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RaisedButton(
                    splashColor: Colors.white,
                    elevation: 10.0,
                    color: Colors.orange,
                    onPressed: () {
                      setState(() {
                        _bmi = (_weight / ((_height / 100) * (_height / 100)))
                            .round()
                            .toInt();
                        if (_bmi >= 18.5 && _bmi <= 25) {
                          _condition = "Normal";
                        } else if (_bmi > 25 && _bmi <= 30) {
                          _condition = "Over Weight";
                        } else if (_bmi > 30) {
                          _condition = "Obesity";
                        } else {
                          _condition = "Under Weight";
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: (Text('Calculate',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold))),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
