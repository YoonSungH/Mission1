package com.example.wifi.model;


import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@Data
@NoArgsConstructor
public class WifiData {

      
    @Id
    @JsonProperty("X_SWIFI_MGR_NO")  // 관리번호
    @Column(name = "mgr_no")
    private String mgrNo;

    @JsonProperty("X_SWIFI_WRDOFC")  // 자치구
    @Column(name = "wrdofc")
    private String wrdofc;

    @JsonProperty("X_SWIFI_MAIN_NM")  // 와이파이명
    @Column(name = "main_nm")
    private String mainNm;

    @JsonProperty("X_SWIFI_ADRES1")  // 도로명주소
    @Column(name = "adres1")
    private String adres1;

    @JsonProperty("X_SWIFI_ADRES2")  // 상세주소
    @Column(name = "adres2")
    private String adres2;

    @JsonProperty("X_SWIFI_INSTL_FLOOR")  // 설치위치(층)
    @Column(name = "instl_floor")
    private String instlFloor;

    @JsonProperty("X_SWIFI_INSTL_TY")  // 설치유형
    @Column(name = "instl_ty")
    private String instlTy;

    @JsonProperty("X_SWIFI_INSTL_MBY")  // 설치기관
    @Column(name = "instl_mby")
    private String instlMby;

    @JsonProperty("X_SWIFI_SVC_SE")  // 서비스구분
    @Column(name = "svc_se")
    private String svcSe;

    @JsonProperty("X_SWIFI_CMCWR")  // 망종류
    @Column(name = "cmcwr")
    private String cmcwr;

    @JsonProperty("X_SWIFI_CNSTC_YEAR")  // 설치년도
    @Column(name = "cnstc_year")
    private String cnstcYear;

    @JsonProperty("X_SWIFI_INOUT_DOOR")  // 실내외구분
    @Column(name = "inout_door")
    private String inoutDoor;

    @JsonProperty("X_SWIFI_REMARS3")  // wifi 접속환경
    @Column(name = "remars3")
    private String remars3;

    @JsonProperty("LAT")  // Y좌표
    @Column(name = "lat")
    private double lat;

    @JsonProperty("LNT")  // X좌표
    @Column(name = "lnt")
    private double lnt;

    @JsonProperty("WORK_DTTM")  // 작업 일시
    @Column(name = "work_dttm")
    private String workDttm;
}
