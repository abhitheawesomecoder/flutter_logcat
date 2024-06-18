package com.calsob.flutter_logcat

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterLogcatPlugin */
class FlutterLogcatPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_logcat")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "log") {
            val tag = call.argument<Any>("tag").toString()
            val message = call.argument<Any>("message").toString()
            val type = call.argument<Any>("type").toString()
            when (type) {
                "d" -> android.util.Log.d(tag, message)
                "w" -> android.util.Log.w(tag, message)
                "v" -> android.util.Log.v(tag, message)
                "e" -> android.util.Log.e(tag, message)
                "i" -> android.util.Log.i(tag, message)
                else -> android.util.Log.d(tag, message)
            }
            result.success("Success")
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
