package com.nicolas.lookify.controllers;

import com.nicolas.lookify.models.Song;
import com.nicolas.lookify.services.SongService;

import jakarta.validation.Valid;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @Autowired
    SongService songService;

    public HomeController(SongService songService) {
        this.songService = songService;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String dashboard(Model model, Song song) {
        model.addAttribute("songs", songService.allSongs());
        return "dashboard";
    }

    @RequestMapping(value = "/songs/new", method = RequestMethod.GET)
    public String newSong(Model model, Song song) {
        return "newSong";
    }

    @RequestMapping(value = "/songs/new", method = RequestMethod.POST)
    public String newSongPost(@Valid @ModelAttribute("song") Song song, BindingResult result) {
        if (result.hasErrors()) {
            return "newSong";
        } else {
            songService.createSong(song);
            return "redirect:/dashboard";
        }
    }

    @RequestMapping(value = { "/search/{artist}" }, method = RequestMethod.GET)
    public String songsByArtistGet(@PathVariable String artist, Model model) {
        model.addAttribute("songs", songService.songsByArtist(artist));
        model.addAttribute("artist", artist);
        return "artistSongs";
    }

    @RequestMapping(value = { "/search" }, method = RequestMethod.POST)
    public String songsByArtist(@RequestParam Optional<String> artist, Model model) {
        model.addAttribute("songs", songService.songsByArtist(artist.get()));
        model.addAttribute("artist", artist.get());
        return "artistSongs";
    }

    @RequestMapping(value = { "/search/topTen" }, method = RequestMethod.GET)
    public String searchTopTen(Model model) {
        List<Song> listSong = songService.allSongs();
        Collections.sort(listSong);

        List<Song> listSongTen = new ArrayList<Song>();

        for (int x = 0; x < 10; x++) {
            try {
                listSongTen.add(listSong.get(x));
            } catch (Exception e) {
                break;
            }

        }
        model.addAttribute("songs", listSongTen);

        return "topTen";
    }

    @RequestMapping(value = { "/songs/{id}" }, method = RequestMethod.GET)
    public String songById(@PathVariable Long id, Model model) {
        Optional<Song> song = songService.songById(id);
        if (song.isPresent()) {
            model.addAttribute("song", song.get());

            return "songPage";
        } else {
            return "redirect:/dashboard";
        }

    }

    @RequestMapping(value = { "/delete/{id}" }, method = RequestMethod.DELETE)
    public String deleteById(@PathVariable Long id, Model model) {
        songService.deleteById(id);
        return "redirect:/dashboard";
    }

}
