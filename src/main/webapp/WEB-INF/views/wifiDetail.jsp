<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>WiFi 상세 정보</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
}

.container {
	width: 80%;
	margin: 20px auto;
	padding: 20px;
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 5px;
}

header {
	background-color: #333;
	color: white;
	padding: 10px 20px;
	text-align: center;
}

h1 {
	font-size: 24px;
	margin-bottom: 20px;
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: left;
}

th {
	background-color: #4CAF50;
	color: white;
	width: 20%;
}

td {
	background-color: #f9f9f9;
}
</style>
</head>
<body>
	<header>
		<h1>와이파이 정보 구하기</h1>
	</header>
	<div class="container">
		<h1>와이파이 상세 정보</h1>
		<table>
					<tr>
						<th>거리(Km)</th>
						<td>${wifiDistance.distance}</td>
					</tr>
					<tr>
						<th>관리번호</th>
						<td>${wifiDistance.wifiData.mgrNo}</td>
					</tr>
					<tr>
						<th>자치구</th>
						<td>${wifiDistance.wifiData.wrdofc}</td>
					</tr>
					<tr>
						<th>와이파이명</th>
						<td>${wifiDistance.wifiData.mainNm}</td>
					</tr>
					<tr>
						<th>도로명주소</th>
						<td>${wifiDistance.wifiData.adres1}</td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td>${wifiDistance.wifiData.adres2}</td>
					</tr>
					<tr>
						<th>설치위치(층)</th>
						<td>${wifiDistance.wifiData.instlFloor}</td>
					</tr>
					<tr>
						<th>설치유형</th>
						<td>${wifiDistance.wifiData.instlTy}</td>
					</tr>
					<tr>
						<th>설치기관</th>
						<td>${wifiDistance.wifiData.instlMby}</td>
					</tr>
					<tr>
						<th>서비스구분</th>
						<td>${wifiDistance.wifiData.svcSe}</td>
					</tr>
					<tr>
						<th>망종류</th>
						<td>${wifiDistance.wifiData.cmcwr}</td>
					</tr>
					<tr>
						<th>설치년도</th>
						<td>${wifiDistance.wifiData.cnstcYear}</td>
					</tr>
					<tr>
						<th>실내외구분</th>
						<td>${wifiDistance.wifiData.inoutDoor}</td>
					</tr>
					<tr>
						<th>WIFI 접속환경</th>
						<td>${wifiDistance.wifiData.remars3}</td>
					</tr>
					<tr>
						<th>X좌표</th>
						<td>${wifiDistance.wifiData.lnt}</td>
					</tr>
					<tr>
						<th>Y좌표</th>
						<td>${wifiDistance.wifiData.lat}</td>
					</tr>
					<tr>
						<th>작업일자</th>
						<td>${wifiDistance.wifiData.workDttm}</td>
					</tr>
		</table>
	</div>

	<a href="/">뒤로 돌아가기</a>
</body>
</html>