package ru.job4j.forum.service;

import org.springframework.stereotype.Service;
import ru.job4j.forum.model.User;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;

@Service
public class UserService {

    private final List<User> users = new ArrayList<>();

    private int lastId = 0;

    public UserService() {
        User user = new User();
        user.setName("user");
        user.setPassword("12345");
        save(user);
    }

    public void save(User user) {
        if (user.getId() == 0) {
            create(user);
        } else {
            update(user);
        }
    }

    private void create(User user) {
        user.setId(++lastId);
        users.add(user);
    }

    private void update(User user) {
        int id = users.indexOf(user);
        if (id != -1) {
            users.set(id, user);
        }
    }

    public List<User> findAll() {
        return users;
    }

    public User findById(int id) {
        return findUnique(user -> user.getId() == id);
    }

    public User findByName(String name) {
        return findUnique(user -> user.getName().equals(name));
    }

    public User findAuth(String name, String password) {
        return findUnique(user -> user.getName().equals(name) && user.getPassword().equals(password));
    }

    private User findUnique(Predicate<User> filter) {
        return users.stream()
                .filter(filter)
                .findFirst()
                .orElse(null);
    }
}
