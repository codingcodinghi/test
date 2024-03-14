<%@page import="java.util.List"%>
<%@page import="dao.GalleryDaoImpl"%>
<%@page import="dao.GalleryDaoInter"%>
<%@page import="vo.GalleryVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="../header.jsp"%>
<%
	GalleryDaoInter dao = GalleryDaoImpl.getDao();
	List<GalleryVO> list = dao.list();
%>
<style>
.image{
	width: 200px, cursor:pointer, hight: 220px
}

</style>
<div id="wrap" class="container mt-5">
	<div class="row">
		<h2>LIST.jsp</h2>
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
				<%--�ݺ��� ����  --%>
				<% for(GalleryVO e : list){%>
				
				<tr>
					<th scope="row"><%=e.getNum() %></th>
					<td>
					  <a href="detail.jsp?num=<%=e.getNum()%>">
					 		<img src="<%=application.getContextPath()%>/resources/img/<%=e.getImgname()%>" 
					 		class="image">
					  </a>	
					 </td>
					<td><%=e.getPrice()%></td>
					<td><%=e.getQty() %></td>
					<td><%=e.getPdate() %></td>
				</tr>
				<%} %>
				<%--�ݺ��� end  --%>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="5" class="text=end">
						<td> <button type="button" class="btn btn-outline-danger btn-sm"  onClick="location='write.jsp'">���ۼ�</button> </td>
					</tr>
				</tfoot>
					
			</table>
	</div>
</div>
<%@include file="../footer.jsp" %>