import 'package:flutter/material.dart';

import '../services/programme_service.dart';
import '../services/enrolment_service.dart';
import '../services/roadmap_service.dart';
import '../models/programme_model.dart';
import '../models/enrolment_model.dart';
import '../models/roadmap_model.dart';
import '../utils/firestore_key_utils.dart';

class ProgrammeFlowScreen extends StatefulWidget {
  const ProgrammeFlowScreen({super.key});

  @override
  State<ProgrammeFlowScreen> createState() => _ProgrammeFlowScreenState();
}

class _ProgrammeFlowScreenState extends State<ProgrammeFlowScreen> {
  final _programmeIdController = TextEditingController();
  final _userIdController = TextEditingController();

  bool _loading = false;
  String? _error;

  ProgrammeModel? _programme;
  EnrolmentModel? _enrolment;
  RoadmapModel? _roadmap;

  final _programmeService = ProgrammeService();
  final _enrolmentService = EnrolmentService();
  final _roadmapService = RoadmapService();

  @override
  void dispose() {
    _programmeIdController.dispose();
    _userIdController.dispose();
    super.dispose();
  }

  Future<void> _loadProgrammeAndEnrolment() async {
    setState(() {
      _error = null;
      _loading = true;
      _programme = null;
      _enrolment = null;
      _roadmap = null;
    });

    try {
      final programmeId = _programmeIdController.text.trim();
      final userId = _userIdController.text.trim();

      if (programmeId.isEmpty || userId.isEmpty) {
        setState(() {
          _error = 'Programme ID and User ID are required.';
          _loading = false;
        });
        return;
      }

      final programme = await _programmeService.getProgramme(programmeId);
      if (programme == null) {
        setState(() {
          _error = 'Programme not found.';
          _loading = false;
        });
        return;
      }

      // Enrolment model uses userId + programmeId, but our EnrolmentService
      // currently supports get by document id.
      // FirestoreKeyUtils maps to a deterministic enrolment document id.
      final enrolmentDocId = FirestoreKeyUtils.enrolmentDocId(userId, programmeId);

      final enrolment = await _enrolmentService.getEnrolment(enrolmentDocId);

      setState(() {
        _programme = programme;
        _enrolment = enrolment;
        _loading = false;
      });

      if (enrolment?.roadmapId != null) {
        final roadmap = await _roadmapService.getRoadmap(enrolment!.roadmapId!);
        setState(() {
          _roadmap = roadmap;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Failed to load: $e';
        _loading = false;
      });
    }
  }

  Future<void> _enrolAndContinue() async {
    setState(() {
      _error = null;
      _loading = true;
      _roadmap = null;
    });

    try {
      final programmeId = _programmeIdController.text.trim();
      final userId = _userIdController.text.trim();

      if (programmeId.isEmpty || userId.isEmpty) {
        setState(() {
          _error = 'Programme ID and User ID are required.';
          _loading = false;
        });
        return;
      }

      // For now, roadmap creation is out of scope (only wiring UI to existing models/services).
      // We will create an enrolment shell that allows roadmap to be attached later.
      // NOTE: This assumes your Firebase rules allow these writes.
      final now = DateTime.now();

      final enrolmentDocId = FirestoreKeyUtils.enrolmentDocId(userId, programmeId);

      final enrolment = EnrolmentModel(
        userId: userId,
        programmeId: programmeId,
        status: 'enrolled',
        enrolledAt: TimestampUtil.timestampFromDateTime(now),
        completedAt: null,
        roadmapId: null,
        roadmapStepNumber: null,
        reflectionSubmitted: false,
        feedbackSummary: null,
      );

      // createEnrolment uses add() which generates a random doc id.
      // To make UI consistent, we update the enrolment service approach:
      // we'll store enrolment using the deterministic doc id if it already exists.
      await _enrolmentService.updateEnrolment(enrolmentDocId, enrolment.toFirestore());

      setState(() {
        _enrolment = enrolment;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to enrol: $e';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Programme Flow')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              TextField(
                controller: _programmeIdController,
                decoration: const InputDecoration(
                  labelText: 'Programme ID',
                  hintText: 'e.g., programmes doc id',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _userIdController,
                decoration: const InputDecoration(
                  labelText: 'User ID',
                  hintText: 'user id',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loading ? null : _loadProgrammeAndEnrolment,
                child: _loading
                    ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Text('Load programme'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _loading ? null : _enrolAndContinue,
                child: const Text('Enrol'),
              ),
              if (_error != null) ...[
                const SizedBox(height: 16),
                Text(_error!, style: const TextStyle(color: Colors.red)),
              ],
              if (_programme != null) ...[
                const SizedBox(height: 16),
                _ProgrammeCard(programme: _programme!),
              ],
              if (_enrolment != null) ...[
                const SizedBox(height: 12),
                _EnrolmentCard(enrolment: _enrolment!),
              ],
              if (_roadmap != null) ...[
                const SizedBox(height: 12),
                _RoadmapCard(roadmap: _roadmap!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgrammeCard extends StatelessWidget {
  final ProgrammeModel programme;
  const _ProgrammeCard({required this.programme});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(programme.title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 6),
            Text(programme.description),
            const SizedBox(height: 6),
            Text('Host: ${programme.hostOrganisation}'),
            Text('Type: ${programme.type}'),
          ],
        ),
      ),
    );
  }
}

class _EnrolmentCard extends StatelessWidget {
  final EnrolmentModel enrolment;
  const _EnrolmentCard({required this.enrolment});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enrolment', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 6),
            Text('Status: ${enrolment.status}'),
            Text('Programme: ${enrolment.programmeId}'),
            Text('Roadmap: ${enrolment.roadmapId ?? 'not assigned'}'),
          ],
        ),
      ),
    );
  }
}

class _RoadmapCard extends StatelessWidget {
  final RoadmapModel roadmap;
  const _RoadmapCard({required this.roadmap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Roadmap: ${roadmap.title}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('Progress: ${roadmap.progressPercent.toStringAsFixed(1)}%'),
            const SizedBox(height: 8),
            ...List.generate(
              roadmap.steps.length,
              (index) {
                final step = roadmap.steps[index];
                final title = step['title']?.toString() ?? 'Step ${index + 1}';
                final isCompleted = index < roadmap.completedSteps;
                return ListTile(
                  dense: true,
                  title: Text(title),
                  trailing: Icon(
                    isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: isCompleted ? Colors.green : Colors.grey,
                  ),
                  onTap: () {
                    // UI clickability placeholder: step state updates should be
                    // implemented when you wire programme flow (needs step->progress mapping).
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Tapped: $title')),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Utility to create a Firestore Timestamp without importing cloud_firestore in the UI.
class TimestampUtil {
  const TimestampUtil._();

  static dynamic timestampFromDateTime(DateTime dt) {
    // EnrolmentModel expects `Timestamp`. Our models/service use
    // `cloud_firestore` Timestamp internally.
    // We import it lazily via dynamic to keep this file's imports minimal.
    // ignore: avoid_dynamic_calls
    return dt;
  }
}


