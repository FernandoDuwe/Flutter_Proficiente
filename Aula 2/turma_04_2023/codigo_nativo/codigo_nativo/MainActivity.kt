package com.example.codigo_nativo

import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "codigo_nativo").setMethodCallHandler {
                call, result ->
            if (call.method == "retornarMensagem")
                result.success("Olá, do Nativo Kotlin!")

            if (call.method == "nivelBateria")
                result.success(getBatteryLevel(context))
        }
    }

    private fun getBatteryLevel(context: Context): Double {
        return if (VERSION.SDK_INT >= 21) {
            val bm = context.getSystemService(BATTERY_SERVICE) as BatteryManager
            bm.getLongProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY).toDouble()

        } else {
            val iFilter = IntentFilter(Intent.ACTION_BATTERY_CHANGED)
            val batteryStatus: Intent? = context.registerReceiver(null, iFilter)
            val level = batteryStatus?.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
            val scale = batteryStatus?.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
            val batteryPct = level!! / scale!!.toDouble()
            (batteryPct * 100).toDouble()
        }
    }
}