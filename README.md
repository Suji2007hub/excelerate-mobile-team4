<div align="center">

# Excelerate Pathfinder

### *Know where to start. Own your learning journey.*

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

**Excelerate Pathfinder** is a smart onboarding and career-guidance mobile app built for the [Excelerate](https://excelerate.africa) platform — designed to help new learners and career-changers discover the right programs, track their growth, and stay connected with tutors and administrators, all from one place.

> Built during the **Excelerate Mobile Internship — Team 4** | `excelerate-mobile-team4`

</div>

---

## Table of Contents

- [Project Overview](#-project-overview)
- [Why Excelerate Pathfinder?](#-why-excelerate-pathfinder)
- [App Structure & User Roles](#-app-structure--user-roles)
- [Key Features](#-key-features)
- [Screenshots](#-screenshots)
- [Technology Stack](#-technology-stack)
- [Project Dependencies](#-project-dependencies)
- [Firebase Configuration](#-firebase-configuration)
- [Setup & Installation](#-setup--installation)
- [Backend Architecture](#-backend-architecture)
- [Contribution Log & Changelog](#-contribution-log--changelog)
- [Team](#-team)

---

## Project Overview

One of the biggest challenges for new learners on Excelerate is knowing **where to begin**. With a growing catalogue of programs and opportunities, first-time users often feel overwhelmed and register for courses without a clear sense of direction — leading to low engagement and high dropout rates.

**Excelerate Pathfinder** solves this by acting as a personal guide from the very first screen.

When a new user registers, the app walks them through a smart **Onboarding Quiz** — asking about their current skill level, career goals, and learning preferences. Based on their answers, the app generates a **Personalised Learning Roadmap** — a curated list of recommended programs ordered by relevance to their goals.

From there, learners can:
- Track their progress through each program
- Earn and share digital credentials on social media
- Give real-time feedback to tutors via **Pulse Check**
- Explore new opportunities matched to their profile

Administrators and tutors also have their own dedicated dashboards — making Pathfinder a complete three-sided platform.

---

## Why Excelerate Pathfinder?

### Benefits to Excelerate (the Platform)

| Benefit | How Pathfinder Delivers It |
|---|---|
|  **Higher learner retention** | Personalised roadmaps reduce overwhelm and keep learners on the right track from day one |
|  **Better program-learner matching** | Onboarding quiz data ensures learners join programs they are actually ready for and interested in |
|  **Real-time quality feedback** | Pulse Check gives tutors and admins instant insight into teaching effectiveness per session |
|  **Improved learner visibility** | Admins can monitor progress, manage opportunities, and identify learners who need support |
|  **Credential sharing drives brand awareness** | When learners share certificates on social media, Excelerate's brand reaches new audiences organically |
|  **Reduced support overhead** | Self-guided onboarding means fewer learners asking "where do I start?" |

### Benefits to Learners

-  **Clarity from day one** — Never again stare at a catalogue wondering what to pick
-  **A personalised path** — Programs recommended for *your* goals and *your* level
-  **Visible progress** — See exactly how far you've come in every program
-  **Social-shareable credentials** — Show off your achievements where it matters
-  **Your voice matters** — Pulse Check lets you rate and respond to teaching quality in real time
-  **Your own profile** — Manage your journey, credentials, and learning history in one place

### Benefits to Tutors

-  **Instant classroom feedback** — Pulse Check surfaces learner sentiment during or after sessions
-  **Better-prepared learners** — Students arrive at their courses already matched by interest and readiness
-  **Direct engagement** — Tutors can see which learners are progressing and who may need a nudge

---

## App Structure & User Roles

Excelerate Pathfinder is built as a **three-sided platform**, with a dedicated experience for each type of user.

```
Excelerate Pathfinder
├──  Learner Side
│   ├── Sign Up / Login
│   ├── Onboarding Quiz
│   ├── Personalised Roadmap
│   ├── Progress Tracker
│   ├── Opportunity Details
│   ├── Credential Summary Card (shareable)
│   ├── Pulse Check (feedback to tutor)
│   └── Profile Screen
│
├──  Admin Side
│   ├── Admin Login
│   ├── Dashboard Overview
│   └── Opportunity Management
│
└── Tutor Side
    └── Feedback Pulse (receive learner feedback)
```

---

## Key Features

### Smart Onboarding Quiz
New users are guided through a short, friendly quiz when they first register. Questions cover:
- Are you a beginner, intermediate, or advanced learner?
- What is your career goal?
- What field are you most interested in?

The app uses these answers to build a personalised experience — no two learners see the same starting point.

---

### Personalised Learning Roadmap
Based on the onboarding quiz, the app generates a curated list of recommended Excelerate programs — ordered by fit, readiness, and goal alignment. Learners always know what to do next and why.

---

### Progress Tracker
Every enrolled program shows a live progress indicator. Learners can see what they have completed, what is in progress, and what is coming next — all on a single clean screen.

---

### Credential Summary Card
When a learner completes a program, they receive a digital **Credential Summary Card**. This card is designed to be shared directly to social media (LinkedIn, Twitter/X, WhatsApp, and more) — turning every completion into a public achievement and a visibility moment for the Excelerate brand.

---

### Pulse Check — Real-Time Learner Feedback
Pulse Check is a lightweight feedback tool built into the learner's experience. During or after a teaching session, learners can rate the session and leave comments. This feedback flows directly to the tutor's **Feedback Pulse** dashboard in real time — giving tutors actionable insight without waiting for end-of-course surveys.

---

### Opportunity Details
Learners can browse and explore all available Excelerate programs in detail — including descriptions, duration, skills covered, and suitability — before committing to enrol.

---

### Admin Dashboard & Opportunity Management
Administrators have a dedicated portal to:
- View a high-level dashboard of platform activity
- Create, edit, and manage learning opportunities
- Monitor learner enrolment and engagement

---

### Learner Profile Screen
Each learner has a profile screen showing their personal information, enrolled programs, earned credentials, and progress history — a single source of truth for their journey on Excelerate.

---

## Screenshots

> All screens below are from the live Flutter application.

---

### Learner Flow

#### Sign Up
<p align="center">
  <img src="screenshots/Sign_Up.png" width="300" alt="Sign Up Screen"/>
</p>

New learners create their account with email and password, or via Google Sign-In. Role selection (Learner / Admin / Tutor) happens at registration.

---

#### Onboarding Quiz
<p align="center">
  <img src="screenshots/Onboarding_Quiz.png" width="300" alt="Onboarding Quiz"/>
</p>

The quiz collects skill level, goals, and interests. Responses are stored in Firestore and used to generate the personalised roadmap immediately after completion.

---

#### Personalised Roadmap
<p align="center">
  <img src="screenshots/Personalized_Roadmap.png" width="300" alt="Personalised Roadmap"/>
</p>

A curated list of recommended programs, ordered by relevance to the learner's onboarding answers. This is the learner's home base — their map through Excelerate.

---

#### Progress Tracker
<p align="center">
  <img src="screenshots/Progress_Tracker.png" width="300" alt="Progress Tracker"/>
</p>

Real-time progress for each enrolled program. Learners can see exactly how far they have come and what remains — keeping motivation high.

---

#### Opportunity Details
<p align="center">
  <img src="screenshots/Opportunity_Details.png" width="300" alt="Opportunity Details"/>
</p>

Full detail view for any program — description, skills, duration, and a clear call to action to enrol.

---

#### Credential Summary Card
<p align="center">
  <img src="screenshots/Credential_Summary_Card.png" width="300" alt="Credential Summary Card"/>
</p>

The shareable credential generated on program completion. Learners tap to share directly to LinkedIn, WhatsApp, Twitter/X, or any other platform.

---

#### Profile Screen
<p align="center">
  <img src="screenshots/Profile_Screen.png" width="300" alt="Profile Screen"/>
</p>

The learner's personal hub — showing their account details, enrolled programs, credentials earned, and overall progress at a glance.

---

### Tutor Flow

#### Feedback Pulse (Tutor Side)
<p align="center">
  <img src="screenshots/Teachers__side__Feedback_pulse_.png" width="300" alt="Tutor Feedback Pulse"/>
</p>

Tutors receive live Pulse Check feedback from learners here. Session ratings and comments are displayed in real time — sourced from Firestore listeners — so tutors can act on feedback immediately.

---

### Admin Flow

#### Admin Login
<p align="center">
  <img src="screenshots/Admin_Login.png" width="300" alt="Admin Login"/>
</p>

A dedicated, secured login portal for administrators — separate from the learner login flow.

---

#### Dashboard Overview (Admin)
<p align="center">
  <img src="screenshots/Dashboard_Overview__Admin_.png" width="300" alt="Admin Dashboard"/>
</p>

The admin's bird's-eye view of platform activity — enrolments, active learners, and program performance metrics.

---

#### Opportunity Management (Admin)
<p align="center">
  <img src="screenshots/Opportunity_Management__Admin_.png" width="300" alt="Opportunity Management"/>
</p>

Admins create, edit, publish, and manage all learning opportunities from this screen. Changes reflect immediately across all learner roadmaps via Firestore.

---

## Technology Stack

| Layer | Technology |
|---|---|
| **Frontend** | Flutter (Dart) |
| **Backend / Database** | Firebase (Cloud Firestore) |
| **Authentication** | Firebase Authentication + Google Sign-In |
| **Real-time Sync** | Firestore real-time listeners |
| **Platform Targets** | Android, iOS |

### Flutter & Dart
The entire UI is built with Flutter using a widget-based component architecture. Flutter's cross-platform nature means a single codebase runs natively on both Android and iOS, with platform-specific UI conventions handled via `cupertino_icons` for iOS-style elements.

### Firebase
Firebase powers all backend functionality:
- **Firebase Authentication** — handles email/password registration and login, and Google Sign-In OAuth flow.
- **Cloud Firestore** — NoSQL document database storing users, programs, progress records, onboarding responses, and Pulse Check feedback. Real-time listeners (`snapshots()`) ensure the Tutor Feedback Pulse and Admin Dashboard update without manual refresh.
- **Firebase Core** — initialises all Firebase services before the app renders.

---

## Project Dependencies

### `pubspec.yaml` — Declared Versions

```yaml
dependencies:
  flutter:
    sdk: flutter

  # Firebase
  firebase_core: ^3.2.0        # Firebase initialisation
  firebase_auth: ^5.1.0        # User authentication (login & registration)
  cloud_firestore: ^5.1.0      # Cloud NoSQL database

  # Authentication
  google_sign_in: ^6.2.1       # Google OAuth authentication

  # Utilities
  url_launcher: ^6.3.0         # Open external links (e.g. credential sharing)
  intl: ^0.19.0                # Date and time formatting

  # UI / UX
  confetti: ^0.7.0             # Celebration animations on credential earn
  cupertino_icons: ^1.0.8      # iOS-style icon set
```

### Resolved Versions (`pubspec.lock`)

| Package | Resolved Version |
|---|---|
| `firebase_core` | 3.15.2 |
| `firebase_auth` | 5.7.0 |
| `cloud_firestore` | 5.6.12 |
| `google_sign_in` | 6.3.0 |
| `url_launcher` | 6.3.2 |
| `intl` | 0.19.0 |
| `confetti` | ~0.7.0 |
| `cupertino_icons` | 1.0.8 |

---

## Firebase Configuration

Firebase must be configured separately for each platform before the app can run.

### Required Configuration Files

| Platform | File Location |
|---|---|
| **Android** | `android/app/google-services.json` |
| **iOS** | `ios/Runner/GoogleService-Info.plist` |
| **All Platforms** | `lib/firebase_options.dart` |

>  These files contain project-specific API keys and are **not committed to the repository**. Each developer must download them from the Firebase Console for the `excelerate-mobile-team4` project.

### Firebase Initialisation

Firebase is initialised once at app startup in `lib/main.dart`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
```

The platform-specific configuration options are auto-generated in:
```
lib/firebase_options.dart
```

---

## Setup & Installation

### Prerequisites

Make sure the following are installed on your machine before proceeding:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.x or later)
- [Dart SDK](https://dart.dev/get-dart) (bundled with Flutter)
- [Android Studio](https://developer.android.com/studio) or [Xcode](https://developer.apple.com/xcode/) (for iOS)
- A Firebase project with Firestore and Authentication enabled
- A physical device or emulator/simulator

---

### Step 1 — Clone the Repository

```bash
git clone https://github.com/excelerate-mobile-team4/excelerate-pathfinder.git
cd excelerate-pathfinder
```

---

### Step 2 — Add Firebase Configuration Files

Download the required files from the Firebase Console for this project and place them as follows:

```
android/app/google-services.json        ← Android config
ios/Runner/GoogleService-Info.plist     ← iOS config
lib/firebase_options.dart               ← Dart config (FlutterFire CLI)
```

To generate `firebase_options.dart` automatically, use the [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/):

```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

---

### Step 3 — Install Dependencies

```bash
flutter pub get
```

---

### Step 4 — Run the Application

```bash
# Run on connected device or emulator
flutter run

# Run on a specific device
flutter run -d <device-id>

# List available devices
flutter devices
```

---

### Step 5 — Build for Release (Optional)

```bash
# Android APK
flutter build apk --release

# iOS (requires Mac + Xcode)
flutter build ios --release
```

---

### Firestore Security Rules (Recommended)

Set the following basic rules in the Firebase Console under **Firestore → Rules** for development:

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{uid} {
      allow read, write: if request.auth != null && request.auth.uid == uid;
    }
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

>  Tighten these rules before any production deployment.

---

## 🏗 Backend Architecture

### Authentication Flow

Authentication logic lives in `lib/services/auth_services.dart`.

#### User Registration

```dart
// Step 1 — Create user account
UserCredential userCredential =
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

// Step 2 — Retrieve unique user ID
String uid = userCredential.user!.uid;

// Step 3 — Store user profile in Firestore
await FirebaseFirestore.instance
    .collection("users")
    .doc(uid)
    .set({
      "name": name,
      "email": email,
      "role": role,         // "learner" | "admin" | "tutor"
    });
```

#### User Login

```dart
await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: email,
  password: password,
);
// Returns true on success, false on failure
```

---

### Firestore Data Structure

```
firestore/
│
├── users/
│   └── {uid}/
│       ├── name          (string)
│       ├── email         (string)
│       └── role          (string: "learner" | "admin" | "tutor")
│
├── programs/
│   └── {programId}/
│       ├── title         (string)
│       ├── description   (string)
│       ├── duration      (string)
│       └── tags          (array)
│
├── progress/
│   └── {uid}/
│       └── {programId}/
│           ├── enrolled  (boolean)
│           ├── percent   (number)
│           └── completed (boolean)
│
├── onboarding/
│   └── {uid}/
│       ├── level         (string: "beginner" | "intermediate" | "advanced")
│       ├── goal          (string)
│       └── interests     (array)
│
└── pulse_feedback/
    └── {sessionId}/
        ├── learnerId     (string)
        ├── tutorId       (string)
        ├── rating        (number: 1–5)
        ├── comment       (string)
        └── timestamp     (timestamp)
```

---

### Architecture Diagram

```
Flutter UI
│
├── Learner Screens ──────────────────────────────────────────────┐
│   Sign Up → Onboarding Quiz → Roadmap → Progress → Credential  │
│                                                                  │
├── Admin Screens ─────────────────────────────────────────────── │
│   Login → Dashboard → Opportunity Management                    │
│                                                                  │
└── Tutor Screens ─────────────────────────────────────────────── │
    Feedback Pulse                                                 │
         │                                                         │
         ▼                                                         │
    Auth Service (lib/services/auth_services.dart)                │
         │                                                         │
    ┌────┴────────────────────┐                                    │
    │                         │                                    │
    ▼                         ▼                                    │
Firebase Auth          Cloud Firestore ◄──────────────────────────┘
• createUser()         • users/{uid}
• signIn()             • programs/{id}
• googleSignIn()       • progress/{uid}/{programId}
                       • onboarding/{uid}
                       • pulse_feedback/{sessionId}
                             │
                             ▼
                    Real-time Listeners
                    (snapshots() — Tutor Pulse,
                     Admin Dashboard)
```

### Android Firebase Plugin

The Google Services Gradle plugin is applied in `android/app/build.gradle.kts`:

```kotlin
id("com.google.gms.google-services")
```

## Contribution Log & Changelog

### Version History

#### `v1.0.0` — Initial Release *(Internship Final Submission)*

**Date:** June 2026
**Team:** Excelerate Mobile Internship — Team 4

### Feature Changelog

| # | Feature | Description | Status |
|---|---|---|---|
| 01 | **Project Scaffolding** | Flutter project created, Firebase project initialised, `pubspec.yaml` configured with all dependencies | ✅ Done |
| 02 | **Firebase Integration** | `firebase_core`, `firebase_auth`, `cloud_firestore`, `google_sign_in` integrated and initialised in `main.dart` | ✅ Done |
| 03 | **User Authentication** | Email/password registration and login implemented via `auth_services.dart`; Google Sign-In added as alternative | ✅ Done |
| 04 | **Role-Based Routing** | Users tagged with `role` field at registration; app routes to Learner, Admin, or Tutor view accordingly | ✅ Done |
| 05 | **Onboarding Quiz** | Multi-step quiz screen built; responses stored in Firestore `onboarding/{uid}` collection | ✅ Done |
| 06 | **Personalised Roadmap** | Roadmap screen reads onboarding data and renders a filtered, ordered list of recommended programs | ✅ Done |
| 07 | **Progress Tracker** | Per-program progress stored in Firestore; UI shows completion percentage with visual progress indicators | ✅ Done |
| 08 | **Opportunity Details Screen** | Full-detail screen for each program including description, skills, and enrolment CTA | ✅ Done |
| 09 | **Credential Summary Card** | Completion card generated on program finish; `url_launcher` and `confetti` used for sharing and celebration | ✅ Done |
| 10 | **Pulse Check (Learner Side)** | Feedback form allowing learners to rate and comment on teaching sessions; data written to `pulse_feedback` collection | ✅ Done |
| 11 | **Feedback Pulse (Tutor Side)** | Tutor dashboard reading Pulse Check submissions in real time via Firestore `snapshots()` listeners | ✅ Done |
| 12 | **Admin Login** | Separate admin login flow with role verification before dashboard access | ✅ Done |
| 13 | **Admin Dashboard Overview** | High-level metrics screen for administrators showing platform activity | ✅ Done |
| 14 | **Opportunity Management (Admin)** | CRUD interface for admins to create and manage programs in Firestore | ✅ Done |
| 15 | **Profile Screen** | Learner profile displaying account info, enrolled programs, and earned credentials | ✅ Done |
| 16 | **UI Polish & Icons** | `cupertino_icons` applied for iOS consistency; `intl` used for date formatting throughout | ✅ Done |
| 17 | **Android Firebase Build Config** | Google Services plugin (`com.google.gms.google-services`) configured in `build.gradle.kts` | ✅ Done |

---

### Known Issues & Future Improvements

| # | Item | Priority |
|---|---|---|
| 01 | Push notifications for program reminders | Medium |
| 02 | Offline caching with Firestore persistence | High |
| 03 | Tutor side: full profile and session management | Medium |
| 04 | Social share deep-link for credentials (Open Graph) | Low |
| 05 | Admin analytics charts (enrolment trends, completion rates) | Medium |
| 06 | Automated Firestore security rules for production | High |

---

##  Team

**Project:** `excelerate-mobile-team4`
**Internship:** Excelerate Mobile Development Internship
**Cohort:** 2026
**Members:** 
Grace Nwakeze
gracenkirukanmd@gmail.com
Frontend lead (UI/UX)

Hafiz Saleh
hafizsaleh1496@gmail.com
Frontend

Jumoke Kazeem
kazeemjumoke12@gmail.com
Team lead (Backend)

K Karthik Reddy
kurmathikarthik@gmail.com
Frontend (Code inspector)

Karizza Peligro
peligrokarizza@gmail.com
Backend (Firebase)

SANSKAR MUNESHWAR
sanskarmuneshwar2004@gmail.com
Frontend/backend (Tester)

V S Sujithraa
sujithraasudhakar02@gmail.com
Backend

| Role | Responsibility |
|---|---|
| Mobile Developers | Flutter UI screens, widget architecture, Dart business logic |
| Backend Integration | Firebase setup, Firestore schema design, Auth service |
| UI/UX Design | Screen designs (Figma → Flutter) for all three user roles |
| QA & Testing | Device testing on Android and iOS simulators |

---

<div align="center">

**Built by Team 4 — Excelerate Mobile Internship 2026**

[![Flutter](https://img.shields.io/badge/Made%20with-Flutter-02569B?style=flat&logo=flutter)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Powered%20by-Firebase-FFCA28?style=flat&logo=firebase&logoColor=black)](https://firebase.google.com)

</div>
