package com.example.aplikasimakananuts;

import java.util.ArrayList;

public class MakananData {
    private static String[] namaMkn = {
            "Ayam Geprek Mozarella",
            "Mie Goreng",
            "Nasi Capcay",
            "Nasi Goreng",
            "Nasi Pecel",

    };

    private static String[] detailMkn = {
            "Ayam Geprek dengan lapisan keju mozarella lembut",
            "Mie Goreng enak sekali...",
            "Nasi Capcay seafood dengan udang yang wow ",
            "Nasi Goreng Maknyuss dengan rasa bumbu khas jawa",
            "Nasi Pecel khas jawa timur pedasnya gile...",

    };

    private static String[] hargaMkn = {
            "Rp 28.000,00",
            "Rp 22.000,00",
            "Rp 25.000,00",
            "Rp 30.000,00",
            "Rp 18.000,00",
    };

    private static int[] imageMkn = {
            R.drawable.ayamgeprek,
            R.drawable.miegor,
            R.drawable.nascap,
            R.drawable.nasgor,
            R.drawable.nasipecel,

    };

    static ArrayList<Makanan> getListData(){
        ArrayList<Makanan> list = new ArrayList<>();
        for (int position = 0; position <namaMkn.length; position++){
            Makanan makanan = new Makanan();
            makanan.setNama(namaMkn[position]);
            makanan.setDetail(detailMkn[position]);
            makanan.setHarga(hargaMkn[position]);
            makanan.setPhoto(imageMkn[position]);
            list.add(makanan);
        }
        return list;
    }
}
