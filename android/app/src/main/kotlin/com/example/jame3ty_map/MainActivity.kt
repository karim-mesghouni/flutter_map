package com.example.jame3ty_map

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

    val ints = mapOf("" to 1,"" to 2,"" to 3)

    fun kf():List<String>{
        return ints.map {
            it.toString()
        }
    }
}
