<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Dawn
  Date: 2020/3/30
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/taglib.jsp"%>
<html>
<head>
    <title>我的收藏</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctxStatic}/public/previous/jplayer.flat.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/public/previous/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/public/previous/animate.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/public/previous/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/public/previous/simple-line-icons.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/public/previous/font.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/public/previous/app.css" type="text/css">
</head>
<body class="" style="">
<section class="vbox">
    <section>
        <header class="bg-white-only header header-md navbar navbar-fixed-top-xs">
            <div class="navbar-header aside bg-info dk">
                <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
                    <i class="icon-list"></i>
                </a>
                <a href="${ctxStatic}/self/center/deleteAllFavorite" class="navbar-brand text-lt">
                    <i class="icon-share"></i>
                    <img src="${ctxStatic}/public/previous/logo.png" alt="." class="hide">
                    <span class="hidden-nav-xs m-l-sm">清空我的收藏</span>
                </a>
                <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".user">
                    <i class="icon-settings"></i>
                </a>
            </div>
            <form class="navbar-form navbar-left input-s-lg m-t m-l-n-xs hidden-xs" role="search" style="margin-left: 200px"
            action="${ctxStatic}/self/center/search" method="post">
                <div class="form-group">
                    <div class="input-group">
                        <span class="input-group-btn">
                            <button type="submit" class="btn btn-sm bg-blue btn-icon rounded" style="width: 100px">
                                <i class="layui-icon layui-icon-search">Search</i>
                            </button>
                         </span>
                         <input type="text" class="form-control input-sm  rounded"
                               placeholder="Search mine videos..." style="width: 350px">
                    </div>
                </div>
            </form>
            <div class="navbar-right ">
                <ul class="nav navbar-nav m-n hidden-xs nav-user user">
                    <li class="hidden-xs">
                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#"
                           class="dropdown-toggle lt" data-toggle="dropdown">
                            <i class="icon-bell"></i>
                            <span class="badge badge-sm up bg-danger count" style="display: inline-block;">3</span>
                        </a>
                        <section class="dropdown-menu aside-xl animated fadeInUp">
                            <section class="panel bg-white">
                                <div class="panel-heading b-light bg-light">
                                    <strong>You have <span class="count" style="display: inline;">3</span> notifications</strong>
                                </div>
                                <div class="list-group list-group-alt"><a
                                        href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#"
                                        class="media list-group-item" style="display: block;"><span
                                        class="pull-left thumb-sm text-center"><i
                                        class="fa fa-envelope-o fa-2x text-success"></i></span><span
                                        class="media-body block m-b-none">Sophi sent you a email<br><small
                                        class="text-muted">1 minutes ago</small></span></a>
                                    <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#"
                                       class="media list-group-item">
                    <span class="pull-left thumb-sm">
                      <img src="${ctxStatic}/public/previous/a0.png" alt="..." class="img-circle">
                    </span>
                                        <span class="media-body block m-b-none">
                      Use awesome animate.css<br>
                      <small class="text-muted">10 minutes ago</small>
                    </span>
                                    </a>
                                    <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#"
                                       class="media list-group-item">
                    <span class="media-body block m-b-none">
                      1.0 initial released<br>
                      <small class="text-muted">1 hour ago</small>
                    </span>
                                    </a>
                                </div>
                                <div class="panel-footer text-sm">
                                    <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#"
                                       class="pull-right"><i class="fa fa-cog"></i></a>
                                    <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video-detail.html#notes"
                                       data-toggle="class:show animated fadeInRight">See all the notifications</a>
                                </div>
                            </section>
                        </section>
                    </li>
                </ul>
            </div>
        </header>
        <section class="hbox stretch">
            <section id="content">
                <section class="vbox" id="bjax-el">
                    <section class="scrollable padder-lg">
                        <h3 class="font-thin m-b">Video List</h3>
                        <div class="row row-sm">
                            <c:forEach items="${videos}" var="video">
                                <div class="col-xs-6 col-sm-4 col-md-3">
                                <div class="item">
                                    <div class="pos-rlt">
                                        <div class="item-overlay opacity r r-2x bg-black">
                                            <div class="center text-center m-t-n">
                                                <a href="${ctxStatic}/census/goplay?id=${video.id}"><i class="fa fa-play-circle i-2x"></i></a>
                                            </div>
                                        </div>
                                        <a href="${ctxStatic}/census/goplay">
                                            <img src="${ctxStatic}${video.cover}" alt="" class="r r-2x img-full">
                                        </a>
                                    </div>
                                    <div class="padder-v">
                                        <a href="${ctxStatic}/census/goplay?id=${video.id}" class="text-ellipsis text-xs text-muted">${video.createuname}</a>
                                        <a href="${ctxStatic}/video/delete?id=${video.id}" class="text-ellipsis">删除</a>
                                        <sapn><a href="${ctxStatic}/census/goplay?id=${video.id}" class="text-ellipsis">${video.desception}</a></sapn>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                    </section>
                </section>
                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video.html#"
                   class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open"
                   data-target="#nav,html"></a>
            </section>
        </section>
    </section>
</section>
<script src="${ctxStatic}/public/previous/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${ctxStatic}/public/previous/bootstrap.js"></script>
<!-- App -->
<script src="${ctxStatic}/public/previous/app.js"></script>
<script src="${ctxStatic}/public/previous/jquery.slimscroll.min.js"></script>
<script src="${ctxStatic}/public/previous/app.plugin.js"></script>
<script type="text/javascript" src="${ctxStatic}/public/previous/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/public/previous/jplayer.playlist.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/public/previous/demo.js"></script>
</body>
</html>
