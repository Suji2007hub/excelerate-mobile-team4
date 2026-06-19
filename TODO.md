# TODO - Firebase integration (enrolment_service.dart, roadmap_service.dart)

- [ ] Add/locate frontend UI screens (currently repo only has models/services + default main.dart)
- [ ] Replace `lib/main.dart` with a minimal, functional programme → enrolment → roadmap UI
- [ ] Wire buttons/taps to `ProgrammeService`, `EnrolmentService`, and `RoadmapService`
- [ ] Implement loading/error states for Firestore calls
- [ ] Create navigation flow:
  - Programme screen (fetch by ID from an input) 
  - Enrolment action (create/update enrolment) 
  - Roadmap screen (render roadmap steps; step click updates progress)
- [ ] Ensure everything builds and is clickable
- [ ] Run `flutter analyze` / `flutter test` (or `flutter run`) to validate compilation

