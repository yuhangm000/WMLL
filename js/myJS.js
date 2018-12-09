
/*加载添加信息页面*/
function AddProgram(){
	$.ajax({
		url:"addProgramPage",
		type:'post',
		success: function (data) {
			$("#import").html(data);
		},
		fail: function(){
			alert("登录失败");
		}
	});
}

/*加载显示充值提现列表页面*/
function showTrade(){
	$.ajax({
		url:"#",
		type:'post',
		success: function (data) {
			$("#import").html(data);
		},
		fail: function(){
			alert("登录失败");
		}
	});
}

/*加载显示红包列表页面*/
function showRedPackge(){
	$.ajax({
		url:"#",
		type:'post',
		success: function (data) {
			$("#import").html(data);
		},
		fail: function(){
			alert("登录失败");
		}
	});
}

/*加载显示打赏记录列表页面*/
function showReward(){
	$.ajax({
		url:"#",
		type:'post',
		success: function (data) {
			$("#import").html(data);
		},
		fail: function(){
			alert("登录失败");
		}
	});
}

/*发送开启红包雨信息*/
function startRain(data){
	var json = {"round" : data}
	$.ajax({
			url : "Lucky_on",
			type : 'post',
			data : json,
			success : function(data) {
				$("#import").html(data);
			},
			fail : function() {
				alert("开启失败，请重试");
			}
	});
}
