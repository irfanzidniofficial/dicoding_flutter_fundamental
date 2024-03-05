import 'package:flutter/foundation.dart';

import 'package:local_db_starter/note.dart';

class DbProvider extends ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get notes => _notes;
}
