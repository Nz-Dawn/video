
$(function () {
    $("#notLogin").click(function () {
        layer.msg('请先登录!')
    });


    $("#SendDanmaku").click(function () {
        var DanmakuVideoid = $("#videoId").val();
        var DanmakuVideotime = 1;
        var DanmakuContent = $("#DanmakuContent").val();
        var DanmakuColor = $("#DanmakuColor").val();
        var DanmakuType = 0;
        if ($("#DanmakuContent").val()=="")
        {
            layer.msg('请输入文字');
            return;
        }
        $.ajax({
            url:"/SendDanmaku",
            cache:false,
            data:{DanmakuVideoid:DanmakuVideoid,DanmakuVideotime:DanmakuVideotime,DanmakuContent:DanmakuContent,DanmakuColor:DanmakuColor,DanmakuType:DanmakuType},
            type:"post",
            success:function (JsonDanmaku) {
                if (JsonDanmaku!=null)
                {
                    var a = $("#DanmakuContent").val("");
                    var DanmakuObj = JSON.parse(JsonDanmaku);
                    //var myDate = new Date();
                    // var NewDanmaku = "<div style='text-shadow: -1px 0 white, 0 1px white, 1px 0 white, 0 -1px white;font-size: 40px;color:"+DanmakuObj.danmakuColor+"'>"+ DanmakuObj.danmakuContent+"</div>";

                    var StringDanmaku =
                        "<li class='danmaku-info-row bpui-selected' style='padding-top: 0px;'>" +
                        "<span class='danmaku-info-time'>"+ DanmakuObj.danmakuStringTime
                        +"</span>" +
                        "<span class='danmaku-info-danmaku' title='"+ DanmakuObj.danmakuContent+"'>"+ DanmakuObj.danmakuContent+"</span>" +
                        "<span class='danmaku-info-date' title='"+DanmakuObj.stringLongSendtime+"'>"+DanmakuObj.stringSendtime+"</span>" +
                        "</li>\n"

                

                    $("#DanmakuList").append(StringDanmaku);
                }

                // alert(DanmakuObj.danmakuContent);
            }
        })

    });

    $("#addBanKeyword").click(function () {
        if ($("#bankeywordtext").val()=="")
        {
            layer.msg('请输入需要屏蔽的关键词!');
            return;
        }
        var bankeywordtext = $("#bankeywordtext").val();
        $("#bankeywordtext").val("");

        $.ajax({
            url:"/addBanKeyword/"+bankeywordtext,
            cache:false,
            type:"post",
            success:function (banKeywordId) {
                if (banKeywordId=="repeat")
                {
                    layer.msg('请勿重复添加');
                    return;
                }

                layer.msg('添加成功!');

                var StringBanKeyword = "<div class=\"Keyword\" id=\"bankeyword"+banKeywordId+"\">\n" +
                    "            <div class=\"Keywordtext layui-elip\" title=\""+bankeywordtext+"\">"+bankeywordtext+"</div>\n" +
                    "            <i class=\"layui-icon\" onclick=\"removebankeyword("+banKeywordId+")\">&#x1006;</i>\n" +
                    "        </div>";


                $("#KeywordList").append(StringBanKeyword);
            }
        })

    })

});

function NotLogin() {
    layer.msg('登录后使用屏蔽及举报功能', function(){
    });
}
function ManagerDanmaku(danmakuId) {
    var danmakuContent = $("#Danmaku"+danmakuId+" #DanmakuText").text();
    layer.confirm('请问你要对此条弹幕做什么?<br>'+danmakuContent, {
        btn: ['屏蔽','举报'] //按钮
    }, function(){
        $.ajax({
            url:"/AddShieldDanmaku/"+danmakuId,
            cache:false,
            data:{danmakuId:danmakuId},
            type:"post",
            success:function () {
                $("#Danmaku"+danmakuId).attr("onclick","removeShieldDanmaku("+danmakuId+")").off("click").css("background","#e2e2e2");
                layer.msg('屏蔽成功,刷新页面后生效', {icon: 1});
            }
        })

    }, function(){
        layer.open({
            type: 2,
            title: '举报',
            shadeClose: true,
            shade: 0.8,
            scrolling:'no',
            resize:false,
            area: ['380px', '600px'],
            content: '/report/'+danmakuId
        });
    });
}

