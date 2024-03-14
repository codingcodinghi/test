/<!-- 포폴? -->
<%@page import="dao.GalleryDaoImple"%>
<%@page import="dao.GalleryDaoInter"%>
<%@page import="vo.GalleryVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
/*이미지 박스를 옆으로 정렬한다.*/
.container {
	position: relative;
	width: 200px;
	margin-left: 10px;
	float: left;
}

.image {
	display: block; /* 마진을 먹이기 위해서 변경 */
	width: 200px;
	height: 220px;
	cursor: pointer;
}
/*overlay를 부모의 절대 좌표로 설정하려면 그 부모 container => relative*/
.overlay {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgb(0, 0, 0);
	background: rgba(0, 0, 0, 0.5);
	cursor: pointer;
	overflow: hidden;
	width: 220px;
	height: 0;
	/*0.5초 , ease: 시작과 끝에서 천천히, 중간에는 빠르게 변화하는 타이밍 함수*/
	transition: .5s ease;
}

.container:hover .overlay {
	height: 80%;
}

.text {
	color: white;
	font-size: 12px;
	position: absolute;
	top: 50%;
	left: 50%;
	text-align: center;
	/*translate(X,Y) : X와 Y의 지정된 거리 만큼 요소를 이동 시켜주는 값*/
	transform: translate(-50%, -50%);
}

.text ul {
	list-style: none;
	width: 220px;
	padding: 20px 10px;
}

.text li {
	width: 100%;
	margin-top: 2px;
}
</style>
</head>
<body>
	<%
		GalleryDaoInter dao = GalleryDaoImple.getDao();
	List<GalleryVO> list = dao.list();
	for (GalleryVO e : list) {
	%>
	<div class="container">
		<img
			src="<%=application.getContextPath()%>/resources/img/<%=e.getImgname()%>"
			class="image">
		<div class="overlay">
			<div class="text">
				<ul>
					<li><%=e.getComm()%></li>
					<li><%=e.getPrice()%>원</li>
					<li><%=e.getQty()%>개</li>
				</ul>
			</div>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>