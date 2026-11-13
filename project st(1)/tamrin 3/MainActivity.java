package com.example.studentapp;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        EditText nameInput = findViewById(R.id.nameInput);
        Button showButton = findViewById(R.id.showButton);

        showButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String name = nameInput.getText().toString().trim();

                if (name.isEmpty()) {
                    nameInput.setError("لطفاً نام را وارد کنید");
                } else {
                    Toast.makeText(
                        MainActivity.this,
                        "سلام " + name,
                        Toast.LENGTH_SHORT
                    ).show();
                }
            }
        });
    }
}
