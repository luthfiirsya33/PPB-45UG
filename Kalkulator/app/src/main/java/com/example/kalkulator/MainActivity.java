package com.example.kalkulator;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    EditText angk1,angk2;
    TextView hasilnya;
    Button tmbltambah;
    Button tmblkurang;
    Button tmblkali;
    Button tmblbagi;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        angk1=(EditText) findViewById(R.id.angka1);
        angk2=(EditText) findViewById(R.id.angka2);
        hasilnya=(TextView) findViewById(R.id.hasilhitung);
        tmbltambah=(Button)findViewById(R.id.tblTambah);
        tmblkurang=(Button)findViewById(R.id.tblKurang);
        tmblkali=(Button)findViewById(R.id.tblKali);
        tmblbagi=(Button)findViewById(R.id.tblBagi);

        tmbltambah.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                int a1=Integer.parseInt(angk1.getText().toString());
                int a2=Integer.parseInt(angk2.getText().toString());
                Integer hasil=a1+a2;
                hasilnya.setText(hasil.toString());
            }
        });
        tmblkurang.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                int a1=Integer.parseInt(angk1.getText().toString());
                int a2=Integer.parseInt(angk2.getText().toString());
                Integer hasil=a1-a2;
                hasilnya.setText(hasil.toString());
            }
        });
        tmblkali.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                int a1=Integer.parseInt(angk1.getText().toString());
                int a2=Integer.parseInt(angk2.getText().toString());
                Integer hasil=a1*a2;
                hasilnya.setText(hasil.toString());
            }
        });
        tmblbagi.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                int a1=Integer.parseInt(angk1.getText().toString());
                int a2=Integer.parseInt(angk2.getText().toString());
                Integer hasil=a1/a2;
                hasilnya.setText(hasil.toString());
            }
        });
    }


}