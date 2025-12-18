<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang ="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link rel ="stylesheet" href ="/resources/css/reset.css"> 
<style>
	.container { width:325px; margin:0 auto; padding:25px 5px; }
	.search-wrap { display:flex; }
	.search-wrap button { width:180px; margin-left:5px; }
	
	.close { position:fixed; right:15px; bottom:25px; }
	
	.addr-msg { margin-top:15px; }
</style>
</head>
<body>

<div class ="container">
	<form action ="/user/rental/get_zipcode" method ="post">
		<ul class="search-wrap">
			<li><input type ="search" name="area3" placeholder="동입력" required class="form_control"></li>
			<li><button type ="submit" class="btn btn-dark">주소 검색</button></li>
		</ul>
	</form>
	
		<button type="button" onclick="self.close()" class ="bnt btn-danger">닫 기</button>
		
		<div class ="addr-list">
			<c:forEach var ="addr" items ="${addrList }">
			<a href = "javascript:sendAddr('${addr.zipcode}' ,'${addr.area1}' ,'${addr.area2}' ,'${addr.area3}' ,'${addr.area4}')">
			 ${addr.zipcode} ${addr.area1} ${addr.area2} ${addr.area3} ${addr.area4}
			</a>
			</c:forEach>
		</div>
</div>
<script> 
	function sendAddr(zipcode,area1,area2,area3,area4){
		var z = String(zipcode).trim();
		var address = area1+' '+area2+' '+ area3+' '+ area4;
		
		opener.document.rt_reg_frm.rt_zipcode.value = z;
		opener.document.rt_reg_frm.rt_addr.value = address;
		
		self.close();
	}
</script>
</body>
</html>