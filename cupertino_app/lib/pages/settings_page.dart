import 'package:flutter/cupertino.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Settings Page"),
      ),
      child: Center(
        child: CupertinoButton(
          child: const Text("Logout"),
          onPressed: () {
            showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text("Are you sure log ou?"),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text("No"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoDialogAction(
                        child: const Text("Yes"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
