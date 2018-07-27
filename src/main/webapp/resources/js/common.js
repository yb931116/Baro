var common = new Object();
/*
 * ################# CONSTANTS ####################
 */

/*
 * common
 */

common.CONTEXT_PATH = '';
/*
 * for ajax form
 */
common.SUCCESS_FLAG = 'SUCCESS_FLAG';
common.URL_FOR_REDIRECT = 'URL_FOR_REDIRECT';
common.MSG_FOR_ALERT = 'MSG_FOR_ALERT';

/**
 * 공통 레이어 팝업
 */
common.layerPopup = function(url, _source_values, _values, id){

	
	$.ajax({
        type : "POST",
        url : url,
        data: {
        	"source_original_no": _source_values[0] ,
			"source_source_no": _source_values[1] ,
			"source_summary": _source_values[2],
			"source_contents": _source_values[3],
			"source_category": _source_values[4],
			"source_business_no": _source_values[5],
        	"original_no":_values[0] ,
			"source_no": _values[1] ,
			"summary": _values[2],
			"contents": _values[3],
			"category": _values[4],
			"business_no": _values[5]
	},
        traditional : true,
        cache: false,
        success : function(data) {
        	common.popupCallback(data, id);
	    },
        error : function(xhr, status, exception){
        	alert("전송에 실패하였습니다. \n ("+status+")");
			return false;
        }
    });
};

common.layerPopupParam = function(url, id, params){
	
	
	$.ajax({
        type : "POST",
        url : url,
        cache: false,
        data : params,
        success : function(data) {
        	common.popupCallback(data, id);
	    },
        error : function(xhr, status, exception){
        	alert("전송에 실패하였습니다. \n ("+status+")");
			return false;
        }
    });
};

/**
 * 팝업콜백함수
 */
common.popupCallback = function(data, id) {
	$(id).html(data);
	$(id).modal({
		modal: true,
		width: "auto",
		maxWidth: "1000px",
		height: "auto",
		minHeight: "500px",
		resizable: true
	});
};