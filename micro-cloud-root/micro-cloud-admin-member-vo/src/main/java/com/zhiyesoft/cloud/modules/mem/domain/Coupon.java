package com.zhiyesoft.cloud.modules.mem.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "mem_coupon")
public class Coupon implements Serializable {
    @Id
    @Column(name = "ID")
    private String id;

    @Column(name = "NAME")
    private String name;

    @Column(name = "CODE")
    private String code;

    /**
     * 开启:1-启用;0-关闭
     */
    @Column(name = "STATUS")
    private Integer status;

    /**
     * 优惠券类型:0-满减券;1-代金券;2-折扣券
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

    @Column(name = "ICON")
    private String icon;

    /**
     * 活动备注
     */
    @Column(name = "DESCRIPTION")
    private String description;

    /**
     * 0-所有人可领;1-会员可领
     */
    @Column(name = "RECEIVE_CONDITIONS")
    private Integer receiveConditions;

    /**
     * 生效时间
     */
    @Column(name = "EFFITIVE_TIME")
    private Date effitiveTime;

    /**
     * 到期时间
     */
    @Column(name = "EXPIRE_TIME")
    private Date expireTime;

    /**
     * 优惠折扣(类型为折扣券时填写)
     */
    @Column(name = "DISCOUNT")
    private Integer discount;

    /**
     * 优惠劵金额(类型为满减券、代金券时填写)
     */
    @Column(name = "REDUCE_PRICE")
    private Double reducePrice;

    /**
     * 领取次数，默认 为1
     */
    @Column(name = "RECEIVE_TIMES")
    private Integer receiveTimes;

    /**
     * 生效方式0:领取后生效;1:固定日期;
     */
    @Column(name = "EFFITIVE_WAY")
    private Integer effitiveWay;

    /**
     * 商铺ID
     */
    @Column(name = "SHOP_ID")
    private String shopId;

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
     * 获取开启:1-启用;0-关闭
     *
     * @return STATUS - 开启:1-启用;0-关闭
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置开启:1-启用;0-关闭
     *
     * @param status 开启:1-启用;0-关闭
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取优惠券类型:0-满减券;1-代金券;2-折扣券
     *
     * @return TYPE - 优惠券类型:0-满减券;1-代金券;2-折扣券
     */
    public Integer getType() {
        return type;
    }

    /**
     * 设置优惠券类型:0-满减券;1-代金券;2-折扣券
     *
     * @param type 优惠券类型:0-满减券;1-代金券;2-折扣券
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
     * @return ICON
     */
    public String getIcon() {
        return icon;
    }

    /**
     * @param icon
     */
    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    /**
     * 获取活动备注
     *
     * @return DESCRIPTION - 活动备注
     */
    public String getDescription() {
        return description;
    }

    /**
     * 设置活动备注
     *
     * @param description 活动备注
     */
    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    /**
     * 获取0-所有人可领;1-会员可领
     *
     * @return RECEIVE_CONDITIONS - 0-所有人可领;1-会员可领
     */
    public Integer getReceiveConditions() {
        return receiveConditions;
    }

    /**
     * 设置0-所有人可领;1-会员可领
     *
     * @param receiveConditions 0-所有人可领;1-会员可领
     */
    public void setReceiveConditions(Integer receiveConditions) {
        this.receiveConditions = receiveConditions;
    }

    /**
     * 获取生效时间
     *
     * @return EFFITIVE_TIME - 生效时间
     */
    public Date getEffitiveTime() {
        return effitiveTime;
    }

    /**
     * 设置生效时间
     *
     * @param effitiveTime 生效时间
     */
    public void setEffitiveTime(Date effitiveTime) {
        this.effitiveTime = effitiveTime;
    }

    /**
     * 获取到期时间
     *
     * @return EXPIRE_TIME - 到期时间
     */
    public Date getExpireTime() {
        return expireTime;
    }

    /**
     * 设置到期时间
     *
     * @param expireTime 到期时间
     */
    public void setExpireTime(Date expireTime) {
        this.expireTime = expireTime;
    }

    /**
     * 获取优惠折扣(类型为折扣券时填写)
     *
     * @return DISCOUNT - 优惠折扣(类型为折扣券时填写)
     */
    public Integer getDiscount() {
        return discount;
    }

    /**
     * 设置优惠折扣(类型为折扣券时填写)
     *
     * @param discount 优惠折扣(类型为折扣券时填写)
     */
    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    /**
     * 获取优惠劵金额(类型为满减券、代金券时填写)
     *
     * @return REDUCE_PRICE - 优惠劵金额(类型为满减券、代金券时填写)
     */
    public Double getReducePrice() {
        return reducePrice;
    }

    /**
     * 设置优惠劵金额(类型为满减券、代金券时填写)
     *
     * @param reducePrice 优惠劵金额(类型为满减券、代金券时填写)
     */
    public void setReducePrice(Double reducePrice) {
        this.reducePrice = reducePrice;
    }

    /**
     * 获取领取次数，默认 为1
     *
     * @return RECEIVE_TIMES - 领取次数，默认 为1
     */
    public Integer getReceiveTimes() {
        return receiveTimes;
    }

    /**
     * 设置领取次数，默认 为1
     *
     * @param receiveTimes 领取次数，默认 为1
     */
    public void setReceiveTimes(Integer receiveTimes) {
        this.receiveTimes = receiveTimes;
    }

    /**
     * 获取生效方式0:领取后生效;1:固定日期;
     *
     * @return EFFITIVE_WAY - 生效方式0:领取后生效;1:固定日期;
     */
    public Integer getEffitiveWay() {
        return effitiveWay;
    }

    /**
     * 设置生效方式0:领取后生效;1:固定日期;
     *
     * @param effitiveWay 生效方式0:领取后生效;1:固定日期;
     */
    public void setEffitiveWay(Integer effitiveWay) {
        this.effitiveWay = effitiveWay;
    }

    /**
     * 获取商铺ID
     *
     * @return SHOP_ID - 商铺ID
     */
    public String getShopId() {
        return shopId;
    }

    /**
     * 设置商铺ID
     *
     * @param shopId 商铺ID
     */
    public void setShopId(String shopId) {
        this.shopId = shopId == null ? null : shopId.trim();
    }
}