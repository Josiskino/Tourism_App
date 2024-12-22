
import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';

import '../../../../core/abstract/usescase/usecase.dart';
import '../entities/transaction.dart';
import '../repositories/transaction_repository.dart';

class GetAllTransactionUsecase implements Usecase {
  final TransactionRepository repository;
  GetAllTransactionUsecase({required this.repository});
  @override
  Future<Either<Failure, List<Transaction>>> call(params) {
    return repository.getAllTransactions();
  }
  
}