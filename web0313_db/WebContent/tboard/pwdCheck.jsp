<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="vo.FboardVO"%>
<%@page import="dao.FboardImpl"%>
<%@page import="dao.FBoardDaoInter"%>
<% 
	int num = Integer.parseInt(request.getParameter("num"));
    String job = request.getParameter("job");
    String pwd = request.getParameter("pwd");
    
	//System.out.println("in pwdCheck.jsp num: " + num + " job: " + job + " pwd: " + pwd);
	
	FBoardDaoInter dao = FboardImpl.getDao();
	FboardVO vo = new FboardVO();
	vo.setNum(num);
	vo.setPwd(pwd);
	boolean res = dao.chkPwd(vo);
	System.out.println(res);
%>
num:<%=num%><br>
job:<%=job%><br>
pwd:<%=pwd%><br>
<%if(!res){%>
	<div>�߸��� �����Դϴ�. ��й�ȣ�� Ʋ���ϴ�.</div>
	<p><a href="info.jsp?num=<%=num%>">Ŭ��</a> </p>	
<%}else{
	if(job.equals("Del")){
		response.sendRedirect("delete.jsp?num=" + num);
	}else{
		response.sendRedirect("updateForm.jsp?num=" + num);
	}
  }%>

