import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wave/business_logic/services/api/quotes_service.dart';
import 'package:wave/business_logic/view_models/quote_provider.dart';

import 'ui//quote_screen.dart';

void main() => runApp(WaveApp());

class WaveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => QuotesService()),
        ChangeNotifierProxyProvider<QuotesService, QuoteProvider>(
          create: (context) => QuoteProvider(),
          update: (context, quotesService, quoteProvider) {
            quoteProvider.quotesService = quotesService;
            return quoteProvider;
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: QuoteScreen(),
      ),
    );
  }
}
