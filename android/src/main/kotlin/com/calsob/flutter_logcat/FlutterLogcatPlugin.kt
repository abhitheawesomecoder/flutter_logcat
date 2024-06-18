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
//        if (call.method == "getPlatformVersion") {
//            android.util.Log.d("call_argument", call.arguments.toString())
//            val arg1 = call.argument<Any>("arg1").toString()
//            val arg2 = call.argument<Any>("arg2").toString()
//            val arg3 = call.argument<Any>("arg3").toString()
//            android.util.Log.d(arg1, "onMethodCall: ")
//            android.util.Log.e(arg2, "onMethodCall: ")
//            android.util.Log.w(arg3, "onMethodCall: ")
//            android.util.Log.i(arg1, "onMethodCall: ")
//            android.util.Log.v(arg2, "onMethodCall: ")
//            val red = "\u001b[31m"
//            val reset = "\u001b[0m"
//            println(red + "Hello World!" + reset)
//
//            result.success("Android ${android.os.Build.VERSION.RELEASE}")
//        } else {
//            result.notImplemented()
//        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
