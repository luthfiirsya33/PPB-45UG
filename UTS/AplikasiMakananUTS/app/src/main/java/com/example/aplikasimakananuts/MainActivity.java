package com.example.aplikasimakananuts;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    private RecyclerView rvMakanan;
    private ArrayList<Makanan> list = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        rvMakanan = findViewById(R.id.rv_makanan);
        rvMakanan.setHasFixedSize(true);

        list.addAll(MakananData.getListData());
        showRecyclerList();
    }
    private void showRecyclerList(){
        rvMakanan.setLayoutManager(new LinearLayoutManager(this));
        ListMakananAdapter listMakananAdapter = new ListMakananAdapter(list);
        rvMakanan.setAdapter(listMakananAdapter);

        listMakananAdapter.setOnItemClickCallback(new ListMakananAdapter.OnItemClickCallback(){
            @Override
            public void onItemClicked(Makanan makanan){
                showSelectedMakanan(makanan);
                Intent moveIntent = new Intent(MainActivity.this, DetailMakananActivity.class);
                moveIntent.putExtra(DetailMakananActivity.ITEM_EXTRA, makanan);
                startActivity(moveIntent);
            }
        });
    }
    private void showSelectedMakanan(Makanan makanan){
        Toast.makeText(this, "Anda Memesan "+makanan.getNama(), Toast.LENGTH_SHORT).show();
    }
}