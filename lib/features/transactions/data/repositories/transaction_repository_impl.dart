import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/params/params.dart';
import 'package:myapp/features/transactions/domain/entities/transaction.dart';
import '../../../../core/util/api_response_exception.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/remote/transaction_remote_data_source.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource remoteDataSource;

  TransactionRepositoryImpl({required this.remoteDataSource});
  
  @override
  Future<Either<Failure, Transaction>> createReservation(TemplateParams transactionData) async {
    try {
      final response = await remoteDataSource.createReservation(transactionData.params);
      return Right(response);
    } on ApiResponseException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unknown error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Transaction>>> getAllTransactions() async {
    try {
      final response = await remoteDataSource.getAllTransactions();
      return Right(response);
    } catch (e) {
      return Left(ServerFailure('Unknown error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Transaction>> getTransactionById(int id) async {
    try {
      final response = await remoteDataSource.getTransaction(); 
      return Right(response);
    } catch (e) {
      return Left(ServerFailure('Unknown error: ${e.toString()}'));
    }
  }
}