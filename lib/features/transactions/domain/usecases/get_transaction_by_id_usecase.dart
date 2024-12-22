
import 'package:fpdart/fpdart.dart';
import 'package:myapp/core/error/failure.dart';

import '../../../../core/abstract/usescase/usecase.dart';
import '../entities/transaction.dart';
import '../repositories/transaction_repository.dart';

class GetTransactionByIdUsecase implements Usecase {
  final TransactionRepository repository;
  GetTransactionByIdUsecase({required this.repository});
  
  @override
  Future<Either<Failure, Transaction>> call(params) {
    return repository.getTransactionById(params);
  }
  
}