package com.example.wifi.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.wifi.model.WifiData;

public interface WifiRepository extends JpaRepository<WifiData, String> {
	
	@Query("SELECT w FROM WifiData w")
    List<WifiData> findTop20(Pageable pageable);

}
