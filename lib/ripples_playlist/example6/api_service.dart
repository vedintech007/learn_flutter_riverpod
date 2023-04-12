import 'dart:convert';

import 'package:http/http.dart';
import 'package:riverpod_tutorials/ripples_playlist/example6/user_model.dart';

class ApiService {
  String endpoint = "http://reqres.in/api/users?pages=1";

  Future<List<UserModel>> getUser() async {
    Response response = await get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];

      return result.map(((e) => UserModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
