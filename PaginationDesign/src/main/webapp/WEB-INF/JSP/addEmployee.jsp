<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
footer {
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
	background: #222;
	color: white;
	text-align: center;
	padding: 10px;
}
header {
	background-color: #1e1e2f;
	color: #fff;
	padding: 15px 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}
.logo {
	font-size: 24px;
	font-weight: bold;
	color: #ffcc00;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	text-shadow: 1px 1px 0 red, 2px 2px 0 blue, 3px 3px 0 green, 4px 4px 0
		orange, 5px 5px 10px black;
}
nav ul {
	list-style: none;
	display: flex;
	gap: 20px;
}
nav ul li {
	display: inline;
}
nav ul li a {
	text-decoration: none;
	color: #fff;
	font-size: 16px;
	transition: color 0.3s;
}
nav ul li a:hover {
	color: #ffcc00;
}
#divMain{
	width: 600px;
	height: 460px;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 20px;
	background-color: #7FFFD4;
	box-shadow:0px 8px 16px 0px rgba(0,0,0,2);
}
.form{
	margin-left: 45px;
	margin-top: 5px;
}
#btn{
	margin-top: 10px;
	text-align: center;
}
.input{
	height: 30px;
	width: 400px;
}
#btnInput{
	height: 40px;
	width: 200px;
}
</style>
</head>
<body>
<footer>&copy; 2025 Employee Data Management. All rights reserved.</footer>
<header>
    <h3 class="logo">MyWebsite</h3>
    <nav>
        <ul>
            <li><a href="./">Home</a></li>
            <li><a href="about">About</a></li>
            <li><a href="services">Services</a></li>
            <li><a href="contact">Contact</a></li>
        </ul>
    </nav>
</header>
<div id="divMain">
	<form:form  method="POST" action="addEmployee" modelAttribute="employeeDTO" enctype="multipart/form-data">
		<div class="form"><b>Name*&nbsp;&nbsp;</b><form:input class="input" path="name" placeholder="Enter Name"/></div>
		<div class="form"><b>Address*&nbsp;&nbsp;</b><form:input class="input" path="address" placeholder="Enter Address"/></div>
		<div class="form"><b>Email*&nbsp;&nbsp;</b><form:input class="input" path="email" placeholder="Enter Email Id"/></div>
		<div class="form"><b>contact*&nbsp;&nbsp;</b><form:input class="input" type="number" path="contact" placeholder="Enter contact number"/></div>
		<div class="form"><b>DateBirth*&nbsp;&nbsp;</b><form:input class="input" path="dateOfBirth" placeholder="Enter datebirth format like 2 jan 1990"/></div>
		<div class="form"><b>Gender*&nbsp;&nbsp;</b><form:input class="input" path="gender" placeholder="Enter gender"/></div>
		<div class="form"><b>Designation*&nbsp;&nbsp;</b><form:input class="input" path="designation" placeholder="Enter designation"/></div>
		<div class="form"><b>Picture*&nbsp;&nbsp;</b><form:input type="file" accept="image/*"  path="image_name" onchange="getImagePreview(event)"/></div>
		<div class="form"><img id="preview" src="" width="100px" height="100px"/></div>
		<div id="btn"><input id="btnInput" style="color:white;background-color: blue;"type="submit" value="Register"/></div>		
	</form:form>
</div>
<script>
	function getImagePreview(event){
		var image=URL.createObjectURL(event.target.files[0]);
		var img=document.getElementById('preview');
		img.innerHTML='';
		img.src=image;
	}
</script>

</body>
</html>