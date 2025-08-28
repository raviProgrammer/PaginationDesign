<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Home</title>
<style>
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

#SecondModel{
	width: 100%;
	height: 150px;
	margin-top: 10px;
	background-color: pink;
}

#secondBody{
	width: 400px;
	height: 70px;
	text-align: center;
	position: relative;
	top: 20%;
	left: 35%; 
}

#ThirdModel{
	width: 100%;
	height: 300px;
	background-color: pink;
	margin-top: 10px;
	display: flex;
}

.thirdBody{
	width: 250px;
	height: 250px;
	background-color: #7FFFD4;
	margin: 20px 180px;  /* margin: 20px(top & bottom) 180px(left & right) */
	box-shadow:0px 8px 16px 0px rgba(0,0,0,2);
	
}

.text{
	margin-left: 60px;
	position: absolute;
}
button {
	color: white;
	position: absolute;
	font-size: 20px;
	width: 100px;
	height: 40px;
	margin-left: 70px;
	margin-top: 100px;
	background-color: blue;
}
button:hover {
	color: yellow;
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

<div id="SecondModel">
	<div id="secondBody">
	<h1 style="color: blue;"><i>Welcome Back Employer</i></h1>
	<p style="color:brown;">Easily to Manager your data from Employee portal</p>
	</div>
</div>

<div id="ThirdModel">
	<div class="thirdBody">
		<h1 class="text">Employee</h1>
		<p style="color:blue; margin-top: 40px; margin-left: 20px;">Add the Employee data here</p>
		<a href="addEmployee"><button>Add</button></a>
	</div>
	<div class="thirdBody">
		<h1 class="text">Employee</h1>
		<p style="color:blue; margin-top: 40px; margin-left: 20px;">Show the Employee data here</p>
		<a href="showEmployee"><button>Show</button></a>
	</div>
</div>
</body>
</html>