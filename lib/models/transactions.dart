class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;

  Transaction(
      {required this.id,
      required this.title,
      required this.value,
      required this.date});

  Transaction.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        id = json['id'],
        value = json['value'],
        date = DateTime.parse(json['date']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'value': value,
      'date': date.toIso8601String(),
    };
  }
}
