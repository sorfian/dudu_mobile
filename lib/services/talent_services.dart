part of 'services.dart';

class TalentServices {
  static Future<ApiReturnValue<List<Talent>>> getTalents(
      {http.Client? client}) async {
    // await Future.delayed(const Duration(seconds: 2));

    // return ApiReturnValue(value: mockTalents);
    client ??= http.Client();

    String url = baseURL + 'talent';
    var uri = Uri.parse(url);

    var response = await client.get(uri);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Talent> talents = (data['data']['data'] as Iterable)
        .map((e) => Talent.fromJson(e))
        .toList();

    return ApiReturnValue(value: talents);
  }
}
