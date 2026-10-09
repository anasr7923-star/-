pluginManagement {
    def flutterSdkPath = {
        def properties = new Properties()
        def propertiesFile = settingsDir.parentFile.resolve("local.properties")
        if (propertiesFile.exists()) {
            propertiesFile.withReader("UTF-8") { reader -> properties.load(reader) }
        }
        def sdkPath = properties.getProperty("flutter.sdk")
        if (sdkPath == null) {
            sdkPath = System.getenv("FLUTTER_ROOT")
        }
        if (sdkPath == null) {
            throw new GradleException("Flutter SDK not found. Define flutter.sdk in local.properties or FLUTTER_ROOT env variable.")
        }
        return sdkPath
    }()

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id "dev.flutter.flutter-plugin-loader" version "1.0.0"
    id "com.android.application" version "8.1.0" apply false
    id "org.jetbrains.kotlin.android" version "1.8.22" apply false
}

include ":app"
