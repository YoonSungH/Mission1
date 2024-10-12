package com.example.wifi.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.wifi.model.WifiHistory;
import com.example.wifi.repository.WifiHistoryRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WifiHistoryService {

    private final WifiHistoryRepository wifiHistoryRepository;

    @Transactional
    public void saveHistory(double lat, double lnt, String remarks) {
        WifiHistory wifiHistory = new WifiHistory();
        wifiHistory.setLat(lat);
        wifiHistory.setLnt(lnt);
        wifiHistory.setSearchTime(LocalDateTime.now()); // 현재 시간 저장
        wifiHistory.setRemarks(remarks);

        wifiHistoryRepository.save(wifiHistory); // 기록 저장
    }
    
    @Transactional
    public List<WifiHistory> getAllHistory() {
        return wifiHistoryRepository.findAll(Sort.by(Sort.Direction.DESC, "id"));  // 내림차순으로 정렬하여 가져오기
    }
    
    @Transactional
    public void deleteHistoryById(Long id) {
        wifiHistoryRepository.deleteById(id);
    }
}
