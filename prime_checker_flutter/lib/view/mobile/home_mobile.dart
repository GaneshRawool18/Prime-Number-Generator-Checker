import 'package:flutter/material.dart';
import 'package:prime_checker_flutter/controller/prime_provider.dart';
import 'package:prime_checker_flutter/widgets/animated_text.dart';
import 'package:prime_checker_flutter/widgets/custom_button.dart';
import 'package:prime_checker_flutter/widgets/number_input_field.dart';
import 'package:provider/provider.dart';

class HomeMobile extends StatefulWidget {
  @override
  _HomeMobileState createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();
  bool isCheckPrime = true;

  @override
  Widget build(BuildContext context) {
    final primeProvider = Provider.of<PrimeProvider>(context);
    final mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double screenHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Prime Checker - Mobile",
          style: TextStyle(
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              AnimatedTextWidget(
                text: "Welcome to Prime Checker!",
                fontSize: screenWidth * 0.055,
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    text: "Check Prime",
                    onPressed: () {
                      setState(() {
                        isCheckPrime = true;
                        primeProvider.resetMessage();
                        numberController.clear();
                      });
                    },
                  ),
                  CustomButton(
                    text: "Generate Primes",
                    onPressed: () {
                      setState(() {
                        isCheckPrime = false;
                        primeProvider.resetMessage();
                        startController.clear();
                        endController.clear();
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.05),
              if (isCheckPrime) ...[
                AnimatedTextWidget(
                  text: "Check Prime Number",
                  fontSize: screenWidth * 0.05,
                ),
                SizedBox(height: screenHeight * 0.03),
                NumberInputField(
                  controller: numberController,
                  label: "Enter Number",
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomButton(
                  text: "Check Prime",
                  onPressed: () {
                    primeProvider.checkPrime(numberController.text);
                  },
                ),
              ],
              if (!isCheckPrime) ...[
                AnimatedTextWidget(
                  text: "Generate Prime Numbers",
                  fontSize: screenWidth * 0.05,
                ),
                SizedBox(height: screenHeight * 0.03),
                NumberInputField(
                  controller: startController,
                  label: "Start Range",
                ),
                NumberInputField(
                  controller: endController,
                  label: "End Range",
                ),
                SizedBox(height: screenHeight * 0.03),
                CustomButton(
                  text: "Generate",
                  onPressed: () {
                    primeProvider.generatePrimeNumbers(
                      startController.text,
                      endController.text,
                    );
                  },
                ),
                if (primeProvider.primes.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.02),
                    padding: EdgeInsets.all(screenWidth * 0.025),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Wrap(
                      children: primeProvider.primes.map((num) {
                        return Padding(
                          padding: EdgeInsets.all(screenWidth * 0.012),
                          child: Text(
                            num.toString(),
                            style: TextStyle(fontSize: screenWidth * 0.04),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
              ],
              SizedBox(height: screenHeight * 0.02),
              if (primeProvider.resultText.isNotEmpty)
                AnimatedTextWidget(
                  text: primeProvider.resultText,
                  fontSize: screenWidth * 0.045,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
