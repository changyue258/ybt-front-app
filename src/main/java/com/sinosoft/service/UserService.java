package com.sinosoft.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sinosoft.entity.UserModel;
import com.sinosoft.util.PageModel;

/**
 * <p>
 * 系统管理员帐号 服务类
 * </p>
 *
 * @author dongwn
 * @since 2020-06-28
 */
public interface UserService extends IService<UserModel> {

    Page<UserModel> findPage(PageModel<UserModel> pageModel);



}
