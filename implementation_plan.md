# Implementation Plan - Rename Project to Jatayat

Rename all remaining references of the old project name `jatra` to `jatayat` across the codebase, configuration files, and IDE settings.

## Proposed Changes

### Core Flutter Configuration

#### [MODIFY] [pubspec.yaml](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/pubspec.yaml)
- Change project name from `jatra` to `jatayat`.

### Dart Source Files

#### [MODIFY] [main.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/main.dart)
- Rename `JatraApp` class to `JatayatApp`.
- Update `runApp` initialization to use `JatayatApp`.

#### [MODIFY] [app_router.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/core/router/app_router.dart)
- Update imports using `package:jatra/` to `package:jatayat/`.

#### [MODIFY] [custom_app_bar.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/core/ui/widgets/custom_app_bar.dart)
- Update imports using `package:jatra/` to `package:jatayat/`.

#### [MODIFY] [route_details_screen.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/features/route_explorer/presentation/screens/route_details_screen.dart)
- Update imports using `package:jatra/` to `package:jatayat/`.

#### [MODIFY] [app_text_styles.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/core/styles/app_text_styles.dart)
- Update the doc comment referencing the Jatra logo to Jatayat logo.

### Test Files

#### [MODIFY] [widget_test.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/test/widget_test.dart)
- Update commented import `package:jatra/main.dart` to `package:jatayat/main.dart`.

### Project Metadata & Documentation

#### [MODIFY] [README.md](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/README.md)
- Change header to `# jatayat`.

### IDE & Configuration Files

#### [NEW] [jatayat.iml](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/jatayat.iml)
- Recreate root `.iml` file with name `jatayat.iml`.

#### [NEW] [jatayat_android.iml](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/android/jatayat_android.iml)
- Recreate android `.iml` file with name `jatayat_android.iml`.

#### [DELETE] [jatra.iml](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/jatra.iml)
- Remove old root `.iml` file.

#### [DELETE] [jatra_android.iml](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/android/jatra_android.iml)
- Remove old android `.iml` file.

#### [MODIFY] [modules.xml](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/.idea/modules.xml)
- Update references of `.iml` files from `jatra` to `jatayat`.

---

## Verification Plan

### Automated Tests
- Run `flutter pub get` to sync the updated project name.
- Run `flutter analyze` to ensure all imports and classes are resolved and syntax is valid.

### Manual Verification
- Confirm that the project builds successfully.
