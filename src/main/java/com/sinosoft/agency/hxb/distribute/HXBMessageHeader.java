/**
 * @Title: HXBMessageHeader.java
 * @Package com.sinosoft.agency.hxb.distribute
 * @version V1.0
 */
package com.sinosoft.agency.hxb.distribute;

import com.sinosoft.ybframework.gateway.distribute.MessageHeader;
import com.sinosoft.ybframework.core.util.StringUtil;


/**
 * @ClassName HXBMessageHeader
 * @Description: 华夏银行消息报文头
 * @author cheng
 * @date 2018年11月1日 下午10:53:27
 *
 */
public class HXBMessageHeader implements MessageHeader
{

	@Override
	public void setReqBodyLen(byte[] reqHeader, int bodyLen)
	{
		
		if(bodyLen == 6){
			
			String msgLenStr = StringUtil.fillWith0(bodyLen, 6);//左补0
			
			byte[] bodyLenByte = msgLenStr.getBytes();
			
			System.arraycopy(bodyLenByte, 0, reqHeader, 0, bodyLenByte.length);
			
		}
		if(bodyLen == 16){
			
			String msgLenStr = StringUtil.fillWith_(bodyLen, 16);//右边空格
			
			byte[] bodyLenByte = msgLenStr.getBytes();
			
			System.arraycopy(bodyLenByte, 0, reqHeader, 0, bodyLenByte.length);
			
		}
		
	}

	@Override
	public int getRspBodyLen(String rspHeaderContent)
	{
		int len = Integer.valueOf(rspHeaderContent.trim());
		
		return len;
	}

	@Override
	public int getReqHeaderLen()
	{
		return 16;
	}

	@Override
	public int getRspHeaderLen()
	{
		
		return 16;
	}

}
