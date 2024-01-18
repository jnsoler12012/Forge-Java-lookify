package com.nicolas.lookify.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "songs")
public class Song extends ModelBase implements Comparable<Song>{
    @Size(min = 5)
    private String title;

    @Size(min = 5)
    private String artist;
 
    @Min(value = 1)
    @Max(value = 10)
    private Long rating;

    public Song() {
    }

    public Song(@Size(min = 5) String title, @Size(min = 5) String artist, @Min(1) @Max(10) Long rating) {
        this.title = title;
        this.artist = artist;
        this.rating = rating;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public Long getRating() {
        return rating;
    }

    public void setRating(Long rating) {
        this.rating = rating;
    }

    @Override
    public int compareTo(Song songCompare) {
        // TODO Auto-generated method stub
        Long compareSong = ((Song)songCompare).getRating();

        return (int) (compareSong - this.rating);
    }

    
}
