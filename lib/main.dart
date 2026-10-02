import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Light Switch',
      debugShowCheckedModeBanner: false,
      home: LightScreen(),
    );
  }
}

class LightScreen extends StatefulWidget {
  const LightScreen({super.key});

  @override
  State<LightScreen> createState() => _LightScreenState();
}

class _LightScreenState extends State<LightScreen> {
  // false = light is OFF, true = light is ON
  bool isOn = false;

  void toggleLight() {
    setState(() {
      isOn = !isOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // The light bulb
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // Yellow glow only when the light is ON
                boxShadow: isOn
                    ? [
                        BoxShadow(
                          color: Colors.yellow.withOpacity(0.6),
                          blurRadius: 60,
                          spreadRadius: 20,
                        ),
                      ]
                    : [],
              ),
              child: Icon(
                isOn ? Icons.lightbulb : Icons.lightbulb_outline,
                size: 150,
                color: isOn ? Colors.amber : Colors.grey,
              ),
            ),

            const SizedBox(height: 60),

            // The button
            SizedBox(
              width: 160,
              height: 56,
              child: ElevatedButton(
                onPressed: toggleLight,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isOn ? Colors.grey.shade700 : Colors.amber,
                  foregroundColor: isOn ? Colors.white : Colors.black,
                ),
                // Shows what the button will do when pressed
                child: Text(
                  isOn ? 'OFF' : 'ON',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
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
