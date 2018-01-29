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
/* A18 - 컬럼 필터링(Filtering) - II setColumnFilters()함수 사용하기 */
var gridView;
var dataProvider;

	$(document).ready(function() {
		// 초기설정
		RealGridJS.setTrace(false);
	    RealGridJS.setRootContext("/realgrid/resources");
	    
	    dataProvider = new RealGridJS.LocalDataProvider();
	    gridView = new RealGridJS.GridView("realgrid");
	    gridView.setDataSource(dataProvider);	  
	    
	  	//10개의 필드를 가진 배열 객체를 생성합니다.
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
	        },
	        {
	            fieldName: "field6"
	        },
	        {
	            fieldName: "field7"
	        },
	        {
	            fieldName: "field8"
	        },
	        {
	            fieldName: "field9"
	        },
	        {
	            fieldName: "field10"
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
	            width : 60,
	            filters : [{
	                name: "가수",
	                criteria: "value = '가수'"
	            }, {
	                name: "배우",
	                criteria: "value = '배우'"
	            }]
	        },
	        {
	            name: "col2",
	            fieldName: "field2",
	            header : {
	                text: "성별"
	            },
	            width: 50
	        },
	        {
	            name: "col3",
	            fieldName: "field3",
	            header : {
	                text: "이름"
	            },
	            width: 80
	        },
	        {
	            name: "col4",
	            fieldName: "field4",
	            header : {
	                text: "국어"
	            },
	            width: 80
	        },
	        {
	            name: "col5",
	            fieldName: "field5",
	            header : {
	                text: "수학"
	            },
	            width: 80
	        },
	        {
	            name: "col6",
	            fieldName: "field6",
	            header : {
	                text: "민법"
	            },
	            width: 80
	        },
	        {
	            name: "col7",
	            fieldName: "field7",
	            header : {
	                text: "한국사"
	            },
	            width: 80
	        },
	        {
	            name: "col8",
	            fieldName: "field8",
	            header : {
	                text: "영어"
	            },
	            width: 80
	        },
	        {
	            name: "col9",
	            fieldName: "field9",
	            header : {
	                text: "과학"
	            },
	            width: 80
	        },
	        {
	            name: "col10",
	            fieldName: "field10",
	            header : {
	                text: "사회"
	            },
	            width: 80
	        }
	    ];
	    //컬럼을 GridView에 입력 합니다.
	    gridView.setColumns(columns);
	    
	    var data = [
	        ["가수", "여자", "정수라", "80", "99", "90", "90", "100", "100", "90"],
	        ["배우", "여자", "송윤아", "10", "33", "90", "70", "60", "100", "80"],
	        ["배우", "여자", "전도연", "20", "22", "90", "70", "60", "100", "80"],
	        ["가수", "여자", "이선희", "40", "33", "90", "70", "60", "100", "80"],
	        ["배우", "여자", "하지원", "10", "11", "90", "70", "60", "100", "80"],
	        ["가수", "여자", "소찬휘", "30", "55", "90", "70", "60", "100", "80"],
	        ["가수", "여자", "박정현", "40", "22", "90", "70", "60", "100", "80"],
	        ["배우", "여자", "전지현", "20", "44", "90", "70", "60", "100", "80"]
	    ];
	    dataProvider.setRows(data);
	    
	 	// setColumnFilters()함수로 직업컬럼에 필터 적용
	    $("#btnSetColumnFilters").on("click", function(){
	        var filters = [{
	                name: "가수",
	                criteria: "value = '가수'",
	                text: "가수만 걸러주세요."
	            }, {
	                name: "배우인데 텍스트다르지롱~",
	                criteria: "value = '배우'"
	            }];

	        gridView.setColumnFilters("col1", filters);
	    });
	 
	    // 필터링 된 컬럼의 필터정보 지우기
	    $("#btnClearColumnFilters").on("click", function(){
	    	 gridView.clearColumnFilters("col1");
	    })
	});
</script>
<title>realGrid Test</title>
</head>
<body>
	<div id="realgrid" style="width: 100%; height: 200px;"></div>
	<button type="button" class="btn btn-primary btn-xs" id="btnClearColumnFilters">직업컬럼 필터정보 지우기</button>
	<button type="button" class="btn btn-primary btn-xs" id="btnSetColumnFilters">직업컬럼 필터정보 생성</button>
</body>
</html>