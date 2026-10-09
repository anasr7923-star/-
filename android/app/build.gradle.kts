pluginManagement {
    val flutterSdkPath = provider {
        val properties = java.util.Properties()
        val propertiesFile = settingsDir.parentFile.resolve("local.properties")
        if (propertiesFile.exists()) {
            propertiesFile.inputStream().use { properties.load(it) }
        }
        val sdkPath = properties.getProperty("flutter.sdk") ?: System.getenv("FLUTTER_ROOT")
        requireNotNull(sdkPath) { "Flutter SDK not found. Define flutter.sdk in local.properties or FLUTTER_ROOT env variable." }
        sdkPath
    }

    includeBuild("${flutterSdkPath.get()}/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.1.0" apply false
    id("org.jetbrains.kotlin.android") version "1.8.22" apply false
}

include(":app")
