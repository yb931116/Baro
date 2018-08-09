<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<c:url value='/resources/js/core/jquery.3.2.1.min.js'/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
redirecting...

	<form id= "redirectForm" method="post" action="<c:url value='/logicfocus/read'/>">
	<input type="hidden" name="project_no" value="${resultMap.project_no}" >
	</form>

</body>

	<script>
	$(function(){
		$("#redirectForm").submit();
	});
	</script>
</html>