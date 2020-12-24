import 'package:wave/business_logic/models/quote.dart';
import 'package:wave/business_logic/services/api/Api.dart';

class QuotesFakeApi implements Api {
  @override
  Future<Quote> fetchRandomQuote() async {
    return Quote(text: "So many of us need so much less than we have especially when so many of us are in need");
  }
}