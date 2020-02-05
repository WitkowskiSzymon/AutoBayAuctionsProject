package pl.witkowski.AutoBay.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AuctionDto {
    private Integer id;
    private String userName;
    private String price;
    private String make;
    private String model;
    private String mileage;
    private String fuel;
    private String year;
    private String base64Image;
    private String userWinner;
}
