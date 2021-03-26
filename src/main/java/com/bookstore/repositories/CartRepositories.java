package com.bookstore.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.bookstore.entities.Cart;

@Repository
public interface CartRepositories extends JpaRepository<Cart, Integer>{
	
	@Query("SELECT e FROM Cart e WHERE e.order.id = '?1'")
	List<Cart> findByIdOrder(int id);
}
