import 'package:dicoding_academy_provider/provider/done_module_provider.dart';
import 'package:dicoding_academy_provider/ui/module_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DoneModuleProvider(),
      child: const MaterialApp(
        home: ModulePage(),
      ),
    );
  }
}
