<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー削除確認</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/origin/user delete.css">
</head>
<body>
<nav class="navbar-light bg-light">



    <ul  class="nav justify-content-end" >


      <li class="nav-item">
        <a class="nav-link" href="#">${userInfo.name} さん</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="LogoutServlet">ログアウト</a>
      </li>


    </ul>
</nav>
<form action="UserDeleteServlet" method="post">
	<div class="container">
	<h1>ユーザ削除確認</h1>
	<div class="main">
<input type="hidden" name="id" value="${user.id}" class="col-sm-6 col-form-label">
<label class="col-sm-6 col-form-label">ログインID:${user.loginId}</label>

<p>を本当に削除してよろしいですか？</p>
<br><br>
<br><br>
</div>
 <a  href="UserServlet" class="btn btn-secondary text-center">キャンセル</a>
<label>         </label>
<label></label>
<label></label>
<label></label>
<label></label>
<label></label>

 <button  type="submit" class="btn btn-secondary text-center">OK</button>


</div>















</form>



</body>
</html>