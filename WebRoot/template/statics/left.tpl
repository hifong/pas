<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <title>企业信息管理平台</title>
    <link rel="stylesheet" type="text/css" href="{$contextPath}/{$Module.id}/easyui/css/bootstrap.css">
  	<link rel="stylesheet" type="text/css" href="{$contextPath}/{$Module.id}/easyui/css/style.css">
    <script type="text/javascript" src="{$contextPath}/{$Module.id}/easyui/jquery.min.js"></script>
  	<script type="text/javascript" src="{$contextPath}/{$Module.id}/easyui/bootstrap.min.js"></script>
    
    <script type="text/javascript">  
		$(document).ready(function(){  
			$(".left a").each(function(){  
				$(this).click(function(){  
					$(".left a").removeClass("active");  
					$(this).addClass("active");    
				});  
			});      
		});  
	</script>
</head>
<body>
	<ul class="left">
        {widget template="statics/include/menu.tpl" moduleId="pas" serviceId="MenuService:findTreeByUser" params="user_id=`$principal.id`"}
	</ul>
</body>
</html>