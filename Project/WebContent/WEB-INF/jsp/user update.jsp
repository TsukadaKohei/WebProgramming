<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー情報更新</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/origin/user update.css">
</head>
<body>

	<nav class="navbar-light bg-light">



    <ul class="nav justify-content-end" >


      <li class="nav-item">
        <a class="nav-link" href="#">${userInfo.name} さん</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="file:///C:/Users/mound/Documents/WebProgramming/Mock/login.html?">ログアウト</a>
      </li>


    </ul>
</nav>
<form action="UserUpdateServlet" method="post">
	<div class="container">
	<h1>ユーザ情報更新</h1>


<input type="hidden" name="id" value="${user.id}" class="col-sm-6 col-form-label">
	 <div class="form-group row">
    <label for="inputlogin" class="col-sm-4 col-form-label">ログインID</label>
    <div class="col-sm-6">
    <label class="col-sm-6 col-form-label">${user.loginId}</label>

    </div>
  </div>

  <div class="form-group row">
    <label for="inputPassword" class="col-sm-4 col-form-label">パスワード</label>
    <div class="col-sm-6">
      <input type="password" name="password" class="form-control" id="inputPassword" placeholder="パスワード">
    </div>
  </div>


  <div class="form-group row">
    <label for="inputPassword" class="col-sm-4 col-form-label">パスワード確認</label>
    <div class="col-sm-6">
      <input type="password" name="password" class="form-control" id="inputPassword" placeholder="パスワードをもう一度入力してください">
    </div>
  </div>


  <div class="form-group row">
    <label for="inputuser" class="col-sm-4 col-form-label">ユーザー名</label>
    <div class="col-sm-6">
      <input type="text" name="name" value="${user.name}" class="form-control" id="inputPassword" placeholder="氏名を入力してください">
    </div>
    </div>


 <div class="form-group row">
    <label for="inputuser" class="col-sm-4 col-form-label">生年月日</label>
    <div class="col-sm-6">
    <input type="date" name="birthDate" value="${user.birthDate}" class="form-control" id="inputPassword" placeholder="生年月日">
    </div>


  </div>
<button type="submit" class="btn btn-secondary text-center">更新</button>

<div class="form-group row">
    <a class="col-sm-4 col-form-label" href="#">戻る</a>
<div class="col-sm-6">
      <label class="text"  ></label>
    </div>
  </div>


</div>



</form>




</body>
</html>