<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/origin/common.css">
</head>
<body>

	<form action="LoginServlet" method="post">
	<div class="login-area">
	<h1>ログインID</h1>
		<c:if test="${errMsg != null}" >
	    <div class="alert alert-danger" role="alert">
		  ${errMsg}
		</div>
	</c:if>

  <div class="form-group row">
    <label for="inputlogin" class="col-sm-4 col-form-label">ログインID</label>
    <div class="col-sm-6">
      <input type="text" name="loginId" class="form-control" id="inputlogin" placeholder="ログインID">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-4 col-form-label">パスワード</label>
    <div class="col-sm-6">
      <input type="password" name="password"  class="form-control" id="inputPassword" placeholder="パスワード">
    </div>
  </div>

  <button type="submit" class="btn btn-secondary text-center">ログイン</button>

  </div>



	</form>
</body>
</html>