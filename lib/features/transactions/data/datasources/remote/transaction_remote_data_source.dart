import '../../../../../core/services/api_client.dart';
import '../../../../../core/util/api_response_exception.dart';
import '../../models/transaction_model.dart';

class TransactionRemoteDataSource {
  final ApiClient apiClient;
  TransactionRemoteDataSource({required this.apiClient});

  Future<TransactionModel> getTransaction() async {
    try {
      final response = await apiClient.getRequest(
        path: "transactions/specific_transaction", 
      );

      if (response.statusCode == 200) {
        return TransactionModel.fromJson(response.data);
      } else {
        throw ApiResponseException(
          message: response.data['message'] ?? 'Échec de récupération de la transaction',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> getAllTransactions() async {
    try {
      final response = await apiClient.getRequest(
        path: "transactions",
      );

      if (response.statusCode == 200) {
        final List<dynamic> transactionsData = response.data['data'];
        final List<TransactionModel> transactions = transactionsData
            .map((transactionJson) => TransactionModel.fromJson(transactionJson))
            .toList();
        return transactions;
      } else {
        throw ApiResponseException(
          message: response.data['message'] ?? 'Échec de récupération des transactions',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<TransactionModel> initTransaction(Map<String, dynamic> transactionData) async {
    try {
      final response = await apiClient.postRequest(
        path: "payments/initiate", 
        data: transactionData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TransactionModel.fromJson(response.data);
      } else {
        throw ApiResponseException(
          message: response.data['message'] ?? 'Échec de création de la transaction',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}