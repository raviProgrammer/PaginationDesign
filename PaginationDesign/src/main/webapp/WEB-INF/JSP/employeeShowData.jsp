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
#mainData{
	width: 1300px;
	height: 500px;
	background-color: pink;
	margin-top: 20px;
	margin-left: 30px;
	box-shadow:0px 8px 16px 0px rgba(0,0,0,2);
	padding-top: 20px;  /* moves all content inside div down(top to down 5px) by 5px */
}
.pagination {
    margin-top: 16px;
}
.pagination .page {
    display: inline-block;
    padding: 6px 10px;
    margin-right: 6px;
    text-decoration: none;
    border-radius: 4px;
    border: 1px solid #ddd;
    color: #333;
}
.pagination .page.active {
    background: #007bff;
    color: #fff;
    border-color: #007bff;
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
<div id="mainData">
	<c:choose>
		<c:when test="${!empty listEmployee}">
			<center>
			<table border="1">
				<tr style="font-size: 22;">
					<th style="width:100px;"><a href="?pageNo=1&sortField=id&sortDir=${reverseSortDir}"> Id</a></th>
					<th style="width:100px;"><a href="?pageNo=1&sortField=name&sortDir=${reverseSortDir}"> Name</a></th>
					<th style="width:100px;"><a href="?pageNo=1&sortField=address&sortDir=${reverseSortDir}"> Address</a></th>
					<th style="width:100px;"><a href="?pageNo=1&sortField=email&sortDir=${reverseSortDir}"> Email</a></th>
					<th style="width:100px;"><a href="?pageNo=1&sortField=contact&sortDir=${reverseSortDir}"> Contact</a></th>
					<th style="width:100px;"><a href="?pageNo=1&sortField=dateOfBirth&sortDir=${reverseSortDir}"> birthDate</a></th>
					<th style="width:100px;"><a href="?pageNo=1&sortField=gender&sortDir=${reverseSortDir}"> Gender</a></th>
					<th style="width:100px;"><a href="?pageNo=1&sortField=designation&sortDir=${reverseSortDir}"> Designation</a></th>
					<th style="width:100px;"><a href="?pageNo=1&sortField=imageName&sortDir=${reverseSortDir}"> Picture</a></th>
				</tr>
				<c:forEach var="emp" items="${listEmployee}">
					<tr style="text-align: center;">
						<td style="height:50px;"> ${emp.id}</td>
						<td style="height:50px;"> ${emp.name}</td>
						<td style="height:50px;"> ${emp.address}</td>
						<td style="height:50px;"> ${emp.email}</td>
						<td style="height:50px;"> ${emp.contact}</td>
						<td style="height:50px;"> ${emp.dateOfBirth}</td>
						<td style="height:50px;"> ${emp.gender}</td>
						<td style="height:50px;"> ${emp.designation}</td>
						<td style="height:50px;"> <img width="50px" height="40px" src="<c:url value="/addImages/saveImage/${emp.imageName }"/>"/></td>
						<td style="height:50px;">
							<b><a onclick="return confirm('do you want to confirm delete')" href="delete?id=${emp.id}">Delete</a></b>
							<b><a href="edit?id=${emp.id}">Update</a></b>
						</td>
					</tr>
				</c:forEach>
				  		
			</table>
			</center>		
		</c:when>
		<c:otherwise>
      		 <h1 style="color:red;text-align:center">Records Empty</h1>
  		</c:otherwise>
	</c:choose>	
	<div class="pagination">
        <c:if test="${totalPages > 1}">
            <c:forEach var="i" begin="1" end="${totalPages}">
                <c:url var="pageUrl" value="/showEmployee">
                    <c:param name="pageNo" value="${i}" />
                    <c:param name="pageSize" value="7" />
                    <c:param name="sortField" value="${sortField}" />
                    <c:param name="sortDir" value="${sortDir}" />
                </c:url>

                <c:choose>
                    <c:when test="${i == currentPage}">
                        <a class="page active" href="${pageUrl}">${i}</a>
                    </c:when>
                    <c:otherwise>
                        <a class="page" href="${pageUrl}">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </c:if>
    </div>
</div>
</body>
</html>