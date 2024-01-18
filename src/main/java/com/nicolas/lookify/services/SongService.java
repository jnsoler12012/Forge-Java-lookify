package com.nicolas.lookify.services;

import com.nicolas.lookify.models.Song;
import com.nicolas.lookify.repository.SongRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SongService {

    @Autowired SongRepository songRepository;

    public List<Song> allSongs(){
        return songRepository.findAll();
    }

    public void createSong(Song song){
        songRepository.save(song);
    }

    public List<Song> songsByArtist(String artist){
        return songRepository.findByArtistContaining(artist);
    }

    public Optional<Song> songById(Long id){
        return songRepository.findById(id);
    }

    public void deleteById(Long id){
        songRepository.deleteById(id);
    }
}
