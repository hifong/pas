<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>企业信息管理平台</title>
    <link rel="stylesheet" type="text/css" href="{$contextPath}/{$Module.id}/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="{$contextPath}/{$Module.id}/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="{$contextPath}/{$Module.id}/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="{$contextPath}/{$Module.id}/editor/themes/default/default.css" />
    
    <link rel="stylesheet" type="text/css" href="{$contextPath}/{$Module.id}/style/my.css">
    
    <script type="text/javascript" src="{$contextPath}/{$Module.id}/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="{$contextPath}/{$Module.id}/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="{$contextPath}/{$Module.id}/easyui/jquery.easyui.patch.js"></script>
    <script type="text/javascript" src="{$contextPath}/{$Module.id}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="{$contextPath}/{$Module.id}/editor/lang/zh_CN.js"></script>
</head> 
<body onpageshow="resetPagination()">
    {jqueryui_grid id="dg" url="/pas/ConfigService/findAll.do" view="config.config.view" }
    {jqueryui_dialog id="dlg" view="config.config.view" }
    
    <script type="text/javascript">
    {literal}
        var url;
        
        function getDatagrid(dg) {
        	return $('#'+dg);
        }
        function getDialog(dlg) {
        	return $('#'+dlg);
        }
        function getForm(dlg) {
        	return $('#'+dlg+'-form');
        }
        function getFieldDiv(dlg, field) {
        	return document.getElementById("div-"+dlg+"-"+field);
        }
        
        function createOne(){
        	var dlg = 'dlg';
        	//
			url = '/pas/ConfigService/create.do';
            //
            getDialog(dlg).dialog('open').dialog('setTitle','新建');
            getForm(dlg).form('clear');
			var row = {};
			getForm(dlg).form('load',row);
        }
        function updateOne(){
        	var dlg = 'dlg';
        	var dg = 'dg';
        	
            var row = getDatagrid(dg).datagrid('getSelected');
            getForm(dlg).form('clear');
            if (row){
                getDialog(dlg).dialog('open').dialog('setTitle','修改用户信息');
                getForm(dlg).form('load',row);
				url = '/pas/ConfigService/update.do?user_id='+row.user_id;
            } else {
            	alert("请选择要修改的行！");
            }
        }
        function saveOne(dlg){
            getForm(dlg).form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                    var result = eval('('+result+')');
                    if (result.errorMsg){
                        $.messager.show({
                            title: 'Error',
                            msg: result.errorMsg
                        });
                    } else {
                        $.messager.show({
                            title: '提示',
                            msg: '操作成功！'
                        });
                        getDialog(dlg).dialog('close');        // close the dialog
                        getDatagrid('dg').datagrid('reload');    // reload the role data
                    }
                }
            });
        }
        function removeOne(){
            var row = getDatagrid('dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('Confirm','删除后数据不能恢复，确认删除么?',function(r){
                    if (r){
                        $.post('/pas/ConfigService/remove.do',row,function(result){
                            if (result.success){
                                $.messager.show({    // show error message
                                    title: '提示',
                                    msg: '数据删除成功！'
                                });
                                getDatagrid('dg').datagrid('reload');
                            } else {
                                $.messager.show({    // show error message
                                    title: 'Error',
                                    msg: result.errorMsg
                                });
                            }
                        },'json');
                    }
                });
            }
        }
		function resetPagination(){
			var p = $('#dg').datagrid('getPager');
			$(p).pagination({             
				pageSize: 15,           
		 		pageList: [15,30],
				beforePageText: '第',      
				afterPageText: '页    共 {pages} 页',             
				displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'                  
			}); 
		}
    </script>
    <script type="text/javascript">
        //编辑器
        var editor;
        KindEditor.ready(function (K) {
            editor = K.create('textarea[name="content"]', {
                allowFileManager: false,
                resizeType: 1,
                allowPreviewEmoticons: false,
                items: [
                    'preview', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                    'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                    'insertunorderedlist', 'quickformat', '|', 'emoticons', 'image', 'link','pagebreak','|', 'fullscreen','source'],
                afterChange: function () {
                    this.sync();
                }
            });
        });
        $(document).ready(function(){
        	//$('#category_id').combobox("setValue", '19');
        	//$('#category_id').combobox("select", '19');
        });
    </script>
    {/literal}
</body>
</html>