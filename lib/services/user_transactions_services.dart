part of 'services.dart';

class UserTransactionServices {
  static Future<ApiReturnValue<List<UserTransaction>>> getTransactions(
      {http.Client? client}) async {
    client ??= http.Client();

    String url = baseURL + 'user/transaction/?limit=1000';
    var uri = Uri.parse(url);

    var response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${User.token}"
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<UserTransaction> transactions = (data['data']['data'] as Iterable)
        .map((e) => UserTransaction.fromJson(e))
        .toList();

    return ApiReturnValue(value: transactions);
  }

  static Future<ApiReturnValue<UserTransaction>> submitTransaction(
      UserTransaction userTransaction,
      {http.Client? client}) async {
    client ??= http.Client();

    String url = baseURL + 'checkout';
    var uri = Uri.parse(url);

    var response = await client.post(uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${User.token}"
        },
        body: jsonEncode(<String, dynamic>{
          'talent_id': userTransaction.talent_id!.id,
          'user_id': userTransaction.user!.id,
          "total": userTransaction.total,
          "status": "PENDING",
          "name": userTransaction.name,
          "moment": userTransaction.moment,
          "occasion": userTransaction.occasion,
          "instruction": userTransaction.instruction,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    UserTransaction value = UserTransaction.fromJson(data['data']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<TransactionTalentDetails>>>
      getTransactionTalentDetails({http.Client? client}) async {
    client ??= http.Client();

    String url = baseURL + 'user/transaction/?limit=1000';
    var uri = Uri.parse(url);

    var response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${User.token}"
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<TransactionTalentDetails> transactions =
        (data['data']['data'] as Iterable)
            .map((e) => TransactionTalentDetails.fromJson(e))
            .toList();

    return ApiReturnValue(value: transactions);
  }
}
