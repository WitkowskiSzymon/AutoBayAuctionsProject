package pl.witkowski.AutoBay.enums;

import lombok.Getter;

@Getter
public enum MakeEnum {
    Alfa_Romeo(1, "Alfa Romeo"),
    Aston_Martin(2, "Aston Martin"),
    Audi(3, "Audi"),
    Bentley(4, "Bentley"),
    BMW(5, "BMW"),
    Cadillac(6, "Cadillac"),
    Chevrolet(7, "Chevrolet"),
    Chrysler(8, "Chrysler"),
    Citroen(9, "Citroen"),
    Dacia(10, "Dacia"),
    Dodge(11, "Dodge"),
    Ferrari(12, "Ferrari"),
    Fiat(13, "Fiat"),
    Ford(14, "Ford"),
    Honda(15, "Honda"),
    Hummer(16, "Hummer"),
    Hyundai(17, "Hyundai"),
    Infiniti(18, "Infiniti"),
    Jaguar(19, "Jaguar"),
    Jeep(20, "Jeep"),
    Kia(21, "Kia"),
    Lamborghini(22, "Lamborghini"),
    Lancia(23, "Lancia"),
    Land_Rover(24, "Land Rover"),
    Lexus(25, "Lexus"),
    Lotus(26, "Lotus"),
    Maserati(27, "Maserati"),
    Mazda(28, "Mazda"),
    Mercedes_Benz(29, "Mercedes-Benz"),
    Mini(30, "Mini"),
    Mitsubishi(31, "Mitsubishi"),
    Nissan(32, "Nissan"),
    Opel(33, "Opel"),
    Porsche(34, "Porsche"),
    Renault(35, "Renault"),
    Rolls_Royce(36, "Rolls-Royce"),
    Seat(37, "Seat"),
    Skoda(38, "Skoda"),
    Subaru(39, "Subaru"),
    Suzuki(40, "Suzuki"),
    Tesla(41, "Tesla"),
    Toyota(42, "Toyota"),
    Volkswagen(43, "Volkswagen"),
    Volvo(44, "Volvo");

    private int id;
    private String name;

    MakeEnum(int id, String name) {
        this.id = id;
        this.name = name;
    }
}
