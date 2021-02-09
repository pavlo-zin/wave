import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:wave/business_logic/view_models/quote_provider.dart';
import 'package:wave/ui/common/text_style.dart';

class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  void initState() {
    super.initState();
    final quoteProvider = context.read<QuoteProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) => quoteProvider.fetchQuote());
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QuoteProvider>();

    if (provider.state == QuoteViewState.loading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (provider.state == QuoteViewState.success) {
      return buildQuoteView(provider);
    } else {
      return Scaffold(
        body: Center(
          child: Text("Error occurred when retrieving the quote"),
        ),
      );
    }
  }

  Widget buildQuoteView(QuoteProvider provider) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => provider.fetchQuote(),
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
                onLongPress: () => _handleQuoteCopy(provider.quote.text),
                child: Text(
                  provider.quote.text,
                  textAlign: TextAlign.center,
                  style: quoteStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleQuoteCopy(String text) {
    Clipboard.setData(ClipboardData(text: text));
    HapticFeedback.lightImpact();
    Fluttertoast.showToast(
        msg: "Copied 😉",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.blue[50],
        textColor: Colors.black87);
  }
}
