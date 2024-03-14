<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>write.jsp</title>
</head>
<body>
<%@include file="../header.jsp" %>
<%= application.getRealPath("resources/img") %>
	<div id="wrap" class="container mt-5">
		<div class="row">
			<h2>Gallery Write</h2>
			<!-- form action="[%=request.getContextPath() %]/test/test.do" method="post" enctype="multipart/form-data"  -->
			<form method="post" action="FboardServlet">
				<!--  항목스타일 반복 -->
				<!-- enctype="multipart/form-data" : 이미지, 영상등을 바이너리로 전송할때 폼의 타입 -->
				<div class="row mb-3">
					<label for="fileName" class="col-sm-2 col-form-label">이미지업로드</label>
					<div class="col-sm-10">
					<!-- !!!!! 이미지일 경우  type="file" -->
						<input type="file" name="fileName" id="fileName" class="form-control">
					</div>
				</div>
				<!--  항목스타일 반복 -->
				<div class="row mb-3">
					<label for="price" class="col-sm-2 col-form-label">가격</label>
					<div class="col-sm-10">
						<input type="number" name="price" id="price" step="1000" value="3000" min="1000" class="form-control">
					</div>
				</div>
				<div class="row mb-3">
					<label for="qty" class="col-sm-2 col-form-label">수량</label>
					<div class="col-sm-10">
						<input type="number" name="qty" id="qty"  class="form-control">
					</div>
				</div>
				<div class="row">
					<label for="comm" class="col-sm-2 col-form-label">내용</label>
					<div class="col-sm-10">
						<textarea rows="10" cols="50" name="comm" id="comm" ></textarea>
					</div>
				</div>			
				
				<div class="container text-center" role="group">
					<button type="submit" class="btn btn-primary" >저장</button>
					<button type="button" class="btn btn-danger"  onClick="location='list.jsp'">리스트</button>				
				</div>
			</form>
		</div>
	</div>
	<%@include file="../footer.jsp" %>
</body>
</html>