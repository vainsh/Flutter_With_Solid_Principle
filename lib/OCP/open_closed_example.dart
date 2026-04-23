import 'package:flutter/material.dart';

/// Open-Closed Principle (OCP):
/// - Open for extension: add new discount types by creating new classes.
/// - Closed for modification: [CheckoutService] does not change for new discounts.
abstract class DiscountRule {
  double apply(double price);
}

class NoDiscount implements DiscountRule {
  @override
  double apply(double price) => price;
}

class PercentageDiscount implements DiscountRule {
  final double percentage;

  PercentageDiscount(this.percentage);

  @override
  double apply(double price) => price - (price * percentage / 100);
}

class FlatDiscount implements DiscountRule {
  final double amount;

  FlatDiscount(this.amount);

  @override
  double apply(double price) => (price - amount).clamp(0, double.infinity);
}

class CheckoutService {
  double calculateFinalPrice({
    required double basePrice,
    required DiscountRule discountRule,
  }) {
    return discountRule.apply(basePrice);
  }
}

/// Minimal Flutter widget showing usage.
class OpenClosedExampleView extends StatelessWidget {
  const OpenClosedExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    const basePrice = 100.0;
    final checkoutService = CheckoutService();

    final noDiscount = checkoutService.calculateFinalPrice(
      basePrice: basePrice,
      discountRule: NoDiscount(),
    );

    final tenPercentDiscount = checkoutService.calculateFinalPrice(
      basePrice: basePrice,
      discountRule: PercentageDiscount(10),
    );

    final flatDiscount = checkoutService.calculateFinalPrice(
      basePrice: basePrice,
      discountRule: FlatDiscount(25),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Open-Closed Principle Example'),
        Text('Base price: \\$${basePrice.toStringAsFixed(2)}'),
        Text('No discount: \\$${noDiscount.toStringAsFixed(2)}'),
        Text('10% discount: \\$${tenPercentDiscount.toStringAsFixed(2)}'),
        Text('Flat \\$25 discount: \\$${flatDiscount.toStringAsFixed(2)}'),
      ],
    );
  }
}
