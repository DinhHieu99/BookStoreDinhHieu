package com.bookstore.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.bookstore.entities.Contact;
@Repository
@Transactional
public interface ContactRepositories extends JpaRepository<Contact, Integer>{
	@Query("SELECT COUNT(e.id) FROM Contact e WHERE e.status = ?1")
	int count(boolean status);
	
	@Query("SELECT e FROM Contact e WHERE e.status = ?1")
	List<Contact> findAll(boolean status);
	
	@Modifying
	@Query("update Contact e set e.status = ?1 where e.id =?2")
	int update(boolean status, int id);
}
