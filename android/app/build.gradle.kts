plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.magic.lantern"
    compileSdkVersion(34) // ترقية نسخة الـ SDK لإطلاق رادار تتبع الكباتن حياً

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    defaultConfig {
        applicationId = "com.magic.lantern"
        minSdkVersion(21) // متوافق تماماً مع حزم Google Maps
        targetSdkVersion(34)
        versionCode = 1
        versionName = "1.0.0"
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("debug")
            minifyEnabled = false
            shrinkResources = false
        }
    }
}

flutter {
    source = "../.."
}
