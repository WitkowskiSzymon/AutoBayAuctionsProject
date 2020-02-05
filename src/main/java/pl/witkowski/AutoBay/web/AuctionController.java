package pl.witkowski.AutoBay.web;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pl.witkowski.AutoBay.enums.FuelEnum;
import pl.witkowski.AutoBay.enums.MakeEnum;
import pl.witkowski.AutoBay.enums.ModelEnum;
import pl.witkowski.AutoBay.model.Auction;
import pl.witkowski.AutoBay.model.AuctionDto;
import pl.witkowski.AutoBay.model.User;
import pl.witkowski.AutoBay.service.AuctionService;
import pl.witkowski.AutoBay.service.UserService;
import pl.witkowski.AutoBay.validator.AuctionValidator;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.function.Predicate;

import static java.time.LocalDate.now;
import static java.util.Optional.ofNullable;
import static java.util.stream.Collectors.toList;

@Controller
public class AuctionController {
    private AuctionService auctionService;
    private AuctionValidator auctionValidator;
    private UserService userService;

    @Autowired
    public AuctionController(AuctionService auctionService, AuctionValidator auctionValidator, UserService userService) {
        this.auctionService = auctionService;
        this.auctionValidator = auctionValidator;
        this.userService = userService;
    }

    @GetMapping("/auction/add")
    public String addAuction(Model model) {
        model.addAttribute("auctionForm", new Auction());

        addFormAttributes(model);
        return "add-auction";
    }

    @PostMapping("/auction/add")
    public String addAuction(Model model, @RequestParam("file") MultipartFile file, @ModelAttribute("auctionForm")
            Auction auctionForm, BindingResult bindingResult) throws IOException {
        auctionValidator.validate(auctionForm, bindingResult);

        if (bindingResult.hasErrors()) {
            addFormAttributes(model);
            return "add-auction";
        }

        String finalImageFormat = prepareImage(file);

        ofNullable(auctionForm).ifPresent(auction -> {
            setAdditionalAuctionValues(auctionForm, finalImageFormat, auction);
        });
        auctionService.addAuction(auctionForm);

        return "redirect:/auction/my-auctions";
    }

    @GetMapping("/buy")
    public String buyAuction(@RequestParam("auctionId") Integer auctionId) {
        auctionService.buyAuction(getUserFromContext(), auctionId);
        return "redirect:/auction/bought-auctions";
    }

    @GetMapping("/auction/my-auctions")
    public String myAuctions(Model model) {
        List<AuctionDto> auctionDtos = auctionService.findMyAuctions().stream()
                .filter(getAuctionDtoPredicate())
                .collect(toList());
        model.addAttribute("auction", auctionDtos);

        return "my-auctions";
    }

    @GetMapping("/auction/bought-auctions")
    public String boughtAuctions(Model model) {
        List<AuctionDto> auctionDtos = auctionService.findBoughtAuctions().stream()
                .filter(auctionDto -> auctionDto.getUserWinner() != null)
                .filter(getAuctionWinnerDtoPredicate())
                .collect(toList());
        model.addAttribute("auction", auctionDtos);

        return "bought-auctions";
    }

    @GetMapping("/auction/update/{id}")
    public String findAuctionForUpdate(@PathVariable Integer id, Model model) {
        Auction auction = auctionService.findAuctionForUpdate(id);
        model.addAttribute("auction", auction);

        return "update-auction";
    }

    @PostMapping("/auction/update/{id}")
    public String updateAuction(@PathVariable Integer id, @ModelAttribute("auction") Auction auction, BindingResult bindingResult) {
        auctionValidator.validate(auction, bindingResult);

        if (bindingResult.hasErrors()) {
            return "update-auction";
        }
        auctionService.updateAuction(id, auction);

        return "redirect:/auction/my-auctions";
    }

    @GetMapping("/auction/delete/{id}")
    public String deleteAuction(@PathVariable Integer id) {
        auctionService.deleteAuction(id);

        return "redirect:/admin";
    }

    private User getUserFromContext() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return userService.findByUsername(authentication.getName());
    }

    private void setAdditionalAuctionValues(@ModelAttribute("auctionForm") Auction auctionForm, String finalBase6, Auction auction) {
        auction.setStartTime(now());
        auction.setBase64Image(finalBase6);
        auction.setFinishTime(now().plusDays(10));
        auction.setUser(getUserFromContext());
        auction.setModel(ModelEnum.valueOf(auctionForm.getModel1()));
    }

    private String prepareImage(@RequestParam("file") MultipartFile file) throws IOException {
        byte[] image = uploadFile(file);
        String base64 = null;

        byte[] encodeBase64 = Base64.encodeBase64(image);
        try {
            base64 = new String(encodeBase64, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return base64;
    }

    private Predicate<AuctionDto> getAuctionDtoPredicate() {
        return auctionDto -> auctionDto.getUserName().equals(SecurityContextHolder.getContext().getAuthentication().getName());
    }

    private Predicate<AuctionDto> getAuctionWinnerDtoPredicate() {
        return auctionDto -> auctionDto.getUserWinner().equals(SecurityContextHolder.getContext().getAuthentication().getName());
    }

    private void addFormAttributes(Model model) {
        model.addAttribute("make", MakeEnum.values());
        model.addAttribute("model", ModelEnum.values());
        model.addAttribute("fuel", FuelEnum.values());
    }

    private byte[] uploadFile(MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            byte[] bytes = file.getBytes();
            return bytes;
        }
        return null;
    }
}