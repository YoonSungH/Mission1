package com.example.wifi.service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.ArrayList;
import java.util.Comparator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.example.mapper.WifiMapper;
import com.example.wifi.model.WifiData;
import com.example.wifi.model.WifiDistance;
import com.example.wifi.model.WifiResponse;
import com.example.wifi.repository.WifiRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WifiService {
	
	private static final Logger logger = LoggerFactory.getLogger(WifiService.class);

    private final WifiRepository wifiRepository;
    private final RestTemplate restTemplate;

    @Value("${wifi.api.key}")
    private String apiKey;
    
    @Transactional
    public void saveWifiDataBatch(List<WifiData> wifiDataList) {
        wifiRepository.saveAll(wifiDataList);  // 배치 저장
//        wifiRepository.flush();  // 강제로 DB에 반영 (트랜잭션을 커밋하기 전에 실행)
    }

    
    @Transactional
    public List<WifiData> fetchAndSaveWifiData() {
        List<WifiData> totalWifiDataList = new ArrayList<>();
        int start = 1;
        int end = 1000;
        int batchSize = 1000;

        while (true) {
            // Open API URL 설정
            String apiUrl = "http://openapi.seoul.go.kr:8088/" + apiKey + "/json/TbPublicWifiInfo/" + start + "/" + end;
            
            // Open API 호출
            WifiResponse response = restTemplate.getForObject(apiUrl, WifiResponse.class);

            if (response != null && response.getWifiInfo() != null) {
                List<WifiData> wifiDataList = response.getWifiInfo().getWifiDataList();

                if (wifiDataList.isEmpty()) {
                    logger.info("모든 데이터를 가져왔습니다.");
                    break;  // 데이터가 더 이상 없으면 루프 종료
                }

                // 배치 단위로 데이터 저장
                saveWifiDataBatch(wifiDataList);  // 새로 정의된 배치 저장 메서드 호출
                
                totalWifiDataList.addAll(wifiDataList);
                logger.info(start + "부터 " + end + "까지 데이터 저장 완료");

                start += batchSize;
                end += batchSize;
            } else {
                logger.warn("더 이상 가져올 데이터가 없습니다.");
                break;
            }
        }

        return totalWifiDataList;
    }
    
    @Transactional(readOnly = true)
    public List<WifiDistance> getNearbyWifiData(double userLat, double userLnt) {
        // 전체 WiFi 데이터를 데이터베이스에서 가져오기
        List<WifiData> wifiDataList = wifiRepository.findAll();
        List<WifiDistance> wifiDataWithDistances = new ArrayList<>();

        if (wifiDataList.isEmpty()) {
            logger.warn("No WiFi data found in the database.");
        } else {
            logger.info("Found {} WiFi data records in the database.", wifiDataList.size());
        }

        // 각 WiFi 데이터와 사용자 위치 사이의 거리 계산
        for (WifiData wifiData : wifiDataList) {
            double distance = calculateDistance(userLat, userLnt, wifiData.getLat(), wifiData.getLnt());
            wifiDataWithDistances.add(new WifiDistance(wifiData, distance));
        }

        // 거리 기준으로 오름차순 정렬
        List<WifiDistance> sortedWifiData = wifiDataWithDistances.stream()
            .sorted(Comparator.comparingDouble(WifiDistance::getDistance))  // 거리에 따른 오름차순 정렬
            .collect(Collectors.toList());

        // 상위 20개의 WiFi 데이터 반환
        return sortedWifiData.stream()
            .limit(20)  // 상위 20개
            .collect(Collectors.toList());
    }
    
    @Transactional(readOnly = true)
    public WifiDistance getWifiDetailById(String wifiId, double userLat, double userLnt) {
        WifiData wifiData = wifiRepository.findById(wifiId).orElse(null);
        
        if (wifiData == null) {
            logger.warn("No WiFi data found for ID: {}", wifiId);
            return null;  // WiFi 데이터가 없으면 null 반환
        }
        
        // 사용자 좌표와 Wi-Fi 위치 사이의 거리 계산
        double distance = calculateDistance(userLat, userLnt, wifiData.getLat(), wifiData.getLnt());

        // WiFi 상세 정보와 거리를 포함한 WifiDistance 객체 반환
        return new WifiDistance(wifiData, distance);
    }
    
    private double calculateDistance(double lat1, double lnt1, double lat2, double lnt2) {
        double latDistance = lat2 - lat1;
        double lntDistance = lnt2 - lnt1;

        return Math.sqrt(latDistance * latDistance + lntDistance * lntDistance);
    }
}
