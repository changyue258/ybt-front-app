package com.sinosoft.entity;


import java.util.Date;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;


/**
 * @author dongwn
 * @since 2020-06-28
 */
@Data
@TableName("t_role")
public class RoleModel {


    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private String id;

    @TableField(value = "role_name")
    private String roleName;

    @TableField(value = "role_desc")
    private String roleDesc;

    @TableField(value = "permissions")
    private String permissions;

    @TableField(value = "role_status")
    private Integer roleStatus;

    @TableField(value = "is_deleted")
    private Integer isDeleted;

    @TableField(value = "create_time")
    private Date createTime;

    @TableField(value = "create_by")
    private String createBy;

    @TableField(value = "update_time")
    private Date updateTime;

    @TableField(value = "update_by")
    private String updateBy;



}


