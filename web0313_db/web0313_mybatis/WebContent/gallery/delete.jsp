<%@page import="dao.GalleryDaoImple"%>
<%@page import="dao.GalleryDaoInter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
GalleryDaoInter dao = GalleryDaoImple.getDao();
dao.delete(num);
response.sendRedirect("list.jsp");
%>                                                                             