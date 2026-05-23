# Jatayat Roadmap

This is the official product roadmap for **Jatayat**, focusing on transitioning to a unified, offline-first database architecture for Dhaka bus commuters.

---

## 🚀 Milestone 1: Offline-First Bookmarks & Saved Journeys (Immediate Focus)
*Allow commuters to bookmark frequent routes and stops, built on a unified local database.*

### 🔍 Objective:
 Dhaka commuters frequently travel the same paths daily (e.g., Mirpur 10 to Farmgate). This feature must allow them to save these stop-pairs or bus routes locally, allowing them to access stop list details and calculated fares instantly without needing a network connection.

### 📋 Technical Design (Unified Database Architecture):
* **Unified Database Selection**:
  * Instead of using a separate key-value store (like `shared_preferences`) for bookmarks and a relational database later for routes, we will select **one unified local database** (such as **Sqflite** or **Hive/Isar**) from day one.
  * Bookmarks will be stored as a dedicated table (`bookmarks`) inside this unified local database.
  * This ensures a clean repository pattern and prevents dependency bloat.
* **UI/UX Flow**:
  * Reactivate the commented-out `BookmarksScreen` in `lib/features/bookmarks/presentation/screens/bookmarks_screen.dart` and the shell tab.
  * Add a simple "Bookmark" icon button on both Route Explorer and Fare Finder result pages.
  * Tapping a bookmarked item reads the route/fare details instantly from the local database.

---

## 🚀 Milestone 2: Going Full Offline (2nd Public Release)
*Transform the entire application to function completely offline, including user settings, themes, and local database syncing.*

### 🔍 Objective:
 Dhaka commutes have highly unstable cellular networks inside buses and crowds. The 2nd Public Release will make search, stop listings, routes, and fare calculations function completely offline, leaving *only* the BRTA PDF file view to require a network download.

### 📋 Technical Design (Offline-First Architecture & Preferences):
* **Unified Local Database Migration**:
  * All bus routes, stop coordinates, and fare matrices will be migrated from Supabase network tables into the **same unified local database** (Sqflite / Hive) initialized in Milestone 1.
  * On first app launch, the database is pre-seeded with the latest routes and fares (either bundled in assets or downloaded on first-boot).
* **Automatic Offline Sync**:
  * Keep a version checker on the Supabase database. If the version changes and there is internet, download the tiny JSON delta in the background and update the local database.
* **User Preferences & System States**:
  * **Dark/Light Theme toggle** preferences will be persisted locally to ensure the user's preferred visual style load instantly on startup.
  * **English/Bangla Language localization** preferences will be persisted locally, maintaining proper user interface states offline.
* **PDF Exception**:
  * PDF route documents and gazettes will remain online-only (on-demand download with our 3-day local disk caching) to keep the initial app bundle size very small.

---

## 📌 Milestone 3: Dual-Language Smart Search (Bangla & English)
*Enable smart cross-language fuzzy searches for Dhaka commuters.*

* **Overview**: Commuters can search stops using either Bangla or English keyboards.
* **Requirement**: Map search queries (e.g. English "mirpur" matches Bangla "মিরপুর" and vice-versa) using local translation dictionaries.

---

## 📌 Milestone 4: Interactive Route Finder (Stop-to-Stop Route Suggestions)
*Suggest transit paths when there is no direct bus between two stops.*

* **Overview**: If no single bus runs from Stop A to Stop B, calculate intersection transfer points.
* **Requirement**: Implement a local graph traversal algorithm (Dijkstra or BFS) on the cached offline database.

---

## 📌 Milestone 5: Crowdsourced Bus Status & Delay Reporter
*Commuters share real-time crowd and traffic conditions on their active routes.*

* **Overview**: Submit crowd level (Empty/Packed) and traffic delay reports to a shared real-time database.
* **Requirement**: Supabase backend endpoints with automatic 1-hour expiration on reports to keep crowdsourced updates accurate.
