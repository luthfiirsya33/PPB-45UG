package com.example.cobaproject2;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    TextView angkaKounter;
    int angka =0;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        angkaKounter=findViewById(R.id.kounter);
    }

    public void toastklik(View view) {
        Toast.makeText(this, "Ini Adalah Toast", Toast.LENGTH_SHORT).show();
    }

    public void counterklik(View view) {
        angka=angka+1;
        angkaKounter.setText(Integer.toString(angka));
    }
}