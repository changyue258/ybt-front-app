package com.sinosoft.agency.hxb.validate;

import com.sinosoft.ybframework.gateway.annotation.MessageValidate;
import com.sinosoft.ybframework.gateway.service.XslMessageValidate;

/**
 * @ClassName CancelApplValidate
 * @Description: 当日撤单服务校验
 * @author yt
 * @date 2018年10月11日
 *
 */
@MessageValidate(transCode = "03")
public class CancelApplValidate extends XslMessageValidate
{

}