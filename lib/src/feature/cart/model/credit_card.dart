import 'package:flutter/material.dart';
import 'package:sizzle_starter/src/core/widget/icons/ecommerce_icons.dart';

class CreditCard {
  final String cardNumber;
  final String expiryDate;
  final String cvv;

  CreditCard({
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
  });

  String get obscuredCardNumber {
    final lastFourDigits = cardNumber.substring(cardNumber.length - 4);
    return '**** **** **** $lastFourDigits';
  }

  bool get isMaster => cardNumber.startsWith('5') || cardNumber.startsWith('2');
  bool get isVisa => cardNumber.startsWith('4');

  IconData get cardIcon {
    if (isMaster) return EcommerceIcons.ri_mastercard_fill;
    if (isVisa) return EcommerceIcons.bxl_visa;
    return Icons.credit_card;
  }

}
