<%@page import="dao.FboardImpl"%>
<%@page import="dao.FBoardDaoInter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	int num = Integer.parseInt(request.getParameter("num"));
	System.out.println("num: " + num);
	FBoardDaoInter dao = FboardImpl.getDao();
	dao.updateHit(num);
	response.sendRedirect("info.jsp?num=" + num);
%>