import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:myapp/features/auth/data/models/user_model.dart';
import 'package:myapp/features/auth/data/models/tourist_model.dart';
import 'package:myapp/features/auth/data/models/agency_model.dart';

part 'auth_remote_data_source.g.dart';

@RestApi(baseUrl: "http://127.0.0.1:8000/api/V1")
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio, {String baseUrl}) = _AuthRemoteDataSource;

  @POST("/register/tourist")
  Future<TouristModel> registerTourist(@Body() Map<String, dynamic> body);

  @POST("/register/agency")
  Future<AgencyModel> registerAgency(@Body() Map<String, dynamic> body);

  @POST("/login")
  Future<UserModel> login(@Body() Map<String, dynamic> body);
}
