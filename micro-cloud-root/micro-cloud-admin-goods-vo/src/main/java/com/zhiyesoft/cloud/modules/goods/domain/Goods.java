package com.zhiyesoft.cloud.modules.goods.domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "pro_goods")
public class Goods implements Serializable {
    @Id
    @Column(name = "ID")
    private String id;

    @Column(name = "NAME")
    private String name;

    @Column(name = "CODE")
    private String code;

    /**
     * 状态:0-正常;1-已删除;2-下架;3-申请上架;4-拒绝;5-上架
     */
    @Column(name = "STATUS")
    private Integer status;

    /**
     * 允许购买用户:0-全部用户;1-VIP用户
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

    @Column(name = "DESCRIPTION")
    private String description;

    /**
     * 新品:0-否;1-是
     */
    @Column(name = "IS_NEW")
    private Byte isNew;

    /**
     * 热门:0-否;1-是
     */
    @Column(name = "IS_HOT")
    private Byte isHot;

    /**
     * 热门:0-否;1-是
     */
    @Column(name = "IS_RECOMMEND")
    private Byte isRecommend;

    /**
     * 申请上架时间
     */
    @Column(name = "APPLY_UP_TIME")
    private Date applyUpTime;

    /**
     * 下架时间
     */
    @Column(name = "DOWN_TIME")
    private Date downTime;

    /**
     * 上架时间
     */
    @Column(name = "UP_TIME")
    private Date upTime;

    /**
     * 是否推荐到首页，0否，1是
     */
    @Column(name = "IS_RECOMMOND_TO_INDEX")
    private Byte isRecommondToIndex;

    /**
     * 下架理由
     */
    @Column(name = "DOWN_REASON")
    private String downReason;

    /**
     * 管理员拒绝上架理由
     */
    @Column(name = "REJECT_REASON")
    private String rejectReason;

    @Column(name = "CATEGORY_ID")
    private String categoryId;

    /**
     * 标题
     */
    @Column(name = "TITLE")
    private String title;

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
     * 获取状态:0-正常;1-已删除;2-下架;3-申请上架;4-拒绝;5-上架
     *
     * @return STATUS - 状态:0-正常;1-已删除;2-下架;3-申请上架;4-拒绝;5-上架
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置状态:0-正常;1-已删除;2-下架;3-申请上架;4-拒绝;5-上架
     *
     * @param status 状态:0-正常;1-已删除;2-下架;3-申请上架;4-拒绝;5-上架
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取允许购买用户:0-全部用户;1-VIP用户
     *
     * @return TYPE - 允许购买用户:0-全部用户;1-VIP用户
     */
    public Integer getType() {
        return type;
    }

    /**
     * 设置允许购买用户:0-全部用户;1-VIP用户
     *
     * @param type 允许购买用户:0-全部用户;1-VIP用户
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
     * 获取新品:0-否;1-是
     *
     * @return IS_NEW - 新品:0-否;1-是
     */
    public Byte getIsNew() {
        return isNew;
    }

    /**
     * 设置新品:0-否;1-是
     *
     * @param isNew 新品:0-否;1-是
     */
    public void setIsNew(Byte isNew) {
        this.isNew = isNew;
    }

    /**
     * 获取热门:0-否;1-是
     *
     * @return IS_HOT - 热门:0-否;1-是
     */
    public Byte getIsHot() {
        return isHot;
    }

    /**
     * 设置热门:0-否;1-是
     *
     * @param isHot 热门:0-否;1-是
     */
    public void setIsHot(Byte isHot) {
        this.isHot = isHot;
    }

    /**
     * 获取热门:0-否;1-是
     *
     * @return IS_RECOMMEND - 热门:0-否;1-是
     */
    public Byte getIsRecommend() {
        return isRecommend;
    }

    /**
     * 设置热门:0-否;1-是
     *
     * @param isRecommend 热门:0-否;1-是
     */
    public void setIsRecommend(Byte isRecommend) {
        this.isRecommend = isRecommend;
    }

    /**
     * 获取申请上架时间
     *
     * @return APPLY_UP_TIME - 申请上架时间
     */
    public Date getApplyUpTime() {
        return applyUpTime;
    }

    /**
     * 设置申请上架时间
     *
     * @param applyUpTime 申请上架时间
     */
    public void setApplyUpTime(Date applyUpTime) {
        this.applyUpTime = applyUpTime;
    }

    /**
     * 获取下架时间
     *
     * @return DOWN_TIME - 下架时间
     */
    public Date getDownTime() {
        return downTime;
    }

    /**
     * 设置下架时间
     *
     * @param downTime 下架时间
     */
    public void setDownTime(Date downTime) {
        this.downTime = downTime;
    }

    /**
     * 获取上架时间
     *
     * @return UP_TIME - 上架时间
     */
    public Date getUpTime() {
        return upTime;
    }

    /**
     * 设置上架时间
     *
     * @param upTime 上架时间
     */
    public void setUpTime(Date upTime) {
        this.upTime = upTime;
    }

    /**
     * 获取是否推荐到首页，0否，1是
     *
     * @return IS_RECOMMOND_TO_INDEX - 是否推荐到首页，0否，1是
     */
    public Byte getIsRecommondToIndex() {
        return isRecommondToIndex;
    }

    /**
     * 设置是否推荐到首页，0否，1是
     *
     * @param isRecommondToIndex 是否推荐到首页，0否，1是
     */
    public void setIsRecommondToIndex(Byte isRecommondToIndex) {
        this.isRecommondToIndex = isRecommondToIndex;
    }

    /**
     * 获取下架理由
     *
     * @return DOWN_REASON - 下架理由
     */
    public String getDownReason() {
        return downReason;
    }

    /**
     * 设置下架理由
     *
     * @param downReason 下架理由
     */
    public void setDownReason(String downReason) {
        this.downReason = downReason == null ? null : downReason.trim();
    }

    /**
     * 获取管理员拒绝上架理由
     *
     * @return REJECT_REASON - 管理员拒绝上架理由
     */
    public String getRejectReason() {
        return rejectReason;
    }

    /**
     * 设置管理员拒绝上架理由
     *
     * @param rejectReason 管理员拒绝上架理由
     */
    public void setRejectReason(String rejectReason) {
        this.rejectReason = rejectReason == null ? null : rejectReason.trim();
    }

    /**
     * @return CATEGORY_ID
     */
    public String getCategoryId() {
        return categoryId;
    }

    /**
     * @param categoryId
     */
    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId == null ? null : categoryId.trim();
    }

    /**
     * 获取标题
     *
     * @return TITLE - 标题
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置标题
     *
     * @param title 标题
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
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