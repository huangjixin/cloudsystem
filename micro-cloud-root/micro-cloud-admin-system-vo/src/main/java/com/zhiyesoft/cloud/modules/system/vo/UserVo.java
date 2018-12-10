/**
 * 
 */
package com.zhiyesoft.cloud.modules.system.vo;

import java.util.List;

import com.zhiyesoft.cloud.modules.system.domain.Resource;
import com.zhiyesoft.cloud.modules.system.domain.Role;
import com.zhiyesoft.cloud.modules.system.domain.User;

import lombok.Data;

/**
 * @author admin
 *
 */
@Data
public class UserVo extends User {
	
	private static final long serialVersionUID = 1L;

	// 角色列表。
	private List<Role> roles;

	// 资源列表。
	private List<Resource> resources;
	
	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public List<Resource> getResources() {
		return resources;
	}

	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}

}
