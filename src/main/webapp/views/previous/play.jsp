<%@ include file="../include/taglib.jsp"%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dawn
  Date: 2020/3/30
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>视频播放</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="${ctxStatic}/js/jquery-3.4.1.min.js"></script>
<%--    <link rel="stylesheet" href="${ctxStatic}/public/previous/jplayer.flat.css" type="text/css">--%>
    <link rel="stylesheet" href="${ctxStatic}/public/previous/bootstrap.css" type="text/css">
<%--    <link rel="stylesheet" href="${ctxStatic}/public/previous/animate.css" type="text/css">--%>
    <link rel="stylesheet" href="${ctxStatic}/public/previous/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/public/previous/simple-line-icons.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/public/previous/font.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/public/previous/app.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/layuiadmin/layui/css/layui.css" media="all">
    <script src="${ctxStatic}/layuiadmin/layui/layui.js"></script>
    <script src="${ctxStatic}/js/Danmaku.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/Video.css" />
<%--    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/report.css" />--%>
    <script src="${ctxStatic}/js/lib/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="${ctxStatic}/css/danmuplayer.css">
    <script src="${ctxStatic}/js/danmuplayer.js"></script>
</head>
<body >
<section class="vbox">
    <section>
        <section class="hbox stretch">
            <section id="content">
                <section class="vbox">
                    <section class="scrollable wrapper-lg">
                        <div class="row">
                            <div class="col-sm-8">
                                <div class="panel">
                                    <!-- video player -->
                                    <div class="l-con" style="width: 761px;">
                                        <div class="player-wrap" style="height: auto;">
                                            <div style="width: 761px; height: 562px; position: static;">
                                                <div class="player" style="width:100%;height:100%;">
                                                    <div class="bilibili-player relative __pakku_injected bilibili-player-no-cursor">
                                                        <div class="bilibili-player-area video-state-blackside video-state-pause progress-shadow-show">
                                                            <div id="danmakuPlayer"></div>
                                                            <div class="bilibili-player-video-bottom-area">
                                                                <div class="bilibili-player-video-sendbar">
                                                                    <div class="bilibili-player-video-info">
                                                                        <div class="bilibili-player-video-info-people">
                                                                            <c:if test="${isFavorite == 'true'}">
                                                                                <span class="bilibili-player-video-info-people-text">
                                                                                    <a href="${ctxStatic}/census/manage/cancelfavorite?vid=${video.id}" >已收藏</a>
                                                                                </span>
                                                                            </c:if>
                                                                            <c:if test="${isFavorite == 'false'}">
                                                                                <span class="bilibili-player-video-info-people-text">
                                                                                    <a href="${ctxStatic}/census/manage/favorite?vid=${video.id}" >收藏</a>
                                                                                </span>
                                                                            </c:if>
                                                                            <c:if test="${video.iscandown == '1'}">
                                                                                <span class="bilibili-player-video-info-people-text">
                                                                                        <a href="${ctxStatic}/census/download?fileName=${video.url}" >下载</a>
                                                                                </span>
                                                                            </c:if>
                                                                        </div>
<%--                                                                        <div class="bilibili-player-video-info-danmaku player-tooltips-trigger" data-text="当前弹幕池弹幕数4415条" data-tooltip="1" data-position="top-center" data-change-mode="0">--%>
<%--                                                                            <span class="bilibili-player-video-info-danmaku-number">==</span>--%>
<%--                                                                            <span class="bilibili-player-video-info-danmaku-text">条实时弹幕</span>--%>
<%--                                                                        </div>--%>
                                                                    </div>
                                                                    <div class="bilibili-player-video-danmaku-root">
                                                                        <span class="shezhi layui-btn layui-btn-radius layui-btn-primary layui-btn-sm" id="danmu_send_opt">弹幕设置</span>
                                                                    </div>
                                                                    <div class="bilibili-player-video-inputbar focus">
                                                                        <div class="bilibili-player-video-inputbar-wrap">
                                                                            <%--                                            <div id="colorpicker"></div><input type="hidden" value="#000000" id="DanmakuColor">--%>
                                                                            <div class="bilibili-player-video-btn bilibili-player-video-btn-danmaku relative" style="display: block;">
														                        <span class="bilibili-player-iconfont bilibili-player-iconfont-danmakutype">
															                        <span class="bp-svgicon">
                                                                                        <i class="layui-icon layui-icon-fonts-u " style="color: #757575;"></i>
															                        </span>
														                        </span>
                                                                            </div>
                                                                            <input class="bilibili-player-video-danmaku-input" placeholder="发个友善的弹幕见证当下"  id="danmu_text">
                                                                        </div>
                                                                        <div id="sendBtn" class="bilibili-player-video-btn-send bui bui-button bui-button-blue" onclick="send_danmu()"> 发送 </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- / video player -->
                                    <div class="wrapper-lg">
                                        <h2 class="m-t-none text-black">Big Buck Bunny Trailer</h2>
                                        <div class="post-sum">
                                             <p>${video.desception}</p>
                                        </div>
                                        <div class="line b-b"></div>
                                        <div class="text-muted">
                                            <i class="fa fa-user icon-muted"></i> by <a href="#" class="m-r-sm">${author.uname}</a>
                                            <i class="fa fa-clock-o icon-muted"></i> ${video.createtime}
                                            <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#" class="m-l-sm"><i class="fa fa-comment-o icon-muted"></i> ${video.star}</a>
                                        </div>
                                    </div>
                                </div>
                                <h4 class="m-t-lg m-b">3 Comments</h4>
                                <section class="comment-list block">
