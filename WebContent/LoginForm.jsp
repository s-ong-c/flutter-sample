

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	input[type=text]{
		color: blue;
	}
	input{
		padding: 5px;
		border: 1px solid black;
		
		margin : 5px;
	}
	input[type=submit]{
		background-color: black;
		color : white;
	}
</style>
</head>
<body>
<form action="/LoginAction" method="post">
	id: <input type="text" name = "id" id = 'id'/><br>
	pw: <input type="password" name = 'pw' id='pw' /><br>
	<input type="submit" value="ok" />
</form>

</body>
</html>