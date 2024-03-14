<%@page import="vo.FboardVO"%>
<%@page import="dao.FboardImpl"%>
<%@page import="dao.FBoardDaoInter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("euc-kr"); %>

 <%
 int num = Integer.parseInt(request.getParameter("num"));	
	int age=Integer.parseInt(request.getParameter("age"));		
	String writer= request.getParameter("writer");
	String subject= request.getParameter("subject");
	String content= request.getParameter("content");
	String reip= request.getRemoteAddr();	
 
	System.out.println("in update.jsp num: " + num + " age: " + age + " writer: " + writer);
	
	FBoardDaoInter dao = FboardImpl.getDao();
	FboardVO v = new FboardVO();
	v.setAge(age);
	v.setWriter(writer);
	v.setSubject(subject);	
	v.setContent(content);
	v.setReip(reip);	
	
	dao.updateFboard(v);
	
	 response.sendRedirect("list.jsp");
 %>

