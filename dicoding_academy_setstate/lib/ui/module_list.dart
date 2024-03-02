import 'package:flutter/material.dart';

class ModuleList extends StatefulWidget {
  final List<String> doneModuleList;
  const ModuleList({super.key, required this.doneModuleList});

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



  // final List<String> _doneModuleList = const [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _moduleList.length,
      itemBuilder: (context, index) {
        return ModuleTile(
          modulName: _moduleList[index],
          isDone: widget.doneModuleList.contains(
            _moduleList[index],
          ),
          onClik: () {
            setState(() {
              widget.doneModuleList.add(_moduleList[index]);
            });
          },
        );
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
