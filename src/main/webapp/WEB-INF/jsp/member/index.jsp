<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인화면</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

<link rel="stylesheet" href="css/main.css">

</head>
<body>
	<div class="container">
		<!-- 1. 게시글 등록 -->
		<div class="btn-wrapper">
			<form action="article/write.do">
				<input type="submit" class="okbtn btn btn-primary" value="게시글 등록" /><br>
				<br>
			</form>
			<!-- 2. 게시글 조회 -->
			<form action="article/read.do">
				<input type="submit" class="okbtn btn btn-primary" value="최근 게시글 보기" /><br>
				<br>
			</form>
			<!-- 3. 게시글 수정 -->
			<form action="article/modify.do">
				<input type="submit" class="okbtn btn btn-primary" value="최근 게시글 수정" /><br>
				<br>
			</form>
			<!-- 4. 게시글 삭제 -->
			<form action="article/delete.do">
				<input type="submit" class="okbtn btn btn-primary" value="최근 게시글 삭제" /><br>
				<br>
			</form>
		</div>
	</div>
</body>
</html>