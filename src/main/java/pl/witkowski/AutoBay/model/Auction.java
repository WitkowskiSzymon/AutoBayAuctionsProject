package pl.witkowski.AutoBay.model;


import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import pl.witkowski.AutoBay.enums.FuelEnum;
import pl.witkowski.AutoBay.enums.MakeEnum;
import pl.witkowski.AutoBay.enums.ModelEnum;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "auctions")
@Getter
@Setter
public class Auction {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private BigDecimal price;

    @DateTimeFormat(pattern = "MM-dd-yyyy")
    private LocalDate startTime;

    @DateTimeFormat(pattern = "MM-dd-yyyy")
    private LocalDate finishTime;

    @Enumerated(EnumType.ORDINAL)
    private MakeEnum make;

    @Enumerated(EnumType.ORDINAL)
    private ModelEnum model;

    @Transient
    private String model1;

    @Enumerated(EnumType.ORDINAL)
    private FuelEnum fuel;

    private Integer year;

    private Integer mileage;

    private String description;

    private boolean auctionFinished;

    @Column(columnDefinition = "NVARCHAR(MAX)")
    private String base64Image;

    @OneToOne
    @JoinColumn(name = "users")
    private User user;

    @OneToOne
    @JoinColumn(name = "winners")
    private User winner;
}
