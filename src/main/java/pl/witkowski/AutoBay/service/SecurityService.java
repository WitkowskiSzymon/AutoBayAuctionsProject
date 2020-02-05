package pl.witkowski.AutoBay.service;

public interface SecurityService {

    String findLoggedInUsername();

    void autoLogin(String username, String password);
}
