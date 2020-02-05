package pl.witkowski.AutoBay.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import pl.witkowski.AutoBay.model.Auction;

import java.math.BigDecimal;

@Component
public class AuctionValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Auction.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Auction auction = (Auction) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "NotEmpty");
        if (auction.getDescription().length() < 6 || auction.getDescription().length() > 256) {
            errors.rejectValue("description", "Size.auctionForm.description");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "year", "NotBlank");
        if (auction.getYear() != null) {
            if (auction.getYear() < 1970 || auction.getYear() > 2019) {
                errors.rejectValue("year", "Size.auctionForm.year");
            }
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "NotBlank");
        if (auction.getPrice().compareTo(new BigDecimal(0)) <= 0 ||
                auction.getPrice().compareTo(new BigDecimal(10000001)) >= 0) {
            errors.rejectValue("price", "Size.auctionForm.price");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mileage", "NotBlank");
        if ((auction.getMileage().compareTo(0)) <= 0 || (auction.getMileage().compareTo(1000000)) >= 0) {
            errors.rejectValue("mileage", "Size.auctionForm.mileage");
        }
    }
}
