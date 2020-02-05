package pl.witkowski.AutoBay.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.witkowski.AutoBay.model.User;
import pl.witkowski.AutoBay.service.UserService;

@Controller
public class UserController {
    private UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/user/update/{id}")
    public String updateUser(@PathVariable Integer id, @ModelAttribute User user) {

        userService.updateUser(id, user);

        return "redirect:../user";
    }

    @GetMapping("/user/delete/{id}")
    public String deleteUser(@PathVariable Integer id) {

        userService.deleteUser(id);

        return "redirect:../user";
    }
}
