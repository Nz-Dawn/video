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
	//window.document.getElementById("fileToUpload").disabled = false;
});

function getProgress(i) {
	var now = new Date();
    $.ajax({
        type: "post",
        dataType: "json",
        url: "../file/progress.do",
        data: now.getTime(),
        success: function(data) {
        	$("#progress_percent"+i).text(data.percent);
            $("#progress_bar"+i).width(data.percent);
            $("#has_upload"+i).text(data.mbRead);
            $("#upload_speed"+i).text(data.speed);
        },
        error: function(err) {
        	$("#progress_percent"+i).text("Error");
        }
    });
}

/**
 * 提交上传文件
 */
function fSubmit(i) {
	$("#process"+i).show();
	$("#cancel"+i).show();
	$("#info"+i).show();
	$("#success_info"+i).hide();
    //文件名
   	//fileName = $("#fileToUpload").val().split('/').pop().split('\\').pop();
    //进度和百分比
    $("#progress_percent"+i).text("0%");
    $("#progress_bar"+i).width("0%");
    $("#progress_all"+i).show();
    oTimer = setInterval("getProgress("+i+")", 500);
    ajaxFileUpload(i);
    //document.getElementById("upload_form").submit();
    // window.document.getElementById("fileToUpload").disabled = true;
}

/**
 * 上传文件
 */
function ajaxFileUpload(i) {
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
                	$("#info"+i).hide();
                	$("#success_info"+i).show();
                	$("#success_info"+i).text(data.msg);
                	$("#process"+i).hide();
                	$("#cancel"+i).hide();
                	//$("#fileToUpload").val("");
                	//双||分割
                	fileUploadArray[i]=data.data.filePath+'||'+data.data.fileSize+'||'+data.data.fileName+'||'+data.data.fileNewName;
                	//调用父页面定义的更新数据库的方法
                	addObject(fileUploadArray[i]);
                	$("#uploadPath"+i).val(data.data.filePath);
                	$("#fileSize"+i).text(data.data.fileSize);
                	$("#fileName"+i).text(data.data.fileName);
                	$("#addTime"+i).text(data.data.addTime);
                	$("#fileNewName").val(data.data.fileNewName);
                	//window.document.getElementById("fileToUpload").disabled = false;
                	//上传进度和上传速度清0
                	$("#has_upload"+i).text("0");
                    $("#upload_speed"+i).text("0");
                    $("#progress_percent"+i).text("0%");
                    $("#progress_bar"+i).width("0%");
                } else{
                	$("#progress_all"+i).hide();
                	//$("#fileToUpload").val("");
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
