import 'package:bmi_edspert_raditya/constants/constant.dart';
import 'package:bmi_edspert_raditya/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({
    Key? key,
    required this.bmi,
  }) : super(key: key);

  final double bmi;

  determineBmiCategory(double bmiValue) {
    String category = '';
    if (bmiValue < 16.0) {
      category = underweightSevere;
    } else if (bmiValue < 17) {
      category = underweightModerate;
    } else if (bmiValue < 18.5) {
      category = underweightMild;
    } else if (bmiValue < 25) {
      category = normal;
    } else if (bmiValue < 30) {
      category = overweight;
    } else if (bmiValue < 35) {
      category = obeseI;
    } else if (bmiValue < 40) {
      category = obeseII;
    } else {
      category = obeseIII;
    }
    return category;
  }

  String getHealthRiskDescription(String categoryName) {
    String description = '';
    switch (categoryName) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        description = 'Possible nutritional deficiency and osteoporosis';
        break;
      case normal:
        description = 'Low risk (healthy range)';
        break;
      case overweight:
        description =
            'Moderate risk of developing heart disease, high blood pressure, stroke, diabetes melitus';
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        description =
            'Moderate risk of developing heart disease, high blood pressure, stroke, diabetes melitus. Metabollic syndrome';
        break;
      default:
        description = 'Description not found';
        break;
    }
    return description;
  }

  @override
  Widget build(BuildContext context) {
    final bmiCategory = determineBmiCategory(bmi);
    final bmiDescription = getHealthRiskDescription(bmiCategory);

    return Scaffold(
      appBar: AppBar(title: Text('Calculation result')),
      body: Column(children: [
        Expanded(
          child: Container(
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
        ),
        Expanded(
          flex: 5,
          child: BmiCard(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiCategory,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${bmi.toStringAsFixed(1)}',
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      bmiDescription,
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
            color: Color(0xffec3c66),
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
