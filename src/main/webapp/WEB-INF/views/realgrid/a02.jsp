<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/realgridjs-lic.js"/>"></script>
<script src="<c:url value="/resources/js/realgridjs_eval.1.1.26.min.js"/>"></script>
<script src="<c:url value="/resources/js/realgridjs-api.1.1.26.js" />"></script>

<script>
/* A02 - 컬럼만들기 */
var gridView;
var dataProvider;

	$(document).ready(function() {
		// 초기설정
		RealGridJS.setTrace(false);
	    RealGridJS.setRootContext("/realgrid/resources");
	    
	    dataProvider = new RealGridJS.LocalDataProvider();
	    gridView = new RealGridJS.GridView("realgrid");
	    gridView.setDataSource(dataProvider);	  
	    
	    // 컬럼 설정
	    var columns = [
	    	{
	    		name : "col1",
	    		header : {
	    			text : "컬럼1"	
	    		},
	    		width : 300	
	    	}
	    ];
	    
	    gridView.setColumns(columns);
	});
	
	
</script>
<title>realGrid Test</title>
</head>
<body>
	<div id="realgrid" style="width: 100%; height: 200px;"></div>
</body>
</html>