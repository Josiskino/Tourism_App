abstract class LocalStorageService {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> removeToken();
  Future<void> initializeToken();
}