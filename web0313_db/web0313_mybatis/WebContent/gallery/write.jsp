<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="../header.jsp"%>
<div id="wrap" class="container mt-5">
	<div class="row">
		<h2>Gallery Write</h2>
		<%=application.getRealPath("resources/img")%>
		<%-- enctype="multipart/form-data" : 이미지,영상등을 바이너리로 전송할 때 
			폼의 타입  --%>
		<form method="post" action="FileUpload" enctype="multipart/form-data">
			<!-- 항목 스타일 반복  -->
			<div class="row mb-3">
				<label for="fileName" class="col-sm-2 col-form-label">이미지
					업로드</label>
				<div class="col-sm-10">
					<%-- type="file"일 때 form의 속성은 enctype 필수 * --%>
					<input type="file" name="fileName" class="form-control"
						id="fileName">
				</div>
			</div>
			<!-- 항목 스타일 반복  -->
			<div class="row mb-3">
				<label for="price" class="col-sm-2 col-form-label">가격</label>
				<div class="col-sm-10">
					<input type="number" name="price" class="form-control" id="price"
						step="1000" value="3000" min="1000">
				</div>
			</div>

			<div class="row mb-3">
				<label for="qty" class="col-sm-2 col-form-label">수량</label>
				<div class="col-sm-10">
					<input type="number" name="qty" class="form-control" id="qty">
				</div>
			</div>


			<div class="row">
				<label for="comm" class="col-sm-2 col-form-label">내용</label>
				<div class="col-sm-10">
					<textarea name="comm" rows="10" cols="50" id="comm"></textarea>
				</div>
			</div>

			<div class="container text-center" role="group">
				<button type="submit" class="btn btn-primary">글작성</button>
				<button type="button" class="btn btn-danger"
					onclick="location='list.jsp'">리스트</button>
			</div>
		</form>
	</div>
</div>
<%@include file="../footer.jsp"%>