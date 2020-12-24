import 'package:wave/business_logic/models/quote.dart';

abstract class Api {
  Future<Quote> fetchRandomQuote();
}