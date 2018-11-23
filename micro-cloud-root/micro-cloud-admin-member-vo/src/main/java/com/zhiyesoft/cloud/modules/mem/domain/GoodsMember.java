package com.zhiyesoft.cloud.modules.mem.domain;

import java.io.Serializable;
import javax.persistence.*;

@Table(name = "mem_goods_member")
public class GoodsMember implements Serializable {
    @Id
    @Column(name = "ID")
    private String id;

    @Column(name = "MEMBER_ID")
    private String memberId;

    @Column(name = "GOODS_ID")
    private String goodsId;

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
     * @return GOODS_ID
     */
    public String getGoodsId() {
        return goodsId;
    }

    /**
     * @param goodsId
     */
    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId == null ? null : goodsId.trim();
    }
}