# Implementation Plan - Bus-Centric Search & Community Reviews

Evolve **Jatayat** from a route-number focused fare calculator into a bus-centric commuter assistant, allowing users to search by bus operator names (*Bikash Paribahan*, *Alif Paribahan*), view full itineraries, submit anonymous ratings/reviews, report missing bus data, and keep local SQLite aligned with local & remote Supabase.

---

## Architecture & Database Changes

### 1. Database Schemas (Supabase Local & SQLite `LocalDatabase` v4)

#### `bus_operators` Table
* `id` (TEXT / UUID PRIMARY KEY)
* `route_id` (TEXT, Foreign Key to `routes.id`)
* `name_en` (TEXT NOT NULL)
* `name_bn` (TEXT NOT NULL)
* `service_type` (TEXT, e.g. `Sitting`, `Local`, `AC`)
* `is_active` (INTEGER / BOOLEAN DEFAULT true)

#### `bus_reviews` Table
* `id` (TEXT / UUID PRIMARY KEY)
* `bus_operator_id` (TEXT, Foreign Key to `bus_operators.id`)
* `rating` (INTEGER NOT NULL, 1 to 5 stars)
* `comment` (TEXT OPTIONAL)
* `created_at` (TEXT / INTEGER TIMESTAMP)

#### `correction_reports` Table
* `id` (TEXT / UUID PRIMARY KEY)
* `bus_operator_id` (TEXT OPTIONAL)
* `route_id` (TEXT OPTIONAL)
* `report_type` (TEXT NOT NULL, e.g. `missing_bus`, `wrong_sequence`, `fare_error`)
* `description` (TEXT NOT NULL)
* `created_at` (TEXT / INTEGER TIMESTAMP)

---

## User Review Required

> [!IMPORTANT]
> **Supabase Local & Database Sync Strategy**:
> 1. We will update `LocalDatabase._createLocalFirstTables` and `_upgradeDB` to version 4 to include `bus_operators`, `bus_reviews`, and `correction_reports`.
> 2. `DatabaseSyncService` will be updated to fetch and sync `bus_operators` alongside `routes` and `stops`.
> 3. Anonymous review submissions and correction reports will be written locally to SQLite if offline, and synced directly via Supabase API when internet is available.

---

## Proposed Changes

### Database Layer (Local SQLite & Supabase Sync)

#### [MODIFY] [local_database.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/core/database/local_database.dart)
* Upgrade DB version to 4.
* Add table creation for `bus_operators`, `bus_reviews`, and `correction_reports`.
* Add helper methods for inserting/fetching bus operators, reviews, and reporting data.

#### [MODIFY] [database_sync_service.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/core/database/database_sync_service.dart)
* Include `bus_operators` in parallel Supabase sync pipeline.

---

### Domain Layer (Entities, Repositories & Use Cases)

#### [NEW] [bus_operator.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/features/fare_finder/domain/entities/bus_operator.dart)
* Entity representing a bus operator with ratings summary.

#### [NEW] [bus_review.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/features/fare_finder/domain/entities/bus_review.dart)
* Entity for rating and qualitative comment.

#### [NEW] [bus_repository.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/features/fare_finder/domain/repositories/bus_repository.dart)
* Contracts for `searchBuses(fromStopId, toStopId)`, `getBusDetails(busId)`, `submitReview(review)`, `submitCorrectionReport(report)`.

---

### Presentation Layer (Bus-Centric UI & Community Feedback)

#### [MODIFY] [fare_finder_screen.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/features/fare_finder/presentation/screens/fare_finder_screen.dart)
* Display operator cards (*Bikash*, *Alif*) with fare, distance, via stops, and service badges.

#### [NEW] [bus_details_screen.dart](file:///mnt/BACKUP/WORKSHOP/Personal/Projects/Jatayat/repo/jatayat/lib/features/fare_finder/presentation/screens/bus_details_screen.dart)
* Full stop itinerary, BRTA legal breakdown, 5-star rating, review submission form, and "Report Correction" button.

---

## Verification Plan

### Automated Tests
- Run `dart analyze` to ensure zero warnings or errors.
- Run `flutter test` for model serialization and repository unit tests.

### Manual Verification
- Test stop-to-stop search showing distinct bus operator cards.
- Test submitting an anonymous rating and review.
- Test correction reporting modal.

