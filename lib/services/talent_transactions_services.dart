part of 'services.dart';

class TalentTransactionServices {
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
}
