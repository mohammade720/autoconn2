import 'package:autoconn2/login_screen/otp_screen.dart';
import 'package:flutter/material.dart';

class GetOtpScreen extends StatefulWidget {
  const GetOtpScreen({super.key});

  @override
  State<GetOtpScreen> createState() => _GetOtpScreenState();
}

class _GetOtpScreenState extends State<GetOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
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
                      width: 103,
                      height: 120,
                    ),
                  ),
                  const SizedBox(height: 42),
                  const Text(
                    'Enter Email Address to continue',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'We Will send you the 6 digit verification code',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: 328,
                      height: 36,
                      child: TextField(
                        decoration: InputDecoration(
                          label: Text('Email Address *'),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF172157),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF172157),
                            ),
                          ),
                        ),
                      ),
                    ),
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
                            text: "Don’t worry your data will not be shared with anyone. Please read our ",
                          ),
                          TextSpan(
                            text: "Terms of Service",
                            style: TextStyle(
                              color: Color(0xFFEAB308),
                            ),
                          ),
                          TextSpan(
                            text: "  and ",
                          ),
                          TextSpan(
                            text: " Privacy Policy",
                            style: TextStyle(
                              color: Color(0xFFEAB308),
                            ),
                          ),
                        ]
                      ),
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
                            MaterialPageRoute(builder: (context) => MyOTPScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFFEAB308),
                        ),
                        child: const Text(
                            'GET OTP',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not an Account?',
                        style: TextStyle(fontSize: 12),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFFEAB308)
                        ),
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
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
