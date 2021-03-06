<%@page import="com.webjjang.board.service.BoardViewService"%>
<%@page import="com.webjjang.main.controller.ExeService"%>
<%@page import="com.webjjang.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//넘어오는 데이터(글번호)받기,넘어오는 건 다 String 
String strNo = request.getParameter("no");
long no = Long.parseLong(strNo);
//2개 이상의 데이터를 하나로 만들어서 넘기려고 함 - 같은 타입 배열, 다른 타입이면 class 또는 object 배열 
// new long[]{글번호,1증가 여부 - 1:증가, 0:증가 안함}
BoardVO vo =(BoardVO)ExeService.execute(new BoardViewService(),new long[]{no,0});
request.setAttribute("vo", vo);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
</head>
<body>
<div class="container">
<h1>게시글 수정</h1>
게시글 수정 처리 HTML form action 설정
<form action="update.jsp" method="post">
	<div class="form-gorup">
		<label>번호</label><br/>
		<!-- input tag의 기본 type->text. 때문에 생략 가능.수정불가 속성:readonly:읽기전용-->
		<input name ="no" readonly="readonly" value="${vo.no }" class="form-control"  ><br/>
	</div>
	<div class="form-gorup">
		<label>제목</label><br/>
		<!-- input tag의 기본 type->text. 때문에 생략 가능 -->
		<input name = "title" value="${vo.title }" class="form-control" required="required"><br/>
		<!--textarea:여러줄의 데이터 입력 rows:즐 수 cols:칸 수 (BS에서 대부분 사용) name:서버에서 찾아쓰는 이름표  value:데이터 기본 셋팅  -->
	</div>
	<div class="form-gorup">
		<label>내용</label><br/>
		<textarea rows="7" name="content" class="form-control"required="required" >
		${vo.content }
		</textarea><br/>  
	</div>
	<div class="form-gorup">
		<label>작성자</label><br/>
		<input name = "writer" class="form-control" value="${vo.writer}"required="required"><br/>
	</div>
<!-- 데이터를 전송하는 type= "submit" 버튼,버튼의 기본이므로 생략가능 -->
<button class="btn btn-default">수정</button>
<button type ="reset" class="btn btn-default">새 입력</button>
<!-- 취소 하려면 버튼 모양으로 사용(type="button")하고 취소 동작을 JS로 작성 -->
<button type ="button" onclick="history.back()" class="btn btn-default">취소</button>

</form>
</div>
</body>
</html>