<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1"/>
    <title>企业信息管理平台</title>
	<link rel="stylesheet" type="text/css" href="{$contextPath}/pas/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="{$contextPath}/pas/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="{$contextPath}/pas/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="{$contextPath}/pas/easyui/css/style.css">
    <script type="text/javascript" src="{$contextPath}/pas/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="{$contextPath}/pas/easyui/jquery.easyui.min.js"></script>
</head>
<body>
    <div class="login">
	    <div class="home_top"><font size=-1 weight=300>用户登录</font></div>
		<div class="home_login">
		<table border=0 width=100% cellpadding=0 cellspacing=0>
		<tr>
		<td>&nbsp;用户名：</td><td><input type="text" id="username" name="username" width="40"></td>
		</tr>
		<tr>
		<td>&nbsp;密&nbsp;码：</td><td><input type="password" id="password" name="password" width="40"></td>
		</tr>
		<tr>
		<td colspan=2><center><input type="button" value="提交" onclick="login()"></center></td>
		</tr>
		</table>
		</div>
		
	</div>
    <script type="text/javascript">
    {literal}
    	function login() {
    		var username = document.getElementById("username").value;
    		var password = document.getElementById("password").value;
    		if(username =='' || password == '') {
    			alert('请输入用户名和密码！');
    			return;
    		}
    		$.ajax({
				type: 'POST',
				url: '/pas/UserService/findByUsernamePassword.do',
				data: {username: username, password: password},
				success: function(res){
					if(res.user_id)
						window.location.href = '/pas/main.shtml';
					else
						alert("用户名或密码错误！");
				},
				dataType: 'json'
			});
    	}
    {/literal}
    </script>
</body>
</html>