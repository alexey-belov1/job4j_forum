package ru.job4j.forum.control;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.job4j.forum.model.User;
import ru.job4j.forum.service.UserService;

@Controller
public class RegControl {

    UserService users;

    public RegControl(UserService users) {
        this.users = users;
    }

    @GetMapping("/reg")
    public String regPage(@RequestParam(required = false) String error,
                            Model model) {
        String errorMessage = null;
        if (error != null) {
            errorMessage = "Пользователь с данным именем уже существует";
        }
        model.addAttribute("errorMessage", errorMessage);
        return "reg";
    }

    @PostMapping("/reg/create")
    public String createUser(@ModelAttribute User user) {
        if (users.findByName(user.getName()) != null) {
            return "redirect:/reg?error=true";
        }
        users.save(user);
        return "redirect:/login";
    }
}