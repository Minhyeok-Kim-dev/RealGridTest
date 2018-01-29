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
/* A12 - 소팅(sorting), 데이터 정렬하기 - I 단일 컬럼 정렬 */
var gridView;
var dataProvider;

	$(document).ready(function() {
		// 초기설정
		RealGridJS.setTrace(false);
	    RealGridJS.setRootContext("/realgrid/resources");
	    
	    dataProvider = new RealGridJS.LocalDataProvider();
	    gridView = new RealGridJS.GridView("realgrid");
	    gridView.setDataSource(dataProvider);	  
	    
	  	//두 개의 필드를 가진 배열 객체를 생성합니다.
	    var fields = [
	        {
	            fieldName: "field1"
	        },
	        {
	            fieldName: "field2"
	        },
	        {
	            fieldName: "field3"
	        }
	    ];
	    //DataProvider의 setFields함수로 필드를 입력합니다.
	    dataProvider.setFields(fields);

	    //필드와 연결된 컬럼을 가진 배열 객체를 생성합니다.
	    var columns = [
	        {
	            name : "col1",
	            fieldName : "field1",
	            header : {
	                text : "이름"
	            },
	            width : 150
	        },
	        {
	            name : "col2",
	            fieldName : "field2",	
	            header : {
	                text : "국어"
	            },
	            width : 150
	        },
	        {
	            name : "col3",
	            fieldName : "field3",	
	            header : {
	                text : "수학"
	            },
	            width : 150
	        }
	    ];
	    //컬럼을 GridView에 입력 합니다.
	    gridView.setColumns(columns);
	    
	 	// 데이터 추가
	    var data = [
	    	["송윤아", "10", "33"],
	        ["전도연", "20", "22"],
	        ["하지원", "20", "11"],
	        ["전지현", "10", "44"]
	    ];
	    dataProvider.setRows(data);
	    
	    $("#btnChangeSortStyleNone").on("click", function(){
	        setSortStyle(RealGridJS.SortStyle.NONE);
	    });   
	    
	    $("#btnChangeSortStyleExclusive").on("click", function(){
	    	setSortStyle(RealGridJS.SortStyle.EXCLUSIVE);
	    });
	});
	
	function setSortStyle(style){
		var options = {};
		options.style = style;
		gridView.setSortingOptions(options);
	}
	
</script>
<title>realGrid Test</title>
</head>
<body>
	<div id="realgrid" style="width: 100%; height: 200px;"></div>
	<button type="button" class="btn btn-primary btn-xs" id="btnChangeSortStyleNone">None</button>
	<button type="button" class="btn btn-primary btn-xs" id="btnChangeSortStyleExclusive">Exclusive</button>
	
</body>
</html>