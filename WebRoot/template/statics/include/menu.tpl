
{foreach from=$rows item=r1}
{if !$r1.children}
<li><a href="{$r1.url}" target="main">{$r1.name}</a></li>
{else}
<li><a href="#menu{$r1.menu_id}" data-toggle="collapse">{$r1.name} [..]</a>
    <ul class="nav collapse " id="menu{$r1.menu_id}">
    	{foreach from=$r1.children item=r2}
			{if !$r2.children}
			<li><a href="{$r2.url}" target="main">{$r2.name}</a></li>
			{else}
			<li><a href="#menu{$r2.menu_id}" data-toggle="collapse">{$r2.name} [..]</a>
			    <ul class="nav collapse " id="menu{$r2.menu_id}">
					{if $r2.name eq '内容管理'}
					{widget template="statics/include/category.tpl" moduleId="cms" serviceId="CategoryService:findChildrenTree" params="parent_id=0"}
					{/if}
			    	{foreach from=$r2.children item=r3}
			    	
						{if !$r3.children}
						<li><a href="{$r3.url}" target="main">{$r3.name}</a></li>
						{else}
						<li><a href="#menu{$r3.menu_id}" data-toggle="collapse">{$r3.name} [..]</a>
						    <ul class="nav collapse " id="menu{$r3.menu_id}">
						    	{foreach from=$r3.children item=r4}
								<li><a href="{$r4.url}" target="main">{$r4.name}</a></li>
							    {/foreach}
							</ul>
						</li>
						{/if}
			    	
				    {/foreach}
				</ul>
			</li>
			{/if}
	    {/foreach}
	</ul>
</li>
{/if}
{/foreach}
