<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>와이파이 정보 결과</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 100px auto;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            text-align: center;
        }
        h1 {
            font-size: 24px;
            color: #4CAF50;
        }
        .message {
            margin-top: 20px;
            font-size: 18px;
        }
        .btn-group a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .btn-group a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>와이파이 정보 불러오기 결과</h1>
    <div class="message">
        <p><strong>${wifiCount}</strong>개의 WiFi 정보를 성공적으로 불러왔습니다.</p>
    </div>
    <div class="btn-group">
        <a href="/">홈으로 돌아가기</a>
    </div>
</div>

</body>
</html>
