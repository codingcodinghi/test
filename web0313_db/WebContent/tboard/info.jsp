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
<title>info.jsp</title>
</head>
<body>
<%@include file="../header.jsp" %>
	<div id="wrap" class="container mt-5">
		<div class="row">
			<h2>FreeBoard INFo.jsp</h2>
				<!--  항목스타일 반복 -->
				<div class="row mb-3">
					<label for="subject" class="col-sm-2 col-form-label">제목</label>
					<div class="col-sm-10">
						<input type="text" name="subject" value=<%= vo.getSubject() %> class="form-control" readonly="readonly">
					</div>
				</div>
				<!--  항목스타일 반복 -->
				<div class="row mb-3">
					<label for="writer" class="col-sm-2 col-form-label">작성자</label>
					<div class="col-sm-10">
						<input type="text" name="writer" id="writer" class="form-control" value="<%= vo.getWriter() %> ">
					</div>
				</div>
				<div class="row">
					<label for="content" class="col-sm-2 col-form-label">내용</label>
					<div class="col-sm-10">
						<textarea rows="10" cols="50" name="content" id="content" readonly="readonly"><%= vo.getContent() %> </textarea>
					</div>
				</div>
				<div class="row mb-3">
					<label for="reip" class="col-sm-2 col-form-label">아이피</label>
					<div class="col-sm-10">
						<input type="text" name="reip" id="reip" class="form-control" value="<%= vo.getReip() %> ">
					</div>
				</div>
				<div class="row mb-3">
					<label for="fdate" class="col-sm-2 col-form-label">작성일</label>
					<div class="col-sm-10">
						<input type="text" name="fdate" id="fdate" class="form-control" value="<%= vo.getFdate() %>">
					</div>
				</div>
				<div class="row mb-3">
					<label for="age" class="col-sm-2 col-form-label">나이</label>
					<div class="col-sm-10">
						<input type="text" name="age" id="age" class="form-control" value="<%= vo.getAge()%>">
					</div>
				</div>
				<div class="container text-center" role="group">
					<button type="button" class="btn btn-primary" onClick="goUrl(<%= vo.getNum() %> ,'Upd')">수정</button>
					<button type="button" class="btn btn-primary" onClick="goUrl(<%= vo.getNum() %> ,'Del')">삭제</button>			
				</div>
		</div>
	</div>
	<script>
		function goUrl(num, type){
			console.log('chkpwdForm.jsp?num=' + num +  '&job=' + type);
			location='chkpwdForm.jsp?num=' + num +  '&job=' + type;
		}	
	</script>
	<%@include file="../footer.jsp" %>
</body>
</html>