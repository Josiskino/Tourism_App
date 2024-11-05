import 'package:myapp/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {

  Future<String> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> loginInWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabase;

  AuthRemoteDataSourceImpl({required this.supabase});

  @override
  Future<String> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signUp(
        email: email, 
        password: password, 
        data: {
          'name': name,
        }
      );
      
      if (response.user == null) {
        throw const ServerException(message: 'User is null!');
      }

      return response.user!.id;

    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<String> loginInWithEmailAndPassword({
    required String email,
    required String password,
  }){
    throw UnimplementedError();
  }
}