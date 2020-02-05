package pl.witkowski.AutoBay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.witkowski.AutoBay.model.Auction;
import pl.witkowski.AutoBay.model.AuctionDto;
import pl.witkowski.AutoBay.model.User;
import pl.witkowski.AutoBay.repository.AuctionRepository;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class AuctionServiceImpl implements AuctionService {

    private AuctionRepository auctionRepository;

    @Autowired
    public AuctionServiceImpl(AuctionRepository auctionRepository) {
        this.auctionRepository = auctionRepository;
    }

    @Override
    public void addAuction(Auction auction) {
        auctionRepository.save(auction);
    }

    @Override
    public Optional<Auction> findByAuctionId(Integer id) {
        return auctionRepository.findById(id);
    }

    @Override
    public Auction findAuctionForUpdate(Integer id) {
        return auctionRepository.findAuctionById(id);
    }

    @Override
    public void updateAuction(Integer id, Auction auction) {
        Auction auctionForUpdate = findAuctionForUpdate(id);
        auctionForUpdate.setDescription(auction.getDescription());
        auctionForUpdate.setPrice(auction.getPrice());
        auctionRepository.save(auctionForUpdate);
    }

    @Override
    public void buyAuction(User user, Integer id) {
        Optional<Auction> buyAuctionId = findByAuctionId(id);
        buyAuctionId.get().setWinner(user);
        buyAuctionId.get().setAuctionFinished(true);
        auctionRepository.save(buyAuctionId.get());
    }

    @Override
    public void deleteAuction(Integer id) {
        auctionRepository.deleteById(id);
    }

    @Override
    public List<AuctionDto> findMyAuctions() {
        return auctionRepository.findAll().stream().filter(auction -> !auction.isAuctionFinished()).map(auction -> {
            AuctionDto auctionDto = createAuctionDto(auction);

            return auctionDto;
        }).collect(Collectors.toList());
    }

    private AuctionDto createAuctionDto(Auction auction) {
        AuctionDto createAuction = new AuctionDto();
        createAuction.setId(auction.getId());
        createAuction.setMake(auction.getMake().getName());
        createAuction.setModel(auction.getModel().getName());
        createAuction.setPrice(auction.getPrice().toPlainString());
        createAuction.setMileage(auction.getMileage().toString());
        createAuction.setYear(auction.getYear().toString());
        createAuction.setFuel(auction.getFuel().getName());
        createAuction.setUserName(auction.getUser().getUsername());
        createAuction.setBase64Image(auction.getBase64Image());
        return createAuction;
    }

    @Override
    public List<AuctionDto> findBoughtAuctions() {
        return auctionRepository.findAll().stream().filter(auction -> auction.isAuctionFinished()).map(auction -> {
            AuctionDto auctionDto = findAuctionDto(auction);

            return auctionDto;
        }).collect(Collectors.toList());
    }

    private AuctionDto findAuctionDto(Auction auction) {
        AuctionDto findAuction = new AuctionDto();
        findAuction.setId(auction.getId());
        findAuction.setMake(auction.getMake().getName());
        findAuction.setModel(auction.getModel().getName());
        findAuction.setPrice(auction.getPrice().toPlainString());
        findAuction.setMileage(auction.getMileage().toString());
        findAuction.setYear(auction.getYear().toString());
        findAuction.setFuel(auction.getFuel().getName());
        findAuction.setUserName(auction.getUser().getUsername());
        if (auction.getWinner() != null) {
            findAuction.setUserWinner(auction.getWinner().getUsername());
        }
        findAuction.setBase64Image(auction.getBase64Image());
        return findAuction;
    }
}
