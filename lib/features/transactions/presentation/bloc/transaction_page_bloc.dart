import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/params/params.dart';
import '../../domain/usecases/create_transaction_usecase.dart';
import 'transaction_page_event.dart';
import 'transaction_page_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final CreateTransactionUsecase createTransactionUsecase;

  TransactionBloc({
    required this.createTransactionUsecase,
  }) : super(TransactionInitial()) {
    on<InitiateTransactionEvent>(_onInitiateTransaction);
  }

  Future<void> _onInitiateTransaction(
    InitiateTransactionEvent event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionLoading());

    final params = TemplateParams(params: {
      'reservation_id': event.reservationId,
      'network': event.network,
      'phone_number': event.phoneNumber,
      'currency': event.currency,
    });

    final result = await createTransactionUsecase(params);

    result.fold(
      (failure) => emit(TransactionError(failure.message)),
      (transaction) => emit(TransactionSuccess(transaction)),
    );
  }
}