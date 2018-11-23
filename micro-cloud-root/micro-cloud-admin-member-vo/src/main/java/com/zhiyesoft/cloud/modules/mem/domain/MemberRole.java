package com.zhiyesoft.cloud.modules.mem.domain;

import java.io.Serializable;
import javax.persistence.*;

@Table(name = "mem_member_role")
public class MemberRole implements Serializable {
    @Id
    @Column(name = "ID")
    private String id;

    /**
     * 会员ID
     */
    @Column(name = "MEMBER_ID")
    private String memberId;

    /**
     * 会员用户的角色ID
     */
    @Column(name = "ROLE_ID")
    private String roleId;

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
     * 获取会员用户的角色ID
     *
     * @return ROLE_ID - 会员用户的角色ID
     */
    public String getRoleId() {
        return roleId;
    }

    /**
     * 设置会员用户的角色ID
     *
     * @param roleId 会员用户的角色ID
     */
    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }
}