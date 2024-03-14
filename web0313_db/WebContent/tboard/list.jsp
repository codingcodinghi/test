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
	<!-- -contents 영역 -->
	<div id="wrap" class="container mt-5">
		<div class="row">
			<h2>FreeBoard List Total: <%=flist.size() %></h2>
			<table>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">조회수</th>
						<th scope="col">날짜</th>
						<th scope="col">나이</th>
						<th scope="col">성년</th>
					</tr>
				</thead>
				<tbody>					
				<%--반복문 시작  --%>
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
				<%--반복문 end  --%>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="5" class="text=end">
						<td> <button type="button" class="btn btn-outline-danger btn-sm"  onClick="location='write.jsp'">글작성</button> </td>
					</tr>
				</tfoot>
					
			</table>
		</div>
	</div>
	</div>
	<%@include file="../footer.jsp" %>
</body>
</html>