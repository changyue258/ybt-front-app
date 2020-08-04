/**
 * @Title: HXBService.java
 * @Package com.sinosoft.agency.hxb
 * @version V1.0
 */
package com.sinosoft.agency.hxb;

import com.sinosoft.ybframework.core.YBException;
import com.sinosoft.ybframework.gateway.service.CallPostService;
import com.sinosoft.ybframework.gateway.service.TransCallPostServiceUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.xpath.XPath;
import com.sinosoft.ybframework.gateway.service.Service;

/**
 * @ClassName HXBService
 * @Description: 华夏银行服务处理类
 * @author cheng
 * @date 2018年9月15日 下午12:17:51
 *
 */
public class HXBService implements Service
{
	protected final Logger LOG = LogManager.getLogger();
	
	@Override
	public Document service(Document paramDoc) throws YBException
	{

		String transCode = "";
		
		try
		{
			XPath path = XPath.newInstance("ReqHead/TransCode");
			
			Element element = (Element) path.selectSingleNode(paramDoc.getRootElement());
			
			transCode = element.getTextTrim();
		}
		catch (JDOMException e)
		{
			LOG.error("获取交易码失败：", e);
		}
		
		LOG.info("交易码内部代码：" + transCode);
		
		if(StringUtils.isBlank(transCode))
		{
			LOG.error("获取交易码信息为空，请检查配置文件");
			throw new YBException("系统处理失败，交易不存在，请联系保险公司！");
		}
		
		//获取远程服务访问处理类
		CallPostService service = TransCallPostServiceUtil.loadProvider(transCode);

		Document rspDoc = service.callPostService(paramDoc);

		return rspDoc;
	}

}
