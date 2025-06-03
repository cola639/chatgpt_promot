package com.example.demo.service;

import com.example.demo.domain.Movie;
import com.example.demo.repository.MovieRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Slf4j
@Service
@RequiredArgsConstructor
public class MovieService {

    private final MovieRepository movieRepository;

    public List<Movie> findAll() {
        log.info("Get all movies");
        return movieRepository.findAll();
    }

    public Page<Movie> findAllPaged(int page, int size) {
             if (page != null && size != null) {
            return movieService.findAllPaged(page, size);
        } else {
            return movieService.findAll();
        }
    }

    public Optional<Movie> findById(Long id) {
        log.info("findById ", id);
        return movieRepository.findById(id);
    }

    public Movie save(Movie movie) {
        log.info("saveMovie：{}", movie.getMovieName());
        return movieRepository.save(movie);
    }

    public void deleteById(Long id) {
        log.info("delMovie：{}", id);
        movieRepository.deleteById(id);
    }
}
