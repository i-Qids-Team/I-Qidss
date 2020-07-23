import 'dart:convert';
import 'package:http/http.dart' as http;


class AnimalService{
  static final AnimalService _instance = AnimalService._constructor();
  factory AnimalService() {
    return _instance;
  }

  AnimalService._constructor();
  
  static const String baseUrl =
      'https://us-central1-i-qids.cloudfunctions.net/animal';

 Future get(String endpoint) async {
    final response = await http.get('$baseUrl/$endpoint',
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  Future post(String endpoint, {dynamic data}) async {
    final response = await http.post('$baseUrl/$endpoint',
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  Future patch(String endpoint, {dynamic data}) async {
    final response = await http.patch('$baseUrl/$endpoint',
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  Future delete(String endpoint) async {
    final response = await http.delete('$baseUrl/$endpoint',
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

}

