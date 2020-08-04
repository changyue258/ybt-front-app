package com.sinosoft.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sinosoft.entity.RoleModel;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 系统用户角色表 Mapper 接口
 * </p>
 *
 * @author dongwn
 * @since 2020-06-28
 */
@Repository//代表持久层
public interface RoleMapper extends BaseMapper<RoleModel> {
}
