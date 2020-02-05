package pl.witkowski.AutoBay.enums;

import lombok.Getter;

@Getter
public enum FuelEnum {
    Benzyna(1,"Benzyna"),
    Diesel(2,"Diesel"),
    Elektryczny(3,"Elektryczny"),
    Hybrydowy(4,"Hybrydowy");

    private int id;
    private String name;

    FuelEnum(int id, String name) {
        this.id = id;
        this.name = name;
    }
}
