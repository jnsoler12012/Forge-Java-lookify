package com.nicolas.lookify.repository;

import com.nicolas.lookify.models.Song;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SongRepository extends CrudRepository<Song, Long> {
    List<Song> findAll();

    @Query(value = "SELECT * FROM songs where title like %:songTitle%",nativeQuery = true)
    List<Song> findSongsBySongTitle(String songTitle);

    List<Song> findByTitleContaining(String title);

    List<Song> findByArtistContaining(String artist);
    
}
