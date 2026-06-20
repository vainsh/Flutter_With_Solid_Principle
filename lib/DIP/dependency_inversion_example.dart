import 'package:flutter/material.dart';

/// Dependency Inversion Principle (DIP) example.
/// High-level modules should depend on abstractions, not concretions.

class Report {
  final String title;
  final String body;
  Report(this.title, this.body);
}

abstract class ReportRepository {
  Future<void> save(Report report);
}

class LocalReportRepository implements ReportRepository {
  @override
  Future<void> save(Report report) async {
    // simulate saving to local storage
    await Future.delayed(const Duration(milliseconds: 10));
  }
}

class CloudReportRepository implements ReportRepository {
  @override
  Future<void> save(Report report) async {
    // simulate uploading to cloud
    await Future.delayed(const Duration(milliseconds: 10));
  }
}

class ReportService {
  final ReportRepository repository;
  ReportService(this.repository);

  Future<void> createReport(String title, String body) async {
    final r = Report(title, body);
    await repository.save(r);
  }
}

class DIPExampleView extends StatefulWidget {
  const DIPExampleView({super.key});

  @override
  State<DIPExampleView> createState() => _DIPExampleViewState();
}

class _DIPExampleViewState extends State<DIPExampleView> {
  String status = 'idle';

  Future<void> _saveWithRepository(ReportRepository repo) async {
    setState(() => status = 'saving...');
    final service = ReportService(repo);
    await service.createReport('My Report', 'Body content');
    setState(() => status = 'saved using ${repo.runtimeType}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Dependency Inversion Principle (DIP)'),
        const SizedBox(height: 8),
        Text('Status: \\$status'),
        const SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton(
              onPressed: () => _saveWithRepository(LocalReportRepository()),
              child: const Text('Save Locally'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => _saveWithRepository(CloudReportRepository()),
              child: const Text('Save to Cloud'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text('Design note: high-level ReportService depends on ReportRepository abstraction.'),
      ],
    );
  }
}
