<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
    <style>
        .login {
            left: 30%;
            position: absolute;
            height: 50px;
            top: 45%;
            width: auto;
            text-align: center;
        }
    </style>
</head>
<body>
        <body>
                <header>  
                    <ul class="topMenu">
                        <!-- <li><a href="http://">Logout</a></li> -->
                        <li><a href="testLogin.html">Login</a></li>
                        <li><a href="http://">Menu</a></li>
                        <li><a href="test.html">Home</a></li>
                    </ul>
                    <div class="container">
                        <img src="image/images.jpg" alt="darkknight">
                        <div class="center">Text</div>
                            <ul class="menuBar">
                                <li><a href="http://">메인</a></li>
                                <li><a href="http://">영화</a></li>
                                <li><a href="http://">이슈</a></li>
                                <li><a href="http://">게시판</a></li>
                                <li><a href="http://">Q&A</a></li>
                            </ul>
                    </div>
                </header>
             
                <form action="/LoginAction" method="post">
                <div class="details">
                    <div class="login">
                            아이디 :<input type="text" name="id" id="" style="float: right"> <br>
                            패스워드 : <input type="password" name="pw" id="">
                   <input type="submit" value="로그인"/>   
                    </div>
                    <%
                String msg = (String)request.getAttribute("msg");
                if(msg!=null){
                	%>
                	<label><b style="color:'red'; border: 10px solid red"><%= msg %></b></label>
                	<%
                }
                %>
                    

                </div>
                </form>
                
                <footer>
                    <p>비트캠프 서초점 자바개발 102기 D조 김상욱<br>
                        강남역 5번출구 앞 100m 지점<br>
                        연락처 : 02-0000-0000
                    </p>
                </footer>
            </body>


</body>
</html>