import 'package:autoconn2/workshoplist_screen.dart';
import 'package:flutter/material.dart';

class TaxInfoCard extends StatefulWidget {
  const TaxInfoCard({super.key});

  @override
  State<TaxInfoCard> createState() => _TaxInfoCardState();
}

class _TaxInfoCardState extends State<TaxInfoCard> {
bool isSwitched = false;
bool isRegisteredForCompositionScheme = false;

@override
Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 19),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                height: 227,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Is your business registered for GST?',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                            // const Spacer(),
                            const Spacer(),
                            Switch(
                              value: isSwitched,
                              onChanged: (bool value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                              activeColor: const Color(0xFFFFFFFF),
                              activeTrackColor: const Color(0xFFEAB308),
                              inactiveTrackColor: Colors.grey,
                              inactiveThumbColor: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 36,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'GST identification Number',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF172157),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF172157),
                                  width: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          checkColor: Colors.white,
                          activeColor: const Color(0xFFEAB308),
                          title: const Text(
                            'My Business Is Registered For Composition Scheme',
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.justify,
                          ),
                          value: isRegisteredForCompositionScheme,
                          onChanged: (bool? value) {
                            setState(() {
                              isRegisteredForCompositionScheme = value ?? false;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 36,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Default Tax Percentage',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF172157),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF172157),
                                  width: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                height: 36,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WorkshoplistScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFFEAB308),
                  ),
                  child: const Text(
                    'Save detail',
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
    );
  }
}
