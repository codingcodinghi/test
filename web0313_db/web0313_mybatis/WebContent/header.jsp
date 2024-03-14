<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>header</title>
<!--  반응형 웹을 위한 브라우저(장치의) width값과 초기 스케일값 1  -->
<meta name="viewport" content="witdh=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<header>
		<hgroup class="p-5 bg-primary text-white text-center">
			<h1>ICT Study Model1</h1>
			<p>[ICT Study 모델 1 실습 페이지 입니다.]</p>
		</hgroup>
	</header>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<ul class="navbar-nav">
				<li class="nav-item"><a href="" class="nav-link active">Home</a></li>
				<li class="nav-item"><a href="" class="nav-link">모델1게시판</a></li>
				<li class="nav-item"><a href="" class="nav-link">프로필</a></li>
				<%-- dropdown 링크 --%>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#">자바</a></li>
					<li><a class="dropdown-item" href="#">JSP</a></li>
					<li><a class="dropdown-driver" href="#"></a></li>
					<li><a class="dropdown-item" href="#">MyBatis</a></li>
				</ul>

				<!-- search창을 flex로 배치 -->
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</ul>
		</div>
	</nav>