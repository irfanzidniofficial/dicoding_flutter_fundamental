// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dicoding_academy_provider/provider/done_module_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoneModuleList extends StatelessWidget {
  const DoneModuleList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doneModuleList =
        Provider.of<DoneModuleProvider>(context, listen: false).doneModuleList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Done Module List"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(doneModuleList[index]),
          );
        },
        itemCount: doneModuleList.length,
      ),
    );
  }
}
