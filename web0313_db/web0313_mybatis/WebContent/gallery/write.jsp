<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="../header.jsp"%>
<div id="wrap" class="container mt-5">
	<div class="row">
		<h2>Gallery Write</h2>
		<%=application.getRealPath("resources/img")%>
		<%-- enctype="multipart/form-data" : �̹���,������� ���̳ʸ��� ������ �� 
			���� Ÿ��  --%>
		<form method="post" action="FileUpload" enctype="multipart/form-data">
			<!-- �׸� ��Ÿ�� �ݺ�  -->
			<div class="row mb-3">
				<label for="fileName" class="col-sm-2 col-form-label">�̹���
					���ε�</label>
				<div class="col-sm-10">
					<%-- type="file"�� �� form�� �Ӽ��� enctype �ʼ� * --%>
					<input type="file" name="fileName" class="form-control"
						id="fileName">
				</div>
			</div>
			<!-- �׸� ��Ÿ�� �ݺ�  -->
			<div class="row mb-3">
				<label for="price" class="col-sm-2 col-form-label">����</label>
				<div class="col-sm-10">
					<input type="number" name="price" class="form-control" id="price"
						step="1000" value="3000" min="1000">
				</div>
			</div>

			<div class="row mb-3">
				<label for="qty" class="col-sm-2 col-form-label">����</label>
				<div class="col-sm-10">
					<input type="number" name="qty" class="form-control" id="qty">
				</div>
			</div>


			<div class="row">
				<label for="comm" class="col-sm-2 col-form-label">����</label>
				<div class="col-sm-10">
					<textarea name="comm" rows="10" cols="50" id="comm"></textarea>
				</div>
			</div>

			<div class="container text-center" role="group">
				<button type="submit" class="btn btn-primary">���ۼ�</button>
				<button type="button" class="btn btn-danger"
					onclick="location='list.jsp'">����Ʈ</button>
			</div>
		</form>
	</div>
</div>
<%@include file="../footer.jsp"%>