<%--                                    <article id="comment-id-3" class="comment-item">--%>
<%--                                        <a class="pull-left thumb-sm">--%>
<%--                                            <img src="${ctxStatic}/public/previous/a0.png" class="img-circle">--%>
<%--                                        </a>--%>
<%--                                        <section class="comment-body m-b">--%>
<%--                                            <div class="m-t-sm">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id neque quam. Aliquam sollicitudin venenatis ipsum ac feugiat. Vestibulum.</div>--%>
<%--                                        </section>--%>
<%--                                    </article>--%>
<%--                                    <!-- .comment-reply -->--%>
<%--                                    <article id="comment-id-1" class="comment-item comment-reply">--%>
<%--                                        <a class="pull-left thumb-sm">--%>
<%--                                            <img src="${ctxStatic}/public/previous/a1.png" class="img-circle">--%>
<%--                                        </a>--%>
<%--                                        <section class="comment-body m-b">--%>
<%--                                            <header>--%>
<%--                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#"><strong>John smith</strong></a>--%>
<%--                                                <label class="label bg-dark m-l-xs">Admin</label>--%>
<%--                                                <span class="text-muted text-xs block m-t-xs">--%>
<%--                                                    26 minutes ago--%>
<%--                                                </span>--%>
<%--                                            </header>--%>
<%--                                            <div class="m-t-sm">Lorem ipsum dolor sit amet, consecteter adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.</div>--%>
<%--                                        </section>--%>
<%--                                    </article>--%>
                                    <!-- / .comment-reply -->
                                    <c:forEach items="${comments}" var="comment">
                                        <article id="comment-id-2" class="comment-item">
                                        <a class="pull-left thumb-sm">
                                            <img src="${ctxStatic}/public/previous/a2.png" class="img-circle">
                                        </a>
                                        <section class="comment-body m-b">
                                            <header>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#"><strong>${comment.username}</strong></a>
                                                <label class="label bg-dark m-l-xs">${comment.username}</label>
                                                <span class="text-muted text-xs block m-t-xs">
                                                     ${comment.createtime}
                                                </span>
                                            </header>
                                            <blockquote class="m-t">
                                                <p>${comment.comment}</p>
                                                <small>Someone famous in <cite title="Source Title">Source Title</cite></small>
                                            </blockquote>
<%--                                            <div class="m-t-sm">Lorem ipsum dolor sit amet, consecteter adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.</div>--%>
                                        </section>
                                    </article>
                                    </c:forEach>
                                </section>
                                <h4 class="m-t-lg m-b">Leave a comment</h4>
                                <form action="${ctxStatic}/sys/comment/publish" method="post">
                                    <input type="hidden" name="tovideoid" id="tovideoid" value="${video.id}">
                                    <input type="hidden" name="touserid" id="touserid" value="">
                                    <div class="form-group">
                                        <label>Comment</label>
                                        <textarea class="form-control" rows="5" name="comment" id="comment" placeholder="Type your comment"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-success">Submit comment</button>
                                    </div>
                                </form>
                            </div>
                            <div class="col-sm-4">
                                <div class="panel panel-default">
                                    <div class="panel-heading">Suggestions</div>
                                    <div class="panel-body">
                                        <c:forEach items="${suggestions}" var="suggestion">
                                            <article class="media">
                                                <a href="${ctxStatic}/census/goplay?id=${suggestion.id}" class="pull-left thumb-lg m-t-xs">
                                                    <img src="${ctxStatic}${suggestion.cover}">
                                                </a>
                                                <div class="media-body">
                                                    <a href="${ctxStatic}/census/goplay?id=${suggestion.id}" class="font-semibold">${suggestion.desception}</a>
                                                    <div class="text-xs block m-t-xs"><a href="${ctxStatic}/census/goplay?id=${suggestion.id}">Travel</a> 2 minutes ago</div>
                                                </div>
                                            </article>
                                        </c:forEach>
