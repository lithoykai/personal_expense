import 'package:expenses_project/components/adaptative_date_picker.dart';
import 'package:expenses_project/components/transaction_list.dart';
import 'package:expenses_project/models/transactions.dart';
import 'package:expenses_project/repositories/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'adaptative_textfield.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
    _titleController.clear();
    _valueController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              AdaptativeTextField(
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
                label: 'Título',
              ),
              // TextField(
              //   onSubmitted: (_) => _submitForm(),
              //   controller: _titleController,
              //   decoration: InputDecoration(
              //     label: Text('Título'),
              //   ),
              // ),
              AdaptativeTextField(
                controller: _valueController,
                label: 'Valor (R\$)',
                onSubmitted: (_) => _submitForm(),
                isNumber: true,
              ),
              // TextField(
              //   onSubmitted: (_) => _submitForm(),
              //   controller: _valueController,
              //   decoration: InputDecoration(
              //     label: Text('Valor (R\$)'),
              //   ),
              //   keyboardType: TextInputType.numberWithOptions(decimal: true),
              // ),
              SizedBox(
                height: 10,
              ),

              AdaptativeDatePicker(
                  selectedDate: _selectedDate,
                  onChangeDate: (newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text(
                      'Nova Transação',
                      // style: TextStyle(color: Colors.purple),
                    ),
                    style: ElevatedButton.styleFrom(
                        // primary: Colors.white,
                        ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
