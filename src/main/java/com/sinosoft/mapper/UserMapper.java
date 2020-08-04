package com.sinosoft.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sinosoft.entity.UserModel;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 系统管理员帐号 Mapper 接口
 * </p>
 *
 * @author dongwn
 * @since 2020-06-28
 */
@Repository//代表持久层
public interface UserMapper extends BaseMapper<UserModel> {
}
