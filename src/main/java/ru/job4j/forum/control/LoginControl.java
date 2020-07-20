package ru.job4j.forum.control;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.job4j.forum.model.User;
import ru.job4j.forum.service.UserService;

@Controller
public class LoginControl {

    UserService users;

    public LoginControl(UserService users) {
        this.users = users;
    }

    @GetMapping("/login")
    public String loginPage(@RequestParam(required = false) String error, Model model) {
        String errorMessage = null;
        if (error != null) {
            errorMessage = "Имя или пароль введены неверно!";
        }
        model.addAttribute("errorMessage", errorMessage);
        return "login";
    }

    @PostMapping("/login")
    public String login(HttpServletRequest request,
                         @RequestParam String name,
                         @RequestParam String password) {
        User user = users.findAuth(name, password);
        if (user != null) {
            request.getSession().setAttribute("user", user);
            return "redirect:/index";
        }
        return "redirect:/login?error=true";
    }

    @GetMapping("/logout")
    public String logoutPage(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/index";
    }
}