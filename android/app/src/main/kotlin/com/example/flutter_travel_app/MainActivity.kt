package com.example.flutter_travel_app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("13479c75-c4ba-456c-b377-449d4f1f5da2")
        MapKitFactory.initialize(context)
        super.configureFlutterEngine(flutterEngine)
    }
}

