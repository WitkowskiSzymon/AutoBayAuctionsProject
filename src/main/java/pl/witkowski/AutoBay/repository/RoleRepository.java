package pl.witkowski.AutoBay.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import pl.witkowski.AutoBay.model.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {
    Role findByName(String role);
}
