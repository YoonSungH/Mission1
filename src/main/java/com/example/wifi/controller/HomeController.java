package com.example.wifi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.wifi.model.WifiData;
import com.example.wifi.model.WifiDistance;
import com.example.wifi.service.WifiHistoryService;
import com.example.wifi.service.WifiService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final WifiService wifiService;
    private final WifiHistoryService wifiHistoryService;
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
    @GetMapping("/")
    public String Home() {
    	return "index";
    }
    

    @GetMapping("/fetchWifiData")
    public String fetchWifiData(Model model) {
    	try {
            // 서비스 호출하여 와이파이 데이터를 가져와서 DB에 저장
    		List<WifiData> wifiDataList = wifiService.fetchAndSaveWifiData(); 
    		
    		model.addAttribute("wifiCount", wifiDataList.size());
            model.addAttribute("message", "와이파이 정보가 성공적으로 저장되었습니다.");
        } catch (Exception e) {
            // 예외 발생 시 로그 출력 및 메시지 처리
            logger.error("Error occurred during Wifi data saving", e);
            model.addAttribute("message", "와이파이 정보를 저장하는 중 오류가 발생했습니다.");
        }
        return "wifiResult"; // 결과 페이지로 이동
    }
    
    @GetMapping("/nearbyWifi")
    public String getNearbyWifiData(@RequestParam("lat") double lat, @RequestParam("lnt") double lnt, Model model) {
        try {
            logger.info("Fetching nearby WiFi data for coordinates: LAT = {}, LNT = {}", lat, lnt);  // 좌표 로그 출력
            
            wifiHistoryService.saveHistory(lat, lnt, "");

            // 서비스 호출하여 가까운 WiFi 데이터 가져옴
            List<WifiDistance> nearbyWifiList = wifiService.getNearbyWifiData(lat, lnt);

            if (nearbyWifiList.isEmpty()) {
                logger.warn("No nearby WiFi data found.");
            } else {
                logger.info("Found {} nearby WiFi records.", nearbyWifiList.size());  // 가져온 데이터 크기 로그
            }

            // 리스트를 모델에 추가
            model.addAttribute("nearbyWifiList", nearbyWifiList);
            model.addAttribute("lat", lat);  // 입력받은 위도 값 유지
            model.addAttribute("lnt", lnt);  // 입력받은 경도 값 유지

        } catch (Exception e) {
            logger.error("Error occurred while fetching nearby Wifi data", e);
            model.addAttribute("message", "주변 와이파이 정보를 가져오는 중 오류가 발생했습니다.");
        }
        return "index";  // 다시 index 페이지로 이동
    }
    
    @GetMapping("/wifiDetail")
    public String getWifiDetail(
            @RequestParam("mgrNo") String mgrNo, 
            @RequestParam("lat") double lat, 
            @RequestParam("lnt") double lnt, 
            Model model) {
        try {
            logger.info("Fetching details for WiFi ID: {}", mgrNo);

            // 서비스 호출하여 와이파이 상세 데이터와 거리 정보 가져옴
            WifiDistance wifiDistance = wifiService.getWifiDetailById(mgrNo, lat, lnt);

            if (wifiDistance == null) {
                model.addAttribute("message", "해당 와이파이의 상세 정보를 찾을 수 없습니다.");
            } else {
                model.addAttribute("wifiDistance", wifiDistance);  // 와이파이 상세 정보와 거리 정보를 모델에 추가
            }
        } catch (Exception e) {
            logger.error("Error occurred while fetching WiFi details", e);
            model.addAttribute("message", "와이파이 상세 정보를 가져오는 중 오류가 발생했습니다.");
        }
        return "wifiDetail";  // 상세 페이지로 이동
    }
}