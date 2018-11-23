package com.zhiyesoft.cloud.modules.mem.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "mem_flow")
public class MemFlow implements Serializable {
    @Id
    @Column(name = "ID")
    private String id;

    @Column(name = "NAME")
    private String name;

    @Column(name = "CODE")
    private String code;

    @Column(name = "STATUS")
    private Integer status;

    /**
     * 0为支出，1为收入  
     */
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

    @Column(name = "UPDATE_BY")
    private String updateBy;

    @Column(name = "CREATE_TIME")
    private Date createTime;

    @Column(name = "UPDATE_TIME")
    private Date updateTime;

    @Column(name = "DESCRIPTION")
    private String description;

    /**
     * 金额
     */
    @Column(name = "AMOUNT")
    private Double amount;

    @Column(name = "MEMBER_ID")
    private String memberId;

    /**
     * 支付方式:1-微信;2-钱包;3-支付宝; 4-银联;
     */
    @Column(name = "PAY_WAY")
    private Integer payWay;

    /**
     * 流水号
     */
    @Column(name = "FLOW_NUM")
    private String flowNum;

    /**
     * 流水号说明
     */
    @Column(name = "FLOW_DESCRIPTION")
    private String flowDescription;

    /**
     * 1为订单；2为平台充值；3为平台兑换；4积分兑换；5提现；想到再定义
     */
    @Column(name = "FLOW_TYPE")
    private Integer flowType;

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
     * 获取0为支出，1为收入  
     *
     * @return TYPE - 0为支出，1为收入  
     */
    public Integer getType() {
        return type;
    }

    /**
     * 设置0为支出，1为收入  
     *
     * @param type 0为支出，1为收入  
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
     * 获取金额
     *
     * @return AMOUNT - 金额
     */
    public Double getAmount() {
        return amount;
    }

    /**
     * 设置金额
     *
     * @param amount 金额
     */
    public void setAmount(Double amount) {
        this.amount = amount;
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
     * 获取支付方式:1-微信;2-钱包;3-支付宝; 4-银联;
     *
     * @return PAY_WAY - 支付方式:1-微信;2-钱包;3-支付宝; 4-银联;
     */
    public Integer getPayWay() {
        return payWay;
    }

    /**
     * 设置支付方式:1-微信;2-钱包;3-支付宝; 4-银联;
     *
     * @param payWay 支付方式:1-微信;2-钱包;3-支付宝; 4-银联;
     */
    public void setPayWay(Integer payWay) {
        this.payWay = payWay;
    }

    /**
     * 获取流水号
     *
     * @return FLOW_NUM - 流水号
     */
    public String getFlowNum() {
        return flowNum;
    }

    /**
     * 设置流水号
     *
     * @param flowNum 流水号
     */
    public void setFlowNum(String flowNum) {
        this.flowNum = flowNum == null ? null : flowNum.trim();
    }

    /**
     * 获取流水号说明
     *
     * @return FLOW_DESCRIPTION - 流水号说明
     */
    public String getFlowDescription() {
        return flowDescription;
    }

    /**
     * 设置流水号说明
     *
     * @param flowDescription 流水号说明
     */
    public void setFlowDescription(String flowDescription) {
        this.flowDescription = flowDescription == null ? null : flowDescription.trim();
    }

    /**
     * 获取1为订单；2为平台充值；3为平台兑换；4积分兑换；5提现；想到再定义
     *
     * @return FLOW_TYPE - 1为订单；2为平台充值；3为平台兑换；4积分兑换；5提现；想到再定义
     */
    public Integer getFlowType() {
        return flowType;
    }

    /**
     * 设置1为订单；2为平台充值；3为平台兑换；4积分兑换；5提现；想到再定义
     *
     * @param flowType 1为订单；2为平台充值；3为平台兑换；4积分兑换；5提现；想到再定义
     */
    public void setFlowType(Integer flowType) {
        this.flowType = flowType;
    }
}