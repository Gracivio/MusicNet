package com.example.imusicweb.database;

import java.io.Serializable;

public class ListSong implements Serializable {
    private Integer id;
    private int song_id;
    private int songList_id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getSong_id() {
        return song_id;
    }

    public void setSong_id(int song_id) {
        this.song_id = song_id;
    }

    public int getSongList_id() {
        return songList_id;
    }

    public void setSongList_id(int songList_id) {
        this.songList_id = songList_id;
    }
}
