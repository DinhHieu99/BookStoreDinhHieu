package com.bookstore.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bookstore.entities.HoaDon;
@Transactional
@Repository
public interface HoaDonRepositories extends JpaRepository<HoaDon, Integer>{
	@Query("SELECT e FROM HoaDon e WHERE e.id = ?1")
	HoaDon findById(int id);
	
	@Query("SELECT e FROM HoaDon e WHERE e.user.id = ?1")
	HoaDon findByIdUser(int id);
	
	@Query("SELECT SUM(totalMoney) FROM HoaDon WHERE user.id = ?1 AND status_delete = false")
	int sumMoney(int id);
	
	@Query("SELECT SUM(e.totalMoney) FROM HoaDon e WHERE MONTH(e.created) = ?1")
	int sumMoneyByMonth(int month);
	
	@Query("SELECT SUM(e.totalMoney) FROM HoaDon e WHERE DATE(e.created) = DATE(?1) ")
	int sumMoneyByDate(String date);
}
