import 'package:flutter/foundation.dart';

@immutable
class Quote {
  final String text;

  Quote({this.text});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      text: json['quote'],
    );
  }
}