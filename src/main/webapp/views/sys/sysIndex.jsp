<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title>微视频平台</title>
  <meta name="renderer" content="webkit">
  <link rel="icon" href="${ctxStatic}/public/image/bitbug_favicon.ico" type="image/x-icon" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="${ctxStatic}/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="${ctxStatic}/layuiadmin/style/admin.css" media="all">
</head>

<body class="layui-layout-body">
  <div id="LAY_app" >
    <div class="layui-layout layui-layout-admin">
      <div class="layui-header">
        <!-- 头部区域 -->
        <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item layadmin-flexible" lay-unselect>
            <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
              <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
            </a>
          </li>
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;" layadmin-event="refresh" title="刷新">
              <i class="layui-icon layui-icon-refresh-3"></i>
            </a>
          </li>
        </ul>
        <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="fullscreen" title="全屏显示">
              <i class="layui-icon layui-icon-screen-full"></i>
            </a>
          </li>

          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a lay-href="goUpdatePwd" title="修改密码">
              <i class="layui-icon layui-icon-edit"></i>
            </a>
          </li>

          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;">
              <img class="layui-nav-img" src="<shiro:principal property="face"/>" onerror="javascript:this.src='//t.cn/RCzsdCq'"><shiro:principal property="tname"/></a>
            </a>
          </li>

          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="logout">
              <i class="layui-icon layui-icon-pause">退出</i>
            </a>
          </li>
        </ul>
      </div>
      
      <!-- 侧边菜单 -->
      <div class="layui-side layui-side-menu">
        <div class="layui-side-scroll">
          <%--<div class="layui-logo" href="javascript:;"> lay-href="javascript:;"--%>
          <div class="layui-logo" >
            <span>
                微视频平台
            </span>
          </div>
          <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
            <li data-name="home" class="layui-nav-item layui-nav-itemed">
              <a lay-href="census/goIndex" lay-tips="主页" lay-direction="2">
                <i class="layui-icon layui-icon-home"></i>
                <cite>视频主页</cite>
              </a>
            </li>
            <c:forEach items="${menuList}" var="menu">
            	<shiro:hasPermission name="${menu.id}"> 
		           <li data-name="template" class="layui-nav-item">
		              <a href="javascript:;" lay-tips="${menu.name}" lay-direction="2">
		                <i class="layui-icon layui-icon-${menu.img }"></i>
		                <cite>${menu.name}</cite>
		              </a>
		              <dl class="layui-nav-child">
		                  	<c:forEach items="${menu.childList}" var="child">
			                  	<shiro:hasPermission name="${child.id}"> 
					                 <dd data-name="console">
					                 	 <a lay-href="${child.url}" >${child.name}</a>
					              	 </dd>
				              	 </shiro:hasPermission>
			              </c:forEach>
		              </dl>
		            </li>
	            </shiro:hasPermission>
            </c:forEach>
          </ul>
        </div>
      </div>

      <!-- 页面标签 -->
      <div class="layadmin-pagetabs" id="LAY_app_tabs">
        <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
        <div class="layui-icon layadmin-tabs-control layui-icon-down">
          <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
            <li class="layui-nav-item" lay-unselect>
              <a href="javascript:;"></a>
              <dl class="layui-nav-child layui-anim-fadein">
                <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
              </dl>
            </li>
          </ul>
        </div>
        <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
          <ul class="layui-tab-title" id="LAY_app_tabsheader">
            <li lay-id="${ctxStatic}/views/home/console.html" lay-attr="home/console.html" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
          </ul>
        </div>
      </div>


      <!-- 主体内容 -->
      <div class="layui-body" id="LAY_app_body">
        <div class="layadmin-tabsbody-item layui-show">
        <hr/>
            <iframe src="census/goIndex" frameborder="0" class="layadmin-iframe" ></iframe>
        </div>
      </div>
      <!-- 辅助元素，一般用于移动设备下遮罩 -->
      <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
  </div>

  <script src="${ctxStatic}/layuiadmin/layui/layui.js"></script>
  <script>
  layui.config({
    base: '${ctxStatic}/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use('index');
  </script>
  
  <!-- 百度统计 -->
  <script>
  var _hmt = _hmt || [];
  (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?d214947968792b839fd669a4decaaffc";
    var s = document.getElementsByTagName("script")[0]; 
    s.parentNode.insertBefore(hm, s);
  })();
  </script>
</body>
</html>
