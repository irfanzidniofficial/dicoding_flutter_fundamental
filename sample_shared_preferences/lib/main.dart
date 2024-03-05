import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  static const String counterNumberPrefs = 'counterNumber';
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _saveNumber();
    });
  }

  // Menyimpan data ke shared preferences

  void _saveNumber() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(counterNumberPrefs, _counter);
  }

  // Membaca data dari shared preferences:
  void _loadNumber() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt(counterNumberPrefs) ?? 0;
    });
  }

  // Menghapus data yang ada di shared preferences

  void _resetNumber() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(counterNumberPrefs);
    _loadNumber();
  }

  @override
  void initState() {
    _loadNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Demo"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You have pushed the button this many times:'),
              const SizedBox(
                height: 10,
              ),
              Text(
                "$_counter",
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                ),
              ),
              OutlinedButton(
                onPressed: _resetNumber,
                child: const Text("Reset"),
              ),
            ],
          ),
        ),
        floatingActionButton: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue,
          child: IconButton(
            onPressed: _incrementCounter,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
