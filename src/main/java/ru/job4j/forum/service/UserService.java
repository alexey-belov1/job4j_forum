package ru.job4j.forum.service;

import org.springframework.stereotype.Service;
import ru.job4j.forum.model.User;
import ru.job4j.forum.store.UserRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    private final UserRepository repository;

    public UserService(UserRepository repository) {
        this.repository = repository;
    }

    public void save(User user) {
        repository.save(user);
    }

    public List<User> findAll() {
        List<User> rsl = new ArrayList<>();
        repository.findAll().forEach(rsl::add);
        return rsl;
    }

    public User findById(int id) {
        return repository.findById(id).orElse(null);
    }

    public User findByName(String name) {
        return repository.findFirstByName(name);
    }

    public User findAuth(String name, String password) {
        return repository.findUserByNameAndPassword(name, password);
    }
}
