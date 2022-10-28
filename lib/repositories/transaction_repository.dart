import 'dart:convert';

import 'package:expenses_project/models/transactions.dart';
import 'package:shared_preferences/shared_preferences.dart';

const keyTrans = 'transaction_list';

class TransactionRepository {
  late SharedPreferences sharedPreferences;

  Future<List<Transaction>> getTransaction() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(keyTrans) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Transaction.fromJson(e)).toList();
  }

  void saveTransaction(List<Transaction> transaction) {
    final jsonString = json.encode(transaction);
    sharedPreferences.setString(keyTrans, jsonString);
  }
}
