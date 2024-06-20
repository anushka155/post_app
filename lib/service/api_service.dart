import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../model/post_model.dart';

class ApiService {
  var baseUrl = "https://jsonplaceholder.typicode.com/";
  var post = "posts";
  Future<List<Post>?> getPost() async {
    try {
      var url = Uri.parse(baseUrl + post);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var decodeResponse = jsonDecode(response.body);
        List<Post> posts = postFromJson(jsonEncode(decodeResponse));
        log(posts.first.title);
        return posts;
      }
      return [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  getComment(String s) {}
}
