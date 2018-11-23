package com.zhiyesoft.cloud.modules.system.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "system_role")
public class Role implements Serializable {
    @Id
    @Column(name = "ID")
    private String id;

    @Column(name = "NAME")
    private String name;

    @Column(name = "CODE")
    private String code;

    @Column(name = "STATUS")
    private Integer status;

    @Column(name = "TYPE")
    private Integer type;

    /**
     * 0表示不锁定，1表示锁定
     */
    @Column(name = "IS_LOCKED")
    private Integer isLocked;

    /**
     * 0表示删除，1表示可用
     */
    @Column(name = "IS_VALID")
    private Integer isValid;

    @Column(name = "SORT_NUM")
    private Integer sortNum;

    @Column(name = "CREATE_BY")
    private String createBy;

    @Column(name = "UPDATE_BY")
    private String updateBy;

    @Column(name = "CREATE_TIME")
    private Date createTime;

    @Column(name = "UPDATE_TIME")
    private Date updateTime;

    /**
     * 缩略图
     */
    @Column(name = "ICON")
    private String icon;

    private static final long serialVersionUID = 1L;

    /**
     * @return ID
     */
    public String getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * @return NAME
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * @return CODE
     */
    public String getCode() {
        return code;
    }

    /**
     * @param code
     */
    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    /**
     * @return STATUS
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * @param status
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * @return TYPE
     */
    public Integer getType() {
        return type;
    }

    /**
     * @param type
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * 获取0表示不锁定，1表示锁定
     *
     * @return IS_LOCKED - 0表示不锁定，1表示锁定
     */
    public Integer getIsLocked() {
        return isLocked;
    }

    /**
     * 设置0表示不锁定，1表示锁定
     *
     * @param isLocked 0表示不锁定，1表示锁定
     */
    public void setIsLocked(Integer isLocked) {
        this.isLocked = isLocked;
    }

    /**
     * 获取0表示删除，1表示可用
     *
     * @return IS_VALID - 0表示删除，1表示可用
     */
    public Integer getIsValid() {
        return isValid;
    }

    /**
     * 设置0表示删除，1表示可用
     *
     * @param isValid 0表示删除，1表示可用
     */
    public void setIsValid(Integer isValid) {
        this.isValid = isValid;
    }

    /**
     * @return SORT_NUM
     */
    public Integer getSortNum() {
        return sortNum;
    }

    /**
     * @param sortNum
     */
    public void setSortNum(Integer sortNum) {
        this.sortNum = sortNum;
    }

    /**
     * @return CREATE_BY
     */
    public String getCreateBy() {
        return createBy;
    }

    /**
     * @param createBy
     */
    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
    }

    /**
     * @return UPDATE_BY
     */
    public String getUpdateBy() {
        return updateBy;
    }

    /**
     * @param updateBy
     */
    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy == null ? null : updateBy.trim();
    }

    /**
     * @return CREATE_TIME
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * @return UPDATE_TIME
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * @param updateTime
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
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
}