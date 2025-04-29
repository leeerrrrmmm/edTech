import 'package:course_ed_tech/domain/entities/CREDIT_CARD_ENTITY/credit_card_entity.dart';
import 'package:course_ed_tech/presentation/bloc/card_bloc/card_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_credit_card/u_credit_card.dart';

class AddCardToPay extends StatefulWidget {
  const AddCardToPay({super.key});

  @override
  State<AddCardToPay> createState() => _AddCardToPayState();
}

class _AddCardToPayState extends State<AddCardToPay> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numController = TextEditingController();
  final TextEditingController _validThruController = TextEditingController();
  final TextEditingController _validFromController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Добавить карту')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            CreditCardUi(
              enableFlipping: true,
              cardHolderFullName: _nameController.text,
              cardNumber: _numController.text,
              validThru: _validThruController.text,
              validFrom: _validFromController.text,
              cvvNumber: _cvvController.text,
            ),
            const SizedBox(height: 20),
            Form(
              key: _globalKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    onChanged:
                        (val) => setState(() {
                          _nameController.text = val;
                        }),
                    validator:
                        (value) =>
                            value == null || value.isEmpty
                                ? 'Введите имя'
                                : null,
                    decoration: InputDecoration(
                      labelText: 'Card Holder Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _numController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                    ],
                    onChanged: (_) => setState(() {}),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите номер';
                      }
                      if (value.length < 13 || value.length > 19) {
                        return 'Номер должен содержать 13–19 цифр';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Card Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          controller: _validFromController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            _DateInputFormatter(),
                          ],
                          onChanged: (_) => setState(() {}),
                          validator:
                              (value) =>
                                  _validateDate(value, label: 'Valid From'),
                          decoration: InputDecoration(
                            labelText: 'Valid From',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: _validThruController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            _DateInputFormatter(),
                          ],
                          onChanged: (_) => setState(() {}),
                          validator:
                              (value) =>
                                  _validateDate(value, label: 'Valid Thru'),
                          decoration: InputDecoration(
                            labelText: 'Valid Thru',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _cvvController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    onChanged: (_) => setState(() {}),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Введите CVV';
                      }
                      if (value.length < 3 || value.length > 4) {
                        return 'CVV должен быть 3–4 цифры';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<CardBloc, CardBlocState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () async {
                          if (_globalKey.currentState?.validate() == true) {
                            final card = CreditCardEntity(
                              id:
                                  DateTime.now()
                                      .millisecondsSinceEpoch, // уникальный ID
                              cardHolderName: _nameController.text,
                              cardNum: _numController.text,
                              validFrom: _validFromController.text,
                              validThro: _validThruController.text,
                              cvv: _cvvController.text,
                            );
                            context.read<CardBloc>().add(AddCreditCard(card));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Карта успешно добавлена!'),
                              ),
                            );
                          }
                        },
                        child: const Text('Сохранить карту'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _validateDate(String? value, {required String label}) {
    if (value == null || value.isEmpty) return 'Введите $label';
    final parts = value.split('/');
    if (parts.length != 2) return '$label должен быть в формате MM/YY';
    final month = int.tryParse(parts[0]);
    final year = int.tryParse(parts[1]);
    if (month == null || month < 1 || month > 12) {
      return 'Неверный месяц в $label';
    }
    if (year == null || year < 0) {
      return 'Неверный год в $label';
    }
    return null;
  }
}

class _DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;
    if (text.length > 2) {
      text = text.substring(0, 2) + '/' + text.substring(2);
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
