package pl.witkowski.AutoBay.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.witkowski.AutoBay.model.Auction;

public interface AuctionRepository extends JpaRepository<Auction, Integer> {
    Auction findAuctionById(Integer id);
}
