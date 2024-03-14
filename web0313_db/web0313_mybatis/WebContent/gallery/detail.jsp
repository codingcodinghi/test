<%@page import="vo.GalleryVO"%>
<%@page import="dao.GalleryDaoImple"%>
<%@page import="dao.GalleryDaoInter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="../header.jsp"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
GalleryDaoInter dao = GalleryDaoImple.getDao();
GalleryVO v = dao.detail(num);
%>
<!-- num,imgname,comm,reip,price,qty,pdate -->
<div id="wrap" class="container mt-5">
	<div class="row">
		<h2>Gallery Detail</h2>
		<!-- �׸� ��Ÿ�� �ݺ�  -->
		<div class="row mb-3">
			<label for="filename" class="col-sm-2 col-form-label">��ȣ</label>
			<div class="col-sm-10">
				<%=v.getNum()%>
			</div>
		</div>
		<!-- �׸� ��Ÿ�� �ݺ�  -->
		<div class="row mb-3">
			<label for="filename" class="col-sm-2 col-form-label">�̹������ε�</label>
			<div class="col-sm-10">
				<img
					src="<%=application.getContextPath()%>/resources/img/<%=v.getImgname()%>">
			</div>
		</div>


		<div class="row mb-3">
			<label for="price" class="col-sm-2 col-form-label">����</label>
			<div class="col-sm-10"><%=v.getPrice()%></div>
		</div>



		<div class="row mb-3">
			<label for="qty" class="col-sm-2 col-form-label">����</label>
			<div class="col-sm-10"><%=v.getQty()%></div>
		</div>


		<div class="row">
			<label for="comm" class="col-sm-2 col-form-label">����</label>
			<div class="col-sm-10">
				<textarea name="comm" rows="10" cols="50" id="comm"><%=v.getComm()%></textarea>
			</div>
		</div>

		<div class="row mb-3">
			<label for="reip" class="col-sm-2 col-form-label">ip</label>
			<div class="col-sm-10"><%=v.getReip()%></div>
		</div>

		<div class="row mb-3">
			<label for="pdate" class="col-sm-2 col-form-label">��¥</label>
			<div class="col-sm-10"><%=v.getPdate()%></div>
		</div>




		<div class="container text-center" role="group">
			<button type="submit" class="btn btn-primary">���ۼ�</button>
			<button type="button" class="btn btn-danger"
				onclick="location='list.jsp'">����Ʈ</button>
			<button type="button" class="btn btn-danger"
				onclick="location='delete.jsp?num=<%=v.getNum()%>'">����</button>
		</div>

	</div>
</div>
<%@include file="../footer.jsp"%>