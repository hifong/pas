
{foreach from=$rows item=r1}
{if !$r1.children}
<li><a href="{$contextPath}/cms/cms/contents.shtml?category_id={$r1.category_id}" target="main">{$r1.name}</a></li>
{else}
<li><a href="#menu{$r1.category_id}" data-toggle="collapse">{$r1.name} [..]</a>
    <ul class="nav collapse " id="menu{$r1.category_id}">
    	{foreach from=$r1.children item=r2}
			{if !$r2.children}
			<li><a href="{$contextPath}/cms/cms/contents.shtml?category_id={$r2.category_id}" target="main">{$r2.name}</a></li>
			{else}
			<li><a href="#menu{$r2.category_id}" data-toggle="collapse">{$r2.name} [..]</a>
			    <ul class="nav collapse " id="menu{$r2.category_id}">
			    	{foreach from=$r2.children item=r3}
			    	
						{if !$r3.children}
						<li><a href="{$contextPath}/cms/cms/contents.shtml?category_id={$r3.category_id}" target="main">{$r3.name}</a></li>
						{else}
						<li><a href="#menu{$r3.category_id}" data-toggle="collapse">{$r3.name} [..]</a>
						    <ul class="nav collapse " id="menu{$r3.category_id}">
						    	{foreach from=$r3.children item=r4}
								<li><a href="{$contextPath}/cms/cms/contents.shtml?category_id={$r4.category_id}" target="main">{$r4.name}</a></li>
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
