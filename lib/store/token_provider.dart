import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenNotifier extends StateNotifier<String?> {
  TokenNotifier() : super(null) {
    _init();
  }

  final _storage = const FlutterSecureStorage();
  static const _tokenKey = 'auth_token';

  Future<void> _init() async {
    state = await _storage.read(key: _tokenKey);
  }

  Future<void> setToken(String token) async {
    state = token;
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<void> removeToken() async {
    state = null;
    await _storage.delete(key: _tokenKey);
  }
}

final tokenProvider = StateNotifierProvider<TokenNotifier, String?>((ref) {
  return TokenNotifier();
});
