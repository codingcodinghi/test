<%@page import="vo.FboardVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.FboardImpl"%>
<%@page import="dao.FBoardDaoInter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="../header.jsp" %>
<html>
<head>
<meta charset="EUC-KR">
<title>list.jsp</title>
</head>
<body>
<%
	FBoardDaoInter dao = FboardImpl.getDao();
	List<FboardVO> flist = dao.listFboard();
%>
	<div>
	<!-- -contents ���� -->
	<div id="wrap" class="container mt-5">
		<div class="row">
			<h2>FreeBoard List Total: <%=flist.size() %></h2>
			<table>
				<thead>
					<tr>
						<th scope="col">��ȣ</th>
						<th scope="col">����</th>
						<th scope="col">�ۼ���</th>
						<th scope="col">��ȸ��</th>
						<th scope="col">��¥</th>
						<th scope="col">����</th>
						<th scope="col">����</th>
					</tr>
				</thead>
				<tbody>					
				<%--�ݺ��� ����  --%>
				<% for(FboardVO e : flist){%>
				
				<tr>
					<th scope="row"><%=e.getNum() %></th>
					<td> <a href="hit.jsp?num=<%=e.getNum() %>" class="link-secondary"><%=e.getSubject() %></a> </td>
					<td><%=e.getWriter() %></td>
					<td><%=e.getHit() %></td>
					<td><%=e.getFdate() %></td>
					<td><%=e.getAge() %></td>
					<td><%=e.getStatus() %></td>
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
	</div>
	<%@include file="../footer.jsp" %>
</body>
</html>