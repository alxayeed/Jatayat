# Flutter Play Store Split / Deferred Components (Fixes the R8 error)
-dontwarn com.google.android.play.core.**
-keep class com.google.android.play.core.** { *; }

# General Flutter & Android keep rules
-keep class io.flutter.embedding.engine.deferredcomponents.** { *; }
-dontwarn io.flutter.embedding.engine.deferredcomponents.**

# Supabase / Postgrest / Serialization (Crucial for your data)
-keepattributes Signature,Annotation,EnclosingMethod
-keep class com.supabase.** { *; }
-dontwarn com.supabase.**

# If you use JSON serialization (Freezed/json_serializable)
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}