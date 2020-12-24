import 'package:wave/business_logic/models/quote.dart';
import 'package:wave/business_logic/services/api/Api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuotesApi implements Api {
  @override
  Future<Quote> fetchRandomQuote() async {
    final response = await http.get('https://api.kanye.rest');

    if (response.statusCode == 200) {
      return Quote.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load a quote');
    }
  }
}