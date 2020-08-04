package com.sinosoft.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sinosoft.entity.PermissionModel;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author dongwn
 * @since 2020-06-28
 */
@Repository//代表持久层
public interface PermissionMapper extends BaseMapper<PermissionModel> {
}
