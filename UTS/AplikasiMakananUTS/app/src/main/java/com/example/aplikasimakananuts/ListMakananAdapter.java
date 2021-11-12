package com.example.aplikasimakananuts;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class ListMakananAdapter extends RecyclerView.Adapter<ListMakananAdapter.ListViewHolder>{
    private ArrayList<Makanan> listMakanan;

    private OnItemClickCallback onItemClickCallback;
    public void setOnItemClickCallback(OnItemClickCallback onItemClickCallback){
        this.onItemClickCallback = onItemClickCallback;
    }


    public ListMakananAdapter(ArrayList<Makanan> list){
        this.listMakanan = list;
    }
    @NonNull
    @Override
    public ListViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_makanan, parent, false);
        return new ListViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ListViewHolder holder, int position) {
        Makanan makanan = listMakanan.get(position);
//        Glide.with(holder.itemView.getContext())
//                .load(Makanan.getPhoto())
//                .apply(new RequestOptions().override(60,60))
//                .into(holder.imgPhoto);
        holder.imgPhoto.setImageResource(makanan.getPhoto());
        holder.tvName.setText(makanan.getNama());
        holder.tvDetail.setText(makanan.getHarga());
        holder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                onItemClickCallback.onItemClicked(listMakanan.get(holder.getAdapterPosition()));
            }
        });

    }

    @Override
    public int getItemCount() {
        return listMakanan.size();
    }


    public class ListViewHolder extends RecyclerView.ViewHolder {
        ImageView imgPhoto;
        TextView tvName;
        TextView tvDetail;
        ListViewHolder(View itemview) {
            super(itemview);
            imgPhoto = itemview.findViewById(R.id.img_item_mkn);
            tvName = itemview.findViewById(R.id.mkn_item_name);
            tvDetail = itemview.findViewById(R.id.mkn_item_detail);
        }
    }
    public interface OnItemClickCallback {
        void onItemClicked(Makanan data);
    }
}
