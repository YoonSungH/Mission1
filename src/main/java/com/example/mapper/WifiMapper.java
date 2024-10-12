package com.example.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.wifi.model.WifiData;

@Mapper
public interface WifiMapper {
	
	void insertWifiData(WifiData wifiData);

    List<WifiData> selectAllWifiData();

    WifiData selectNearestWifi(Map<String, Object> params);
	
}
