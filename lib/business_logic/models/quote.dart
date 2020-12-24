class Quote {
  String text;

  Quote({this.text});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      text: json['quote'],
    );
  }
}