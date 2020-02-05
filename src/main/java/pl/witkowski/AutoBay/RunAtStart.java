package pl.witkowski.AutoBay;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import pl.witkowski.AutoBay.enums.FuelEnum;
import pl.witkowski.AutoBay.enums.MakeEnum;
import pl.witkowski.AutoBay.enums.ModelEnum;
import pl.witkowski.AutoBay.model.Auction;
import pl.witkowski.AutoBay.model.Role;
import pl.witkowski.AutoBay.model.User;
import pl.witkowski.AutoBay.repository.AuctionRepository;
import pl.witkowski.AutoBay.repository.RoleRepository;
import pl.witkowski.AutoBay.repository.UserRepository;

import javax.annotation.PostConstruct;
import java.math.BigDecimal;
import java.time.LocalDate;

@Component
public class RunAtStart {

    private UserRepository userRepository;
    private RoleRepository roleRepository;
    private AuctionRepository auctionRepository;

    @Autowired
    public RunAtStart(UserRepository userRepository, RoleRepository roleRepository, AuctionRepository auctionRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.auctionRepository = auctionRepository;
    }

    @PostConstruct
    public void runAtStart() {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

        User admin = createAdmin(bCryptPasswordEncoder);
        User user = createUser(bCryptPasswordEncoder);

        createRoleAdmin(admin);
        createRoleUser(user);

        Pictures pics = new Pictures();

        createAuction1(user, pics);
        createAuction2(user, pics);
        createAuction3(user, pics);
        createAuction4(user, pics);
    }

    private User createAdmin(BCryptPasswordEncoder bCryptPasswordEncoder) {
        User admin = new User();
        admin.setUsername("adminAccount");
        admin.setPassword(bCryptPasswordEncoder.encode("aDm1n!5trat0r"));
        return admin;
    }

    private User createUser(BCryptPasswordEncoder bCryptPasswordEncoder) {
        User user = new User();
        user.setUsername("userAccount");
        user.setPassword(bCryptPasswordEncoder.encode("rAwPa55w0rD"));
        return user;
    }

    private void createRoleAdmin(User admin) {
        Role roleAdmin = new Role();
        roleAdmin.setName("ROLE_ADMIN");
        roleRepository.save(roleAdmin);
        admin.getRoles().add(roleAdmin);
        userRepository.save(admin);
    }

    private void createRoleUser(User user) {
        Role roleUser = new Role();
        roleUser.setName("ROLE_USER");
        roleRepository.save(roleUser);
        user.getRoles().add(roleUser);
        userRepository.save(user);
    }

    private void createAuction1(User user, Pictures pics) {
        BigDecimal bd1 = new BigDecimal("177000.00");
        Auction auction1 = new Auction();

        auction1.setStartTime(LocalDate.of(2019, 4, 20));
        auction1.setFinishTime(LocalDate.of(2019, 4, 30));
        auction1.setPrice(bd1);
        auction1.setUser(user);
        auction1.setFuel(FuelEnum.Diesel);
        auction1.setMake(MakeEnum.Audi);
        auction1.setModel(ModelEnum.A7);
        auction1.setYear(2014);
        auction1.setMileage(14478);
        auction1.setDescription("Dobrze zachowane, luksusowe Audi A7");
        auction1.setAuctionFinished(false);
        auction1.setBase64Image(pics.getImage1());
        auctionRepository.save(auction1);
    }

    private void createAuction2(User user, Pictures pics) {
        BigDecimal bd2 = new BigDecimal("1921200.00");
        Auction auction2 = new Auction();

        auction2.setStartTime(LocalDate.of(2019, 4, 5));
        auction2.setFinishTime(LocalDate.of(2019, 4, 15));
        auction2.setPrice(bd2);
        auction2.setUser(user);
        auction2.setFuel(FuelEnum.Benzyna);
        auction2.setMake(MakeEnum.Lamborghini);
        auction2.setModel(ModelEnum.Aventador);
        auction2.setYear(2016);
        auction2.setMileage(1564);
        auction2.setDescription("Nowe, piekielnie szybkie Lamborghini Aventador LP-700/4");
        auction2.setAuctionFinished(false);
        auction2.setBase64Image(pics.getImage2());
        auctionRepository.save(auction2);
    }

    private void createAuction3(User user, Pictures pics) {
        BigDecimal bd3 = new BigDecimal("357000.00");
        Auction auction3 = new Auction();

        auction3.setStartTime(LocalDate.of(2020, 2, 18));
        auction3.setFinishTime(LocalDate.of(2020, 2, 28));
        auction3.setPrice(bd3);
        auction3.setUser(user);
        auction3.setFuel(FuelEnum.Elektryczny);
        auction3.setMake(MakeEnum.Tesla);
        auction3.setModel(ModelEnum.Model_S);
        auction3.setYear(2017);
        auction3.setMileage(76278);
        auction3.setDescription("Elektryzująca Tesla Model S");
        auction3.setAuctionFinished(false);
        auction3.setBase64Image(pics.getImage3());
        auctionRepository.save(auction3);
    }

    private void createAuction4(User user, Pictures pics) {
        BigDecimal bd4 = new BigDecimal("17000.00");
        Auction auction4 = new Auction();

        auction4.setStartTime(LocalDate.of(2019, 12, 9));
        auction4.setFinishTime(LocalDate.of(2019, 12, 19));
        auction4.setPrice(bd4);
        auction4.setUser(user);
        auction4.setFuel(FuelEnum.Hybrydowy);
        auction4.setMake(MakeEnum.Toyota);
        auction4.setModel(ModelEnum.Prius);
        auction4.setYear(2014);
        auction4.setMileage(154478);
        auction4.setDescription("Hybrydowa Toyota Prius trzeciej generacji");
        auction4.setAuctionFinished(false);
        auction4.setBase64Image(pics.getImage4());
        auctionRepository.save(auction4);
    }
}

