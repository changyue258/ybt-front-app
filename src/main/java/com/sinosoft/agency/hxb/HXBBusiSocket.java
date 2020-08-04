/**
 * @Title: HXBBusiSocket.java
 * @Package com.sinosoft.agency.hxb
 * @version V1.0
 */
package com.sinosoft.agency.hxb;

import java.net.Socket;

import com.sinosoft.ybframework.core.YBException;
import com.sinosoft.ybframework.core.util.DateUtil;
import com.sinosoft.ybframework.gateway.AgencyConfig;
import com.sinosoft.ybframework.gateway.BusiSocket;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.jdom.Document;
import org.jdom.Element;
import com.sinosoft.ybframework.core.util.SpringUtil;

/**
 * @ClassName HXBBusiSocket
 * @Description: 银行socket类
 * @author cheng
 * @date 2018年9月15日 上午11:43:22
 *
 */

public class HXBBusiSocket extends BusiSocket
{
	private static final Logger LOG = LogManager.getLogger();
	
	private static AgencyConfig agencyConfig = (AgencyConfig) SpringUtil.getBean("hxbAgencyConfig");
	
	public HXBBusiSocket(Socket socket) {
		super(socket, agencyConfig);
	}
	
	@Override
	public Document getErrMsg(String resultInfo)
	{
		
		String transCode = null;
		
		Element reqHead = agencyConfig.getSocketNetImpl().getReqHead();
		
		try {
			
			transCode = agencyConfig.getSocketNetImpl().getAgencyTransCode();
			
			if (null == reqHead) {
				
				reqHead = new Element(""); //此节点名不重要，只是不让其报空指针
			}
			
		} catch (YBException e) {
			
			LOG.error(e);
			
		}
		
		Document rspDocument = new Document();

		//root根结点
		Element root = new Element("RETURN");
		rspDocument.setRootElement(root);

		//MAIN结点
		Element main = new Element("MAIN");
		root.addContent(main);

		Element eeAPP = new Element("APP");
		Element eeOKFLAG = new Element("OKFLAG");
		eeOKFLAG.setText("0");
		Element eeFAILDETAIL = new Element("FAILDETAIL");
		eeFAILDETAIL.setText(resultInfo);

		main.addContent(eeAPP);
		main.addContent(eeOKFLAG);
		main.addContent(eeFAILDETAIL);
	    return rspDocument;
	}

}
