package com.zhiyesoft.cloud.modules.mem.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "mem_exception_job")
public class ExceptionJob implements Serializable {
    @Id
    @Column(name = "ID")
    private String id;

    @Column(name = "JOB_ID")
    private String jobId;

    @Column(name = "MEMBER_ID")
    private String memberId;

    /**
     * 状态，1为有效，表示问题仍然存在；0表示问题已经得到解决
     */
    @Column(name = "STATUS")
    private Integer status;

    @Column(name = "CREATE_TIME")
    private Date createTime;

    @Column(name = "UPDATE_TIME")
    private Date updateTime;

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
     * @return JOB_ID
     */
    public String getJobId() {
        return jobId;
    }

    /**
     * @param jobId
     */
    public void setJobId(String jobId) {
        this.jobId = jobId == null ? null : jobId.trim();
    }

    /**
     * @return MEMBER_ID
     */
    public String getMemberId() {
        return memberId;
    }

    /**
     * @param memberId
     */
    public void setMemberId(String memberId) {
        this.memberId = memberId == null ? null : memberId.trim();
    }

    /**
     * 获取状态，1为有效，表示问题仍然存在；0表示问题已经得到解决
     *
     * @return STATUS - 状态，1为有效，表示问题仍然存在；0表示问题已经得到解决
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置状态，1为有效，表示问题仍然存在；0表示问题已经得到解决
     *
     * @param status 状态，1为有效，表示问题仍然存在；0表示问题已经得到解决
     */
    public void setStatus(Integer status) {
        this.status = status;
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
}