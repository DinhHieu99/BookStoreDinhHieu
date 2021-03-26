package com.bookstore.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.bookstore.entities.ReviewProduct;

public interface ReviewProductRepositories  extends JpaRepository<ReviewProduct, Integer>{
	@Query("SELECT e FROM ReviewProduct e WHERE e.product.id = ?1")
	List<ReviewProduct> findAllByIdProduct(int id);
	
	@Query("SELECT e.rating FROM ReviewProduct e WHERE e.product.id = ?1")
	int rating(int id);
	
	@Query("SELECT COUNT(e.id) FROM ReviewProduct e WHERE e.product.id = ?1")
	int countComment(int id);
	
	@Query("SELECT SUM(e.rating) FROM ReviewProduct e WHERE e.product.id = ?1")
	int sumRating(int id);
}
