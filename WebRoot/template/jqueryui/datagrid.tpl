    <table id="{$id}" title="{$title}" class="easyui-datagrid" style="width:99%;height:600"
            url="{$url}"
            toolbar="#{$id}-toolbar" pagination="true" pageSize="15" pageList="[15,30]"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
    			{foreach from=$fields item=field key=k}{if $field.type neq 'hidden' and $field.type neq 'password' and $field.isColumn neq 'false'}
                <th field="{$field.name}" width="{$field.width | default : ''}">{$field.title}</th>{/if}
				{/foreach}
            </tr>
        </thead>
    </table>
    <div id="{$id}-toolbar">
    	{foreach from=$buttons item=button key=k}
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="{$button.iconCls}" plain="true" onclick="{$button.function}">{$button.title}</a>
		{/foreach}
    </div>