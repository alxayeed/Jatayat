# Jatayat 2.0.0: Master Engineering Specification & Implementation Architecture

**Document Version:** 2.0.0-MASTER  
**Target Platform:** Flutter (Android & iOS)  
**Architecture:** Clean Architecture + SOLID + Local-First SQLite Cache + Remote Supabase Sync + Global Community AI Cache  
**State Management:** Riverpod (`StateNotifierProvider` / `AsyncNotifierProvider`)  
**Target Audience:** Mobile Engineers, Backend Developers, and Autonomous AI Coding Agents  

---

# Table of Contents
1. [Executive Summary & Product Vision](#1-executive-summary--product-vision)
2. [End-to-End Commute Scenarios & Detailed Use Cases](#2-end-to-end-commute-scenarios--detailed-use-cases)
3. [Deep-Dive: Zero-Cost Lite AI & Multi-Tier Global Community Cache Architecture](#3-deep-dive-zero-cost-lite-ai--multi-tier-global-community-cache-architecture)
4. [Complete Database Schema (PostgreSQL & SQLite v4)](#4-complete-database-schema-postgresql--sqlite-v4)
5. [Seeded Transit Services (Top 60+ Buses, Metro MRT-6 & Trains)](#5-seeded-transit-services-top-60-buses-metro-mrt-6--trains)
6. [Graph Routing & Interchange Traversal Algorithm](#6-graph-routing--interchange-traversal-algorithm)
7. [Dual-Layer Stop Model & BRTA Gazette Proof Mechanics](#7-dual-layer-stop-model--brta-gazette-proof-mechanics)
8. [Domain, Data & Presentation Layer Code Blueprints](#8-domain-data--presentation-layer-code-blueprints)
9. [Step-by-Step Phased TDD Implementation Roadmap](#9-step-by-step-phased-tdd-implementation-roadmap)
10. [Testing Matrix, Quality Gates & Zero-Warning Policy](#10-testing-matrix-quality-gates--zero-warning-policy)
11. [Timeline, Sprint Planning & Engineering Estimations](#11-timeline-sprint-planning--engineering-estimations)
12. [Architectural Decision Records (ADRs), Design Patterns & Engineering Principles](#12-architectural-decision-records-adrs-design-patterns--engineering-principles)

---

# 1. Executive Summary & Product Vision

Jatayat 1.x was engineered as a regulatory fare viewer referencing official BRTA gazettes. However, real-world commuters do not look for abstract route codes like *"Route A-101"*; they look for **actual bus company names** (*"প্রজাপতি", "বিকল্প", "ভিক্টর ক্লাসিক", "রাইদা", "শিকড়", "অছিম", "আলিফ"*) and require **multi-step transfer paths** when no single direct bus connects their origin and destination.

### Core Objectives for 2.0.0:
1. **Real Bus Operator Identification**: Suggest concrete bus services with brand color badges and types (Non-AC, AC, Metro, Seating).
2. **Multi-Modal Transit Integration**: Dhaka Metro Rail (MRT Line-6, 16 stations) and Suburban Commuter Trains (Dhaka-Narayanganj, Dhaka-Gazipur/Airport, CTG Shuttle) as first-class transit options.
3. **Automated 1-Hop Transfer & Multi-Step Routing**: Graph-based interchange engine solving transfers via major transit hubs (Farmgate, Shahbagh, Mirpur-10, Mohakhali, Kuril, Kakrail, Malibagh, Motijheel, Airport, GEC).
4. **Intermediate Day-to-Day Real Stops with Legal Gazette Proofs**: Commuters can search colloquial/practical stops (*ধানমন্ডি ৩২, বাড্ডা লিংক রোড, টেকনিক্যাল*) with mathematical BRTA fare bounding and 1-tap jump to scanned PDF proofs.
5. **Zero-Cost Lite AI with Global Community Cache**: Natural conversational and voice search powered by Google Gemini 2.5 Flash Free Tier + **Shared Supabase Global Community Cache** (reduces external API calls by 90%, response time <35ms, $0.00 infrastructure cost).
6. **100% Offline-First Functionality**: Sub-50ms query latency on-device without internet connectivity.

---

# 2. End-to-End Commute Scenarios & Detailed Use Cases

To guarantee that developers and agents handle every real-world edge case, here are the 8 fundamental commute scenarios supported by Jatayat 2.0.0:

### Case 1: Direct City Bus (0 Transfers)
- **Scenario**: User searches `মিরপুর ১০ (Mirpur 10)` ➔ `ফার্মগেট (Farmgate)`.
- **System Behavior**:
  1. Queries SQLite for direct bus operators stopping at both stops in sequence order.
  2. Returns direct bus cards: 🚌 *বিকল্প অটো সার্ভিস (Bikolpo)*, 🚌 *শিকড় পরিবহন (Shikhor)*, 🚌 *স্বাধীন পরিবহন (Shadhin)*.
  3. Displays official BRTA fare: `৳১৫` (Distance: ~5.8 km).
  4. Provides 1-tap `[ 📄 গেজেট প্রমাণপত্র দেখুন ]` button linking to BRTA Gazette Page.

### Case 2: Direct Dhaka Metro Rail (0 Transfers - MRT Line-6)
- **Scenario**: User searches `উত্তরা উত্তর (Uttara North / Diabari)` ➔ `বাংলাদেশ সচিবালয় (Secretariat)`.
- **System Behavior**:
  1. Identifies both stops as active MRT-6 stations.
  2. Returns Metro Card: 🚇 *মেট্রোরেল (MRT Line-6)*.
  3. Displays: Regular Fare: `৳৯০`, Rapid Pass / MRT Pass (10% discount): `৳৮১`, Travel Time: `~৩০ মিনিট` (vs ~1.5 hours by road).

### Case 3: Multi-Step Bus + Bus Interchange (1 Transfer)
- **Scenario**: User searches `মিরপুর ১৪ (Mirpur 14)` ➔ `ধানমন্ডি ৩২ (Dhanmondi 32)`. No direct bus runs this exact corridor.
- **System Behavior**:
  1. Graph Solver identifies intersection hub: `ফার্মগেট (Farmgate)`.
  2. Leg 1: 🚌 *শিকড় পরিবহন* (Mirpur 14 ➔ Farmgate | Fare: `৳১৫` | Dist: 4.2 km).
  3. Transfer: 🚶‍♂️ *ফার্মগেট মোড়ে বাস পরিবর্তন (Walk 1-2 mins)*.
  4. Leg 2: 🚌 *৮ নং পরিবহন / স্বাধীন* (Farmgate ➔ Dhanmondi 32 | Fare: `৳১০` (Min Fare) | Dist: 2.1 km).
  5. Total Journey: Total Fare: `৳২৫`, Total Distance: `৬.৩ কিমি`, Total Legs: `২`.

### Case 4: Multi-Modal Bus + Metro Rail Interchange (1 Transfer)
- **Scenario**: User searches `মোহাম্মদপুর বাস স্ট্যান্ড (Mohammadpur)` ➔ `মতিঝিল (Motijheel)`.
- **System Behavior**:
  1. Option A (Direct Bus in traffic): 🚌 *তরঙ্গ প্লাস / রাজা সিটি* (Direct | Fare: `৳২৫` | Est. Time: 65 mins).
  2. Option B (Multi-Modal Smart Transfer):
     - Leg 1: 🚌 *বাস / রিকশা* (Mohammadpur ➔ Farmgate Metro Station | Fare: `৳১০-৳১৫` | 15 mins).
     - Leg 2: 🚇 *মেট্রোরেল* (Farmgate ➔ Motijheel Station | Fare: `৳৩০` | 12 mins).
     - Summary: Total Fare: `৳৪০`, Total Travel Time: `~২৭ মিনিট` (Saves 38 mins).

### Case 5: Suburban Commuter Railway Line
- **Scenario**: User searches `জয়দেবপুর (Joydebpur / Gazipur)` ➔ `কমলাপুর (Kamalapur Railway Station)`.
- **System Behavior**:
  1. Identifies Bangladesh Railway suburban commuter line.
  2. Returns: 🚆 *জয়দেবপুর কমিউটার / তুরাগ এক্সপ্রেস*.
  3. Displays Railway Fixed Fare: `৳২৫ - ৳৩৫`, Intermediate stops: *ধীরাশ্রম, টঙ্গী জংশন, ঢাকা বিমানবন্দর, তেজগাঁও, কমলাপুর*.

### Case 6: Real-World Intermediate Stop with Gazette Milestone Bounding
- **Scenario**: User searches `ধানমন্ডি ৩২ (Dhanmondi 32)` ➔ `বিমানবন্দর (Airport)`.
- **System Behavior**:
  1. `ধানমন্ডি ৩২` is a practical commuter stop (not an official BRTA gazette header).
  2. Mathematical Bounding Algorithm finds:
     - Previous Gazette Milestone: `আসাদগেট (Asad Gate)` (Gazette Fare: `৳৪২`).
     - Next Gazette Milestone: `সায়েন্স ল্যাব (Science Lab)` (Gazette Fare: `৳৩৮`).
  3. Calculates interpolated fair fare: `৳৪০` (Distance: ~16.5 km).
  4. Displays Gazette Proof Reference: *"গেজেট প্রমাণ: আসাদগেট ➔ বিমানবন্দর (৳৪২, পৃষ্ঠা ১২)"*.

### Case 7: Backtrack & Looping Route Pruning
- **Scenario**: Graph solver evaluates a path from *Mirpur 10 to Farmgate* via *Uttara* (Loop).
- **System Behavior**:
  1. Graph solver applies distance and angle bounding.
  2. If $\text{Distance}(\text{Leg } 1) + \text{Distance}(\text{Leg } 2) > 1.8 \times \text{Euclidean Distance}(\text{Origin, Dest})$, the path is pruned.
  3. Eliminates circular or non-sensical transfer paths.

### Case 8: Multi-Language & Colloquial Alias Search
- **Scenario**: User types in search bar: `"zoo"`, `"মিরপুর দশ"`, `"300 feet"`, `"চিড়িয়াখানা"`, `"technical"`.
- **System Behavior**:
  1. Searches against `stops.name_bn`, `stops.name_en`, `stops.aliases_bn`, and `stops.search_terms`.
  2. Matches `"zoo"` to `মিরপুর চিড়িয়াখানা (Mirpur Zoo)` and `"300 feet"` to `কুড়িল বিশ্বরোড (Kuril Bishwa Road)`.

---

# 3. Deep-Dive: Zero-Cost Lite AI & Multi-Tier Global Community Cache Architecture

The Lite AI feature enables users to type or speak natural queries (*"আমি ধানমন্ডি ৩২ থেকে উত্তরা ৬ নং যাবো কীভাবে কম খরচে যাওয়া যায়?"*). 

To ensure **$0.00 cost**, zero rate-limit issues, and **100% factual accuracy (no hallucinated bus routes or fares)**, the AI uses a **4-Tier Hybrid Architecture with a Global Community Cache in Supabase**:

```mermaid
graph TD
    UserQuery["User Prompt: 'ধানমন্ডি ৩২ থেকে উত্তরা ৬ নং যাবো কীভাবে?'"] --> L1{Tier 1: On-Device Regex & Token Matcher}
    
    L1 -->|Known stops detected on phone| LocalEngine[0ms - Instant Local Graph Solver]
    L1 -->|Complex Natural Language Question| L2{Tier 2: On-Device SQLite Cache}
    
    L2 -->|Found in User's Phone Cache| LocalHit[0ms - Return Local Cached Answer]
    L2 -->|Not on Phone| L3{Tier 3: Remote Supabase Community Cache}
    
    L3 -->|Found in Shared Global DB| RemoteHit[35ms - Return Community Cached Answer + Save to Phone]
    L3 -->|Brand New Unique Query| L4[Tier 4: Call Gemini Flash Free Tier]
    
    L4 --> GeminiToolCall[AI Tool Call: 'search_transit_route']
    GeminiToolCall --> LocalEngine
    LocalEngine --> VerifiedData[100% Verified Routes & Official Fares]
    VerifiedData --> AISynthesis[Gemini Formats Final Bengali Response]
    AISynthesis --> SaveSupabase[Upload to Supabase 'ai_global_cache' for all users]
    SaveSupabase --> SavePhone[Save to Local Phone SQLite]
    SavePhone --> DeliverUI[Deliver to User]
```

### 3.1 Why the Global Community Cache Guarantees Permanent Free Tier
- In Dhaka and CTG, 90% of daily commuter questions revolve around the same **300–500 popular travel corridors** (*Mirpur to Motijheel, Uttara to Farmgate, Dhanmondi to Gulshan, Agrabad to GEC*).
- When **User #1** asks about a corridor, Gemini generates the verified answer once and uploads it to Supabase.
- When **User #2, User #500, or User #10,000** asks the same or semantically identical question, it hits the Supabase Community Cache in **<35ms with 0 Gemini API calls**.
- **Result**: External Gemini API calls are reduced by **85% to 95%**, making it virtually impossible to exhaust the 1,500 daily free tier limit.

### 3.2 Tool Calling (Function Declaration) Schema
When calling the Gemini API, we pass the tool declaration so the model returns structured parameters rather than making up answers:

```json
{
  "name": "search_transit_route",
  "description": "Calculates official bus, metro rail, and train routes with fares between two stoppages in Dhaka or Chittagong.",
  "parameters": {
    "type": "object",
    "properties": {
      "origin_stop_name": {
        "type": "string",
        "description": "The extracted origin stoppage or landmark name in Bangla or English (e.g. 'মিরপুর ১০', 'Dhanmondi 32', 'Farmgate')"
      },
      "destination_stop_name": {
        "type": "string",
        "description": "The extracted destination stoppage or landmark name in Bangla or English (e.g. 'উত্তরা', 'Motijheel', 'Airport')"
      },
      "transit_preference": {
        "type": "string",
        "enum": ["all", "bus_only", "metro_preferred", "cheapest", "fastest"],
        "description": "User preference regarding transit mode or optimization."
      }
    },
    "required": ["origin_stop_name", "destination_stop_name"]
  }
}
```

### 3.3 System Prompt Instructions for Gemini Flash
```text
You are Jatayat AI (যাতায়াত এআই), an expert urban transit assistant for Dhaka and Chattogram.
Your job is to help commuters find the best bus, metro, and train routes.

CRITICAL RULES:
1. Always call the `search_transit_route` tool with the extracted origin and destination stop names.
2. DO NOT make up or hallucinate bus names, route numbers, or fares. Only present the verified data returned by the tool.
3. If the user asks in Bengali, respond in fluent, natural Bengali. If they ask in English, respond in English.
4. Highlight travel tips: mention when Metro Rail saves time over road traffic, or when a direct bus is cheaper than a multi-step transfer.
```

---

# 4. Complete Database Schema (PostgreSQL & SQLite v4)

### 4.1 PostgreSQL / Supabase Schema (`supabase/migrations/20260904_add_transit_v2.sql`)

```sql
-- 1. Transit Services Table (Buses, Metro Rail, Commuter Trains)
CREATE TABLE public.transit_services (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name_bn TEXT NOT NULL,
    name_en TEXT NOT NULL,
    operator_name TEXT,
    vehicle_type TEXT NOT NULL CHECK (vehicle_type IN ('bus', 'metro_rail', 'commuter_train')),
    brand_color_hex TEXT DEFAULT '#1976D2',
    is_ac BOOLEAN DEFAULT false,
    region TEXT DEFAULT 'Dhaka Metro',
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMPTZ DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now()
);

-- 2. Transit Service Stops (Sequential Stop Ordering)
CREATE TABLE public.transit_service_stops (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    service_id UUID REFERENCES public.transit_services(id) ON DELETE CASCADE,
    stop_id UUID REFERENCES public.stops(id) ON DELETE CASCADE,
    sequence_order INTEGER NOT NULL,
    cumulative_distance_km NUMERIC,
    is_active BOOLEAN DEFAULT true,
    CONSTRAINT unique_service_stop_seq UNIQUE (service_id, sequence_order)
);
CREATE INDEX idx_service_stops_lookup ON public.transit_service_stops(stop_id, service_id);

-- 3. Metro Rail & Train Specific Station-to-Station Fares
CREATE TABLE public.metro_train_fares (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    service_id UUID REFERENCES public.transit_services(id) ON DELETE CASCADE,
    from_stop_id UUID REFERENCES public.stops(id) ON DELETE CASCADE,
    to_stop_id UUID REFERENCES public.stops(id) ON DELETE CASCADE,
    regular_fare INTEGER NOT NULL,
    rapid_pass_fare INTEGER,
    travel_time_minutes INTEGER,
    is_active BOOLEAN DEFAULT true,
    CONSTRAINT unique_metro_fare_pair UNIQUE (service_id, from_stop_id, to_stop_id)
);

-- 4. Global Community AI Cache Table (Shared across all app users)
CREATE TABLE public.ai_global_cache (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    normalized_query TEXT NOT NULL,
    origin_stop_id UUID REFERENCES public.stops(id) ON DELETE SET NULL,
    destination_stop_id UUID REFERENCES public.stops(id) ON DELETE SET NULL,
    transit_preference TEXT DEFAULT 'all',
    synthesized_response_bn TEXT NOT NULL,
    synthesized_response_en TEXT,
    hit_count INTEGER DEFAULT 1,
    revision_id UUID REFERENCES public.revisions(id) ON DELETE CASCADE,
    last_accessed_at TIMESTAMPTZ DEFAULT now(),
    created_at TIMESTAMPTZ DEFAULT now()
);
CREATE INDEX idx_global_cache_lookup ON public.ai_global_cache(origin_stop_id, destination_stop_id, transit_preference);
CREATE INDEX idx_global_cache_query ON public.ai_global_cache(normalized_query);
```

### 4.2 SQLite Local-First Schema Upgrade (`LocalDatabase._upgradeDB`)
In `lib/core/database/local_database.dart`:
- Upgrade DB version to `4`.
- Execute table creations in `_upgradeDB(db, oldVersion, newVersion)`:
```sql
CREATE TABLE transit_services (
    id TEXT PRIMARY KEY,
    name_bn TEXT NOT NULL,
    name_en TEXT NOT NULL,
    operator_name TEXT,
    vehicle_type TEXT NOT NULL,
    brand_color_hex TEXT,
    is_ac INTEGER,
    region TEXT,
    is_active INTEGER
);

CREATE TABLE transit_service_stops (
    id TEXT PRIMARY KEY,
    service_id TEXT,
    stop_id TEXT,
    sequence_order INTEGER,
    cumulative_distance_km REAL,
    is_active INTEGER
);

CREATE TABLE metro_train_fares (
    id TEXT PRIMARY KEY,
    service_id TEXT,
    from_stop_id TEXT,
    to_stop_id TEXT,
    regular_fare INTEGER,
    rapid_pass_fare INTEGER,
    travel_time_minutes INTEGER,
    is_active INTEGER
);

CREATE TABLE ai_query_cache (
    query_hash TEXT PRIMARY KEY,
    user_query TEXT,
    origin_stop_id TEXT,
    destination_stop_id TEXT,
    synthesized_response TEXT,
    created_at INTEGER
);
```

---

# 5. Seeded Transit Services (Top 60+ Buses, Metro MRT-6 & Trains)

Here is the structured catalog of seeded transit operators to be populated into `transit_services` and `transit_service_stops`:

```
┌────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ 🚇 METRO RAIL & COMMUTER TRAINS                                                                        │
├───────────────────────┬──────────────────────────────────────────────────────────────┬─────────────────┤
│ সার্ভিস নাম (Service)   │ রুট করিডোর / প্রধান স্টপেজসমূহ (Route Corridor)              │ টাইপ / কালার    │
├───────────────────────┼──────────────────────────────────────────────────────────────┼─────────────────┤
│ মেট্রোরেল (MRT Line-6) │ উত্তরা উত্তর ➔ পল্লবী ➔ মিরপুর ১০ ➔ কাজীপাড়া ➔ ফার্মগেট ➔    │ 🚇 #00843D      │
│                       │ শাহবাগ ➔ ঢাকা বিশ্ববিদ্যালয় ➔ সচিবালয় ➔ মতিঝিল (১৬ স্টেশন)   │ (Metro Green)   │
│ জয়দেবপুর কমিউটার ট্রেন│ জয়দেবপুর ➔ ধীরাশ্রম ➔ টঙ্গী ➔ বিমানবন্দর ➔ তেজগাঁও ➔ কমলাপুর  │ 🚆 #D32F2F      │
│ নারায়ণগঞ্জ কমিউটার ট্রেন│ নারায়ণগঞ্জ ➔ চাষাড়া ➔ ফতুল্লা ➔ পাগলা ➔ গেন্ডারিয়া ➔ কমলাপুর │ 🚆 #1976D2      │
│ চবি শাটল ট্রেন (CTG)  │ চট্টগ্রাম রেলওয়ে স্টেশন ➔ ঝাউতলা ➔ ষোলশহর ➔ চট্টগ্রাম বিশ্ববিদ্যালয়│ 🚆 #7B1FA2   │
└───────────────────────┴──────────────────────────────────────────────────────────────┴─────────────────┘

┌────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ 🚌 TOP DHAKA CITY BUS OPERATORS                                                                        │
├───────────────────────┬──────────────────────────────────────────────────────────────┬─────────────────┤
│ সার্ভিস নাম (Service)   │ রুট করিডোর / প্রধান স্টপেজসমূহ (Route Corridor)              │ টাইপ / কালার    │
├───────────────────────┼──────────────────────────────────────────────────────────────┼─────────────────┤
│ প্রজাপতি পরিবহন       │ মোহাম্মদপুর ➔ মিরপুর ১০ ➔ ইসিবি চত্বর ➔ কুড়িল ➔ আব্দুল্লাহপুর│ 🚌 #2E7D32      │
│ বিকল্প অটো সার্ভিস     │ মিরপুর ১২ ➔ ফার্মগেট ➔ শাহবাগ ➔ পল্টন ➔ মতিঝিল ➔ সায়েদাবাদ   │ 🚌 #1565C0      │
│ ভিক্টর ক্লাসিক        │ সদরঘাট ➔ গুলিস্তান ➔ রামপুরা ➔ বাড্ডা ➔ কুড়িল ➔ উত্তরা       │ 🚌 #C62828      │
│ রাইদা এন্টারপ্রাইজ    │ পোস্তগোলা ➔ সায়েদাবাদ ➔ রামপুরা ➔ কুড়িল ➔ দিয়াবাড়ী (উত্তরা)  │ 🚌 #E65100      │
│ শিকড় পরিবহন           │ মিরপুর ১২ ➔ কাজীপাড়া ➔ ফার্মগেট ➔ শাহবাগ ➔ আজিমপুর           │ 🚌 #00695C      │
│ অছিম পরিবহন           │ গাবতলী ➔ মিরপুর ১ ➔ মহাখালী ➔ বাড্ডা ➔ ডেমরা স্টাফ কোয়ার্টার │ 🚌 #4E342E      │
│ আলিফ পরিবহন           │ মিরপুর ১০ ➔ বনানী ➔ নতুন বাজার ➔ রামপুরা ➔ যাত্রাবাড়ী        │ 🚌 #0277BD      │
│ অনাবিল সুপার          │ সাইনবোর্ড ➔ যাত্রাবাড়ী ➔ রামপুরা ➔ কুড়িল ➔ গাজীপুর চৌরাস্তা  │ 🚌 #558B2F      │
│ বিহঙ্গ পরিবহন          │ মিরপুর ১৪ ➔ মহাখালী ➔ শাহবাগ ➔ আজিমপুর                      │ 🚌 #F57F17      │
│ তুরাগ পরিবহন          │ যাত্রাবাড়ী ➔ সায়েদাবাদ ➔ বিশ্বরোড ➔ বিমানবন্দর ➔ টঙ্গী       │ 🚌 #4527A0      │
│ লাব্বাইক পরিবহন       │ সাভার ➔ গাবতলী ➔ ফার্মগেট ➔ মগবাজার ➔ সায়েদাবাদ             │ 🚌 #AD1457      │
│ বসুমতী ট্রান্সপোর্ট   │ গাবতলী ➔ মিরপুর ১০ ➔ বিমানবন্দর ➔ গাজীপুর চৌরাস্তা           │ 🚌 #00838F      │
│ ভিআইপি ২৭             │ আজিমপুর ➔ সায়েন্স ল্যাব ➔ ফার্মগেট ➔ মহাখালী ➔ উত্তরা       │ 🚌 #6A1B9A      │
│ তরঙ্গ প্লাস           │ মোহাম্মদপুর ➔ শংকর ➔ ধানমন্ডি ➔ শাহবাগ ➔ মতিঝিল              │ 🚌 #D84315      │
│ স্বাধীন পরিবহন        │ মিরপুর ১২ ➔ শেওড়াপাড়া ➔ ফার্মগেট ➔ কারওয়ান বাজার ➔ গুলিস্তান  │ 🚌 #37474F      │
│ দেওয়ান পরিবহন         │ আজিমপুর ➔ নিউ মার্কেট ➔ ফার্মগেট ➔ মহাখালী ➔ কুড়িল ➔ আব্দুল্লাহপুর│ 🚌 #00695C│
│ মোহাম্মদীয়া লিমিটেড   │ মোহাম্মদপুর ➔ আসাদগেট ➔ ফার্মগেট ➔ মহাখালী ➔ বিমানবন্দর ➔ আব্দুল্লাহপুর│ 🚌 #00897B│
│ নূর-ই-মक्का পরিবহন    │ গাবতলী ➔ টেকনিক্যাল ➔ মিরপুর ১ ➔ কাকলী ➔ বাড্ডা ➔ যাত্রাবাড়ী│ 🚌 #827717      │
│ বাসের হাট             │ সায়েদাবাদ ➔ মালিবাগ ➔ রামপুরা ➔ নতুন বাজার ➔ কুড়িল          │ 🚌 #546E7A      │
│ রজনীগন্ধা পরিবহন      │ সাভার ➔ হেমায়েতপুর ➔ গাবতলী ➔ ফার্মগেট ➔ মতিঝিল ➔ সায়দাবাদ  │ 🚌 #283593      │
│ ... (Total 60+ Dhaka & CTG city bus services populated in database)                                    │
└────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

---

# 6. Graph Routing & Interchange Traversal Algorithm

### 6.1 Mathematical Formulation
Let the public transit network be represented as a directed graph $G = (V, E)$, where:
- $V$ is the set of all transit stoppages.
- $E$ is the set of directed edges $(u, v)$ such that there exists a transit service $S$ with $u$ occurring before $v$ in its sequence.
- $W(u, v) = (\text{Fare}_{S}(u, v), \text{Distance}_{S}(u, v), \text{Time}_{S}(u, v))$.

### 6.2 Traversal Strategy
1. **Direct Route Match ($0$ Transfers)**:
   $$\text{Direct}(A, B) = \{ S \in \text{Services} \mid \text{seq}_S(A) < \text{seq}_S(B) \}$$
2. **1-Hop Interchange Search via Hubs ($1$ Transfer)**:
   $$\text{Hubs} = \{ \text{Farmgate, Shahbagh, Mirpur-10, Mohakhali, Kuril, Kakrail, Malibagh, Motijheel, Airport, GEC} \}$$
   For each $H \in \text{Hubs} \setminus \{A, B\}$:
   $$\text{Journey}(A \xrightarrow{S_1} H \xrightarrow{S_2} B) = \text{Direct}(A, H) \times \text{Direct}(H, B) \quad \text{where } S_1 \neq S_2$$
3. **Cost Aggregation**:
   $$\text{Total Fare} = \text{Fare}(A \xrightarrow{S_1} H) + \text{Fare}(H \xrightarrow{S_2} B)$$
   $$\text{Total Distance} = \text{Dist}(A \xrightarrow{S_1} H) + \text{Dist}(H \xrightarrow{S_2} B)$$

### 6.3 Pure Dart Solver Implementation (`transit_graph_solver.dart`)
```dart
import '../entities/transit_journey_entity.dart';
import '../entities/transit_service_entity.dart';
import '../entities/transit_stop_entity.dart';

class ServiceEdge {
  final TransitServiceEntity service;
  final TransitStopEntity fromStop;
  final TransitStopEntity toStop;
  final double distanceKm;
  final double fareAmount;
  final int travelTimeMinutes;

  ServiceEdge({
    required this.service,
    required this.fromStop,
    required this.toStop,
    required this.distanceKm,
    required this.fareAmount,
    required this.travelTimeMinutes,
  });
}

class TransitGraphSolver {
  List<TransitJourneyEntity> findJourneys({
    required String originStopId,
    required String destinationStopId,
    required Map<String, List<ServiceEdge>> directEdgesMap,
    required Set<String> interchangeHubStopIds,
  }) {
    final List<TransitJourneyEntity> journeys = [];

    // 1. Direct Journeys
    final directEdges = directEdgesMap['${originStopId}_$destinationStopId'] ?? [];
    for (final edge in directEdges) {
      journeys.add(TransitJourneyEntity(
        legs: [
          TransitLegEntity(
            service: edge.service,
            fromStop: edge.fromStop,
            toStop: edge.toStop,
            distanceKm: edge.distanceKm,
            fareAmount: edge.fareAmount,
            travelTimeMinutes: edge.travelTimeMinutes,
          )
        ],
        totalFare: edge.fareAmount,
        totalDistanceKm: edge.distanceKm,
        totalTravelTimeMinutes: edge.travelTimeMinutes,
        isDirect: true,
      ));
    }

    // 2. 1-Hop Interchange Journeys
    for (final hubId in interchangeHubStopIds) {
      if (hubId == originStopId || hubId == destinationStopId) continue;

      final leg1Edges = directEdgesMap['${originStopId}_$hubId'] ?? [];
      final leg2Edges = directEdgesMap['${hubId}_$destinationStopId'] ?? [];

      if (leg1Edges.isNotEmpty && leg2Edges.isNotEmpty) {
        for (final e1 in leg1Edges) {
          for (final e2 in leg2Edges) {
            // Avoid transfer to the exact same bus line
            if (e1.service.id == e2.service.id) continue;

            journeys.add(TransitJourneyEntity(
              legs: [
                TransitLegEntity(
                  service: e1.service,
                  fromStop: e1.fromStop,
                  toStop: e1.toStop,
                  distanceKm: e1.distanceKm,
                  fareAmount: e1.fareAmount,
                  travelTimeMinutes: e1.travelTimeMinutes,
                ),
                TransitLegEntity(
                  service: e2.service,
                  fromStop: e2.fromStop,
                  toStop: e2.toStop,
                  distanceKm: e2.distanceKm,
                  fareAmount: e2.fareAmount,
                  travelTimeMinutes: e2.travelTimeMinutes,
                ),
              ],
              totalFare: e1.fareAmount + e2.fareAmount,
              totalDistanceKm: e1.distanceKm + e2.distanceKm,
              totalTravelTimeMinutes: e1.travelTimeMinutes + e2.travelTimeMinutes + 5, // +5 min transfer
              isDirect: false,
              transferHubNameBn: e1.toStop.nameBn,
            ));
          }
        }
      }
    }

    // Sort: Direct first, then lowest fare, then shortest time
    journeys.sort((a, b) {
      if (a.isDirect != b.isDirect) return a.isDirect ? -1 : 1;
      final fareComp = a.totalFare.compareTo(b.totalFare);
      if (fareComp != 0) return fareComp;
      return a.totalTravelTimeMinutes.compareTo(b.totalTravelTimeMinutes);
    });

    return journeys;
  }
}
```

---

# 7. Dual-Layer Stop Model & BRTA Gazette Proof Mechanics

When a user selects an intermediate day-to-day stop (e.g. `ধানমন্ডি ৩২`), the app binds the stop to enclosing official BRTA gazette anchors:

```
[Official Gazette Milestone: আসাদগেট (Asad Gate)] ── ৳৪২
           │
           ▼ (350m down Mirpur Road)
[Real-World Stop: ধানমন্ডি ৩২ (Dhanmondi 32)] ───── ৳৪০ (Calculated Official Fare)
           │
           ▼ (400m down Mirpur Road)
[Official Gazette Milestone: সায়েন্স ল্যাব (Science Lab)] ── ৳৩৮
```

### 7.1 Gazette Proof Anchor Model (`gazette_proof_anchor.dart`)
```dart
class GazetteProofAnchor {
  final String prevGazetteStopNameBn;
  final double prevGazetteFare;
  final String nextGazetteStopNameBn;
  final double nextGazetteFare;
  final int gazettePdfPageNumber;
  final String gazettePdfUrl;

  GazetteProofAnchor({
    required this.prevGazetteStopNameBn,
    required this.prevGazetteFare,
    required this.nextGazetteStopNameBn,
    required this.nextGazetteFare,
    required this.gazettePdfPageNumber,
    required this.gazettePdfUrl,
  });
}
```

### 7.2 Presentation Card Proof Button
On the `TransitJourneyCard`:
- Displays: `📑 গেজেট রেফারেন্স: আসাদগেট (৳৪২) ও সায়েন্স ল্যাব (৳৩৮)-এর মধ্যবর্তী (পৃষ্ঠা ১২)`.
- Action: Tapping jumps directly to `PdfViewerScreen(pdfUrl: anchor.gazettePdfUrl, initialPage: anchor.gazettePdfPageNumber)`.

---

# 8. Domain, Data & Presentation Layer Code Blueprints

### 8.1 Domain Entities (`lib/features/fare_finder/domain/entities/`)
- `transit_service_entity.dart`: Encapsulates `id`, `nameBn`, `nameEn`, `vehicleType` (enum: `bus`, `metroRail`, `commuterTrain`), `brandColorHex`, `isAc`.
- `transit_leg_entity.dart`: Single hop with `service`, `fromStop`, `toStop`, `fareAmount`, `distanceKm`.
- `transit_journey_entity.dart`: Full itinerary with `List<TransitLegEntity> legs`, `totalFare`, `isDirect`.

### 8.2 Presentation State & Notifier (`transit_search_notifier.dart`)
```dart
enum TransitFilter { all, busOnly, metroPreferred, trainOnly }

@freezed
abstract class TransitSearchState with _$TransitSearchState {
  const factory TransitSearchState({
    @Default(false) bool isLoading,
    @Default(false) bool isCalculating,
    @Default(TransitFilter.all) TransitFilter filter,
    TransitStopEntity? selectedOrigin,
    TransitStopEntity? selectedDestination,
    @Default([]) List<TransitStopEntity> originSuggestions,
    @Default([]) List<TransitStopEntity> destinationSuggestions,
    @Default([]) List<TransitJourneyEntity> journeys,
    String? errorMessage,
  }) = _TransitSearchState;
}
```

---

# 9. Step-by-Step Phased TDD Implementation Roadmap

All code modifications must follow the strict step-by-step TDD cycle:

```
┌───────────┐     ┌───────────┐     ┌───────────┐     ┌───────────┐     ┌───────────┐
│  Step 1   │ ──> │  Step 2   │ ──> │  Step 3   │ ──> │  Step 4   │ ──> │  Step 5   │
│ Entities  │     │ Database  │     │ Graph     │     │ Contract  │     │ Data      │
│ & Models  │     │ & Schema  │     │ Solver    │     │ & UseCase │     │ Sources   │
└───────────┘     └───────────┘     └───────────┘     └───────────┘     └───────────┘
      │
      ▼
┌───────────┐     ┌───────────┐     ┌───────────┐     ┌───────────┐
│  Step 6   │ ──> │  Step 7   │ ──> │  Step 8   │ ──> │  Step 9   │
│ Riverpod  │     │ UI & Card │     │ Lite AI   │     │ Integrat. │
│ Providers │     │ Assembly  │     │ Assistant │     │ Test (0W) │
└───────────┘     └───────────┘     └───────────┘     └───────────┘
```

- **Step 1: Domain Entities & Models (TDD)**:
  - Write test: `test/features/fare_finder/domain/entities/transit_journey_entity_test.dart`.
  - Create entities and models with Freezed / JSON serialization.
- **Step 2: Database Schema & Migration (SQLite v4 & Supabase)**:
  - Add tables and migration scripts. Populate 60+ bus lines, MRT-6, and commuter trains.
- **Step 3: Graph Solver Engine (TDD)**:
  - Write test: `test/features/fare_finder/domain/services/transit_graph_solver_test.dart`.
  - Implement `TransitGraphSolver` in pure Dart.
- **Step 4: Repository Contracts & Use Cases (TDD)**:
  - Write test: `test/features/fare_finder/domain/usecases/get_transit_journeys_usecase_test.dart`.
  - Implement `GetTransitJourneysUseCase`.
- **Step 5: Local & Remote Data Sources (TDD)**:
  - Write test: `test/features/fare_finder/data/datasources/local_transit_data_source_test.dart`.
  - Implement SQLite graph edge queries, Supabase `ai_global_cache` integration, and update `DatabaseSyncService`.
- **Step 6: State Management (Riverpod - TDD)**:
  - Write test: `test/features/fare_finder/presentation/providers/transit_search_provider_test.dart`.
  - Implement `TransitSearchNotifier`.
- **Step 7: UI Assembly & Journey Cards**:
  - Implement `TransitModeFilterBar`, `TransitJourneyCard`, `GazetteProofAnchorTile`.
- **Step 8: Zero-Cost Lite AI Assistant with Global Community Caching**:
  - Implement `GeminiTransitAIService`, `LocalIntentParser`, Supabase `ai_global_cache` client, and local SQLite query cache.
- **Step 9: End-to-End Feature Flow Test & Zero-Warning Analysis**:
  - Execute `flutter test` and `dart analyze` to guarantee **0 warnings and 0 errors**.

---

# 10. Testing Matrix, Quality Gates & Zero-Warning Policy

### Quality Gates:
1. **100% Analysis Cleanliness**: Every Dart file must pass `dart analyze` with zero warnings, zero hints, and zero deprecations.
2. **Deterministic TDD**: All use cases and graph solvers verified with mock datasets.
3. **No Secret Leakage**: API keys stored strictly in `.env` files; no sensitive tokens in Git or logger output.
4. **Git Log Convention Matching**: All commits follow conventional commit messages (e.g. `feat(transit): ...`, `test(routing): ...`).

---

# 11. Timeline, Sprint Planning & Engineering Estimations

The complete Jatayat 2.0.0 engineering cycle is structured into **3 core sprints** with an estimated total execution time of **5.5 to 7.5 hours**:

```
┌────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ ⏱️ DETAILED TIME ESTIMATION BY STEP                                                                    │
├─────────┬──────────────────────────────────┬──────────────────────────────────────────┬────────────────┤
│ ধাপ     │ ফোকাস এরিয়া                      │ কাজের পরিধি (Scope & Deliverables)        │ আনুমানিক সময়   │
├─────────┼──────────────────────────────────┼──────────────────────────────────────────┼────────────────┤
│ Step 1  │ Domain Entities & Models (TDD)   │ TransitService, TransitLeg, Freezed gen  │ 35 – 45 মিনিট  │
│ Step 2  │ Database Schema & 60+ Bus Seed   │ SQLite v4, Supabase SQL, 60+ Bus + Metro │ 45 – 60 মিনিট  │
│ Step 3  │ Graph Traversal Engine (TDD)     │ Pure Dart TransitGraphSolver + Unit test │ 45 – 60 মিনিট  │
│ Step 4-5│ Repositories & SQLite DS (TDD)   │ LocalTransitDataSource & Sync Service    │ 45 – 60 মিনিট  │
│ Step 6  │ Riverpod State Notifier (TDD)    │ TransitSearchNotifier & State providers  │ 30 – 45 মিনিট  │
│ Step 7  │ UI Journey Cards & Filters       │ ModeFilterBar, TransitCards, GazetteTile │ 60 – 90 মিনিট  │
│ Step 8  │ Lite AI & Supabase Global Cache  │ Gemini AI Service, IntentParser, Cache   │ 50 – 70 মিনিট  │
│ Step 9  │ End-to-End Test & Zero Warnings  │ Integration test flow + dart analyze (0W)│ 30 – 45 মিনিট  │
├─────────┴──────────────────────────────────┴──────────────────────────────────────────┼────────────────┤
│ মোট প্রকল্প সময় (Total Project Duration)                                              │ ~5.5 - 7.5 ঘণ্টা│
└───────────────────────────────────────────────────────────────────────────────────────┴────────────────┘
```

### Sprint Delivery Milestones:
*   **Sprint 1: Transit Engine & Multi-Step Core (~3.0 Hours)**: Steps 1 to 5 (Working offline DB, 60+ bus lines, Metro Rail, graph interchange algorithm).
*   **Sprint 2: Commuter UI & Gazette Proofing (~2.0 Hours)**: Steps 6 and 7 (Modernized journey cards, filter chips, transfer timeline, PDF jump).
*   **Sprint 3: Zero-Cost Lite AI & Global Cache (~2.0 Hours)**: Steps 8 and 9 (Voice/text AI assistant, Supabase community cache, end-to-end integration tests).

---

# 12. Architectural Decision Records (ADRs), Design Patterns & Engineering Principles

To guarantee that any developer or agent understands **WHY** each architectural decision was made, here is the complete engineering principles, design patterns, and ADR mapping:

### 12.1 Design Patterns Applied

```
┌──────────────────────────────────────┬────────────────────────────────────────────────────────────────────────┐
│ Design Pattern                       │ Where It Is Applied & Why                                              │
├──────────────────────────────────────┼────────────────────────────────────────────────────────────────────────┤
│ 1. Repository Pattern                │ Decouples the domain use cases from underlying data sources            │
│                                      │ (`LocalTransitDataSource` vs `RemoteTransitDataSource`).               │
├──────────────────────────────────────┼────────────────────────────────────────────────────────────────────────┤
│ 2. Strategy Pattern                  │ Encapsulates different transit routing filters (`DirectOnlyStrategy`,  │
│                                      │ `InterchangeHubStrategy`, `MetroPreferredStrategy`).                   │
├──────────────────────────────────────┼────────────────────────────────────────────────────────────────────────┤
│ 3. Multi-Tier Proxy / Cache Pattern  │ Request pipeline: Tier 1 (Device SQLite) ➔ Tier 2 (Supabase Community) │
│                                      │ ➔ Tier 3 (Gemini Flash API). Guarantees sub-35ms speed & $0.00 cost.   │
├──────────────────────────────────────┼────────────────────────────────────────────────────────────────────────┤
│ 4. Command / Tool Calling Pattern    │ AI generates structured JSON tool arguments (`search_transit_route`),  │
│                                      │ executed deterministically by Dart engine to prevent hallucination.    │
├──────────────────────────────────────┼────────────────────────────────────────────────────────────────────────┤
│ 5. Functional Error Handling Pattern │ Wrap async repository return types in `Either<Failure, Success>`       │
│                                      │ (Dartz) rather than throwing unchecked runtime exceptions.             │
├──────────────────────────────────────┼────────────────────────────────────────────────────────────────────────┤
│ 6. Adapter / DTO Mapper Pattern      │ Explicit separation between raw SQLite/Supabase Map rows, Data Models  │
│                                      │ (`TransitServiceModel`), and pure Domain Entities.                     │
├──────────────────────────────────────┼────────────────────────────────────────────────────────────────────────┤
│ 7. Observer / Reactive State Pattern │ Riverpod `StateNotifierProvider` with fine-grained selectors           │
│                                      │ (`ref.watch(provider.select(...))`) to prevent unnecessary UI rebuilds.│
└──────────────────────────────────────┴────────────────────────────────────────────────────────────────────────┘
```

### 12.2 SOLID Principles & Clean Architecture Enforcement

*   **Single Responsibility Principle (SRP)**:
    - UI widgets are strictly presentational. Zero math, zero API calls, and zero database mutations occur in widget `build()` methods.
    - `TransitGraphSolver` does ONLY mathematical graph traversal; it does not know about SQLite, HTTP, or Flutter.
*   **Open / Closed Principle (OCP)**:
    - New transportation modes (e.g. Water Bus / BIWTC Launch / BRT Line-3) can be introduced by creating a new `vehicle_type` without modifying the core graph solver algorithm.
*   **Liskov Substitution Principle (LSP)**:
    - `LocalTransitDataSource` and `RemoteTransitDataSource` honor the exact same contract signatures interchangeably.
*   **Interface Segregation Principle (ISP)**:
    - Dedicated, focused contracts: `TransitRepository` (routing & fares), `AIRepository` (intent parsing & caching), and `SettingsRepository` (preferences).
*   **Dependency Inversion Principle (DIP)**:
    - High-level domain use cases (`GetTransitJourneysUseCase`) depend solely on abstract repository interfaces (`TransitRepository`), not on concrete SQLite or Supabase database classes.

### 12.3 Algorithms & Data Structures Employed

1. **Adjacency Hash Map Graph ($O(1)$ Edge Lookups)**:
   - Key: `"${fromStopId}_${toStopId}"` ➔ Value: `List<ServiceEdge>`.
   - Allows instant constant-time lookup of all transit operators running between two stops.
2. **Bi-Directional Hub-Intersection Solver ($O(V_{hubs} \cdot (\text{deg}(u) + \text{deg}(v)))$)**:
   - Evaluates the 10 core transit interchange hubs of Dhaka/CTG (*Farmgate, Shahbagh, Mirpur-10, Mohakhali, Kuril, Kakrail, Malibagh, Motijheel, Airport, GEC*).
   - Solves multi-step journeys in **<15ms** on mobile hardware.
3. **Euclidean Angle & Spatial Pruning Algorithm**:
   - Prunes detour loops where $\text{Dist}(A, H) + \text{Dist}(H, B) > 1.8 \times \text{EuclideanDist}(A, B)$.
4. **Deterministic Fare Bounding Function**:
   $$F_{calculated} = \max(D \times R_{base}, F_{min}) \quad \text{such that} \quad F_{prev\_gazette} \le F_{calculated} \le F_{next\_gazette}$$

### 12.4 Architecture Decision Records (ADRs)

#### 📝 ADR-001: SQLite Local-First Cache + Supabase Delta Sync
*   **Context**: Dhaka commuters frequently travel in basements, dense crowds, and inside metal bus bodies where cellular 4G is unstable or drops completely.
*   **Decision**: Store all stops, bus lines, metro stations, and fare charts in a local SQLite database (`jatayat.db`). Supabase is used strictly for asynchronous delta updates.
*   **Trade-off**: Requires ~3 MB of phone storage.
*   **Consequence**: Sub-50ms instant searches with **100% offline uptime** and **$0 cloud egress cost**.

#### 📝 ADR-002: Pure Dart In-Memory Graph Traversal vs. SQL Recursive CTEs
*   **Context**: Multi-step routing can be solved either via complex recursive SQLite queries (`WITH RECURSIVE`) or in pure Dart memory.
*   **Decision**: Load transit edges into an in-memory adjacency list in pure Dart and solve transfers using `TransitGraphSolver`.
*   **Trade-off**: Memory footprint ~2 MB in RAM.
*   **Consequence**: Execution is 5x faster (<15ms), eliminates SQLite thread locks, and allows 100% pure Dart unit testing without mocking databases.

#### 📝 ADR-003: Deterministic Hybrid AI Tool-Calling vs. Raw LLM Generation
*   **Context**: Large Language Models (LLMs) hallucinate nonexistent bus routes, incorrect fare numbers, and outdated routes.
*   **Decision**: The AI acts purely as an Intent & Entity Extractor calling the `search_transit_route` tool. All routes and fares are computed by the deterministic Dart graph engine.
*   **Trade-off**: Requires two-step processing when calling Gemini API.
*   **Consequence**: Guarantees **100% factual and legal BRTA accuracy**, zero hallucinations, and cuts LLM token payload by 90%.

#### 📝 ADR-004: Dual-Layer Stop Model (Colloquial Stops + Gazette Milestone Anchors)
*   **Context**: Commuters search for colloquial stops (*"Dhanmondi 32"*, *"Badda Link Road"*), while legal fare disputes require official BRTA gazette milestones.
*   **Decision**: Maintain real-world stops as primary search entities, while linking each to its enclosing `prev_gazette_stop_id` and `next_gazette_stop_id`.
*   **Trade-off**: Additional relational metadata in `stops` table.
*   **Consequence**: 100% natural commuter search usability while retaining 1-tap jump to scanned BRTA gazette PDF proofs.

---
*End of Master Technical Specification for Jatayat 2.0.0.*
