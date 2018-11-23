package com.zhiyesoft.cloud.modules.mem.domain;

import java.io.Serializable;
import javax.persistence.*;

@Table(name = "mem_member_article")
public class MemberArticle implements Serializable {
    @Id
    @Column(name = "ID")
    private String id;

    /**
     * 会员ID
     */
    @Column(name = "MEMBER_ID")
    private String memberId;

    /**
     * 文章ID
     */
    @Column(name = "ARTICLE_ID")
    private String articleId;

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
     * 获取会员ID
     *
     * @return MEMBER_ID - 会员ID
     */
    public String getMemberId() {
        return memberId;
    }

    /**
     * 设置会员ID
     *
     * @param memberId 会员ID
     */
    public void setMemberId(String memberId) {
        this.memberId = memberId == null ? null : memberId.trim();
    }

    /**
     * 获取文章ID
     *
     * @return ARTICLE_ID - 文章ID
     */
    public String getArticleId() {
        return articleId;
    }

    /**
     * 设置文章ID
     *
     * @param articleId 文章ID
     */
    public void setArticleId(String articleId) {
        this.articleId = articleId == null ? null : articleId.trim();
    }
}