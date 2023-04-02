package com.world.gecko.repository;

import javax.persistence.Id;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.world.gecko.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Id> {
	User findById(String id);
}
