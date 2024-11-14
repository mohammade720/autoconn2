import 'package:autoconn2/login_screen/tab_view/tabview.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class MyOTPScreen extends StatefulWidget {
  const MyOTPScreen({super.key});

  @override
  State<MyOTPScreen> createState() => _MyOTPScreenState();
}

class _MyOTPScreenState extends State<MyOTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                  const SizedBox(height: 42),
                  const Text(
                    'OTP Verification',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter the OTP send to shabbir@---',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.edit,
                        size: 16,
                        color: Color(0xff0001000),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Pinput(
                    length: 6,
                    defaultPinTheme: PinTheme(
                      width: 44,
                      height: 44,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF172157)),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    onChanged: (value) {
                      print('OTP entered: $value');
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't receive OTP ?",
                        style: TextStyle(fontSize: 12),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Resend 59s',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFEAB308),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  'Don’t worry your data will not be shared with anyone. Please read our ',
                            ),
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(
                                color: Color(0xFFEAB308),
                              ),
                            ),
                            TextSpan(
                              text: ' and ',
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: Color(0xFFEAB308),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(height: 36),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: 328,
                      height: 36,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyTabView()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFFEAB308),
                        ),
                        child: const Text(
                          'Verify & Continue',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
