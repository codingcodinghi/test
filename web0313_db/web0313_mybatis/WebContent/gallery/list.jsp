<%@page import="dao.GalleryDaoImple"%>
<%@page import="dao.GalleryDaoInter"%>
<%@page import="vo.GalleryVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="../header.jsp"%>
<style>
.image {
	width: 200px;
	cursor: pointer;
	height: 220px;
}
</style>
<div id="wrap" class="container mt-5">
	<div class="row">
		<h2>Gallery Write</h2>
		<table>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">이미지</th>
					<th scope="col">가격</th>
					<th scope="col">수량</th>
					<th scope="col">날짜</th>
				</tr>
			</thead>
			<tbody>
				<%
					GalleryDaoInter dao = GalleryDaoImple.getDao();
				List<GalleryVO> list = dao.list();
				for (GalleryVO e : list) {
				%>
				<tr>
					<td><%=e.getNum()%></td>
					<td><a href="detail.jsp?num=<%=e.getNum()%>"> <img
							src="<%=application.getContextPath()%>/resources/img/<%=e.getImgname()%>"
							class="image"></a></td>
					<td><%=e.getPrice()%>원</td>
					<td><%=e.getQty()%>개</td>
					<td><%=e.getPdate()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="5" class="text-end">
						<button class="btn btn-outline-danger btn-sm"
							onclick="location='write.jsp'">갤러리등록</button>
					</th>
				<tr>
			</tfoot>
			</div>
			</div>
			<%@include file="../footer.jsp"%>