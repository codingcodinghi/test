<%@page import="vo.FboardVO"%>
<%@page import="dao.FboardImpl"%>
<%@page import="dao.FBoardDaoInter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	int num = Integer.parseInt(request.getParameter("num"));
	System.out.println("num: " + num);
	FBoardDaoInter dao = FboardImpl.getDao();
	FboardVO vo = dao.datailFboard(num);
%>
<html>
<head>
<meta charset="EUC-KR">
<title>updateForm.jsp</title>
</head>
<body>
<%@include file="../header.jsp" %>
	<div id="wrap" class="container mt-5">
		<div class="row">
			<h2>FreeBoard updateForm.jsp</h2>
				<!--  �׸�Ÿ�� �ݺ� -->
			<form method="post" action="update.jsp">
				<input type="hidden" name="num" value=<%= num %> >
				<div class="row mb-3">
					<label for="subject" class="col-sm-2 col-form-label">����</label>
					<div class="col-sm-10">
						<input type="text" name="subject" value=<%= vo.getSubject() %> class="form-control" >
					</div>
				</div>
				<!--  �׸�Ÿ�� �ݺ� -->
				<div class="row mb-3">
					<label for="writer" class="col-sm-2 col-form-label">�ۼ���</label>
					<div class="col-sm-10">
						<input type="text" name="writer" id="writer" class="form-control" value="<%= vo.getWriter() %> ">
					</div>
				</div>
				<div class="row">
					<label for="content" class="col-sm-2 col-form-label">����</label>
					<div class="col-sm-10">
						<textarea rows="10" cols="50" name="content" id="content" ><%= vo.getContent() %> </textarea>
					</div>
				</div>
				<div class="row mb-3">
					<label for="reip" class="col-sm-2 col-form-label">������</label>
					<div class="col-sm-10">
						<input type="text" name="reip" id="reip" class="form-control" value="<%= vo.getReip() %> ">
					</div>
				</div>
				<div class="row mb-3">
					<label for="fdate" class="col-sm-2 col-form-label">�ۼ���</label>
					<div class="col-sm-10">
						<input type="text" name="fdate" id="fdate" class="form-control" value="<%= vo.getFdate() %>">
					</div>
				</div>
				<div class="row mb-3">
					<label for="age" class="col-sm-2 col-form-label">����</label>
					<div class="col-sm-10">
						<input type="text" name="age" id="age" class="form-control" value="<%= vo.getAge()%>">
					</div>
				</div>
				<div class="container text-center" role="group">
					<button type="submit" class="btn btn-primary" >����</button>
					<button type="button" class="btn btn-danger"  onClick="location='list.jsp'">����Ʈ</button>				
				</div>
			</form>	
		</div>
	</div>
	
	<%@include file="../footer.jsp" %>