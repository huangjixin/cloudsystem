package com.zhiyesoft.cloud.modules.mem.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "mem_check_config")
public class CheckConfig implements Serializable {
    @Id
    @Column(name = "ID")
    private String id;

    @Column(name = "IS_LOCKED")
    private Integer isLocked;

    @Column(name = "IS_VALID")
    private Integer isValid;

    @Column(name = "CREATE_BY")
    private String createBy;

    @Column(name = "UPDATE_BY")
    private String updateBy;

    @Column(name = "CREATE_TIME")
    private Date createTime;

    @Column(name = "UPDATE_TIME")
    private Date updateTime;

    @Column(name = "DESCRIPTION")
    private String description;

    /**
     * 签到频率，按照分钟配置,默认1440，一天一次
     */
    @Column(name = "RATE")
    private Integer rate;

    /**
     * 每天签到次数
     */
    @Column(name = "CHECK_NUM")
    private Integer checkNum;

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
     * @return IS_LOCKED
     */
    public Integer getIsLocked() {
        return isLocked;
    }

    /**
     * @param isLocked
     */
    public void setIsLocked(Integer isLocked) {
        this.isLocked = isLocked;
    }

    /**
     * @return IS_VALID
     */
    public Integer getIsValid() {
        return isValid;
    }

    /**
     * @param isValid
     */
    public void setIsValid(Integer isValid) {
        this.isValid = isValid;
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
     * @return DESCRIPTION
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description
     */
    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    /**
     * 获取签到频率，按照分钟配置,默认1440，一天一次
     *
     * @return RATE - 签到频率，按照分钟配置,默认1440，一天一次
     */
    public Integer getRate() {
        return rate;
    }

    /**
     * 设置签到频率，按照分钟配置,默认1440，一天一次
     *
     * @param rate 签到频率，按照分钟配置,默认1440，一天一次
     */
    public void setRate(Integer rate) {
        this.rate = rate;
    }

    /**
     * 获取每天签到次数
     *
     * @return CHECK_NUM - 每天签到次数
     */
    public Integer getCheckNum() {
        return checkNum;
    }

    /**
     * 设置每天签到次数
     *
     * @param checkNum 每天签到次数
     */
    public void setCheckNum(Integer checkNum) {
        this.checkNum = checkNum;
    }
}