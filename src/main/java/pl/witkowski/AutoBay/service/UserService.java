package pl.witkowski.AutoBay.service;


import pl.witkowski.AutoBay.model.User;

public interface UserService {

    void saveUser(User user);

    User findByUsername(String username);

    void updateUser(Integer id, User user);

    void deleteUser(Integer id);

}
