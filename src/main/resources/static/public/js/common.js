$(function(){
//全选
	$("#checkAll").click(function(){
		$(".list_tr").each(function(e){
			var is_choose=$(this).attr('choose');
			if(is_choose!=1){
				$(this).find(".checkId").prop("checked","checked");	
				$(this).css("background","#eee");
				$(this).attr('choose','1');
			}else{
				$(this).find(".checkId").removeProp("checked");
				$(this).css("background","#fff");
				$(this).attr('choose','0');
			}
		});
	});
		
	$(".list_tr .checkId").each(function(e){
		$(this).click(function(){
			var is_choose=$(this).parents(".list_tr").attr('choose');
			if(is_choose!=1){
				$(this).prop("checked","checked");	
				$(this).parents(".list_tr").css("background","#eee");
				$(this).parents(".list_tr").attr('choose','1');
			}else{
				$(this).removeProp("checked");
				$(this).parents(".list_tr").css("background","#ffffff");
				$(this).parents(".list_tr").attr('choose','0');
			}
		})
	})
});

//删除单条
function del_confirm(p_title,url,id){
	layer.confirm(p_title, {
		btn: ['确定','取消'] //按钮
		}, function(){
			$.ajax({
				type: "GET",
				url: url,
				dataType: "json",
				success: function(data){
					if(data.result==1){
						layer.msg('删除成功！');
						$("#tr_"+id).hide();
						$(".parent_"+id).hide();
					}else{
						layer.msg('删除失败请重试！');
					}
				}
			});
		}
	);	
};

//催办
function urge(obj) {
     layer.confirm('确认催办', {
        btn : [ '确定', '取消' ]
    }, function(index) {
       $ajax({
       	 type: 'POST',
       	 url: 'url',
       	 dataType: "json",
       	 success: function(data){
			if(data.result==1){
				layer.msg('催办成功');
			}else{
				layer.msg('催办失败请重试！');
			}
		  }
       }) 
   }); 
};

//删除多条
function delAll(){
	checkedID=$(".checkId:checked").length;
	if(checkedID!=0){
		layer.confirm("您真的要删除吗？", {
			btn: ['确定','取消'] //按钮
			}, function(){
				$('#listForm').ajaxSubmit({
					type : 'post',
					url : $(this).attr('action'),
					success : function(result){
						if(result==1){
							layer.confirm("删除成功!", {
								btn: ['确定'] //按钮
							},function(){
								location.reload();	
							})
						}else{
							layer.msg('删除失败，请重试！');	
						}
					} 
				})
				
			}
		);
	}else{
		layer.alert('请选择要删除的行',{icon:2,title:'操作失败'});
		return false;
	}	
}

/*关闭弹出框口*/
function layer_close(){
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}



//新增弹出窗口功能
function role_add(title,url,w,h){
	layer_show(title,url,w,h);
}

//编辑弹出窗口功能
function role_eidt(title,url,w,h){
	layer_show(title,url,w,h);
}
//查看弹出窗口功能
function role_see(title,url,w,h){
	layer_show(title,url,w,h);
}
//审核弹出窗口功能
function role_exam(title,url,w,h){
	layer_show(title,url,w,h);
}

/*弹出层*/
function layer_show(title,url,w,h){
	if (title == null || title == '') {
		title=false;
	};
	if (url == null || url == '') {
		url="404.html";
	};
	if (w == null || w == '') {
		w=800;
	};
	if (h == null || h == '') {
		h=($(window).height() - 50);
	};
	layer.open({
		type: 2,
		area: [w+'px', h +'px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: title,
		content: url
	});
}
//弹出时间
$(function(){
	layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  laydate.render({
	    elem: '#test1' 
	  });
	  var laydate2 = layui.laydate;
	  laydate2.render({
	    elem: '#Mtime' 
	  });
	});
})





