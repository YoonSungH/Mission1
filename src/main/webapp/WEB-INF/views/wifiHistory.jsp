<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>위치 히스토리 목록</title>
<style>
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

    .table-container {
        overflow-x: auto; /* 테이블에 가로 스크롤을 허용 */
        margin-top: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        table-layout: auto; /* 데이터에 맞춰 열 크기 조정 */
        min-width: 800px; /* 스크롤을 유발할 최소 너비 설정 */
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
</style>
</head>
<body>
    <header>
        <h1>위치 히스토리 목록</h1>
    </header>

    <div class="container">
        <div class="btn-group">
            <a href="/">홈</a>
            <a href="/wifiHistory">위치 히스토리 목록</a>
            <a href="/fetchWifiData">Open API 와이파이 정보 가져오기</a>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>X좌표</th>
                        <th>Y좌표</th>
                        <th>조회일자</th>
                        <th>비고</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="history" items="${historyList}">
                        <tr>
                            <td>${history.id}</td>
                            <td>${history.lat}</td>
                            <td>${history.lnt}</td>
                            <td>${history.searchTime}</td>
                            <td><form action="/deleteHistory" method="post">
                                    <input type="hidden" name="id" value="${history.id}" />
                                    <button type="submit">삭제</button>
                                </form></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
