import 'package:flutter/material.dart';

/// Beginner example: Stack vs IndexedStack.
///
/// Stack is useful when multiple widgets should be layered on top of each other.
/// IndexedStack is useful when only one child should be visible at a time while
/// keeping the other children alive in the widget tree.
class StackVsIndexedStackExample extends StatefulWidget {
  const StackVsIndexedStackExample({super.key});

  @override
  State<StackVsIndexedStackExample> createState() =>
      _StackVsIndexedStackExampleState();
}

class _StackVsIndexedStackExampleState
    extends State<StackVsIndexedStackExample> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    _DemoPage(
      icon: Icons.home_outlined,
      title: 'Home',
      description: 'Scroll or enter data here.',
    ),
    _DemoPage(
      icon: Icons.search,
      title: 'Search',
      description: 'This page remains alive when you switch tabs.',
    ),
    _DemoPage(
      icon: Icons.favorite_border,
      title: 'Favorites',
      description: 'Each page keeps its own widget state.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack vs IndexedStack'),
      ),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _pages,
            ),
          ),
          const Divider(height: 1),
          NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() => _selectedIndex = index);
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// A simple Stack example showing how widgets can be layered.
class StackOverlayExample extends StatelessWidget {
  const StackOverlayExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 220,
          width: double.infinity,
          color: Colors.blue.shade100,
          alignment: Alignment.center,
          child: const Text(
            'Background',
            style: TextStyle(fontSize: 24),
          ),
        ),
        const Positioned(
          right: 16,
          top: 16,
          child: CircleAvatar(
            child: Icon(Icons.favorite),
          ),
        ),
        const Positioned(
          left: 16,
          bottom: 16,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Text('Overlay content'),
            ),
          ),
        ),
      ],
    );
  }
}

class _DemoPage extends StatelessWidget {
  const _DemoPage({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 72),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              description,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
