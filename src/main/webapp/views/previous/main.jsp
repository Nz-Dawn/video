<%--
  Created by IntelliJ IDEA.
  User: Dawn
  Date: 2020/3/30
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/taglib.jsp"%>
<html lang="en" class="app js no-touch no-android chrome no-firefox no-iemobile no-ie no-ie8 no-ie10 no-ie11 no-ios no-ios7 ipad"><head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Musik | Web Application</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctxStatic}/public/previous/jplayer.flat.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/public/previous/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/public/previous/animate.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/public/previous/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/public/previous/simple-line-icons.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/public/previous/font.css" type="text/css">
    <link rel="stylesheet" href="${ctxStatic}/public/previous/app.css" type="text/css">
    <!--[if lt IE 9]>
    <script src="${ctxStatic}/public/previous/html5shiv.js"></script>
    <script src="${ctxStatic}/public/previous/respond.min.js"></script>
    <script src="${ctxStatic}/public/previous/excanvas.js"></script>
    <![endif]-->
</head>
<body>
</div>
<section class="vbox">
<%--    <header class="bg-white-only header header-md navbar navbar-fixed-top-xs">--%>
<%--        <div class="navbar-header aside bg-info nav-xs">--%>
<%--            <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">--%>
<%--                <i class="icon-list"></i>--%>
<%--            </a>--%>
<%--            <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html" class="navbar-brand text-lt">--%>
<%--                <i class="icon-earphones"></i>--%>
<%--                <img src="${ctxStatic}/public/previous/logo.png" alt="." class="hide">--%>
<%--                <span class="hidden-nav-xs m-l-sm">Musik</span>--%>
<%--            </a>--%>
<%--            <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".user">--%>
<%--                <i class="icon-settings"></i>--%>
<%--            </a>--%>
<%--        </div>      <ul class="nav navbar-nav hidden-xs">--%>
<%--        <li>--%>
<%--            <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#nav,.navbar-header" data-toggle="class:nav-xs,nav-xs" class="text-muted">--%>
<%--                <i class="fa fa-indent text"></i>--%>
<%--                <i class="fa fa-dedent text-active"></i>--%>
<%--            </a>--%>
<%--        </li>--%>
<%--    </ul>--%>
<%--        <form class="navbar-form navbar-left input-s-lg m-t m-l-n-xs hidden-xs" role="search">--%>
<%--            <div class="form-group">--%>
<%--                <div class="input-group">--%>
<%--            <span class="input-group-btn">--%>
<%--              <button type="submit" class="btn btn-sm bg-white btn-icon rounded"><i class="fa fa-search"></i></button>--%>
<%--            </span>--%>
<%--                    <input type="text" class="form-control input-sm no-border rounded" placeholder="Search songs, albums...">--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </form>--%>
<%--        <div class="navbar-right ">--%>
<%--            <ul class="nav navbar-nav m-n hidden-xs nav-user user">--%>
<%--                <li class="hidden-xs">--%>
<%--                    <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="dropdown-toggle lt" data-toggle="dropdown">--%>
<%--                        <i class="icon-bell"></i>--%>
<%--                        <span class="badge badge-sm up bg-danger count" style="display: inline-block;">3</span>--%>
<%--                    </a>--%>
<%--                    <section class="dropdown-menu aside-xl animated fadeInUp">--%>
<%--                        <section class="panel bg-white">--%>
<%--                            <div class="panel-heading b-light bg-light">--%>
<%--                                <strong>You have <span class="count" style="display: inline;">3</span> notifications</strong>--%>
<%--                            </div>--%>
<%--                            <div class="list-group list-group-alt"><a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="media list-group-item" style="display: block;"><span class="pull-left thumb-sm text-center"><i class="fa fa-envelope-o fa-2x text-success"></i></span><span class="media-body block m-b-none">Sophi sent you a email<br><small class="text-muted">1 minutes ago</small></span></a>--%>
<%--                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="media list-group-item">--%>
<%--                    <span class="pull-left thumb-sm">--%>
<%--                      <img src="${ctxStatic}/public/previous/a0.png" alt="..." class="img-circle">--%>
<%--                    </span>--%>
<%--                                    <span class="media-body block m-b-none">--%>
<%--                      Use awesome animate.css<br>--%>
<%--                      <small class="text-muted">10 minutes ago</small>--%>
<%--                    </span>--%>
<%--                                </a>--%>
<%--                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="media list-group-item">--%>
<%--                    <span class="media-body block m-b-none">--%>
<%--                      1.0 initial released<br>--%>
<%--                      <small class="text-muted">1 hour ago</small>--%>
<%--                    </span>--%>
<%--                                </a>--%>
<%--                            </div>--%>
<%--                            <div class="panel-footer text-sm">--%>
<%--                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="pull-right"><i class="fa fa-cog"></i></a>--%>
<%--                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#notes" data-toggle="class:show animated fadeInRight">See all the notifications</a>--%>
<%--                            </div>--%>
<%--                        </section>--%>
<%--                    </section>--%>
<%--                </li>--%>
<%--                <li class="dropdown">--%>
<%--                    <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="dropdown-toggle bg clear" data-toggle="dropdown">--%>
<%--              <span class="thumb-sm avatar pull-right m-t-n-sm m-b-n-sm m-l-sm">--%>
<%--                <img src="${ctxStatic}/public/previous/a0.png" alt="...">--%>
<%--              </span>--%>
<%--                        John.Smith <b class="caret"></b>--%>
<%--                    </a>--%>
<%--                    <ul class="dropdown-menu animated fadeInRight">--%>
<%--                        <li>--%>
<%--                            <span class="arrow top"></span>--%>
<%--                            <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">Settings</a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/profile.html">Profile</a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">--%>
<%--                                <span class="badge bg-danger pull-right">3</span>--%>
<%--                                Notifications--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <li>--%>
<%--                            <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/docs.html">Help</a>--%>
<%--                        </li>--%>
<%--                        <li class="divider"></li>--%>
<%--                        <li>--%>
<%--                            <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/modal.lockme.html" data-toggle="ajaxModal">Logout</a>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </header>--%>
    <section>
        <section class="hbox stretch">
            <!-- .aside -->
            <aside class="bg-black dk nav-xs aside hidden-print" id="nav">
                <section class="vbox">
                    <section class="w-f-md scrollable">
                        <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 584px;"><div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="10px" data-railopacity="0.2" style="overflow: hidden; width: auto; height: 584px;">



                            <!-- nav -->
                            <nav class="nav-primary hidden-xs">
                                <ul class="nav bg clearfix">
                                    <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                                        Discover
                                    </li>
                                    <li>
                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html">
                                            <i class="icon-disc icon text-success"></i>
                                            <span class="font-bold">What's new</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/genres.html">
                                            <i class="icon-music-tone-alt icon text-info"></i>
                                            <span class="font-bold">Genres</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/events.html">
                                            <i class="icon-drawer icon text-primary-lter"></i>
                                            <b class="badge bg-primary pull-right">6</b>
                                            <span class="font-bold">Events</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/listen.html">
                                            <i class="icon-list icon  text-info-dker"></i>
                                            <span class="font-bold">Listen</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/video.html" data-target="#content" data-el="#bjax-el" data-replace="true">
                                            <i class="icon-social-youtube icon  text-primary"></i>
                                            <span class="font-bold">Video</span>
                                        </a>
                                    </li>
                                    <li class="m-b hidden-nav-xs"></li>
                                </ul>
                                <ul class="nav" data-ride="collapse">
                                    <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                                        Interface
                                    </li>
                                    <li>
                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="auto">
                        <span class="pull-right text-muted">
                          <i class="fa fa-angle-left text"></i>
                          <i class="fa fa-angle-down text-active"></i>
                        </span>
                                            <i class="icon-screen-desktop icon">
                                            </i>
                                            <span>Layouts</span>
                                        </a>
                                        <ul class="nav dk text-sm">
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/layout-color.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Color option</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/layout-boxed.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Boxed layout</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/layout-fluid.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Fluid layout</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="auto">
                        <span class="pull-right text-muted">
                          <i class="fa fa-angle-left text"></i>
                          <i class="fa fa-angle-down text-active"></i>
                        </span>
                                            <i class="icon-chemistry icon">
                                            </i>
                                            <span>UI Kit</span>
                                        </a>
                                        <ul class="nav dk text-sm">
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/buttons.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Buttons</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/icons.html" class="auto">
                                                    <b class="badge bg-info pull-right">369</b>
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Icons</span>
                                                </a>
                                            </li><li>
                                            <a href="http://www.cssmoban.com/" class="auto">
                                                <b class="badge bg-info pull-right">369</b>
                                                <i class="fa fa-angle-right text-xs"></i>

                                                <span>More</span>
                                            </a>
                                        </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/grid.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Grid</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/widgets.html" class="auto">
                                                    <b class="badge bg-dark pull-right">8</b>
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Widgets</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/components.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Components</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/list.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>List group</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#table" class="auto">
                            <span class="pull-right text-muted">
                              <i class="fa fa-angle-left text"></i>
                              <i class="fa fa-angle-down text-active"></i>
                            </span>
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Table</span>
                                                </a>
                                                <ul class="nav dker">
                                                    <li>
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/table-static.html">
                                                            <i class="fa fa-angle-right"></i>
                                                            <span>Table static</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/table-datatable.html">
                                                            <i class="fa fa-angle-right"></i>
                                                            <span>Datatable</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#form" class="auto">
                            <span class="pull-right text-muted">
                              <i class="fa fa-angle-left text"></i>
                              <i class="fa fa-angle-down text-active"></i>
                            </span>
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Form</span>
                                                </a>
                                                <ul class="nav dker">
                                                    <li>
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/form-elements.html">
                                                            <i class="fa fa-angle-right"></i>
                                                            <span>Form elements</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/form-validation.html">
                                                            <i class="fa fa-angle-right"></i>
                                                            <span>Form validation</span>
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/form-wizard.html">
                                                            <i class="fa fa-angle-right"></i>
                                                            <span>Form wizard</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/chart.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Chart</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/portlet.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Portlet</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/timeline.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Timeline</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="auto">
                        <span class="pull-right text-muted">
                          <i class="fa fa-angle-left text"></i>
                          <i class="fa fa-angle-down text-active"></i>
                        </span>
                                            <i class="icon-grid icon">
                                            </i>
                                            <span>Pages</span>
                                        </a>
                                        <ul class="nav dk text-sm">
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/profile.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Profile</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/blog.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Blog</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/invoice.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Invoice</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/gmap.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Google Map</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/jvectormap.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Vector Map</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/signin.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Signin</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/signup.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>Signup</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/404.html" class="auto">
                                                    <i class="fa fa-angle-right text-xs"></i>

                                                    <span>404</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                                <ul class="nav text-sm">
                                    <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                                        <span class="pull-right"><a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><i class="icon-plus i-lg"></i></a></span>
                                        Playlist
                                    </li>
                                    <li>
                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">
                                            <i class="icon-music-tone icon"></i>
                                            <span>Hip-Pop</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">
                                            <i class="icon-playlist icon text-success-lter"></i>
                                            <b class="badge bg-success dker pull-right">9</b>
                                            <span>Jazz</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <!-- / nav -->
                        </div><div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 10px; position: absolute; top: -50px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 0px; height: 584px;"></div><div class="slimScrollRail" style="width: 10px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 0px;"></div></div>
                    </section>

                    <footer class="footer hidden-xs no-padder text-center-nav-xs">
                        <div class="bg hidden-xs ">
                            <div class="dropdown dropup wrapper-sm clearfix">
                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="dropdown-toggle" data-toggle="dropdown">
                      <span class="thumb-sm avatar pull-left m-l-xs">
                        <img src="./Musik _ Web Application_files/a3.png" class="dker" alt="...">
                        <i class="on b-black"></i>
                      </span>
                                    <span class="hidden-nav-xs clear">
                        <span class="block m-l">
                          <strong class="font-bold text-lt">John.Smith</strong>
                          <b class="caret"></b>
                        </span>
                        <span class="text-muted text-xs block m-l">Art Director</span>
                      </span>
                                </a>
                                <ul class="dropdown-menu animated fadeInRight aside text-left">
                                    <li>
                                        <span class="arrow bottom hidden-nav-xs"></span>
                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">Settings</a>
                                    </li>
                                    <li>
                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/profile.html">Profile</a>
                                    </li>
                                    <li>
                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">
                                            <span class="badge bg-danger pull-right">3</span>
                                            Notifications
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/docs.html">Help</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/modal.lockme.html" data-toggle="ajaxModal">Logout</a>
                                    </li>
                                </ul>
                            </div>
                        </div>            </footer>
                </section>
            </aside>
            <!-- /.aside -->
            <section id="content">
                <section class="hbox stretch">
                    <section>
                        <section class="vbox">
                            <section class="scrollable padder-lg w-f-md" id="bjax-target">
                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="pull-right text-muted m-t-lg" data-toggle="class:fa-spin"><i class="icon-refresh i-lg  inline" id="refresh"></i></a>
                                <h2 class="font-thin m-b">Discover <span class="musicbar animate inline m-l-sm" style="width:20px;height:20px">
                    <span class="bar1 a1 bg-primary lter"></span>
                    <span class="bar2 a2 bg-info lt"></span>
                    <span class="bar3 a3 bg-success"></span>
                    <span class="bar4 a4 bg-warning dk"></span>
                    <span class="bar5 a5 bg-danger dker"></span>
                  </span></h2>
                                <div class="row row-sm">
                                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                        <div class="item">
                                            <div class="pos-rlt">
                                                <div class="bottom">
                                                    <span class="badge bg-info m-l-sm m-b-sm">03:20</span>
                                                </div>
                                                <div class="item-overlay opacity r r-2x bg-black">
                                                    <div class="text-info padder m-t-sm text-sm">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o text-muted"></i>
                                                    </div>
                                                    <div class="center text-center m-t-n">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><i class="icon-control-play i-2x"></i></a>
                                                    </div>
                                                    <div class="bottom padder m-b-sm">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="pull-right">
                                                            <i class="fa fa-heart-o"></i>
                                                        </a>
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">
                                                            <i class="fa fa-plus-circle"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><img src="./Musik _ Web Application_files/p1.jpg" alt="" class="r r-2x img-full"></a>
                                            </div>
                                            <div class="padder-v">
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis">Tempered Song</a>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis text-xs text-muted">Miaow</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                        <div class="item">
                                            <div class="pos-rlt">
                                                <div class="item-overlay opacity r r-2x bg-black active">
                                                    <div class="text-info padder m-t-sm text-sm">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o text-muted"></i>
                                                        <i class="fa fa-star-o text-muted"></i>
                                                    </div>
                                                    <div class="center text-center m-t-n">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" data-toggle="class">
                                                            <i class="icon-control-play i-2x text"></i>
                                                            <i class="icon-control-pause i-2x text-active"></i>
                                                        </a>
                                                    </div>
                                                    <div class="bottom padder m-b-sm">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="pull-right active" data-toggle="class">
                                                            <i class="fa fa-heart-o text"></i>
                                                            <i class="fa fa-heart text-active text-danger"></i>
                                                        </a>
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" data-toggle="class">
                                                            <i class="fa fa-plus-circle text"></i>
                                                            <i class="fa fa-check-circle text-active text-info"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><img src="./Musik _ Web Application_files/p2.jpg" alt="" class="r r-2x img-full"></a>
                                            </div>
                                            <div class="padder-v">
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis">Vivamus vel tincidunt libero</a>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis text-xs text-muted">Lauren Taylor</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix visible-xs"></div>
                                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                        <div class="item">
                                            <div class="pos-rlt">
                                                <div class="item-overlay opacity r r-2x bg-black">
                                                    <div class="text-info padder m-t-sm text-sm">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o text-muted"></i>
                                                    </div>
                                                    <div class="center text-center m-t-n">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><i class="icon-control-play i-2x"></i></a>
                                                    </div>
                                                    <div class="bottom padder m-b-sm">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="pull-right">
                                                            <i class="fa fa-heart-o"></i>
                                                        </a>
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">
                                                            <i class="fa fa-plus-circle"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><img src="./Musik _ Web Application_files/p3.jpg" alt="" class="r r-2x img-full"></a>
                                            </div>
                                            <div class="padder-v">
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis">Morbi id neque quam liquam sollicitudin</a>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis text-xs text-muted">Allen JH</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                        <div class="item">
                                            <div class="pos-rlt">
                                                <div class="item-overlay opacity r r-2x bg-black">
                                                    <div class="text-info padder m-t-sm text-sm">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o text-muted"></i>
                                                    </div>
                                                    <div class="center text-center m-t-n">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><i class="icon-control-play i-2x"></i></a>
                                                    </div>
                                                    <div class="bottom padder m-b-sm">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="pull-right">
                                                            <i class="fa fa-heart-o"></i>
                                                        </a>
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">
                                                            <i class="fa fa-plus-circle"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="top">
                            <span class="pull-right m-t-n-xs m-r-sm text-white">
                              <i class="fa fa-bookmark i-lg"></i>
                            </span>
                                                </div>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><img src="./Musik _ Web Application_files/p4.jpg" alt="" class="r r-2x img-full"></a>
                                            </div>
                                            <div class="padder-v">
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis">Tincidunt libero</a>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis text-xs text-muted">Amanda Conlan</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix visible-xs"></div>
                                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                        <div class="item">
                                            <div class="pos-rlt">
                                                <div class="item-overlay opacity r r-2x bg-black">
                                                    <div class="text-info padder m-t-sm text-sm">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o text-muted"></i>
                                                    </div>
                                                    <div class="center text-center m-t-n">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><i class="icon-control-play i-2x"></i></a>
                                                    </div>
                                                    <div class="bottom padder m-b-sm">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="pull-right">
                                                            <i class="fa fa-heart-o"></i>
                                                        </a>
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">
                                                            <i class="fa fa-plus-circle"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><img src="./Musik _ Web Application_files/p5.jpg" alt="" class="r r-2x img-full"></a>
                                            </div>
                                            <div class="padder-v">
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis">Fermentum diam</a>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis text-xs text-muted">Nisa Colen</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                        <div class="item">
                                            <div class="pos-rlt">
                                                <div class="top">
                                                    <span class="pull-right m-t-sm m-r-sm badge bg-info">6</span>
                                                </div>
                                                <div class="item-overlay opacity r r-2x bg-black">
                                                    <div class="text-info padder m-t-sm text-sm">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o text-muted"></i>
                                                    </div>
                                                    <div class="center text-center m-t-n">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><i class="icon-control-play i-2x"></i></a>
                                                    </div>
                                                    <div class="bottom padder m-b-sm">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="pull-right">
                                                            <i class="fa fa-heart-o"></i>
                                                        </a>
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">
                                                            <i class="fa fa-plus-circle"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><img src="./Musik _ Web Application_files/p6.jpg" alt="" class="r r-2x img-full"></a>
                                            </div>
                                            <div class="padder-v">
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis">Habitant</a>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis text-xs text-muted">Dan Doorack</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix visible-xs"></div>
                                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                        <div class="item">
                                            <div class="pos-rlt">
                                                <div class="item-overlay opacity r r-2x bg-black">
                                                    <div class="text-info padder m-t-sm text-sm">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o text-muted"></i>
                                                    </div>
                                                    <div class="center text-center m-t-n">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><i class="icon-control-play i-2x"></i></a>
                                                    </div>
                                                    <div class="bottom padder m-b-sm">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="pull-right">
                                                            <i class="fa fa-heart-o"></i>
                                                        </a>
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">
                                                            <i class="fa fa-plus-circle"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="top">
                                                    <span class="pull-right m-t-sm m-r-sm badge bg-white">12</span>
                                                </div>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><img src="./Musik _ Web Application_files/p7.jpg" alt="" class="r r-2x img-full"></a>
                                            </div>
                                            <div class="padder-v">
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis">Vivamus vel tincidunt libero</a>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis text-xs text-muted">Ligula H</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                        <div class="item">
                                            <div class="pos-rlt">
                                                <div class="item-overlay opacity r r-2x bg-black">
                                                    <div class="text-info padder m-t-sm text-sm">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o text-muted"></i>
                                                    </div>
                                                    <div class="center text-center m-t-n">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><i class="icon-control-play i-2x"></i></a>
                                                    </div>
                                                    <div class="bottom padder m-b-sm">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="pull-right">
                                                            <i class="fa fa-heart-o"></i>
                                                        </a>
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">
                                                            <i class="fa fa-plus-circle"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><img src="./Musik _ Web Application_files/p8.jpg" alt="" class="r r-2x img-full"></a>
                                            </div>
                                            <div class="padder-v">
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis">Aliquam sollicitudin venenati</a>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis text-xs text-muted">James East</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix visible-xs"></div>
                                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                        <div class="item">
                                            <div class="pos-rlt">
                                                <div class="item-overlay opacity r r-2x bg-black">
                                                    <div class="text-info padder m-t-sm text-sm">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o text-muted"></i>
                                                    </div>
                                                    <div class="center text-center m-t-n">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><i class="icon-control-play i-2x"></i></a>
                                                    </div>
                                                    <div class="bottom padder m-b-sm">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="pull-right">
                                                            <i class="fa fa-heart-o"></i>
                                                        </a>
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">
                                                            <i class="fa fa-plus-circle"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><img src="./Musik _ Web Application_files/p9.jpg" alt="" class="r r-2x img-full"></a>
                                            </div>
                                            <div class="padder-v">
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis">Lementum ligula vitae</a>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis text-xs text-muted">Lauren Taylor</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                        <div class="item">
                                            <div class="pos-rlt">
                                                <div class="item-overlay r r-2x bg-light dker active">
                                                    <div class="text-info padder m-t-sm text-sm">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o text-muted"></i>
                                                    </div>
                                                    <div class="center text-center m-t-n">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" data-toggle="class" class="active">
                                                            <i class="icon-control-play i-2x text"></i>
                                                            <i class="icon-control-pause i-2x text-active"></i>
                                                        </a>
                                                    </div>
                                                    <div class="bottom padder m-b-sm">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="pull-right" data-toggle="class">
                                                            <i class="fa fa-heart-o text"></i>
                                                            <i class="fa fa-heart text-active text-danger"></i>
                                                        </a>
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="active" data-toggle="class">
                                                            <i class="fa fa-plus-circle text"></i>
                                                            <i class="fa fa-check-circle text-active text-info"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><img src="./Musik _ Web Application_files/p10.jpg" alt="" class="r r-2x img-full"></a>
                                            </div>
                                            <div class="padder-v">
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis">Egestas dui nec fermentum </a>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis text-xs text-muted">Chris Fox</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix visible-xs"></div>
                                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                        <div class="item">
                                            <div class="pos-rlt">
                                                <div class="item-overlay opacity r r-2x bg-black">
                                                    <div class="text-info padder m-t-sm text-sm">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o text-muted"></i>
                                                    </div>
                                                    <div class="center text-center m-t-n">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><i class="icon-control-play i-2x"></i></a>
                                                    </div>
                                                    <div class="bottom padder m-b-sm">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="pull-right">
                                                            <i class="fa fa-heart-o"></i>
                                                        </a>
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">
                                                            <i class="fa fa-plus-circle"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><img src="./Musik _ Web Application_files/p11.jpg" alt="" class="r r-2x img-full"></a>
                                            </div>
                                            <div class="padder-v">
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis">Aliquam sollicitudin venenatis ipsum</a>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis text-xs text-muted">Jack Jason</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
                                        <div class="item">
                                            <div class="pos-rlt">
                                                <div class="item-overlay opacity r r-2x bg-black">
                                                    <div class="text-info padder m-t-sm text-sm">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o text-muted"></i>
                                                    </div>
                                                    <div class="center text-center m-t-n">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><i class="icon-control-play i-2x"></i></a>
                                                    </div>
                                                    <div class="bottom padder m-b-sm">
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="pull-right">
                                                            <i class="fa fa-heart-o"></i>
                                                        </a>
                                                        <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">
                                                            <i class="fa fa-plus-circle"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#"><img src="./Musik _ Web Application_files/p12.jpg" alt="" class="r r-2x img-full"></a>
                                            </div>
                                            <div class="padder-v">
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis">Vestibulum ullamcorper</a>
                                                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="text-ellipsis text-xs text-muted">MM &amp; DD</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