<%--                                            <article class="media">--%>
<%--                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#" class="pull-left thumb-lg m-t-xs">--%>
<%--                                                    <img src="${ctxStatic}/public/previous/m41.jpg">--%>
<%--                                                </a>--%>
<%--                                                <div class="media-body">--%>
<%--                                                    <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#" class="font-semibold">Lorem ipsum dolor sit amet it.</a>--%>
<%--                                                    <div class="text-xs block m-t-xs"><a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#">Design</a> 2 hours ago</div>--%>
<%--                                                </div>--%>
<%--                                            </article>--%>
<%--                                            <article class="media">--%>
<%--                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#" class="pull-left thumb-lg m-t-xs">--%>
<%--                                                    <img src="${ctxStatic}/public/previous/m42.jpg">--%>
<%--                                                </a>--%>
<%--                                                <div class="media-body">--%>
<%--                                                    <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#" class="font-semibold">Sed diam nonummy tincidunt ut laoreet</a>--%>
<%--                                                    <div class="text-xs block m-t-xs"><a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#">MFC</a> 1 week ago</div>--%>
<%--                                                </div>--%>
<%--                                            </article>--%>
<%--                                            <article class="media">--%>
<%--                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#" class="pull-left thumb-lg m-t-xs">--%>
<%--                                                    <img src="${ctxStatic}/public/previous/m43.jpg">--%>
<%--                                                </a>--%>
<%--                                                <div class="media-body">--%>
<%--                                                    <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#" class="font-semibold">Lonummy nibh euismod sed laoreet</a>--%>
<%--                                                    <div class="text-xs block m-t-xs"><a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#">MFC</a> 1 week ago</div>--%>
<%--                                                </div>--%>
<%--                                            </article>--%>
<%--                                            <article class="media">--%>
<%--                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#" class="pull-left thumb-lg m-t-xs">--%>
<%--                                                    <img src="${ctxStatic}/public/previous/m44.jpg">--%>
<%--                                                </a>--%>
<%--                                                <div class="media-body">--%>
<%--                                                    <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#" class="font-semibold">Mibh euismod tincidunt ut laoreet</a>--%>
<%--                                                    <div class="text-xs block m-t-xs"><a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#">MFC</a> 1 week ago</div>--%>
<%--                                                </div>--%>
<%--                                            </article>--%>
<%--                                            <article class="media">--%>
<%--                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#" class="pull-left thumb-lg m-t-xs">--%>
<%--                                                    <img src="${ctxStatic}/public/previous/m45.jpg">--%>
<%--                                                </a>--%>
<%--                                                <div class="media-body">--%>
<%--                                                    <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#" class="font-semibold">Siam nonummy nibh oreet</a>--%>
<%--                                                    <div class="text-xs block m-t-xs"><a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#">MFC</a> 1 week ago</div>--%>
<%--                                                </div>--%>
<%--                                            </article>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </section>
                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
            </section>
        </section>
    </section>
</section>
<script>
    layui.use(['colorpicker','table','form','layer'], function(){
        var colorpicker = layui.colorpicker;
        var form = layui.form;
        var layer = layui.layer;
        //表单赋值
        colorpicker.render({
            elem: '#colorpicker'
            ,color: '#000000'
            ,predefine: true
            ,done: function(color){
                $('#DanmakuColor').val(color);
            }
        });

    });
    var DanmakuData = getDanmakuData(${video.id});

    $("#danmakuPlayer").danmuplayer({
        src:"${ctxStatic}${video.url}",       //视频源
        width:761,            //视频宽度
        height:516,            //视频高度/sendDanmakuByUrl/{videoId}
        speed: 10000,			//弹幕速度，穿过视频的毫秒数
        url_to_get_danmu: "${ctxStatic}/getDanmakuDataByUrl/${video.id}", //用来接收弹幕信息的url
        url_to_post_danmu: "${ctxStatic}/sendDanmakuByUrl/${video.id}", //用来存储弹幕信息的url
    });
</script>

</body>
</html>
