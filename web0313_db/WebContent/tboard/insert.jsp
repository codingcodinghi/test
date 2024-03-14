<%@page import="vo.FboardVO"%>
<%@page import="dao.FboardImpl"%>
<%@page import="dao.FBoardDaoInter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

 <%
     FboardVO v = new FboardVO();
     FBoardDaoInter dao = FboardImpl.getDao();
	 dao.addFboard(v); 
	 response.sendRedirect("list.jsp");
 %>

