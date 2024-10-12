package com.example.wifi.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.example.wifi.model.WifiHistory;
import com.example.wifi.service.WifiHistoryService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class WifiHistoryController {

    private final WifiHistoryService wifiHistoryService;

    @GetMapping("/wifiHistory")
    public String getWifiHistory(Model model) {
        // 위치 히스토리 목록을 가져오는 서비스 호출
        List<WifiHistory> historyList = wifiHistoryService.getAllHistory();

        // 모델에 히스토리 목록 추가
        model.addAttribute("historyList", historyList);

        return "wifiHistory";  // wifiHistory.jsp로 이동
    }
    
    @PostMapping("/deleteHistory")
    public String deleteHistory(@RequestParam("id") Long id) {
        wifiHistoryService.deleteHistoryById(id);
        return "redirect:/wifiHistory";  // 삭제 후 다시 위치 히스토리 목록으로 리다이렉트
    }
}
