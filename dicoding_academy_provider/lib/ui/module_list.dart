import 'package:dicoding_academy_provider/provider/done_module_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModuleList extends StatefulWidget {
  const ModuleList({super.key});

  @override
  State<ModuleList> createState() => _ModuleListState();
}

class _ModuleListState extends State<ModuleList> {
  final List<String> _moduleList = const [
    "Modul 1 - Pengenalan Dart",
    "Modul 2 - Program Dart Pertamamu",
    "Modul 3 - Dart Fundamantal",
    "Modul 4 - Control Flow",
    "Modul 5 - Collections",
    "Modul 6 - Object Oriented Programming",
    'Modul 7 - Functional Styles',
    'Modul 8 - Dart Type System',
    'Modul 9 - Dart Futures',
    'Modul 10 - Effective Dart',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _moduleList.length,
      itemBuilder: (context, index) {
        return Consumer<DoneModuleProvider>(
            builder: (contex, DoneModuleProvider data, widget) {
          return ModuleTile(
            modulName: _moduleList[index],
            isDone: data.doneModuleList.contains(
              _moduleList[index],
            ),
            onClik: () {
              data.complete(_moduleList[index]);
            },
          );
        });
      },
    );
  }
}

class ModuleTile extends StatelessWidget {
  final String modulName;
  final bool isDone;
  final Function() onClik;
  const ModuleTile(
      {super.key,
      required this.modulName,
      required this.isDone,
      required this.onClik});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(modulName),
      trailing: isDone
          ? const Icon(
              Icons.done,
            )
          : ElevatedButton(
              onPressed: onClik,
              child: const Text("Done"),
            ),
    );
  }
}
