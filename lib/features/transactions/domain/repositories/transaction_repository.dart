import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/params/params.dart';
import '../../../../core/error/failure.dart';
import '../entities/transaction.dart';

abstract class TransactionRepository {
  Future<Either<Failure, Transaction>> createReservation(TemplateParams transactionData);
  Future<Either<Failure, List<Transaction>>> getAllTransactions();
  Future<Either<Failure, Transaction>> getTransactionById(int id);
}