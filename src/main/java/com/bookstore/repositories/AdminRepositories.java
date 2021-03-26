package com.bookstore.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bookstore.entities.Admin;
@Transactional
@Repository
public interface AdminRepositories extends JpaRepository<Admin, Integer>{
		
	@Query("SELECT COUNT(e.id) FROM Admin e")
	int countAdmin();
	
	@Query("SELECT e.id FROM Admin e WHERE e.username= ?1")
	int findIdByUserName(String username );
	
	@Query("SELECT e.status_login FROM Admin e WHERE e.id = ?1")
	boolean status_login(int id);
}
