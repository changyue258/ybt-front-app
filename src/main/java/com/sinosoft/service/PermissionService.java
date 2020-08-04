package com.sinosoft.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sinosoft.entity.PermissionModel;
import com.sinosoft.entity.UserModel;
import com.sinosoft.util.PageModel;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author dongwn
 * @since 2020-06-28
 */
public interface PermissionService extends IService<PermissionModel> {

    Map<String, Object> getUserPerms(UserModel user);

    Page<PermissionModel> findPage(PageModel<PermissionModel> pageModel);

}
