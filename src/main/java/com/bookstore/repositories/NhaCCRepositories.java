package com.bookstore.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bookstore.entities.NhaCC;
@Transactional
@Repository
public interface NhaCCRepositories extends JpaRepository<NhaCC, Integer> {

}
