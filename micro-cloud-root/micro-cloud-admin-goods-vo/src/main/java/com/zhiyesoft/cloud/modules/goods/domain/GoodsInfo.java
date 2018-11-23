package com.zhiyesoft.cloud.modules.goods.domain;

import java.io.Serializable;
import javax.persistence.*;

@Table(name = "pro_goods_info")
public class GoodsInfo implements Serializable {
    @Id
    @Column(name = "ID")
    private String id;

    /**
     * 销售量
     */
    @Column(name = "SALE_COUNT")
    private Integer saleCount;

    /**
     * 浏览次数
     */
    @Column(name = "VISIT_COUNT")
    private Integer visitCount;

    /**
     * 收藏次数
     */
    @Column(name = "COLLECT_COUNT")
    private Integer collectCount;

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
     * 获取销售量
     *
     * @return SALE_COUNT - 销售量
     */
    public Integer getSaleCount() {
        return saleCount;
    }

    /**
     * 设置销售量
     *
     * @param saleCount 销售量
     */
    public void setSaleCount(Integer saleCount) {
        this.saleCount = saleCount;
    }

    /**
     * 获取浏览次数
     *
     * @return VISIT_COUNT - 浏览次数
     */
    public Integer getVisitCount() {
        return visitCount;
    }

    /**
     * 设置浏览次数
     *
     * @param visitCount 浏览次数
     */
    public void setVisitCount(Integer visitCount) {
        this.visitCount = visitCount;
    }

    /**
     * 获取收藏次数
     *
     * @return COLLECT_COUNT - 收藏次数
     */
    public Integer getCollectCount() {
        return collectCount;
    }

    /**
     * 设置收藏次数
     *
     * @param collectCount 收藏次数
     */
    public void setCollectCount(Integer collectCount) {
        this.collectCount = collectCount;
    }
}