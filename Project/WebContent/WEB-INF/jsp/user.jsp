<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー一覧</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/origin/user.css">
</head>
<body>
	<form>
	<nav class=" navbar-light bg-light">



    <ul  class="nav justify-content-end" >

      <li class="nav-item">
        <a class="nav-link" href="#">${userInfo.name} さん</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="UserNewServlet">新規登録</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="LogoutServlet">ログアウト</a>
      </li>

    </ul>

</nav>
	<div class="container">
	<h1>ユーザ一覧</h1>



	 <div class="form-group row">
    <label for="inputlogin" class="col-sm-4 col-form-label">ログインID</label>
    <div class="col-sm-6">
      <input type="text" class="form-control" id="inputlogin" placeholder="ログインID">
    </div>
  </div>


  <div class="form-group row">
    <label for="inputuser" class="col-sm-4 col-form-label">ユーザー名</label>
    <div class="col-sm-6">
      <input type="text" class="form-control" id="inputPassword" placeholder="ユーザー名">
    </div>




  </div>

 <div class="form-group row">
<label class="col-sm-4 col-form-label">生年月日</label>
<div class="date col-sm-6">
<div class="row">
<div class="col-sm-5">
<input type="date" class="form-control" id="dt" onchange="mydate1();" />
</div>
<div  class="col-sm-2">
<a>～</a>
</div>
<div  class="col-sm-5">
<input type="date" class="form-control" id="dt" onchange="mydate1();" />
</div>
</div>
</div>
</div>
<br><br>

 <a href="" type="submit" class="btn btn-secondary text-center">検索</a>


<br><br>
<table class="table">
  <caption>List of users</caption>
  <thead>
    <tr>
      <th scope="col">ログインID</th>
      <th scope="col">ユーザ一名</th>
      <th scope="col">生年月日</th>
      <th scope="col" > </th>
       <th scope="col" > </th>
        <th scope="col" > </th>
    </tr>
  </thead>
  <tbody>

    	<c:forEach var="user" items="${userList}">
<tr>
      <td>${user.loginId}</td>
      <td>${user.name}</td>
      <td>${user.birthDate}</td>

      <td><a href="UserInfoServlet?id=${user.id}" type="button" class="btn btn-primary">詳細</a></td>
     <td><a href="UserUpdateServlet?id=${user.id}" type="button" class="btn btn-success">更新</a></td>
	<td><a href="UserDeleteServlet?id=${user.id}" type="button" class="btn btn-danger">削除</a></td>
</tr>
		</c:forEach>






  </tbody>
</table>
		</div>
		</form>
</body>
</html>