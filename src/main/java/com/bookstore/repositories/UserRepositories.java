package com.bookstore.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bookstore.entities.Users;
@Transactional
@Repository
public interface UserRepositories extends JpaRepository<Users, Integer> {
	@Query("SELECT max(id) FROM Users")
	int maxId();
	
	@Query("SELECT e FROM Users e WHERE e.id = ?1")
	Users findById(int id);
	
	@Query("SELECT e.password FROM Users e WHERE e.id = ?1")
	String findPasswordById(int id);
}
