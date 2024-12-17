// lib/core/services/local_storage_service_impl.dart
import 'package:shared_preferences/shared_preferences.dart';

import '../abstract/local_storage/local_storage_service.dart';
import '../services/api_client.dart'; 

class LocalStorageServiceImpl implements LocalStorageService {
  static const String _tokenKey = 'auth_token';
  final ApiClient _apiClient;

  LocalStorageServiceImpl(this._apiClient);

  @override
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    
    // Définir le token dans l'ApiClient
    _apiClient.setAuthToken(token);
  }

  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  @override
  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    
    // Effacer le token dans l'ApiClient
    _apiClient.clearAuthToken();
  }
  
  @override
  Future<void> initializeToken() async {
    final token = await getToken();
    if (token != null) {
      _apiClient.setAuthToken(token);
    }
  }
  
}