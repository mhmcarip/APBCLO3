import 'dart:convert';
import 'package:http/http.dart' as http;


Future<dynamic> fetchCocktail(String id) async {
  final response = await http.get(
    Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id'),
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    print("response data api : $jsonResponse['drinks']");
    return jsonResponse['drinks'][0];
  } else {
    throw Exception('Failed to load cocktail');
  }
}
