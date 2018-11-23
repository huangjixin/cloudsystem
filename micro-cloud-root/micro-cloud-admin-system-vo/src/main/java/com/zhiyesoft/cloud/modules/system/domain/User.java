package com.zhiyesoft.cloud.modules.system.domain;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.*;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Table(name = "system_user")
public class User implements Serializable,UserDetails {
    /**
     * 系统ID标识符
     */
    @Id
    @Column(name = "ID")
    private String id;

    /**
     * 姓名
     */
    @Column(name = "NAME")
    private String name;

    /**
     * 代码
     */
    @Column(name = "CODE")
    private String code;

    /**
     * 状态，待定
     */
    @Column(name = "STATUS")
    private String status;

    /**
     * 类型
     */
    @Column(name = "TYPE")
    private Integer type;

    /**
     * 是否被锁定，0不是，1是，默认不锁定
     */
    @Column(name = "IS_LOCKED")
    private Integer isLocked;

    /**
     * 是否删除，1是，0否
     */
    @Column(name = "IS_VALID")
    private Integer isValid;

    /**
     * 序号自增
     */
    @Column(name = "SORT_NUM")
    private Integer sortNum;

    /**
     * 创建人
     */
    @Column(name = "CREATE_BY")
    private String createBy;

    /**
     * 编辑人
     */
    @Column(name = "UPDATE_BY")
    private String updateBy;

    /**
     * 创建时间
     */
    @Column(name = "CREATE_TIME")
    private Date createTime;

    /**
     * 编辑时间
     */
    @Column(name = "UPDATE_TIME")
    private Date updateTime;

    /**
     * 登录名
     */
    @Column(name = "LOGIN_NAME")
    private String loginName;

    /**
     * 密码
     */
    @Column(name = "PASSWORD")
    private String password;

    /**
     * 邮箱
     */
    @Column(name = "EMAIL")
    private String email;

    /**
     * 缩略图
     */
    @Column(name = "ICON")
    private String icon;

    /**
     * 电话
     */
    @Column(name = "MOBILE")
    private String mobile;

    
    private static final long serialVersionUID = 1L;

    /**
     * 获取系统ID标识符
     *
     * @return ID - 系统ID标识符
     */
    public String getId() {
        return id;
    }

    /**
     * 设置系统ID标识符
     *
     * @param id 系统ID标识符
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * 获取姓名
     *
     * @return NAME - 姓名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置姓名
     *
     * @param name 姓名
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * 获取代码
     *
     * @return CODE - 代码
     */
    public String getCode() {
        return code;
    }

    /**
     * 设置代码
     *
     * @param code 代码
     */
    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    /**
     * 获取状态，待定
     *
     * @return STATUS - 状态，待定
     */
    public String getStatus() {
        return status;
    }

    /**
     * 设置状态，待定
     *
     * @param status 状态，待定
     */
    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    /**
     * 获取类型
     *
     * @return TYPE - 类型
     */
    public Integer getType() {
        return type;
    }

    /**
     * 设置类型
     *
     * @param type 类型
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * 获取是否被锁定，0不是，1是，默认不锁定
     *
     * @return IS_LOCKED - 是否被锁定，0不是，1是，默认不锁定
     */
    public Integer getIsLocked() {
        return isLocked;
    }

    /**
     * 设置是否被锁定，0不是，1是，默认不锁定
     *
     * @param isLocked 是否被锁定，0不是，1是，默认不锁定
     */
    public void setIsLocked(Integer isLocked) {
        this.isLocked = isLocked;
    }

    /**
     * 获取是否删除，1是，0否
     *
     * @return IS_VALID - 是否删除，1是，0否
     */
    public Integer getIsValid() {
        return isValid;
    }

    /**
     * 设置是否删除，1是，0否
     *
     * @param isValid 是否删除，1是，0否
     */
    public void setIsValid(Integer isValid) {
        this.isValid = isValid;
    }

    /**
     * 获取序号自增
     *
     * @return SORT_NUM - 序号自增
     */
    public Integer getSortNum() {
        return sortNum;
    }

    /**
     * 设置序号自增
     *
     * @param sortNum 序号自增
     */
    public void setSortNum(Integer sortNum) {
        this.sortNum = sortNum;
    }

    /**
     * 获取创建人
     *
     * @return CREATE_BY - 创建人
     */
    public String getCreateBy() {
        return createBy;
    }

    /**
     * 设置创建人
     *
     * @param createBy 创建人
     */
    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
    }

    /**
     * 获取编辑人
     *
     * @return UPDATE_BY - 编辑人
     */
    public String getUpdateBy() {
        return updateBy;
    }

    /**
     * 设置编辑人
     *
     * @param updateBy 编辑人
     */
    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy == null ? null : updateBy.trim();
    }

    /**
     * 获取创建时间
     *
     * @return CREATE_TIME - 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取编辑时间
     *
     * @return UPDATE_TIME - 编辑时间
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * 设置编辑时间
     *
     * @param updateTime 编辑时间
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * 获取登录名
     *
     * @return LOGIN_NAME - 登录名
     */
    public String getLoginName() {
        return loginName;
    }

    /**
     * 设置登录名
     *
     * @param loginName 登录名
     */
    public void setLoginName(String loginName) {
        this.loginName = loginName == null ? null : loginName.trim();
    }

    /**
     * 获取密码
     *
     * @return PASSWORD - 密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置密码
     *
     * @param password 密码
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    /**
     * 获取邮箱
     *
     * @return EMAIL - 邮箱
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置邮箱
     *
     * @param email 邮箱
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * 获取缩略图
     *
     * @return ICON - 缩略图
     */
    public String getIcon() {
        return icon;
    }

    /**
     * 设置缩略图
     *
     * @param icon 缩略图
     */
    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }
    
    /**
     * 获取电话
     *
     * @return MOBILE - 电话
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * 设置电话
     *
     * @param mobile 电话
     */
    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return null;
	}

	@Override
	public String getUsername() {
		return this.id;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
}