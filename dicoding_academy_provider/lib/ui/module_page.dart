import 'package:dicoding_academy_provider/ui/done_module_list.dart';
import 'package:dicoding_academy_provider/ui/module_list.dart';
import 'package:flutter/material.dart';

class ModulePage extends StatefulWidget {
  const ModulePage({super.key});

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  final List<String> doneModuleList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pemprograman Dart"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DoneModuleList();
              }));
            },
            icon: const Icon(
              Icons.done,
            ),
          ),
        ],
      ),
      body: const ModuleList(),
    );
  }
}
