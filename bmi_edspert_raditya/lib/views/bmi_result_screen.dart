import 'package:bmi_edspert_raditya/helpers/bmi_calculator.dart';
import 'package:bmi_edspert_raditya/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({
    Key? key,
    required this.bmi,
  }) : super(key: key);

  final double bmi;

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    bmiCalculator.determineBmiCategory();
    bmiCalculator.getHealthRiskDescription();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculation result'),
      ),
      body: Column(children: [
        const Expanded(
          child: Center(
            child: Text(
              'Your Result',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: BmiCard(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiCalculator.bmiCategory ?? 'Data not found',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      bmiCalculator.bmiDescription ?? 'Data not found',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    )
                  ]),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 80,
            color: const Color(0xffec3c66),
            child: const Center(
              child: Text(
                'Re-Calculate BMI',
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
