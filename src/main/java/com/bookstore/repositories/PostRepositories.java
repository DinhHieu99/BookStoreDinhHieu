package com.bookstore.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.bookstore.entities.Post;
@Repository
@Transactional
public interface PostRepositories extends JpaRepository<Post, Integer>{
	@Query("SELECT e.view FROM Post e WHERE e.id = ?1")
	int findViewById(int id);
	
	@Modifying
	@Query("UPDATE Post e SET e.view =?1 WHERE e.id = ?2")
	int updateViewById(int view, int id);
	
	@Query("SELECT e FROM Post e ORDER BY e.view DESC")
	List<Post> getView();
}
