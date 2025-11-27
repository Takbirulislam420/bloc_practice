import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:practice_with_bloc/model/post_model.dart';

class PostRepository {
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;

        return body.map((e) {
          return PostModel(
            userId: e['userId'] as int,
            id: e['id'] as int,
            title: e['title'] as String,
            body: e['body'] as String,
          );
        }).toList();
      } else {
        throw HttpException(
          "Server error: ${response.statusCode}",
        );
      }
    }

    // Network error (no internet)
    on SocketException catch (_) {
      throw Exception("No Internet connection");
    }

    // Request timed out
    on TimeoutException catch (_) {
      throw Exception("Request timeout, please try again");
    }

    // Invalid JSON or format error
    on FormatException catch (_) {
      throw Exception("Invalid response format");
    }

    // Other unknown errors
    catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