<%--                                <div class="row m-t-lg m-b-lg">--%>
<%--                                    <div class="col-sm-6">--%>
<%--                                        <div class="bg-primary wrapper-md r">--%>
<%--                                            <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">--%>
<%--                                                <span class="h4 m-b-xs block"><i class=" icon-user-follow i-lg"></i> Login or Create account</span>--%>
<%--                                                <span class="text-muted">Save and share your playlist with your friends when you log in or create an account.</span>--%>
<%--                                            </a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-sm-6">--%>
<%--                                        <div class="bg-black wrapper-md r">--%>
<%--                                            <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#">--%>
<%--                                                <span class="h4 m-b-xs block"><i class="icon-cloud-download i-lg"></i> Download our app</span>--%>
<%--                                                <span class="text-muted">More Templates </span></a><a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>.--%>

<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                            </section>
                            <footer class="footer bg-dark">
                                <div id="jp_container_N" class="jp-video-270p">
                                    <div class="jp-type-playlist">
                                        <div id="jplayer_N" class="jp-jplayer hide" style="width: 480px; height: 270px;"><img id="jp_poster_0" src="./Musik _ Web Application_files/m0.jpg" style="width: 480px; height: 270px; display: inline;"><audio id="jp_audio_0" preload="metadata" src="http://flatfull.com/themes/assets/musics/adg3com_bustedchump.mp3" title="Busted Chump"></audio><video id="jp_video_0" preload="metadata" title="Busted Chump" style="width: 0px; height: 0px;"></video></div>
                                        <div class="jp-gui">
                                            <div class="jp-video-play hide" style="display: block;">
                                                <a class="jp-video-play-icon">play</a>
                                            </div>
                                            <div class="jp-interface">
                                                <div class="jp-controls">
                                                    <div><a class="jp-previous"><i class="icon-control-rewind i-lg"></i></a></div>
                                                    <div>
                                                        <a class="jp-play"><i class="icon-control-play i-2x"></i></a>
                                                        <a class="jp-pause hid" style="display: none;"><i class="icon-control-pause i-2x"></i></a>
                                                    </div>
                                                    <div><a class="jp-next"><i class="icon-control-forward i-lg"></i></a></div>
                                                    <div class="hide"><a class="jp-stop"><i class="fa fa-stop"></i></a></div>
                                                    <div><a class="" data-toggle="dropdown" data-target="#playlist"><i class="icon-list"></i></a></div>
                                                    <div class="jp-progress hidden-xs">
                                                        <div class="jp-seek-bar dk" style="width: 100%;">
                                                            <div class="jp-play-bar bg-info" style="width: 0%;">
                                                            </div>
                                                            <div class="jp-title text-lt" style="display: none;">Busted Chump</div>
                                                        </div>
                                                    </div>
                                                    <div class="hidden-xs hidden-sm jp-current-time text-xs text-muted">00:00</div>
                                                    <div class="hidden-xs hidden-sm jp-duration text-xs text-muted">00:00</div>
                                                    <div class="hidden-xs hidden-sm">
                                                        <a class="jp-mute" title="mute"><i class="icon-volume-2"></i></a>
                                                        <a class="jp-unmute hid" title="unmute" style="display: none;"><i class="icon-volume-off"></i></a>
                                                    </div>
                                                    <div class="hidden-xs hidden-sm jp-volume">
                                                        <div class="jp-volume-bar dk">
                                                            <div class="jp-volume-bar-value lter" style="width: 80%;"></div>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <a class="jp-shuffle" title="shuffle"><i class="icon-shuffle text-muted"></i></a>
                                                        <a class="jp-shuffle-off hid" title="shuffle off" style="display: none;"><i class="icon-shuffle text-lt"></i></a>
                                                    </div>
                                                    <div>
                                                        <a class="jp-repeat" title="repeat"><i class="icon-loop text-muted"></i></a>
                                                        <a class="jp-repeat-off hid" title="repeat off" style="display: none;"><i class="icon-loop text-lt"></i></a>
                                                    </div>
                                                    <div class="hide">
                                                        <a class="jp-full-screen" title="full screen"><i class="fa fa-expand"></i></a>
                                                        <a class="jp-restore-screen" title="restore screen" style="display: none;"><i class="fa fa-compress text-lt"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="jp-playlist dropup" id="playlist">
                                            <ul class="dropdown-menu aside-xl dker" style="display: block;"><li class="jp-playlist-current"><div><a href="javascript:;" class="jp-playlist-item-remove">×</a><a href="javascript:;" class="jp-playlist-item jp-playlist-current" tabindex="1">Busted Chump <span class="jp-artist">by ADG3</span></a></div></li><li><div><a href="javascript:;" class="jp-playlist-item-remove">×</a><a href="javascript:;" class="jp-playlist-item" tabindex="1">Chucked Knuckles <span class="jp-artist">by 3studios</span></a></div></li><li><div><a href="javascript:;" class="jp-playlist-item-remove">×</a><a href="javascript:;" class="jp-playlist-item" tabindex="1">Cloudless Days <span class="jp-artist">by ADG3 Studios</span></a></div></li><li><div><a href="javascript:;" class="jp-playlist-item-remove">×</a><a href="javascript:;" class="jp-playlist-item" tabindex="1">Core Issues <span class="jp-artist">by Studios</span></a></div></li><li><div><a href="javascript:;" class="jp-playlist-item-remove">×</a><a href="javascript:;" class="jp-playlist-item" tabindex="1">Cryptic Psyche <span class="jp-artist">by ADG3</span></a></div></li><li><div><a href="javascript:;" class="jp-playlist-item-remove">×</a><a href="javascript:;" class="jp-playlist-item" tabindex="1">Electro Freak <span class="jp-artist">by Studios</span></a></div></li><li><div><a href="javascript:;" class="jp-playlist-item-remove">×</a><a href="javascript:;" class="jp-playlist-item" tabindex="1">Freeform <span class="jp-artist">by ADG</span></a></div></li></ul>
                                        </div>
                                        <div class="jp-no-solution hide" style="display: none;">
                                            <span>Update Required</span>
                                            To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                                        </div>
                                    </div>
                                </div>
                            </footer>
                        </section>
                    </section>
                    <!-- side content -->
<%--                    <aside class="aside-md bg-light dk" id="sidebar">--%>
<%--                        <section class="vbox animated fadeInRight">--%>
<%--                            <footer class="footer footer-md bg-black">--%>
<%--                                <form class="" role="search">--%>
<%--                                    <div class="form-group clearfix m-b-none">--%>
<%--                                        <div class="input-group m-t m-b">--%>
<%--                        <span class="input-group-btn">--%>
<%--                          <button type="submit" class="btn btn-sm bg-empty text-muted btn-icon"><i class="fa fa-search"></i></button>--%>
<%--                        </span>--%>
<%--                                            <input type="text" class="form-control input-sm text-white bg-empty b-b b-dark no-border" placeholder="Search members">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </form>--%>
<%--                            </footer>--%>
<%--                        </section>--%>
<%--                    </aside>--%>
                    <!-- / side content -->
                </section>
                <a href="http://demo.cssmoban.com/cssthemes3/yzts_15_musik/index.html#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
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

</body></html>
