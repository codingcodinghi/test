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
					<th scope="col">��ȣ</th>
					<th scope="col">�̹���</th>
					<th scope="col">����</th>
					<th scope="col">����</th>
					<th scope="col">��¥</th>
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
					<td><%=e.getPrice()%>��</td>
					<td><%=e.getQty()%>��</td>
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
							onclick="location='write.jsp'">���������</button>
					</th>
				<tr>
			</tfoot>
			</div>
			</div>
			<%@include file="../footer.jsp"%>