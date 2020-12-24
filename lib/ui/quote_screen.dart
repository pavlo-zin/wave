import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:wave/business_logic/service_locator.dart';
import 'package:wave/business_logic/view_models/quote_viewmodel.dart';
import 'package:wave/business_logic/view_state.dart';
import 'package:wave/ui/shared/text_style.dart';

class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  QuoteViewModel quoteViewModel = serviceLocator<QuoteViewModel>();

  @override
  void initState() {
    quoteViewModel.fetchQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuoteViewModel>(
      create: (context) => quoteViewModel,
      child: Consumer<QuoteViewModel>(
          builder: (context, model, child) =>
              quoteViewModel.state == ViewState.Busy
                  ? Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : buildQuoteView(model)),
    );
  }

  Widget buildQuoteView(QuoteViewModel model) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => model.fetchQuote(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "🌊",
                    style: waveStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onLongPress: () => handleQuoteCopy(model),
                  child: Text(
                    model.quote.text,
                    textAlign: TextAlign.center,
                    style: quoteStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      );

  void handleQuoteCopy(QuoteViewModel model) {
    Clipboard.setData(ClipboardData(text: model.quote.text));
    HapticFeedback.lightImpact();
    Fluttertoast.showToast(
        msg: "Copied 😉",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.blue[100],
        textColor: Colors.black87);
  }
}
