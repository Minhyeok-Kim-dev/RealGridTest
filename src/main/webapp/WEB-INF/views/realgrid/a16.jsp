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
/* A16 - 로우 그룹핑(row grouping) - II groupBy()함수로 그룹핑 */
var gridView;
var dataProvider;

	$(document).ready(function() {
		// 초기설정
		RealGridJS.setTrace(false);
	    RealGridJS.setRootContext("/realgrid/resources");
	    
	    dataProvider = new RealGridJS.LocalDataProvider();
	    gridView = new RealGridJS.GridView("realgrid");
	    gridView.setDataSource(dataProvider);	  
	    
	  //다섯개의 필드를 가진 배열 객체를 생성합니다.
	    var fields = [
	        {
	            fieldName: "field1"
	        },
	        {
	            fieldName: "field2"
	        },
	        {
	            fieldName: "field3"
	        },
	        {
	            fieldName: "field4"
	        },
	        {
	            fieldName: "field5"
	        }
	    ];
	    //DataProvider의 setFields함수로 필드를 입력합니다.
	    dataProvider.setFields(fields);

	  //필드와 연결된 컬럼 배열 객체를 생성합니다.
	    var columns = [
	        {
	            name: "col1",
	            fieldName: "field1",
	            header : {
	                text: "직업"
	            },
	            width: 100
	        },
	        {
	            name: "col2",
	            fieldName: "field2",
	            header : {
	                text: "성별"
	            },
	            width: 100
	        },
	        {
	            name: "col3",
	            fieldName: "field3",
	            header : {
	                text: "이름"
	            },
	            width: 100
	        },
	        {
	            name: "col4",
	            fieldName: "field4",
	            header : {
	                text: "국어"
	            },
	            width: 100
	        },
	        {
	            name: "col5",
	            fieldName: "field5",
	            header : {
	                text: "수학"
	            },
	            width: 100
	        }
	    ];
	    //컬럼을 GridView에 입력 합니다.
	    gridView.setColumns(columns);
	    
	    var data = [
	        ["배우", "여자", "송윤아", "10", "33"],
	        ["배우", "여자", "전도연", "20", "22"],
	        ["가수", "여자", "이선희", "40", "33"],
	        ["배우", "여자", "하지원", "10", "11"],
	        ["가수", "여자", "소찬휘", "30", "55"],
	        ["가수", "여자", "박정현", "40", "22"],
	        ["배우", "여자", "전지현", "20", "44"]
	    ];
	    dataProvider.setRows(data);
	    
	 	// Reset Groups
	    $("#btnResetGroups").on("click", function(){
	        gridView.groupBy([]);
	    })

	    // 직업컬럼 단일그룹
	    $("#btnField1Group").on("click", function(){
	        gridView.groupBy(["field1"]);
	    })

	    // 국어컬럼 단일그룹
	    $("#btnField4Group").on("click", function(){
	        gridView.groupBy(["field4"]);
	    })

	    // 직업컬럼, 국어컬럼으로 중첩그룹
	    $("#btnMultiFieldsGroup").on("click", function(){
	        gridView.groupBy(["field1", "field4"]);
	    })
	});
</script>
<title>realGrid Test</title>
</head>
<body>
	<div id="realgrid" style="width: 100%; height: 200px;"></div>
	<button type="button" class="btn btn-primary btn-xs" id="btnResetGroups">그룹상태 초기화</button>
	<button type="button" class="btn btn-primary btn-xs" id="btnField1Group">직업컬럼으로 그룹잡기</button>
	<button type="button" class="btn btn-primary btn-xs" id="btnField4Group">국어컬럼으로 그룹잡기</button>
	<button type="button" class="btn btn-primary btn-xs" id="btnMultiFieldsGroup">직업컬럼, 국어컬럼으로 그룹잡기</button>	
</body>
</html>