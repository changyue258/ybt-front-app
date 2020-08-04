package com.sinosoft.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sinosoft.entity.UserModel;
import com.sinosoft.mapper.UserMapper;
import com.sinosoft.service.UserService;
import com.sinosoft.util.PageModel;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Map;

/**
 * <p>
 * 系统管理员帐号 服务实现类
 * </p>
 *
 * @author dongwn
 * @since 2020-06-28
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, UserModel> implements UserService {

    @Override
    public Page<UserModel> findPage(PageModel<UserModel> pageModel) {
        QueryWrapper<UserModel> wrapper = commonWrapper(pageModel);
        return (Page<UserModel>) super.page(pageModel, wrapper);
    }


    private QueryWrapper<UserModel> commonWrapper(PageModel<UserModel> pageModel) {
        Map paramMap = pageModel.getCondition();
        QueryWrapper<UserModel> wrapper = new QueryWrapper<UserModel>();
        wrapper.eq("is_deleted", 0);
        String name = "name";
        paramMap.forEach((k, v) -> {
            if(!StringUtils.isEmpty(v)){
                if (name.equals(k)) {
                    wrapper.like("name", v);
                }
            }
        });
        return wrapper;
    }
}
