package com.sekolah.authservice.Repository;


import com.sekolah.authservice.Model.ERole;
import com.sekolah.authservice.Model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
    Optional<Role> findByName(ERole name);
}

