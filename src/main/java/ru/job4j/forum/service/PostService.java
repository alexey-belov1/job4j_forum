package ru.job4j.forum.service;

import org.springframework.stereotype.Service;
import ru.job4j.forum.model.Post;
import ru.job4j.forum.store.PostRepository;

import java.util.*;

@Service
public class PostService {

    private final PostRepository repository;

    public PostService(PostRepository posts) {
        this.repository = posts;
    }

    public void save(Post post) {
        repository.save(post);
    }

    public void updateNameDesc(Post post) {
        repository.updateNameDesc(post.getId(), post.getName(), post.getDesc());
    }

    public List<Post> findAll() {
        List<Post> rsl = new ArrayList<>();
        repository.findAll().forEach(rsl::add);
        return rsl;
    }

    public Post findById(int id) {
        return repository.findById(id).orElse(null);
    }
}