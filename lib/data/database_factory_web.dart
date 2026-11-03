
import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';

Future<Database> openGhostDatabase() async {
  return databaseFactoryWeb.openDatabase('ghostapp.db');
}
