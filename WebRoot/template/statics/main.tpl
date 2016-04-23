<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1"/>

     <link rel="stylesheet" type="text/css" href="{$contextPath}/{$Module.id}/easyui/css/bootstrap.css">
     <link rel="stylesheet" type="text/css" href="{$contextPath}/{$Module.id}/easyui/css/style.css">
     <script type="text/javascript" src="{$contextPath}/{$Module.id}/easyui/jquery.min.js"></script>
     <script type="text/javascript" src="{$contextPath}/{$Module.id}/easyui/bootstrap.min.js"></script>

    <title>企业信息管理平台</title>
	<script>
	    if (self.location != top.location) {
    		top.location = self.location;
    	}
	</script>
    <div id="top">
    <iframe src="top.shtml" height="50" width="100%" frameborder="0" ></iframe></div>
    <div id="left"  style="z-index:-1;" > 
    <iframe src="left.shtml?district_id=1" width="14%" scrolling="no" frameborder="0" style="z-index:-1" onload="this.height=0;var fdh=(this.Document?this.Document.body.scrollHeight:this.contentDocument.body.offsetHeight);this.height=(fdh>700?fdh:800) "></iframe>
    <iframe src="home.shtml"  id="iframepage" width="85%" frameborder="0" name="main" onload="this.height=0;var fdh=(this.Document?this.Document.body.scrollHeight:this.contentDocument.body.offsetHeight);this.height=(fdh>700?fdh:800)"></iframe>
    </div>
</head>
<body>
</body>
