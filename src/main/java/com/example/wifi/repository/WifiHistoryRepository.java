package com.example.wifi.repository;



import org.springframework.data.jpa.repository.JpaRepository;


import com.example.wifi.model.WifiHistory;


public interface WifiHistoryRepository extends JpaRepository<WifiHistory, Long> {

}
