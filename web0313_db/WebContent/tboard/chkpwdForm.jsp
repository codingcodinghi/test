<%@page import="vo.FboardVO"%>
<%@page import="dao.FboardImpl"%>
<%@page import="dao.FBoardDaoInter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	int num = Integer.parseInt(request.getParameter("num"));
	String job = request.getParameter("job");
	
	System.out.println("num: " + num);
	FBoardDaoInter dao = FboardImpl.getDao();
	//FboardVO vo = dao.chkPwd(FboardVO);
%>
<%@include file="../header.jsp" %>
<h2> chkpwdForm.jsp</h2>
<div id="wrap" class="container mt-5">
	<form method="post" action="pwdCheck.jsp">
		<input type="hidden" name="num" value=<%= num %> >
		<input type="hidden" name="job" value=<%= job %> >
		<div class="row mb-3">
			<label for="pwd" class="col-sm-2 col-form-label">비밀번호</label>
			<div class="col-sm-10">
				<input type="password" name="pwd"  class="form-control" >
			</div>
		</div>
		<div class="container text-center" role="group">
			<button type="submit" class="btn btn-primary" >인증</button>
			<button type="button" class="btn btn-danger"  onClick="location='list.jsp'">리스트</button>				
		</div>

	</form>
	
</div>


<%@include file="../footer.jsp" %>

