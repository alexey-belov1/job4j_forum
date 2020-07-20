package ru.job4j.forum.control;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.job4j.forum.model.Message;
import ru.job4j.forum.model.Post;
import ru.job4j.forum.model.User;
import ru.job4j.forum.service.MessageService;
import ru.job4j.forum.service.PostService;
import ru.job4j.forum.service.UserService;

import java.util.GregorianCalendar;

@Controller
public class EditControl {

    UserService users;
    PostService posts;
    MessageService messages;

    public EditControl(UserService users, PostService posts, MessageService messages) {
        this.users = users;
        this.posts = posts;
        this.messages = messages;
    }

    @GetMapping("/post/edit")
    public String editPage(HttpServletRequest request,
                           @RequestParam(required = false) Integer postId,
                           Model model) {
        if (postId != null) {
            User user = (User) request.getSession().getAttribute("user");
            Post post = posts.findById(postId);
            if (post == null || post.getAuthor().getId() != user.getId()) {
                return "redirect:/index";
            }
            model.addAttribute("post", post);
        }
        return "post/edit";
    }

    @PostMapping("/post/create")
    public String createPost(HttpServletRequest request, @ModelAttribute Post post) {
        if (post.getId() != 0)  {
            posts.updateNameDesc(post);
        } else {
            post.setAuthor((User) request.getSession().getAttribute("user"));
            post.setCreated(GregorianCalendar.getInstance());
            posts.save(post);
        }
        return "redirect:/index";
    }
}