//移除屏蔽
function removeShieldDanmaku(danmakuId) {

    layer.confirm('是否移除屏蔽?', {
        btn: ['确定','取消'] //按钮
    }, function(){
        $.ajax({
            url:"/removeShieldDanmaku/"+danmakuId,
            cache:false,
            data:{danmakuId:danmakuId},
            type:"post",
            success:function () {
                $("#Danmaku"+danmakuId).attr("onclick","ManagerDanmaku("+danmakuId+")").css("background","#ffffff");
                //$("#Danmaku"+danmakuId+" #DanmakuText").val($("#Danmaku"+danmakuId).attr("title"));
                layer.msg('移除成功,刷新后生效', {icon: 1});
            }
        })

    }, function(){

    });
}

//提交举报
function postComplaint(DanmakuId) {
    var complainttype = $("#complaintType").val();
    var complaintContext = $("#complaintContext").val();
    //alert($("#complaintType").val()+"===="+$("#complaintContext").val())
    $.ajax({
        url:"/PostComplaintDanmaku/"+DanmakuId,
        cache:false,
        data:{complainttype:complainttype,complaintContext:complaintContext},
        type:"post",
        success:function (msg) {
            if(msg=="failed")
            {
                parent.layer.msg('举报失败,请检查登录状态', {shade: 0.3})
            }else if (msg=="repeat")
            {
                parent.layer.msg('举报失败,请勿重复举报', {shade: 0.3})
            }else if (msg=="ban")
            {
                parent.layer.msg('该弹幕已被管理员处理,请刷新', {shade: 0.3})
            }else {
                parent.layer.msg('举报成功,请等待管理员处理', {shade: 0.3})
            }
            //layer.msg('举报成功,请等待管理员处理', {icon: 1});

            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        }
    })
}

//隐藏弹幕
function hiddenDanmaku(DanmakuId) {
    $.ajax({
        url:"/setDanmakuStatus/"+DanmakuId+"/1",
        cache:false,
        type:"post",
        success:function () {
            $("#danmakustatus"+DanmakuId).text("隐藏");
            $("#btn"+DanmakuId).attr("onclick","recoverDanmaku("+DanmakuId+")")
                .attr("class","layui-btn layui-btn-sm layui-btn-normal")
                .text("恢复");
        }
    })
}

//恢复弹幕
function recoverDanmaku(DanmakuId) {
    $.ajax({
        url:"/setDanmakuStatus/"+DanmakuId+"/2",
        cache:false,
        type:"post",
        success:function () {
            $("#danmakustatus"+DanmakuId).text("正常");
            $("#btn"+DanmakuId).attr("onclick","hiddenDanmaku("+DanmakuId+")")
                .attr("class","layui-btn layui-btn-sm layui-btn-danger")
                .text("隐藏");
        }
    })
}
//封禁
function BanDanmaku(DanmakuId) {
    $.ajax({
        url:"/setDanmakuStatus/"+DanmakuId+"/2",
        cache:false,
        type:"post",
        success:function () {
            $("#danmakustatus"+DanmakuId).text("违规");
            $("#btn"+DanmakuId).attr("onclick","recoverDanmaku("+DanmakuId+")")
                .attr("class","layui-btn layui-btn-sm layui-btn-disabled")
                .text("违规");
            $("#bt2n"+DanmakuId).attr("onclick","recoverBanDanmaku("+DanmakuId+")")
                .attr("class","layui-btn layui-btn-sm layui-btn-warm")
                .text("恢复弹幕");
        }
    })
}
//恢复封禁
function recoverBanDanmaku(DanmakuId) {
    $.ajax({
        url:"/setDanmakuStatus/"+DanmakuId+"/0",
        cache:false,
        type:"post",
        success:function () {
            $("#danmakustatus"+DanmakuId).text("正常");
            $("#btn"+DanmakuId).attr("onclick","hiddenDanmaku("+DanmakuId+")")
                .attr("class","layui-btn layui-btn-sm layui-btn-danger")
                .text("隐藏");

            $("#bt2n"+DanmakuId).attr("onclick","BanDanmaku("+DanmakuId+")")
                .attr("class","layui-btn layui-btn-sm layui-btn-danger")
                .text("判定违规");
        }
    })
}
//移除举报
function  removeComplaint(ComplaintId) {
    $.ajax({
        url:"/removeComplaint/"+ComplaintId,
        cache:false,
        type:"post",
        success:function () {
            layer.msg('撤销成功!');
            $("#complaint"+ComplaintId).remove();
            $("#hr"+ComplaintId).remove();
        }
    })
}
//移除关键词
function  removebankeyword(banKeywordId) {
    $.ajax({
        url:"/removeBanKeyword/"+banKeywordId,
        cache:false,
        type:"post",
        success:function () {
            layer.msg('撤销成功!');
            $("#bankeyword"+banKeywordId).remove();
        }
    })
}

