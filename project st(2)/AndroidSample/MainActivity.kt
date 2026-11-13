package com.example.kotlinbutton

import android.app.Activity
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.Toast

class MainActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val button: Button = findViewById(R.id.showButton)
        button.setOnClickListener {
            Toast.makeText(
                this,
                "سلام! به برنامه خوش آمدید.",
                Toast.LENGTH_SHORT
            ).show()
        }
    }
}
