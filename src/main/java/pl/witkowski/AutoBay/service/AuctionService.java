package pl.witkowski.AutoBay.service;

import pl.witkowski.AutoBay.model.Auction;
import pl.witkowski.AutoBay.model.AuctionDto;
import pl.witkowski.AutoBay.model.User;

import java.util.List;
import java.util.Optional;

public interface AuctionService {

    void addAuction(Auction auction);

    Optional<Auction> findByAuctionId(Integer id);

    void updateAuction(Integer id, Auction auction);

    void buyAuction(User user, Integer id);

    Auction findAuctionForUpdate(Integer id);

    void deleteAuction(Integer id);

    List<AuctionDto> findMyAuctions();

    List<AuctionDto> findBoughtAuctions();
}
