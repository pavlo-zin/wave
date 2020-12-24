import 'package:wave/business_logic/models/quote.dart';
import 'package:wave/business_logic/service_locator.dart';
import 'package:wave/business_logic/services/api/Api.dart';
import 'package:wave/business_logic/view_models/base_viewmodel.dart';

import '../view_state.dart';

class QuoteViewModel extends BaseViewModel {
  Api _api = serviceLocator<Api>();

  Quote quote;

  Future fetchQuote() async {
    setState(ViewState.Busy);
    quote = await _api.fetchRandomQuote();
    setState(ViewState.Idle);
  }
}