package ru.job4j.forum.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;
import ru.job4j.forum.model.Post;
import ru.job4j.forum.model.User;
import ru.job4j.forum.service.PostService;
import ru.job4j.forum.service.UserService;

@Component
public class InitDataDB implements ApplicationRunner {

    @Autowired
    private PostService postService;

    @Autowired
    private UserService userService;

    public void run(ApplicationArguments args) {
        User user = new User();
        user.setId(1);
        user.setName("user");
        user.setPassword("12345");
        userService.save(user);

        Post post = new Post();
        post.setId(1);
        post.setName("Продам ладу");
        post.setDesc("Не бита, не крашена");
        post.setAuthor(user);
        postService.save(post);
    }
}
