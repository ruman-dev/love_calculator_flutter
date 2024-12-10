import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

final TextEditingController yourNameController = TextEditingController();
final TextEditingController partnerNameController = TextEditingController();
final _formKey = GlobalKey<FormState>();
bool isCalculated = false;
String result = '';

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  void dispose() {
    yourNameController.dispose();
    partnerNameController.dispose();
    super.dispose();
  }



  double calculateLove(String yourName, String partnerName) {
    double yourNameVal = 0.0;
    double partnerNameVal = 0.0;
    double finalValue;

    for (int i = 0; i < yourName.length; i++) {
      yourNameVal += yourName.codeUnitAt(i);
    }
    for (int i = 0; i < partnerName.length; i++) {
      partnerNameVal += partnerName.codeUnitAt(i);
    }
    if (yourNameVal < partnerNameVal) {
      finalValue = (yourNameVal / partnerNameVal) * 100;
    } else {
      finalValue = (partnerNameVal / yourNameVal) * 100;
    }
    return finalValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/love_image.jpg',
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Love Calculator',
                    style: TextStyle(color: Colors.pink, fontSize: 32),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: yourNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill your name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              label: Text('Your Name'),
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(Icons.heart_broken),
                              prefixIconColor: Colors.pink),
                          style: TextStyle(color: Colors.pink.shade500),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: partnerNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill your name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              label: Text('Partnar\'s Name'),
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(Icons.heart_broken),
                              prefixIconColor: Colors.pink),
                          style: TextStyle(color: Colors.pink.shade500),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pink),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    result = calculateLove(
                                            yourNameController.text,
                                            partnerNameController.text)
                                        .toStringAsFixed(2);
                                    isCalculated = true;
                                  
                                  });
                                }
                              },
                              child: const Text(
                                'Calculate Love',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            const SizedBox(width: 30),
                            Offstage(
                              offstage: !isCalculated,
                              child: showResult(result),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget showResult(String result) {
  return Center(
    child: Text(
      "$result 💞",
      style: const TextStyle(
        color: Colors.pink,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
