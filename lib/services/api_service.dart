
import 'package:http/http.dart' as http;
import 'package:persona_flutter/models/persona.dart';

class ApiService {
  final String baseUrl = 'https://persona-compendium.onrender.com/personas/';

  Future<List<Persona>> fetchPersona() async {
    final response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode == 200) {
      return personaFromJson(response.body);
    } else {
      throw Exception('Failed to load personas');
    }
  }
}