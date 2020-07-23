package ru.job4j.forum.control;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.job4j.forum.model.Message;
import ru.job4j.forum.model.User;
import ru.job4j.forum.service.MessageService;
import ru.job4j.forum.service.PostService;
import ru.job4j.forum.service.UserService;

import java.util.GregorianCalendar;

@Controller
public class PostControl {

    UserService users;
    PostService posts;
    MessageService messages;

    public PostControl(UserService users, PostService posts, MessageService messages) {
        this.users = users;
        this.posts = posts;
        this.messages = messages;
    }

    @GetMapping("/post")
    public String postPage(@RequestParam int postId, Model model) {
        model.addAttribute("post", posts.findById(postId));
        return "post";
    }

    @PostMapping("/message/create")
    public String createMessage(@ModelAttribute Message message,
                        @RequestParam int postId,
                        HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        message.setAuthor(user);
        message.setCreated(GregorianCalendar.getInstance());
        message.setPost(posts.findById(postId));
        messages.save(message);
        return "redirect:/post?postId=" + postId;
    }
}