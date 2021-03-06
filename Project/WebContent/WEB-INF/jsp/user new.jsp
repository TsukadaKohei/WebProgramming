<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー新規登録</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/origin/user new.css">
</head>
<body>

	<nav class="navbar-light bg-light">



    <ul  class="nav justify-content-end" >


      <li class="nav-item">
        <a class="nav-link" href="#">ユーザー名</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="LogoutServlet">ログアウト</a>
      </li>


    </ul>
</nav>
<form action="UserNewServlet" method="post">
	<div class="container">
	<h1>ユーザ新規登録</h1>

	<c:if test="${errMsg != null}" >
	    <div class="alert alert-danger" role="alert">
		  ${errMsg}
		</div>
	</c:if>


	 <div class="form-group row">
    <label for="inputlogin" class="col-sm-4 col-form-label" >ログインID</label>
    <div class="col-sm-6">
      <input type="text" name="loginId" class="form-control" id="inputlogin" placeholder="ログインID">
    </div>
  </div>

  <div class="form-group row">
    <label for="inputPassword" class="col-sm-4 col-form-label" >パスワード</label>
    <div class="col-sm-6">
      <input type="password" name="password" class="form-control" id="inputPassword" placeholder="パスワード">
    </div>
  </div>


  <div class="form-group row">
    <label for="inputPassword" class="col-sm-4 col-form-label" >パスワード確認</label>
    <div class="col-sm-6">
      <input type="password" name="password2" class="form-control" id="inputPassword" placeholder="パスワードをもう一度入力してください">
    </div>
  </div>


  <div class="form-group row">
    <label for="inputuser" class="col-sm-4 col-form-label" >ユーザー名</label>
    <div class="col-sm-6">
      <input type="text" name="name" class="form-control" id="inputPassword" placeholder="ユーザー名">
    </div>
    </div>


 <div class="form-group row">
    <label  for="inputuser" class="col-sm-4 col-form-label" >生年月日</label>
    <div class="col-sm-6">
      <input type="date" name="birthDate" class="form-control" id="inputPassword" placeholder="生年月日">
    </div>


  </div>
  <div>
<button type="submit" class="btn btn-secondary text-center">登録</button>
</div>
<div class="form-group row">
    <a class="col-sm-4 col-form-label" href="#">戻る</a>
<div class="col-sm-6">
      <label class="text"></label>
    </div>
  </div>


</div>



</form>




</body>
</html>