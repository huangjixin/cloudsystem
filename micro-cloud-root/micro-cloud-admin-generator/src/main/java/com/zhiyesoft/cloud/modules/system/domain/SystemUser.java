package com.zhiyesoft.cloud.modules.system.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "system_user")
public class SystemUser implements Serializable {
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
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        SystemUser other = (SystemUser) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
            && (this.getCode() == null ? other.getCode() == null : this.getCode().equals(other.getCode()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()))
            && (this.getIsLocked() == null ? other.getIsLocked() == null : this.getIsLocked().equals(other.getIsLocked()))
            && (this.getIsValid() == null ? other.getIsValid() == null : this.getIsValid().equals(other.getIsValid()))
            && (this.getSortNum() == null ? other.getSortNum() == null : this.getSortNum().equals(other.getSortNum()))
            && (this.getCreateBy() == null ? other.getCreateBy() == null : this.getCreateBy().equals(other.getCreateBy()))
            && (this.getUpdateBy() == null ? other.getUpdateBy() == null : this.getUpdateBy().equals(other.getUpdateBy()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()))
            && (this.getLoginName() == null ? other.getLoginName() == null : this.getLoginName().equals(other.getLoginName()))
            && (this.getPassword() == null ? other.getPassword() == null : this.getPassword().equals(other.getPassword()))
            && (this.getEmail() == null ? other.getEmail() == null : this.getEmail().equals(other.getEmail()))
            && (this.getIcon() == null ? other.getIcon() == null : this.getIcon().equals(other.getIcon()))
            && (this.getMobile() == null ? other.getMobile() == null : this.getMobile().equals(other.getMobile()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getCode() == null) ? 0 : getCode().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        result = prime * result + ((getIsLocked() == null) ? 0 : getIsLocked().hashCode());
        result = prime * result + ((getIsValid() == null) ? 0 : getIsValid().hashCode());
        result = prime * result + ((getSortNum() == null) ? 0 : getSortNum().hashCode());
        result = prime * result + ((getCreateBy() == null) ? 0 : getCreateBy().hashCode());
        result = prime * result + ((getUpdateBy() == null) ? 0 : getUpdateBy().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        result = prime * result + ((getLoginName() == null) ? 0 : getLoginName().hashCode());
        result = prime * result + ((getPassword() == null) ? 0 : getPassword().hashCode());
        result = prime * result + ((getEmail() == null) ? 0 : getEmail().hashCode());
        result = prime * result + ((getIcon() == null) ? 0 : getIcon().hashCode());
        result = prime * result + ((getMobile() == null) ? 0 : getMobile().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", code=").append(code);
        sb.append(", status=").append(status);
        sb.append(", type=").append(type);
        sb.append(", isLocked=").append(isLocked);
        sb.append(", isValid=").append(isValid);
        sb.append(", sortNum=").append(sortNum);
        sb.append(", createBy=").append(createBy);
        sb.append(", updateBy=").append(updateBy);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", loginName=").append(loginName);
        sb.append(", password=").append(password);
        sb.append(", email=").append(email);
        sb.append(", icon=").append(icon);
        sb.append(", mobile=").append(mobile);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}