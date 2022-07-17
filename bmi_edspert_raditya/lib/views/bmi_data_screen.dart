import 'package:bmi_edspert_raditya/constants/constant.dart';
import 'package:bmi_edspert_raditya/helpers/bmi_calculator.dart';
import 'package:bmi_edspert_raditya/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  // double calculateBmi() {
  //   double heightInMeter = height / 100;

  //   final bmi = weight / (heightInMeter * heightInMeter);
  //   return bmi;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    gender = 'male';
                    setState(() {});
                  },
                  child: BmiCard(
                    borderColor:
                        (gender == 'male') ? Colors.white : primaryColor,
                    child: const GenderIconText(
                      icon: Icons.male,
                      title: 'Male',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    gender = 'female';
                    setState(() {});
                  },
                  child: BmiCard(
                    borderColor:
                        (gender == 'female') ? Colors.white : primaryColor,
                    child: const GenderIconText(
                      icon: Icons.female,
                      title: 'Female',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: BmiCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height',
                  style: labelTextStyle!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$height',
                      style: numberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: labelTextStyle,
                    )
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 80,
                  max: 200,
                  thumbColor: Colors.white,
                  activeColor: Colors.red,
                  onChanged: (value) {
                    height = value.toInt();
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: BmiCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: labelTextStyle,
                      ),
                      Text(
                        '$weight',
                        style: numberTextStyle,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: (() {
                              weight -= 1;
                              setState(() {});
                            }),
                            elevation: 0,
                            shape: const CircleBorder(),
                            fillColor: const Color(0xff212747),
                            constraints: const BoxConstraints.tightFor(
                              width: 56,
                              height: 56,
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          RawMaterialButton(
                            onPressed: (() {
                              weight += 1;
                              setState(() {});
                            }),
                            elevation: 0,
                            shape: const CircleBorder(),
                            fillColor: const Color(0xff212747),
                            constraints: const BoxConstraints.tightFor(
                              width: 56,
                              height: 56,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: BmiCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: labelTextStyle,
                      ),
                      Text(
                        '$age',
                        style: numberTextStyle,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: (() {
                              age = age -= 1;
                              setState(() {});
                            }),
                            elevation: 0,
                            shape: const CircleBorder(),
                            fillColor: const Color(0xff212747),
                            constraints: const BoxConstraints.tightFor(
                              width: 56,
                              height: 56,
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          RawMaterialButton(
                            onPressed: (() {
                              age += 1;
                              setState(() {});
                            }),
                            elevation: 0,
                            shape: const CircleBorder(),
                            fillColor: const Color(0xff212747),
                            constraints: const BoxConstraints.tightFor(
                              width: 56,
                              height: 56,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            final bmiCalculator = BmiCalculator(height: height, weight: weight);
            bmiCalculator.calculateBmi();

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) {
                  return BmiResultScreen(
                    bmi: bmiCalculator.bmi!,
                  );
                }),
              ),
            );
          },
          child: Container(
            height: 80,
            color: const Color(0xffec3c66),
            child: const Center(
              child: Text(
                'Calculate BMI',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

// Bmi Card for gender
class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF131328),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor!,
          ),
        ),
        margin: const EdgeInsets.all(15),
        child: child);
  }
}

// Gender for BMI
class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        Text(title, style: labelTextStyle),
      ],
    );
  }
}
