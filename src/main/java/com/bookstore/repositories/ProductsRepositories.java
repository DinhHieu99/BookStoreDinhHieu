package com.bookstore.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bookstore.entities.Products;

@Transactional
@Repository
public interface ProductsRepositories extends JpaRepository<Products, Integer> {
	@Query("SELECT e FROM Products e WHERE e.id=?1")
	Products findById(int id);

	@Query("SELECT e.quantity FROM Products e WHERE e.id=?1")
	int statusProduct(int id);

	@Query("SELECT e.view FROM Products e WHERE e.id=?1")
	int view(int id);
	
	@Query("SELECT e FROM Products e ORDER BY e.view DESC")
	List<Products> mostView();
	
	@Modifying
	@Query("UPDATE Products e SET e.view =?1 WHERE e.id=?2")
	int updateView(int view, int id);
}
