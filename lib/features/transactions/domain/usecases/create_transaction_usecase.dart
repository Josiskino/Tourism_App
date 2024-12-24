
import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';

import '../../../../core/abstract/usescase/usecase.dart';
import '../entities/transaction.dart';
import '../repositories/transaction_repository.dart';

class CreateTransactionUsecase implements Usecase {
  final TransactionRepository repository;
  CreateTransactionUsecase({required this.repository});

  @override
  Future<Either<Failure, Transaction>> call(params) {
    return repository.createTransaction(params);
  }

}