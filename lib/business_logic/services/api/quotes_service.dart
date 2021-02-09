import 'package:wave/business_logic/models/quote.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuotesService {
  static const String _base_url = 'https://api.kanye.rest';

  Future<Quote> fetchRandomQuote() async {
    final response = await http.get(_base_url);

    if (response.statusCode == 200) {
      return Quote.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}