<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="vo.FboardVO"%>
<%@page import="dao.FboardImpl"%>
<%@page import="dao.FBoardDaoInter"%>
<% 
	int num = Integer.parseInt(request.getParameter("num"));
	FboardImpl.getDao().deleteFboard(num);
	FboardVO vo = new FboardVO();
	// �������̵�
	response.sendRedirect("list.jsp");
%>


