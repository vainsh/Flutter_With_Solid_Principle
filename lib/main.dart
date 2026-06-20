import 'package:flutter/material.dart';
import 'package:flutter_with_solid_principle/SRP/login_form.dart';
import 'package:flutter_with_solid_principle/OCP/open_closed_example.dart';
import 'package:flutter_with_solid_principle/LSP/liskov_example.dart';
import 'package:flutter_with_solid_principle/ISP/interface_segregation_example.dart';
import 'package:flutter_with_solid_principle/DIP/dependency_inversion_example.dart';

void main() {
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _open(BuildContext context, Widget page) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => Scaffold(body: SafeArea(child: Padding(padding: const EdgeInsets.all(16.0), child: page)))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter With SOLID Principle')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () => _open(context, const LoginForm()),
            child: const Text('SRP: Login Form'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => _open(context, const OpenClosedExampleView()),
            child: const Text('OCP: Open/Closed Example'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => _open(context, const LSPExampleView()),
            child: const Text('LSP: Liskov Example'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => _open(context, const ISPExampleView()),
            child: const Text('ISP: Interface Segregation Example'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => _open(context, const DIPExampleView()),
            child: const Text('DIP: Dependency Inversion Example'),
          ),
        ],
      ),
    );
  }
}

