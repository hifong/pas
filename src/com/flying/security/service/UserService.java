package com.flying.security.service;

import com.flying.common.util.Codes;
import com.flying.framework.annotation.DaoCreate;
import com.flying.framework.annotation.DaoQuery;
import com.flying.framework.annotation.DaoRemove;
import com.flying.framework.annotation.DaoUpdate;
import com.flying.framework.annotation.Param;
import com.flying.framework.annotation.Service;
import com.flying.framework.annotation.Transaction;
import com.flying.framework.data.Data;
import com.flying.framework.service.AbstractService;

@Service("UserService")
public class UserService  extends AbstractService{
	
	@DaoCreate(entity="security.user")
	public Data create(
			@Param(value="username", required=true)String username,
			@Param(value="password",required=true)String password,
			@Param(value="org_name",required=true)String org_name,
			@Param(value="real_name",required=true)String real_name) throws Exception {
		return null;
	}

	@DaoUpdate(entity="security.user")
	public Data update(
			@Param(value="org_name",required=true)String org_name,
			@Param(value="real_name",required=true)String real_name,
			@Param(value="user_id",required=true)long user_id) throws Exception {
		return null;
	}

	@DaoUpdate(entity="security.user")
	public Data changePassword(
			@Param(value="password",required=true)String password,
			@Param(value="user_id",required=true)long user_id) throws Exception {
		return null;
	}

	@DaoRemove(entity="security.user")
	public Data remove(
			@Param(value="user_id",required=true)long user_id) throws Exception {
		return null;
	}

	@DaoRemove(entity="security.user")
	public Data removeByUsername(
			@Param(value="username",required=true)String username) throws Exception {
		return null;
	}
	
	@DaoQuery(single=true, entity="security.user.perms")
	public Data findByUsernamePassword(@Param(value="username",required=true)String username,
			@Param(value="password",required=true)String password) throws Exception {
		return null;
	}
	
	@DaoQuery(entity="security.user")
	public Data findAll(Data request) throws Exception {
		return request;
	}
	
	//
	@Transaction
	public Data createWithRoles(
			@Param(value="username", required=true)String username,
			@Param(value="password",required=true)String password,
			@Param(value="org_name",required=true)String org_name,
			@Param(value="real_name",required=true)String real_name, 
			@Param(value="role_ids",required=true)long[] role_ids
			) throws Exception {
		Data d = this.create(username, password, org_name, real_name);
		RoleService rs = this.module.getService(RoleService.class);
		if(role_ids != null)
			for(long r: role_ids) {
				rs.addRoleToUser(r, d.getLong("user_id",0));
			}
		return new Data(Codes.CODE, Codes.SUCCESS);
	}

	@Transaction
	public Data updateWithRoles(
			@Param(value="org_name",required=true)String org_name,
			@Param(value="real_name",required=true)String real_name,
			@Param(value="role_ids",required=true)long[] role_ids,
			@Param(value="user_id",required=true)long user_id
			) throws Exception {
		this.update(org_name, real_name, user_id);
		RoleService rs = this.module.getService(RoleService.class);
		rs.removeByUser(user_id);
		if(role_ids != null)
			for(long r: role_ids) {
				rs.addRoleToUser(r, user_id);
			}
		return new Data(Codes.CODE, Codes.SUCCESS);
	}

	@Transaction
	public Data removeWithRoles(
			@Param(value="user_id",required=true)long user_id) throws Exception{
		RoleService rs = this.module.getService(RoleService.class);
		rs.removeByUser(user_id);
		
		this.remove(user_id);
		return new Data(Codes.CODE, Codes.SUCCESS);
	}
}
