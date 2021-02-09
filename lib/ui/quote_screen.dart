import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
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
    WidgetsBinding.instance
        .addPostFrameCallback((_) => quoteProvider.fetchQuote());
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QuoteProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text("Kanye wisdom", style: titleStyle),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            tooltip: 'Share quote',
            onPressed: () => _handleOnShare(provider.quote.text),
          ),
        ],
      ),
      body: provider.state == QuoteViewState.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _buildQuoteView(provider),
    );
  }

  Widget _buildQuoteView(QuoteProvider provider) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            child: Text("🌊", style: waveStyle),
            onPressed: () => provider.fetchQuote(),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              provider.quote.text,
              textAlign: TextAlign.center,
              style: quoteStyle,
            ),
          ),
        ],
      ),
    );
  }

  void _handleOnShare(String text) {
    Share.share(text, subject: 'Check out this quote!');
  }
}
