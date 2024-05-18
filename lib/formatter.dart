import 'dart:math';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

final currencyFormatter = NumberFormat("#,##,###");

final DateFormat _dateFormatter = DateFormat('dd/MM/yyyy');

String getFormattedDate(DateTime date) {
  return _dateFormatter.format(date);
}

String getFormattedTime(DateTime dateTime) {
  return DateFormat.jm().format(dateTime);
}

String getFormattedCurrency(int amount) {
  return currencyFormatter.format(amount);
}

String undoFormatting(String value) {
  return value.replaceAll(',', '');
}

class IntegerFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final oldReturnValue = TextEditingValue(
      text: oldValue.text,
      selection: TextSelection.collapsed(offset: oldValue.text.length),
    );

    final newValueText = newValue.text.replaceAll(',', '');

    if (newValueText.isEmpty) return newValue;

    if ((newValue.text.isNotEmpty && int.tryParse(newValueText) == null)) {
      return oldReturnValue;
    }

    final String formatted = currencyFormatter.format(int.parse(newValueText));
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class DoubleFormatter extends TextInputFormatter {
  final double? max;

  const DoubleFormatter({this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == oldValue.text) return oldValue;

    if (newValue.text.isEmpty) return newValue;

    if (newValue.text == '.') {
      return TextEditingValue(
        text: "0${newValue.text}",
        selection: const TextSelection.collapsed(offset: 2),
      );
    }

    bool hasMultiplePeriods =
        RegExp(r'\.').allMatches(newValue.text).length > 1;

    if (hasMultiplePeriods) {
      return _formatMultipleCommas(newValue, oldValue);
    }

    final commaRemovedNewValue = newValue.text.replaceAll(',', '');

    if (max != null &&
        double.tryParse(newValue.text) != null &&
        max! < double.parse(newValue.text)) {
      return oldValue;
    }

    if (!commaRemovedNewValue.endsWith('.') &&
        double.tryParse(commaRemovedNewValue) == null) return oldValue;

    if (commaRemovedNewValue.contains('.')) {
      return _formatDouble(newValue, oldValue);
    }

    return _formatInt(newValue, oldValue);
  }

  TextEditingValue _formatMultipleCommas(
    TextEditingValue newValue,
    TextEditingValue oldValue,
  ) {
    final oldPointIndex = oldValue.text.indexOf('.');
    final newPointFirstIndex = newValue.text.indexOf('.');

    int indexToBeRemoved = newPointFirstIndex;
    if (newPointFirstIndex != oldPointIndex) {
      indexToBeRemoved = newValue.text.lastIndexOf('.');
    }

    final newString =
        '${newValue.text.substring(0, indexToBeRemoved)}${newValue.text.substring(indexToBeRemoved + 1)}';

    final newPointIndex = newString.indexOf('.');

    final integerPart = newString.substring(0, newPointIndex);
    final decimalPart = newString.substring(newPointIndex + 1);
    String resultIntegerPart = integerPart;
    String resultDecimalPart = decimalPart;

    if (integerPart != "") {
      resultIntegerPart = currencyFormatter.format(int.parse(integerPart));
    } else {
      resultIntegerPart = "0";
    }
    if (decimalPart != "") {
      resultDecimalPart = int.parse(decimalPart).toString();
    }

    return TextEditingValue(
      text: '$resultIntegerPart.$resultDecimalPart',
      selection: TextSelection.collapsed(offset: resultIntegerPart.length + 1),
    );
  }

  TextEditingValue _formatInt(
    TextEditingValue newValue,
    TextEditingValue oldValue,
  ) {
    final cursorPosition = newValue.selection.baseOffset;
    final formattedResult =
        currencyFormatter.format(double.tryParse(newValue.text));

    bool isAddedToEnd = cursorPosition == newValue.text.length;

    final decimalPointRemoved =
        !newValue.text.contains('.') && oldValue.text.contains('.');

    if (newValue.text.startsWith('0') &&
        newValue.text.length > 1 &&
        oldValue.text != '0' &&
        !decimalPointRemoved) {
      return oldValue;
    }

    if (decimalPointRemoved && newValue.text.startsWith('0')) {
      return TextEditingValue(
        text: formattedResult,
        selection: const TextSelection.collapsed(offset: 1),
      );
    }

    String newValueFromStartToEdited = isAddedToEnd || decimalPointRemoved
        ? newValue.text
        : newValue.text.substring(0, cursorPosition);
    final resultValueFromStartToEdited = isAddedToEnd || decimalPointRemoved
        ? formattedResult
        : formattedResult.substring(0, cursorPosition);

    final newValueNumCommas = newValueFromStartToEdited.split(',').length - 1;
    final resultNumCommas = resultValueFromStartToEdited.split(',').length - 1;

    final adjustmentOffset = resultNumCommas - newValueNumCommas;

    return newValue.copyWith(
      text: formattedResult,
      selection: TextSelection.collapsed(
          offset:
              min(cursorPosition, formattedResult.length) + adjustmentOffset),
    );
  }

  TextEditingValue _formatDouble(
    TextEditingValue newValue,
    TextEditingValue oldValue,
  ) {
    final cursorPosition = newValue.selection.baseOffset;
    final indexOfPoint = newValue.text.indexOf('.');

    final decimalPointAdded =
        newValue.text.contains('.') && !oldValue.text.contains('.');

    final integerPart = newValue.text.substring(0, indexOfPoint);
    final fractionPart = newValue.text.substring(indexOfPoint + 1);

    if (integerPart == "" && oldValue.text.contains('.')) {
      return newValue;
    }

    if ((int.tryParse(integerPart) == null) ||
        (fractionPart != '' && int.tryParse(fractionPart) == null)) {
      return oldValue;
    }

    if (cursorPosition > indexOfPoint && !decimalPointAdded) {
      final result = currencyFormatter.format(int.parse(integerPart));
      final resultCommaCount = result.split(',').length - 1;
      return newValue.copyWith(
        text: '$result.$fractionPart',
        selection: TextSelection.collapsed(
          offset: newValue.selection.baseOffset + resultCommaCount,
        ),
      );
    }

    if (newValue.text.startsWith('0') &&
        newValue.text.length > 1 &&
        oldValue.text != "0" &&
        integerPart != "0" &&
        cursorPosition == 1) {
      return oldValue;
    }

    final isAddedToIntegetPartEnd = cursorPosition == integerPart.length;

    final formattedResult = currencyFormatter.format(int.parse(integerPart));

    if (decimalPointAdded) {
      return TextEditingValue(
        text: '$formattedResult.$fractionPart',
        selection: TextSelection.collapsed(offset: formattedResult.length + 1),
      );
    }

    String newValueFromStartToEdited = isAddedToIntegetPartEnd
        ? integerPart
        : integerPart.substring(0, min(cursorPosition, integerPart.length));
    String resultValueFromStartToEnd = isAddedToIntegetPartEnd
        ? formattedResult
        : formattedResult.substring(
            0, min(cursorPosition, formattedResult.length));

    final newValueNumCommas = newValueFromStartToEdited.split(',').length - 1;
    final resultNumCommas = resultValueFromStartToEnd.split(',').length - 1;

    final adjustmentOffset = resultNumCommas - newValueNumCommas;

    return TextEditingValue(
      text: '$formattedResult.$fractionPart',
      selection: TextSelection.collapsed(
          offset:
              min(cursorPosition, formattedResult.length) + adjustmentOffset),
    );
  }
}
