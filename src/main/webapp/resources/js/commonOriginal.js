var commonOriginal = new Object();
/*
 * ################# CONSTANTS ####################
 */

/*
 * common
 */

commonOriginal.CONTEXT_PATH = '';
/*
 * for ajax form
 */
commonOriginal.SUCCESS_FLAG = 'SUCCESS_FLAG';
commonOriginal.URL_FOR_REDIRECT = 'URL_FOR_REDIRECT';
commonOriginal.MSG_FOR_ALERT = 'MSG_FOR_ALERT';

/**
 * 공통 레이어 팝업
 */
commonOriginal.layerPopup = function(url, id){
	$.ajax({
        type : "POST",
        url : url,
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

commonOriginal.layerPopupParam = function(url, id, params){
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
commonOriginal.popupCallback = function(data, id) {
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