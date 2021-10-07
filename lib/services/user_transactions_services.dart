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
      {File? videoFile,
      File? videoThumbnail,
      http.Client? client}) async {
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
    if (videoFile != null && videoThumbnail != null) {
      ApiReturnValue<String> result = await uploadVideoFile(
          videoFile, videoThumbnail, data['data']['external_id']);
      if (result.videoFile != null) {
        value = value.copyWith(
            videoPath:
                "https://staging.dudu.co.id/storage/" + result.videoFile!);
      }
      if (result.videoThumbnail != null) {
        value = value.copyWith(
            videoThumbnail:
                "https://staging.dudu.co.id/storage/" + result.videoThumbnail!);
      }
    }

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> uploadVideoFile(
      File videoFile, File videoThumbnail, String externalId,
      {http.MultipartRequest? request}) async {
    String url = baseURL + 'user/transaction/upload';
    var uri = Uri.parse(url);

    request ??= http.MultipartRequest("POST", uri)
      ..headers["Content-Type"] = "application/json"
      ..headers["Authorization"] = "Bearer ${User.token}";

    var multipartFile =
        await http.MultipartFile.fromPath('video_file', videoFile.path);
    var multipartThumbnail = await http.MultipartFile.fromPath(
        'video_thumbnail', videoThumbnail.path);

    request.fields.addAll({'external_id': externalId});
    request.files.add(multipartFile);
    request.files.add(multipartThumbnail);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      String videoFile = data['data'][0];
      String videoThumbnail = data['data'][1];

      return ApiReturnValue(
          videoFile: videoFile, videoThumbnail: videoThumbnail);
    } else {
      return ApiReturnValue(message: 'Uploading Profile Picture Failed');
    }
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
