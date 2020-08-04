/**
 * @Title: HXBSocketNetImpl.java
 * @Package com.sinosoft.agency.hxb
 * @version V1.0
 */
package com.sinosoft.agency.hxb;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.Socket;
import java.util.List;
import java.util.Map;

import com.sinosoft.ybframework.core.YBException;
import com.sinosoft.ybframework.core.util.IOStreamUtil;
import com.sinosoft.ybframework.core.util.JdomUtil;
import com.sinosoft.ybframework.gateway.service.SocketNetImpl;
import org.apache.commons.lang3.StringUtils;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.xpath.XPath;


import com.sinosoft.ybframework.core.util.StringUtil;

/**
 * @ClassName HXBSocketNetImpl
 * @Description: 华夏银行socket处理类
 * @author cheng
 * @date 2018年9月15日 上午11:59:32
 *
 */
public class HXBSocketNetImpl extends SocketNetImpl {
	private static final String INTO_METHOD_LOG = "into HXBSocketNetImpl.{}";
	private static final String OUT_METHOD_LOG = "out HXBSocketNetImpl.{}";

	/**
	 * 
	 * @Title: setTransNo
	 * @Description: 将交易流水号设置到线程局部变量里
	 * @param doc
	 */
	public void setTransNo(Document doc) {
		Map<String, Object> map = super.threadLocalMap.get();
		String transNo = doc.getRootElement().getChild("MAIN").getChildTextTrim("TRANSRNO");
		map.put("transNo", transNo);
	}

	/**
	 * 
	 * @Title: setAgencTransCode
	 * @Description: 将交易代码设置到线程局部变量里
	 * @param doc
	 */
	public void setAgencTransCode(Document doc) {
		Map<String, Object> map = super.threadLocalMap.get();
		String transCode = doc.getRootElement().getChild("MAIN").getChildTextTrim("FUNCTIONFLAG");
		map.put("transCode", transCode);
	}

	/**
	 * 
	 * @Title: setReqHead
	 * @Description: 将请求报文头设置到线程局部变量里
	 * @param doc
	 */
	public void setReqHead(Document doc) {
		Map<String, Object> map = super.threadLocalMap.get();
		Element reqHead = doc.getRootElement().getChild("MAIN");
		map.put("reqHead", reqHead);
	}

	/**
	 * 
	 * @Title: getReqHead
	 * @Description: 从线程局部变量获取请求报文头
	 * @return
	 */
	public Element getReqHead() {
		Map<String, Object> map = super.threadLocalMap.get();
		return (Element) map.get("reqHead");
	}

	@Override
	public String getAgencyTransCode() throws YBException {
		Map<String, Object> map = super.threadLocalMap.get();
		return (String) map.get("transCode");
	}

	@Override
	public String getTransNo() throws YBException {
		Map<String, Object> map = super.threadLocalMap.get();
		return (String) map.get("transNo");
	}

	@Override
	public byte[] getRspHead(byte[] encryptedBody) throws Exception {
		StringBuilder head = new StringBuilder();
		// 报文长度
		int msgLenth = encryptedBody.length;
		byte rspHeadByte[] = null;
		//包头
		String nclf = "NCLF";
		head.append(nclf);
		//发送/接收标志
		String rspFlag = "20";
		head.append(rspFlag);
		//交易代码
		String agencyTransCode = getAgencyTransCode();
		head.append(agencyTransCode);
		// 采用左对齐，右补空格(英文空格)方式填充
		String msgLenStr = StringUtil.fillWith_(msgLenth+16, 8);
		head.append(msgLenStr);
		try {
			rspHeadByte = head.toString().getBytes(getCharset());
		}
		catch (UnsupportedEncodingException e) {
			LOG.error("组织返回报文头失败：", e);
			throw new YBException(e);
		}
		return rspHeadByte;
	}

	@Override
	public byte[] receiveReqHead() throws Exception {
		LOG.info(INTO_METHOD_LOG, "receiveReqHead");
		Socket socket = getSocket();
		InputStream is = socket.getInputStream();
		/**读取报文头信息*/
		byte[] head = new byte[16];
		IOStreamUtil.readFull(head, is);
//		String headString = new String(head);
//		int parseInt = Integer.parseInt(headString.substring(8).trim());
//		head =(headString.substring(0, 8) + String.valueOf(parseInt)).getBytes(getCharset());
		LOG.info("包头:",new String(head));
		LOG.info(OUT_METHOD_LOG, "receiveReqHead");
		return head;
	}

	@Override
	public byte[] receiveReqBody(String reqHead, byte[] reqHeadByte) throws Exception {
		LOG.info(INTO_METHOD_LOG, "receiveReqBody");
		int bodyLen = 0;
		//报文体长度
		if(reqHeadByte.length != 0) {
			bodyLen = Integer.parseInt(new String(reqHeadByte, getCharset()).substring(8, reqHeadByte.length).trim()) - 16;
		}
		LOG.info("报文体长度：" + bodyLen);
		//读取报文体信息
		byte[] body = new byte[bodyLen];
		Socket socket = getSocket();
		InputStream is = socket.getInputStream();
		IOStreamUtil.readFull(body, is);
		LOG.info(OUT_METHOD_LOG, "receiveReqBody");
		return body;
	}

	@Override
	public byte[] decrypt(String reqHead, byte[] reqBody) throws Exception {
		LOG.info(INTO_METHOD_LOG, "decrypt");
		LOG.info(OUT_METHOD_LOG, "decrypt");
		return reqBody;
	}

	@Override
	public Document buildInNoStdDoc(byte[] decryptedReqBody) throws Exception {
		LOG.info(INTO_METHOD_LOG, "buildInNoStdDoc");
		Document recieveDoc = JdomUtil.build(decryptedReqBody, "GBK", false);
		setReqHead(recieveDoc);
		LOG.info(OUT_METHOD_LOG, "buildInNoStdDoc");
		return recieveDoc;
	}

	@Override
	public byte[] getRspBody(Document outNoStdDoc) throws Exception {
		LOG.info(INTO_METHOD_LOG, "getRspBody");
		String charset = getCharset();
		//交易成功时，添加银行请求报文头，后续判断
		Element rRootElement = outNoStdDoc.getRootElement();
		rRootElement.addContent(getReqHead());
		//返回报文体
		String docStr = JdomUtil.toStringFmt(outNoStdDoc, charset);
		byte body[] = docStr.getBytes(charset);
		LOG.info(OUT_METHOD_LOG, "getRspBody");
		return body;
	}

	@Override
	public byte[] encrypt(byte[] rspBody) throws Exception {
		LOG.info(INTO_METHOD_LOG, "encrypt");
		LOG.info(OUT_METHOD_LOG, "encrypt");
		return rspBody;
	}
}
