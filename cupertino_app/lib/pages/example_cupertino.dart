import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExampleCupertino extends StatefulWidget {
  const ExampleCupertino({super.key});

  @override
  State<ExampleCupertino> createState() => _ExampleCupertinoState();
}

class _ExampleCupertinoState extends State<ExampleCupertino> {
  bool _isSelected = false;
  double _sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adaptif Widget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch.adaptive(
              value: _isSelected,
              onChanged: (value) {
                setState(() {
                  _isSelected = value;
                });
              },
            ),
            Slider.adaptive(
              value: _sliderValue,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            defaultTargetPlatform == TargetPlatform.iOS
                ? const Text("iOS")
                : const Text("Android")
          ],
        ),
      ),
    );
  }
}
