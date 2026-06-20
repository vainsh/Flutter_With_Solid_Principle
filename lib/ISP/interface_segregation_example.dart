import 'package:flutter/material.dart';

/// Interface Segregation Principle (ISP) example.
/// Split large interfaces into focused ones so clients only depend on what they use.

class Document {
  final String content;
  Document(this.content);
}

abstract class Printer {
  void printDocument(Document doc);
}

abstract class Scanner {
  Document scan();
}

abstract class Fax {
  void fax(Document doc);
}

// A simple printer that only implements printing
class SimplePrinter implements Printer {
  @override
  void printDocument(Document doc) {
    // printing logic
    // pretend to print
  }
}

// A multi-function device implements multiple small interfaces
class MultiFunctionPrinter implements Printer, Scanner, Fax {
  @override
  void fax(Document doc) {
    // fax logic
  }

  @override
  Document scan() {
    // scan logic
    return Document('scanned content');
  }

  @override
  void printDocument(Document doc) {
    // print logic
  }
}

class ISPExampleView extends StatelessWidget {
  const ISPExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    final Document doc = Document('Hello ISP');
    final Printer printer = SimplePrinter();
    final MultiFunctionPrinter mfp = MultiFunctionPrinter();

    // Clients that only need printing depend on Printer, not on scanner/fax methods.
    printer.printDocument(doc);
    mfp.printDocument(doc);
    final scanned = mfp.scan();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Interface Segregation Principle (ISP)'),
        const SizedBox(height: 8),
        Text('Printed document content: \\${doc.content}'),
        Text('Scanned document content: \\${scanned.content}'),
        const SizedBox(height: 8),
        const Text('Design note: prefer many small interfaces over a large "fat" interface.'),
      ],
    );
  }
}
