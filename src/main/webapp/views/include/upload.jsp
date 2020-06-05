<%@ page contentType="text/html;charset=UTF-8" %>
<link media="all" href="${ctxStatic}/upload/common.css" type="text/css" rel="stylesheet">
<link media="all" href="${ctxStatic}/upload/style.css" type="text/css" rel="stylesheet">
<link media="all" href="${ctxStatic}/upload/jquery-ui-1.10.1.custom.min.css" rel="stylesheet" type="text/css" />
<script src="${ctxStatic}/upload/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/upload/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/upload/public.js" type="text/javascript"></script>
<script src="${ctxStatic}/upload/ajaxfileupload.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){ 
	window.document.getElementById("fileToUpload").disabled = false;
});

function getProgress() {
	var now = new Date();
    $.ajax({
        type: "post",
        dataType: "json",
        url: "../file/progress.do",
        data: now.getTime(),
        success: function(data) {
        	$("#progress_percent").text(data.percent);
            $("#progress_bar").width(data.percent);
            $("#has_upload").text(data.mbRead);
            $("#upload_speed").text(data.speed);
        },
        error: function(err) {
        	$("#progress_percent").text("Error");
        }
    });
}

/**
 * 提交上传文件
 */
function fSubmit() {
	$("#process").show();
	$("#cancel").show();
	$("#info").show();
	$("#success_info").hide();
    //文件名
   	fileName = $("#fileToUpload").val().split('/').pop().split('\\').pop();
    //进度和百分比
    $("#progress_percent").text("0%");
    $("#progress_bar").width("0%");
    $("#progress_all").show();
    oTimer = setInterval("getProgress()", 1000);
    ajaxFileUpload();
    //document.getElementById("upload_form").submit();
    window.document.getElementById("fileToUpload").disabled = true;
}

/**
 * 上传文件
 */
function ajaxFileUpload() {
    $.ajaxFileUpload({
        url: '../file/uploadFile.do',
        secureuri: false,
        fileElementId: 'fileToUpload',
        dataType: 'json',
        data: {
            name: 'file',
            id: 'id'
        },
        success: function(data, status) {
            if (typeof(data.code) != 'undefined') {
            	window.clearInterval(oTimer);
                if (data.code == 0) {//上传成功
                	$("#info").hide();
                	$("#success_info").show();
                	$("#success_info").text(data.data.fileName + "\t" +data.msg);
                	$("#process").hide();
                	$("#cancel").hide();
                	$("#fileToUpload").val("");
                	$("#uploadPath").val(data.data.filePath);
                	$("#fileSize").val(data.data.fileSize);
                	$("#fileName").val(data.data.fileName);
                	$("#fileNewName").val(data.data.fileNewName);
                	window.document.getElementById("fileToUpload").disabled = false;
                	//上传进度和上传速度清0
                	$("#has_upload").text("0");
                    $("#upload_speed").text("0");
                    $("#progress_percent").text("0%");
                    $("#progress_bar").width("0%");
                } else{
                	$("#progress_all").hide();
                	$("#fileToUpload").val("");
                	if (typeof(data.message) != 'undefined') {
                		alert(data.message);
                	}
                	alert("上传错误！");
                }
            }
        },
        error: function(data, status, e) {
            alert(e);
        }
    })
    return false;
}

</script>
