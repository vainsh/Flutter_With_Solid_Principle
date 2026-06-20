# Flutter With SOLID Principle — Examples

This repository contains a small Flutter app demonstrating SOLID design principles with minimal examples.

Included principles and files

- Single Responsibility Principle (SRP)
  - lib/SRP/single_responsibility_principle.dart
  - Shows a LoginForm where widget/view and controller responsibilities are separated.

- Open/Closed Principle (OCP)
  - lib/OCP/open_closed_example.dart
  - Demonstrates adding discount strategies (NoDiscount, PercentageDiscount, FlatDiscount) without modifying CheckoutService.

- Liskov Substitution Principle (LSP)
  - lib/LSP/liskov_example.dart
  - Shows a violating design (BadSquare extends BadRectangle) and a corrected design using a Shape abstraction.

- Interface Segregation Principle (ISP)
  - lib/ISP/interface_segregation_example.dart
  - Splits a fat device interface into Printer, Scanner, and Fax interfaces with a SimplePrinter and MultiFunctionPrinter.

- Dependency Inversion Principle (DIP)
  - lib/DIP/dependency_inversion_example.dart
  - ReportService depends on ReportRepository abstraction; Local and Cloud repositories implement it.

Running the app

1. Ensure Flutter is installed: https://flutter.dev/docs/get-started/install
2. From repository root run:

   flutter pub get
   flutter run

3. The app launches to a home menu (added in lib/main.dart). Use the buttons to open each SOLID example screen.

Notes

- Examples are intentionally minimal and educational — they prioritise clarity over production concerns.
- Feel free to extend examples (e.g., add tests, show failing LSP test case, or wire real persistence for DIP).

License / Authors

- Author: (your name)
- Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
