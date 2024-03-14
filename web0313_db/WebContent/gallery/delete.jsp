<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="vo.GalleryVO"%>
<%@page import="dao.GalleryDaoImpl"%>
<%@page import="dao.GalleryDaoInter"%>
<% 
int num = Integer.parseInt(request.getParameter("num"));

 GalleryDaoInter dao = GalleryDaoImpl.getDao();
 dao.del(num);
 response.sendRedirect("list.jsp");
%>


