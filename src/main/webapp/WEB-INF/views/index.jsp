<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>와이파이 정보 구하기</title>
<style>
/* 스타일 설정 */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
}

header {
	background-color: #333;
	color: white;
	padding: 10px 20px;
	text-align: center;
}

.container {
	width: 80%;
	margin: 20px auto;
	padding: 20px;
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 5px;
}

h1 {
	font-size: 24px;
	margin-bottom: 20px;
}

.btn-group {
	margin-bottom: 20px;
}

.btn-group a {
	margin-right: 10px;
	text-decoration: none;
	padding: 10px 15px;
	background-color: #007bff;
	color: white;
	border-radius: 5px;
}

.btn-group a:hover {
	background-color: #0056b3;
}

.input-group {
	margin-bottom: 10px;
}

.input-group label {
	margin-right: 10px;
	font-weight: bold;
}

.input-group input {
	padding: 5px;
	width: 100px;
}

.table-container {
	overflow-x: auto; /* 테이블에 가로 스크롤을 허용 */
	margin-top: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	table-layout: auto; /* 데이터에 맞춰 열 크기 조정 */
	min-width: 1200px; /* 스크롤을 유발할 최소 너비 설정 */
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
	white-space: nowrap; /* 긴 텍스트도 한 줄로 표시 */
}

th {
	background-color: #4CAF50;
	color: white;
}

.message {
	text-align: center;
	color: #555;
	margin-top: 20px;
}
</style>
</head>
<body>
	<header>
		<h1>와이파이 정보 구하기</h1>
	</header>

	<div class="container">
		<div class="btn-group">
			<a href="/">홈</a> <a href="/wifiHistory">위치 히스토리 목록</a> <a
				href="/fetchWifiData">Open API 와이파이 정보 가져오기</a>
		</div>

		<div class="input-group">
			<form action="/nearbyWifi" method="get">
				<label for="lat">LAT:</label> <input type="text" id="lat" name="lat"
					value="${lat != null ? lat : '0.0'}"> <label for="lnt">LNT:</label>
				<input type="text" id="lnt" name="lnt"
					value="${lnt != null ? lnt : '0.0'}">

				<button type="button" onclick="getLocation()">내 위치 가져오기</button>
				<button type="submit">근처 WIFI 정보 보기</button>
			</form>
		</div>



		<div class="table-container">
			<table>
				<thead>
					<tr>
						<th>거리(Km)</th>
						<th>관리번호</th>
						<th>자치구</th>
						<th>와이파이명</th>
						<th>도로명주소</th>
						<th>상세주소</th>
						<th>설치위치(층)</th>
						<th>설치유형</th>
						<th>설치기관</th>
						<th>서비스구분</th>
						<th>망종류</th>
						<th>설치년도</th>
						<th>실내외구분</th>
						<th>WIFI접속환경</th>
						<th>X좌표</th>
						<th>Y좌표</th>
						<th>작업일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="wifi" items="${nearbyWifiList}">
						<tr>
							<td>${wifi.distance}</td>
							<!-- 거리(Km), 이 부분은 추가적인 계산이 필요할 수 있음 -->
							<td>${wifi.wifiData.mgrNo}</td>
							<!-- 관리번호 -->
							<td>${wifi.wifiData.wrdofc}</td>
							<!-- 자치구 -->
							<td><a href="/wifiDetail?mgrNo=${wifi.wifiData.mgrNo}&lat=${lat}&lnt=${lnt}"">
								${wifi.wifiData.mainNm} </a></td>
							<!-- 와이파이명 -->
							<td>${wifi.wifiData.adres1}</td>
							<!-- 도로명주소 -->
							<td>${wifi.wifiData.adres2}</td>
							<!-- 상세주소 -->
							<td>${wifi.wifiData.instlFloor}</td>
							<!-- 설치위치(층) -->
							<td>${wifi.wifiData.instlTy}</td>
							<!-- 설치유형 -->
							<td>${wifi.wifiData.instlMby}</td>
							<!-- 설치기관 -->
							<td>${wifi.wifiData.svcSe}</td>
							<!-- 서비스구분 -->
							<td>${wifi.wifiData.cmcwr}</td>
							<!-- 망종류 -->
							<td>${wifi.wifiData.cnstcYear}</td>
							<!-- 설치년도 -->
							<td>${wifi.wifiData.inoutDoor}</td>
							<!-- 실내외구분 -->
							<td>${wifi.wifiData.remars3}</td>
							<!-- WIFI 접속환경 -->
							<td>${wifi.wifiData.lnt}</td>
							<!-- X좌표 -->
							<td>${wifi.wifiData.lat}</td>
							<!-- Y좌표 -->
							<td>${wifi.wifiData.workDttm}</td>
							<!-- 작업일자 -->
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>

	<script>
		// 내 위치 가져오기 함수
		function getLocation() {
			if (navigator.geolocation) {
				navigator.geolocation
						.getCurrentPosition(function(position) {
							document.getElementById('lat').value = position.coords.latitude;
							document.getElementById('lnt').value = position.coords.longitude;
						});
			} else {
				alert("이 브라우저는 Geolocation을 지원하지 않습니다.");
			}
		}
	</script>
</body>
</html>
