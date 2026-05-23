# Renaming & Feedback Feature Walkthrough

We have successfully renamed the project from `jatra` to `jatayat`, refactored the feedback system styling, and implemented a high-performance local disk caching system for route PDFs.

## Changes Made

### 1. Codebase Renaming (jatra -> jatayat)
* **Configuration**: Updated package name in `pubspec.yaml` to `jatayat` and README headers.
* **Imports**: Standardized all package imports across `lib/` and `test/` to `package:jatayat/...`.
* **Classes**: Renamed central application widget `JatraApp` to `JatayatApp`.
* **IDE Modules**: Created new `.iml` config files, deleted old files, and updated `.idea/modules.xml`.

### 2. Feedback Button Styling (Option B)
* **File**: `lib/core/ui/widgets/app_feedback_button.dart`
* **Changes**: Refactored colors to use theme-based accent pairs:
  * **Background**: `theme.colorScheme.secondaryContainer` (Soft, subtle brand container green)
  * **Icon Color**: `theme.colorScheme.onSecondaryContainer` (Dark contrast green)
* **Outcome**: Resolved dark-mode contrast conflicts where the button was nearly invisible.

### 3. Minimal & Clean Issue Template
* **File**: `lib/core/providers/feedback_provider.dart`
* **Changes**: Redesigned the GitHub Issue template structure to be completely clean and minimal:
  * Placed the label (`bug`/`enhancement`) and reported timestamp on separate lines at the top.
  * Omitted submission metadata and system environment sections to focus on core details.
  * Renamed the section heading to `Bug description` or `Suggestion` based on report type.
  * Cleanly rendered screenshots under simple `Attached screenshots:` text.

### 4. PDF Performance Upgrade (Local Disk Caching)
* **File**: `lib/core/ui/widgets/app_pdf_viewer.dart`
* **Changes**: Added a smart local caching layer inside `_downloadAndSavePdf()`:
  * Checks if the PDF file already exists in the device temporary directory.
  * If it exists, checks the last modified timestamp.
  * **If less than 3 days old (Cache Hit)**: Loads the file instantly in milliseconds.
  * **If older than 3 days or not found (Cache Miss)**: Downloads a fresh copy from the server, caches it locally, and loads.
* **Outcome**: Dramatic page load performance boost, offline viewing support, and massive cellular data savings for users.

---

## Verification Results
* Switch branches and merges were successfully integrated on `feature/feedback`.
* Verified both Light and Dark mode readability on console chat and codebase structures.
