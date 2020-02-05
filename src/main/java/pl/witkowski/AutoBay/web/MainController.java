package pl.witkowski.AutoBay.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.witkowski.AutoBay.enums.FuelEnum;
import pl.witkowski.AutoBay.enums.MakeEnum;
import pl.witkowski.AutoBay.enums.ModelEnum;
import pl.witkowski.AutoBay.model.AuctionDto;
import pl.witkowski.AutoBay.model.FindModel;
import pl.witkowski.AutoBay.model.User;
import pl.witkowski.AutoBay.service.AuctionService;
import pl.witkowski.AutoBay.service.SecurityService;
import pl.witkowski.AutoBay.service.UserService;
import pl.witkowski.AutoBay.validator.UserValidator;

import java.util.List;
import java.util.function.Predicate;

import static java.util.stream.Collectors.toList;

@Controller
public class MainController {
    private UserService userService;
    private AuctionService auctionService;
    private SecurityService securityService;
    private UserValidator userValidator;

    @Autowired
    public MainController(UserService userService, AuctionService auctionService, SecurityService securityService, UserValidator userValidator) {
        this.userService = userService;
        this.auctionService = auctionService;
        this.securityService = securityService;
        this.userValidator = userValidator;
    }

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }
        userService.saveUser(userForm);
        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Login lub hasło jest błędny.");

        if (logout != null)
            model.addAttribute("message", "Zostałeś poprawnie wylogowany.");

        return "login";
    }

    @GetMapping({"/", "/welcome"})
    public String welcome(Model model) {

        addFormAttributes(model);
        model.addAttribute("auctions", auctionService.findMyAuctions());

        return "welcome";
    }

    @PostMapping("/find")
    public String find(Model model, FindModel findModel) {
        addFormAttributes(model);

        List<AuctionDto> auctionDtos = auctionService.findMyAuctions().stream()
                .filter(findPredicate(findModel))
                .collect(toList());
        model.addAttribute("auctions", auctionDtos);

        return "welcome";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

    @GetMapping("/admin")
    public String admin(Model model) {
        addFormAttributes(model);
        model.addAttribute("auctions", auctionService.findMyAuctions());

        return "admin";
    }

    @GetMapping("/show/{id}")
    public String showAuction(@PathVariable String id, Model model) {
        int i = Integer.parseInt(id);
        model.addAttribute("auction", auctionService.findByAuctionId(i).get());
        return "show-auction";
    }

    private void addFormAttributes(Model model) {
        model.addAttribute("make", MakeEnum.values());
        model.addAttribute("model", ModelEnum.values());
        model.addAttribute("fuel", FuelEnum.values());
    }

    private Predicate<AuctionDto> findPredicate(FindModel findModel) {

        return auctionDto ->
                auctionDto.getMake().equalsIgnoreCase(findModel.getMake())
                        && auctionDto.getModel().equalsIgnoreCase(findModel.getModel().replace("_", " "))
                        && auctionDto.getFuel().equalsIgnoreCase(findModel.getFuel()
                );
    }
}
