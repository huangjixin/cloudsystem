package com.zhiyesoft.cloud.modules.mem.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "mem_job_record")
public class JobRecord implements Serializable {
    /**
     * 与作业步骤一致的ID
     */
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

    @Column(name = "IS_LOCKED")
    private Integer isLocked;

    @Column(name = "IS_VALID")
    private Integer isValid;

    @Column(name = "SORT_NUM")
    private Integer sortNum;

    @Column(name = "CREATE_BY")
    private String createBy;

    @Column(name = "CREATE_TIME")
    private Date createTime;

    @Column(name = "DESCRIPTION")
    private String description;

    /**
     * 作业连接
     */
    @Column(name = "URL")
    private String url;

    /**
     * 物理地址
     */
    @Column(name = "LOCATION")
    private String location;

    /**
     * 作业ID
     */
    @Column(name = "JOB_ID")
    private String jobId;

    private static final long serialVersionUID = 1L;

    /**
     * 获取与作业步骤一致的ID
     *
     * @return ID - 与作业步骤一致的ID
     */
    public String getId() {
        return id;
    }

    /**
     * 设置与作业步骤一致的ID
     *
     * @param id 与作业步骤一致的ID
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
     * 获取作业连接
     *
     * @return URL - 作业连接
     */
    public String getUrl() {
        return url;
    }

    /**
     * 设置作业连接
     *
     * @param url 作业连接
     */
    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    /**
     * 获取物理地址
     *
     * @return LOCATION - 物理地址
     */
    public String getLocation() {
        return location;
    }

    /**
     * 设置物理地址
     *
     * @param location 物理地址
     */
    public void setLocation(String location) {
        this.location = location == null ? null : location.trim();
    }

    /**
     * 获取作业ID
     *
     * @return JOB_ID - 作业ID
     */
    public String getJobId() {
        return jobId;
    }

    /**
     * 设置作业ID
     *
     * @param jobId 作业ID
     */
    public void setJobId(String jobId) {
        this.jobId = jobId == null ? null : jobId.trim();
    }
}