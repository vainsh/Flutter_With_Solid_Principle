import 'package:flutter/material.dart';

/// Liskov Substitution Principle (LSP) example.
/// Demonstrates a violation and a corrected design.

// Violation: Square inherits from Rectangle and changes behavior of setters
class BadRectangle {
  double width;
  double height;

  BadRectangle(this.width, this.height);

  void setWidth(double w) => width = w;
  void setHeight(double h) => height = h;

  double area() => width * height;
}

class BadSquare extends BadRectangle {
  BadSquare(double size) : super(size, size);

  @override
  void setWidth(double w) {
    width = w;
    height = w;
  }

  @override
  void setHeight(double h) {
    height = h;
    width = h;
  }
}

// Correct design: use Shape abstraction with area(), do not rely on width/height setters
abstract class Shape {
  double area();
}

class Rectangle implements Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  double area() => width * height;
}

class Square implements Shape {
  final double size;

  Square(this.size);

  @override
  double area() => size * size;
}

class LSPExampleView extends StatelessWidget {
  const LSPExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    // Violation example
    final BadRectangle rect = BadRectangle(4, 5);
    final BadRectangle sqAsRect = BadSquare(4);

    rect.setWidth(3);
    // client expects sqAsRect to behave like a rectangle, but setters behave differently
    sqAsRect.setWidth(3); // now both width & height changed -> surprising

    final rectArea = rect.area();
    final badSqArea = sqAsRect.area();

    // Correct example
    final Shape rectangle = Rectangle(3, 5);
    final Shape square = Square(4);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Liskov Substitution Principle (LSP)'),
        const SizedBox(height: 8),
        Text('Bad Rectangle area: \\$rectArea'),
        Text('Bad Square-as-Rectangle area (surprising): \\$badSqArea'),
        const Divider(),
        Text('Rectangle area (correct): \\${rectangle.area()}'),
        Text('Square area (correct): \\${square.area()}'),
        const SizedBox(height: 8),
        const Text('Design note: depend on abstractions (Shape) that preserve expected behavior.'),
      ],
    );
  }
}
