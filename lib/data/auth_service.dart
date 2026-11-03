
import 'package:bcrypt/bcrypt.dart';
import 'package:sembast/sembast.dart';

class LocalAuthService {
  LocalAuthService(this.database);

  final Database database;

  final StoreRef<String, Map<String, Object?>> _accounts =
      stringMapStoreFactory.store('accounts');

  Future<bool> register(String email, String password) async {
    final normalizedEmail = email.trim().toLowerCase();

    final existing = await _accounts.record(normalizedEmail).get(database);

    if (existing != null) {
      return false;
    }

    final passwordHash = BCrypt.hashpw(
      password,
      BCrypt.gensalt(),
    );

    await _accounts.record(normalizedEmail).put(database, {
      'email': normalizedEmail,
      'passwordHash': passwordHash,
      'createdAt': DateTime.now().toIso8601String(),
    });

    return true;
  }

  Future<bool> signIn(String email, String password) async {
    final normalizedEmail = email.trim().toLowerCase();

    final account = await _accounts.record(normalizedEmail).get(database);

    if (account == null) {
      return false;
    }

    final passwordHash = account['passwordHash'] as String;

    return BCrypt.checkpw(password, passwordHash);
  }
}
