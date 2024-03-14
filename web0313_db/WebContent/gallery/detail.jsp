<%@page import="vo.GalleryVO"%>
<%@page import="dao.GalleryDaoImpl"%>
<%@page import="dao.GalleryDaoInter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="../header.jsp"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
    
	GalleryDaoInter dao = GalleryDaoImpl.getDao();
	GalleryVO vo = dao.detail(num);
%>
<style>
.image{
	width: 200px, cursor:pointer, hight: 220px
}

</style>
<div id="wrap" class="container mt-5">
		<div class="row">
			<h2>Gallery Detail</h2>	
				<label for="fileName" class="col-sm-2 col-form-label"><%=vo.getNum()%></label>
				<div class="row mb-3">
					<label for="fileName" class="col-sm-2 col-form-label">�̹���</label>
					<div class="col sm-10">
						<img
							src="<%=application.getContextPath()%>/resources/img/<%=vo.getImgname()%>"
							class="image">
					</div>
				</div>
					<!--  �׸�Ÿ�� �ݺ� -->
				<div class="row mb-3">
					<label for="price" class="col-sm-2 col-form-label">����</label>
					<div class="col sm-10">
					<%=vo.getPrice()%>
					</div>
				</div>
				<div class="row mb-3">
					<label for="qty" class="col-sm-2 col-form-label">����</label>
					<div class="col sm-10">
					<%=vo.getQty()%>
					</div>
				</div>
				<div class="row mb-3">
					<label for="qty" class="col-sm-2 col-form-label">�ۼ���</label>
					<div class="col sm-10">
					<%=vo.getPdate()%>
					</div>
				</div>
				<div class="row">
					<label for="comm" class="col-sm-2 col-form-label"><%=vo.getPdate()%></label>
					<div class="col-sm-10">
						<textarea rows="10" cols="50" name="comm" id="comm" readonly="readonly"><%= vo.getComm() %> </textarea>
					</div>
				</div>			
				
				<div class="container text-center" role="group">
					<button type="submit" class="btn btn-primary" >����</button>
					<button type="button" class="btn btn-danger"  onClick="location='list.jsp'">����Ʈ</button>	
					<button type="button" class="btn btn-primary" onClick="location='update.jsp?num=<%= vo.getNum() %>' ">����</button>
					<button type="button" class="btn btn-primary" onClick="location='delete.jsp?num=<%= vo.getNum() %>' ">����</button>			
				</div>			
		</div>
	</div>
	
	<%@include file="../footer.jsp" %>