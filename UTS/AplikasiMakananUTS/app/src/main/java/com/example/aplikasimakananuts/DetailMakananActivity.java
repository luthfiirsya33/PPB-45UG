package com.example.aplikasimakananuts;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.TextView;

public class DetailMakananActivity extends AppCompatActivity {
    public static final String ITEM_EXTRA = "item_extra";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail_makanan);

        //ImageView imgMakanan = findViewById(R.id.imgMakanan);
        TextView tvMknName = findViewById(R.id.tvMknName);
        TextView tvMknDetail = findViewById(R.id.tvMknDetail);
        TextView tvMknHarga = findViewById(R.id.tvMknHarga);

        Makanan makanan = getIntent().getParcelableExtra(ITEM_EXTRA);
        if (makanan != null) {
//            Glide.with(this)
//                    .load(Makanan.getPhoto())
//                    .into(imgMakanan);
            //imgMakanan.setImageResource(makanan.getPhoto());
            tvMknName.setText(makanan.getNama());
            tvMknDetail.setText(makanan.getDetail());
            tvMknHarga.setText(makanan.getHarga());
        }
        if (getSupportActionBar() != null) {
            getSupportActionBar().setTitle("Detail Makanan");
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        }
    }
    @Override
    public boolean onSupportNavigateUp(){
        finish();
        return true;
    }

}