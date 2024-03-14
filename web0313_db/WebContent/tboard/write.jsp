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
	<div id="wrap" class="container mt-5">
		<div class="row">
			<h2>FreeBoard Write</h2>
			<form method="post" action="Fboard">
				<input type="hidden" name="num" value="0" >
				<!--  항목스타일 반복 -->
				<div class="row mb-3">
					<label for="subject" class="col-sm-2 col-form-label">제목</label>
					<div class="col-sm-10">
						<input type="text" name="subject" id="subject" class="form-control">
					</div>
				</div>
				<!--  항목스타일 반복 -->
				<div class="row mb-3">
					<label for="writer" class="col-sm-2 col-form-label">작성자</label>
					<div class="col-sm-10">
						<input type="text" name="writer" id="writer" class="form-control">
					</div>
				</div>
				<div class="row">
					<label for="content" class="col-sm-2 col-form-label">내용</label>
					<div class="col-sm-10">
						<textarea rows="10" cols="50" name="content" id="content" ></textarea>
					</div>
				</div>
				<div class="row mb-3">
					<label for="pwd" class="col-sm-2 col-form-label">패스워드</label>
					<div class="col-sm-10">
						<input type="password" name="pwd" id="pwd" class="form-control">
					</div>
				</div>
				<div class="row mb-3">
					<label for="age" class="col-sm-2 col-form-label">나이</label>
					<div class="col-sm-10">
						<input type="text" name="age" id="age" class="form-control">
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