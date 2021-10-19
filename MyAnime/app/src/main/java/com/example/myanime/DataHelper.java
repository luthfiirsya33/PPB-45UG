package com.example.myanime;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;


public class DataHelper extends SQLiteOpenHelper {
    public static final String DATABASE_NAME = "anime.db";
    public static final String TABLE_NAME = "anime_table";
    public static final String COL_1 = "ID";
    public static final String COL_2 = "TITLE";
    public static final String COL_3 = "MC";
    public static final String COL_4 = "HEROINE";
    public static final String COL_5 = "GENRE";
    public static final String COL_6 = "YEAR";

    public DataHelper(Context context){
        super(context, DATABASE_NAME,null,1);
        SQLiteDatabase db = this.getWritableDatabase();
    }
    @Override
    public void onCreate(SQLiteDatabase db){
        db.execSQL("create table anime_table(ID INTEGER PRIMARY KEY AUTOINCREMENT,TITLE TEXT, MC TEXT, HEROINE TEXT, GENRE TEXT, YEAR TEXT)");


    }
    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion){
        db.execSQL("DROP TABLE IF EXISTS "+TABLE_NAME);
        onCreate(db);
    }
    public boolean insertData(String title, String mc,String heroine, String genre, String year){
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put(COL_2, title);
        contentValues.put(COL_3, mc);
        contentValues.put(COL_4, heroine);
        contentValues.put(COL_5, genre);
        contentValues.put(COL_6, year);
        long result = db.insert(TABLE_NAME, null, contentValues);
        if(result == -1)
            return false;
        else
            return true;
    }
    public Cursor getAllData() {
        SQLiteDatabase db = this.getWritableDatabase();
        Cursor res = db.rawQuery("select * from "+TABLE_NAME,null);
        return res;
    }
    public boolean updateData(String id,String title,String mc,String heroine, String genre, String year) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put(COL_1,id);
        contentValues.put(COL_2,title);
        contentValues.put(COL_3,mc);
        contentValues.put(COL_4,heroine);
        contentValues.put(COL_5,genre);
        contentValues.put(COL_6,year);
        db.update(TABLE_NAME, contentValues, "ID = ?",new String[] { id });
        return true;
    }

    public Integer deleteData (String id) {
        SQLiteDatabase db = this.getWritableDatabase();
        return db.delete(TABLE_NAME, "ID = ?",new String[] {id});
    }
}
