import 'package:bmi/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'resuable_card.dart';
import 'constants.dart';
import 'calculator_brain.dart';

enum Gender { male, female, no }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.no;

  int height = 180;
  int weight = 60;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ResuableCard(
                      selectedGender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      IconContent(FontAwesomeIcons.mars, 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ResuableCard(
                      selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ResuableCard(
                  activeCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height', style: labelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumbertTextStyle,
                          ),
                          Text('cm', style: labelTextStyle),
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 25.0),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 110.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      )
                    ],
                  )),
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ResuableCard(
                      activeCardColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                              child: Text('WEIGHT', style: labelTextStyle)),
                          Text(
                            weight.toString(),
                            style: kNumbertTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                child: Icon(FontAwesomeIcons.minus),
                                elevation: 6.0,
                                constraints: BoxConstraints.tightFor(
                                  width: 40.0,
                                  height: 40.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                shape: CircleBorder(),
                                fillColor: Color(0xFF4C4F5E),
                              ),
                              RawMaterialButton(
                                child: Icon(FontAwesomeIcons.plus),
                                elevation: 6.0,
                                constraints: BoxConstraints.tightFor(
                                  width: 40.0,
                                  height: 40.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                shape: CircleBorder(),
                                fillColor: Color(0xFF4C4F5E),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                Expanded(
                  child: ResuableCard(
                      activeCardColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(child: Text('AGE', style: labelTextStyle)),
                          Text(
                            age.toString(),
                            style: kNumbertTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                child: Icon(FontAwesomeIcons.minus),
                                elevation: 6.0,
                                constraints: BoxConstraints.tightFor(
                                  width: 40.0,
                                  height: 40.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                shape: CircleBorder(),
                                fillColor: Color(0xFF4C4F5E),
                              ),
                              RawMaterialButton(
                                child: Icon(FontAwesomeIcons.plus),
                                elevation: 6.0,
                                constraints: BoxConstraints.tightFor(
                                  width: 40.0,
                                  height: 40.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                shape: CircleBorder(),
                                fillColor: Color(0xFF4C4F5E),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            )),
            GestureDetector(
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(weight, height);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      calc.calculateBMI(),
                      calc.getResult(),
                      calc.getInterpretation()
                    ),
                  ),
                );
              },
              child: Container(
                child: Center(
                    child: Text(
                  'Calculate',
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
        ));
  }
}
