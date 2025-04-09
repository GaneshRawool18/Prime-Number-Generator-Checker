import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prime_checker_flutter/controller/prime_provider.dart';
import 'package:prime_checker_flutter/widgets/custom_button.dart';
import 'package:prime_checker_flutter/widgets/number_input_field.dart';
import 'package:prime_checker_flutter/widgets/animated_text.dart';

class HomeDesktop extends StatefulWidget {
  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();
  bool isCheckPrime = true;

  @override
  Widget build(BuildContext context) {
    final primeProvider = Provider.of<PrimeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Prime Checker - Desktop"),
        backgroundColor: Colors.deepPurple,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Set a max width similar to websites (800px)
          double containerWidth =
              constraints.maxWidth > 900 ? 800 : constraints.maxWidth * 0.95;

          return Center(
            child: Container(
              width: containerWidth,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const AnimatedTextWidget(
                      text: "Welcome to Prime Checker!",
                      fontSize: 22,
                    ),
                    const SizedBox(height: 30),

                    // Mode Switch Buttons
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
                    const SizedBox(height: 30),

                    // Prime Checking Section
                    if (isCheckPrime) ...[
                      NumberInputField(
                        controller: numberController,
                        label: "Enter Number",
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        text: "Check Prime",
                        onPressed: () {
                          primeProvider.checkPrime(numberController.text);
                        },
                      ),
                    ],

                    // Show result message
                    if (primeProvider.resultText.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: AnimatedTextWidget(
                          text: primeProvider.resultText,
                          fontSize: 18,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
