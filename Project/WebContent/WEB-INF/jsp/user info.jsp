<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー詳細情報参照</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/origin/user info.css">
</head>
<body>

	<nav class=" navbar-light bg-light">



    <ul  class="nav justify-content-end" >


      <li class="nav-item">
        <a class="nav-link" href="#">${userInfo.name} さん</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="LogoutServlet">ログアウト</a>
      </li>


    </ul>
</nav>
<form>
	<div class="container">
	<h1>ユーザー詳細情報画面</h1>



	 <div class="form-group row">
    <label for="inputlogin" class="col-sm-4 col-form-label">ログインID</label>
    <div class="col-sm-6">
      <a class="col-sm-6 col-form-label" >${user.loginId}</a>
    </div>
  </div>

  <div class="form-group row">
    <label for="inputPassword" class="col-sm-4 col-form-label">ユーザー名</label>
    <div class="col-sm-6">
            <a class="col-sm-6 col-form-label" >${user.name}</a>

    </div>
  </div>


  <div class="form-group row">
    <label for="inputPassword" class="col-sm-4 col-form-label">生年月日</label>
    <div class="col-sm-6">
           <a class="col-sm-6 col-form-label">${user.birthDate}</a>

    </div>
  </div>


  <div class="form-group row">
    <label for="inputuser" class="col-sm-4 col-form-label">登録日時</label>
    <div class="col-sm-6">
     <a class="col-sm-8 col-form-label" >${user.createDate}</a>
    </div>
    </div>


 <div class="form-group row">
    <label for="inputuser" class="col-sm-4 col-form-label">更新日時</label>
    <div class="col-sm-6">
      <a class="col-sm-8 col-form-label" >${user.updateDate}</a>
    </div>


  </div>


<div class="form-group row">
    <a class="col-sm-4 col-form-label" href="#">戻る</a>
<div class="col-sm-6">
      <label class="col-sm-4 col-form-label"></label>
    </div>
  </div>


</div>



</form>




</body>
</html>