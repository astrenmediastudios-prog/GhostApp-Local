
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

import 'package:sembast/sembast.dart';

Future<Database> openGhostDatabase() async {
  final directory = await getApplicationDocumentsDirectory();

  final databasePath = join(directory.path, 'ghostapp.db');

  return databaseFactoryIo.openDatabase(databasePath);
}
