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
/* A10 - ItemModel과 ItemIndex 이해하기 */
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
	        }
	    ];
	    //DataProvider의 setFields함수로 필드를 입력합니다.
	    dataProvider.setFields(fields);

	    //필드와 연결된 컬럼을 가진 배열 객체를 생성합니다.
	    var columns = [
	        {
	            name: "col1",
	            fieldName: "field1",
	            header : {
	                text: "컬럼1"
	            },
	            width: 200
	        },
	        {
	            name: "col2",
	            fieldName: "field2",	
	            header : {
	                text: "컬럼2"
	            },
	            width: 200
	        }
	    ];
	    //컬럼을 GridView에 입력 합니다.
	    gridView.setColumns(columns);
	    
	 	// 데이터 추가
	    var data = [
	    	["data1-1", "data1-2"],
	    	["data2-1", "data2-2"],
	    	["data3-1", "data3-2"],
	    	["data4-1", "data4-2"]
	    ];
	    dataProvider.setRows(data);
	    
	  //버튼을 클릭하면 포커스된 셀을 다른 셀로 변경합니다.
	    $("#btnPopupItemIndex").on("click", function(){
	        popupItemIndex();
	    })   
	});
	
	function popupItemIndex(){
		var focusCell = gridView.getCurrent();
		
		alert(focusCell.itemIndex);	// 0-based
	}
	
</script>
<title>realGrid Test</title>
</head>
<body>
	<div id="realgrid" style="width: 100%; height: 200px;"></div>
	<button type="button" class="btn btn-primary btn-xs" id="btnPopupItemIndex">포커스셀 ItemIndex 팝업하기</button>
</body>
</html>