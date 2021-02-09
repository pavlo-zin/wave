import 'package:flutter/cupertino.dart';
import 'package:wave/business_logic/models/quote.dart';
import 'package:wave/business_logic/services/api/quotes_service.dart';

enum QuoteViewState {
  loading, error, success
}

class QuoteProvider extends ChangeNotifier {
  QuotesService _quotesService;
  
  Quote quote;
  QuoteViewState state = QuoteViewState.loading;

  set quotesService(QuotesService newQuotesService) {
    _quotesService = newQuotesService;
  }

  Future fetchQuote() async {
    state = QuoteViewState.loading;
    notifyListeners();

    quote = await _quotesService.fetchRandomQuote();
    state = quote == null ? QuoteViewState.error : QuoteViewState.success;
    notifyListeners();
  }
}