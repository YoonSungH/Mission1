package com.example.wifi.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import java.util.List;

@Data
public class WifiResponse {

    @JsonProperty("TbPublicWifiInfo")
    private WifiInfo wifiInfo;

    @Data
    public static class WifiInfo {
        @JsonProperty("row")
        private List<WifiData> wifiDataList; // Open API의 와이파이 데이터 목록
    }
}

