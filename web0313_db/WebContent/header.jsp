<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>index</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>
<style type="text/css">
	/* *{
		margin: 0;
		padding: 0;
	} */
</style>
<head>
<meta charset="EUC-KR">
<title>HEADER</title>
</head>
<body>
	<header>
		<hgroup class="p-5 bg-primary text-white text-center " >
		<h1> ICT Study Model1</h1>
		
		</hgroup>
	</header>	
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
	 <div class="container-fluid">
			<ul class="navbar-nav">
				<li class="nav-item"><a href="" class="nav-link active" >Home</a></li>
				<li class="nav-item"><a href="" class="nav-link" >모델1게시판</a></li>
				<li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            Link
		          </a>
		          <ul class="dropdown-menu">
		            <li><a class="dropdown-item" href="#">Java</a></li>
		            <li><a class="dropdown-item" href="#">JSP</a></li>
		            <li><hr class="dropdown-divider"></li>
		            <li><a class="dropdown-item" href="#">Mybatis</a></li>
		          </ul>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link disabled" aria-disabled="true">갤러리</a>
		        </li>
		        </ul>
		        <!-- search창을 flex로 배치 -->
		        <form class="d-flex" role="search">
			        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			        <button class="btn btn-outline-success" type="submit">Search</button>
			      </form>
			
		</div>ㅕ	
	</nav>
</body>
</html>