function  getDanmakuManagerData(videoId) {
    var DanmakuManagerData;
    $.ajax({
        url:"/getDanmakuManagerData/"+videoId,
        cache:false,
        type:"post",
        async: false,
        success:function (JsonDanmakuManagerData) {
            DanmakuManagerData = JSON.parse(JsonDanmakuManagerData);
            //return DanmakuManagerData;//为什么返回值为undefined?
        }
    });

    return DanmakuManagerData;
}
function  getAdminDanmakuManagerData(videoId) {
    var DanmakuManagerData;
    $.ajax({
        url:"/getDanmakuManagerData/"+videoId,
        cache:false,
        type:"post",
        async: false,
        success:function (JsonDanmakuManagerData) {
            DanmakuManagerData = JSON.parse(JsonDanmakuManagerData);
            //return DanmakuManagerData;//为什么返回值为undefined?
        }
    });

    return DanmakuManagerData;
}

function getDanmakuData(VideoId) {
    var LoginStatus = $("#LoginStatus").val();
    var DanmakuPool;
    $.ajax({
        url:"/getDanmakuData/"+VideoId+".json",
        cache:false,
        type:"post",
        success:function (JsonDanmakuData) {
            var DanmakuData = JSON.parse(JsonDanmakuData);
            var ScreemDanmaku;//要显示在视频上的弹幕
            var Danmaku = DanmakuData[0];//总弹幕池
            var Shield = DanmakuData[1];//用户屏蔽弹幕
            var banKeyword = DanmakuData[2];//用户屏蔽关键词
            for(i = 0;i<Danmaku.length;i++)
            {
                var StringClick;//点击事件
                if (LoginStatus == "notLogin")
                    StringClick = "NotLogin()";
                else
                    StringClick= "ManagerDanmaku("+Danmaku[i].danmakuId+")";
                var danmakuContent;//弹幕内容
                var style;//弹幕侧栏样式
                var b = 1;//弹幕状态
                //筛选弹幕
                if(Shield!=undefined){
                    for (x=0;x<Shield.length;x++)
                    {
                        if (Danmaku[i].danmakuId==Shield[x].shieldBanid)
                            b = 2;
                    }
                }
                if (banKeyword!=undefined){
                    for (x=0;x<banKeyword.length;x++)
                    {
                        if (Danmaku[i].danmakuContent.indexOf(banKeyword[x].banKeywordString)!=-1)
                            b = 3;
                    }
                }
                if (b==1)
                {
                    danmakuContent = Danmaku[i].danmakuContent;
                    style = "background-color: #ffffff;";
                    //ScreemDanmaku.push(Danmaku[i]);
                }else if (b==2){
                    //danmakuContent = "单条弹幕屏蔽";
                    danmakuContent = Danmaku[i].danmakuContent;
                    style = "background-color: #e2e2e2;";
                    StringClick = "removeShieldDanmaku("+Danmaku[i].danmakuId+")";
                }else {
                    danmakuContent = "关键词屏蔽";
                    style = "background-color: #e2e2e2;";
                    StringClick = " ";
                }
                var StringDanmaku = "    <li  onclick=\""+StringClick+"\" id=\"Danmaku"+Danmaku[i].danmakuId+"\"  class=\"danmaku-info-row bpui-selected\" style=\"padding-top: 0px;"+style+"\">\n" +
                    "        <span class=\"danmaku-info-time\">"+Danmaku[i].danmakuStringTime+"</span>\n" +
                    "        <span class=\"danmaku-info-danmaku\" id=\"DanmakuText\" title=\""+Danmaku[i].danmakuContent+"\">"+danmakuContent+"</span>\n" +
                    "        <span class=\"danmaku-info-date\" title=\""+Danmaku[i].stringLongSendtime+"\" type=\"both\" >"+Danmaku[i].stringSendtime+"</span>\n" +
                    "    </li>"

                $("#DanmakuList").append(StringDanmaku);
            }
        }
    });
    return DanmakuPool;
}


function notLogin() {
    layer.msg('请先登录!');
}




