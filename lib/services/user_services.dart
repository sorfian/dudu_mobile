part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client? client}) async {
    client ??= http.Client();

    String url = baseURL + 'login';
    var uri = Uri.parse(url);

    var response = await client.post(uri,
        headers: {"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<bool>> logout({http.Client? client}) async {
    client ??= http.Client();

    String url = baseURL + 'logout';
    var uri = Uri.parse(url);

    var response = await client.post(uri, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${User.token}"
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    bool status = data['data'];
    User.token = "";

    return ApiReturnValue(value: status);
  }

  static Future<ApiReturnValue<User>> signUp(User user, String password,
      {File? pictureFile, http.Client? client}) async {
    client ??= http.Client();

    String url = baseURL + 'register';
    var uri = Uri.parse(url);

    var response = await client.post(uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, dynamic>{
          'name': user.name!,
          'email': user.email!,
          'password': password,
          'password_confirmation': password,
          'phone_number': user.phone_number ?? "",
          'social_media': user.social_media ?? "",
          'socmed_detail': user.socmed_detail ?? "",
          'total_followers': user.total_followers ?? "",
          'description': user.description,
          'is_active': user.is_active,
          'role': user.role,
          'company': user.company,
          'web_linkedin': user.web_linkedin,
          'partner_role': user.partner_role,
          'industry': user.industry,
          'npwp': user.npwp,
          'city': user.city,
          'is_joined': user.is_joined,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    if (pictureFile != null) {
      ApiReturnValue<String> result = await uploadProfilePicture(pictureFile);
      if (result.value != null) {
        value = value.copyWith(
            profile_photo_path:
                "https://staging.dudu.co.id/storage/" + result.value!);
      }
    }

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> uploadProfilePicture(File pictureFile,
      {http.MultipartRequest? request}) async {
    String url = baseURL + 'user/photo';
    var uri = Uri.parse(url);

    request ??= http.MultipartRequest("POST", uri)
      ..headers["Content-Type"] = "application/json"
      ..headers["Authorization"] = "Bearer ${User.token}";

    var multipartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      String imagePath = data['data'][0];

      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: 'Uploading Profile Picture Failed');
    }
  }
}
