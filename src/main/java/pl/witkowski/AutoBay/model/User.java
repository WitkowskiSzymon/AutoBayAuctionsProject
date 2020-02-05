package pl.witkowski.AutoBay.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "users")
@Getter
@Setter
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotEmpty
    @Size(min = 6)
    private String username;

    @NotBlank
    @Size(min = 8)
    private String password;

    @Transient
    @Size(min = 8)
    private String passwordConfirm;

    @ManyToMany
    private Set<Role> roles = new HashSet<>();
}
