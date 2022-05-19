import 'package:flutter/material.dart';
import 'constants.dart';
import 'resuable_card.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.bmiResults, this.resultText, this.interpretation);

  final String bmiResults;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Center(
                  child: Text(
            'Your Results',
            style: kResultsTitleTextStyle,
          ))),
          Expanded(
            flex: 6,
            child: ResuableCard(
              activeCardColor,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(resultText, style: kResultTextStyle),
                  Text(
                    bmiResults,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                  child: Text(
                'Re-Calculate',
                style: kNumbertTextStyle,
              )),
              color: bottomContainerColor,
              // ignore: prefer_const_constructors
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          )
        ],
      ),
    );
  }
}
