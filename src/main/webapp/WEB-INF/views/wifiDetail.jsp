<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>WiFi �� ����</title>
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
		<h1>�������� ���� ���ϱ�</h1>
	</header>
	<div class="container">
		<h1>�������� �� ����</h1>
		<table>
					<tr>
						<th>�Ÿ�(Km)</th>
						<td>${wifiDistance.distance}</td>
					</tr>
					<tr>
						<th>������ȣ</th>
						<td>${wifiDistance.wifiData.mgrNo}</td>
					</tr>
					<tr>
						<th>��ġ��</th>
						<td>${wifiDistance.wifiData.wrdofc}</td>
					</tr>
					<tr>
						<th>�������̸�</th>
						<td>${wifiDistance.wifiData.mainNm}</td>
					</tr>
					<tr>
						<th>���θ��ּ�</th>
						<td>${wifiDistance.wifiData.adres1}</td>
					</tr>
					<tr>
						<th>���ּ�</th>
						<td>${wifiDistance.wifiData.adres2}</td>
					</tr>
					<tr>
						<th>��ġ��ġ(��)</th>
						<td>${wifiDistance.wifiData.instlFloor}</td>
					</tr>
					<tr>
						<th>��ġ����</th>
						<td>${wifiDistance.wifiData.instlTy}</td>
					</tr>
					<tr>
						<th>��ġ���</th>
						<td>${wifiDistance.wifiData.instlMby}</td>
					</tr>
					<tr>
						<th>���񽺱���</th>
						<td>${wifiDistance.wifiData.svcSe}</td>
					</tr>
					<tr>
						<th>������</th>
						<td>${wifiDistance.wifiData.cmcwr}</td>
					</tr>
					<tr>
						<th>��ġ�⵵</th>
						<td>${wifiDistance.wifiData.cnstcYear}</td>
					</tr>
					<tr>
						<th>�ǳ��ܱ���</th>
						<td>${wifiDistance.wifiData.inoutDoor}</td>
					</tr>
					<tr>
						<th>WIFI ����ȯ��</th>
						<td>${wifiDistance.wifiData.remars3}</td>
					</tr>
					<tr>
						<th>X��ǥ</th>
						<td>${wifiDistance.wifiData.lnt}</td>
					</tr>
					<tr>
						<th>Y��ǥ</th>
						<td>${wifiDistance.wifiData.lat}</td>
					</tr>
					<tr>
						<th>�۾�����</th>
						<td>${wifiDistance.wifiData.workDttm}</td>
					</tr>
		</table>
	</div>

	<a href="/">�ڷ� ���ư���</a>
</body>
</html>