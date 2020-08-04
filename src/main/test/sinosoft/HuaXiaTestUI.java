package sinosoft; /**
 * 华夏银行测试类
 */

import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;

import com.sinosoft.ybframework.core.util.IOStreamUtil;
import com.sinosoft.ybframework.core.util.JdomUtil;
import org.apache.log4j.Logger;
import org.jdom.Document;

public class HuaXiaTestUI {
	private final static Logger cLogger = Logger.getLogger(HuaXiaTestUI.class);

	private final String cIP;
	private final int cPort;

	public static void main(String[] args) throws Exception {
		System.out.println("程序开始...");

		//本地
		String mIP = "127.0.0.1";

		int mPort = 52018;

		/**
		 * 10-新单投保
		 * 11-承保收费
		 * 12-当日撤单
		 * 51-日终对帐
		 * 90-续期查询
		 * 91-续期缴费
		 */
		String mFuncFlag = null;

		//新单投保
		mFuncFlag = "10";
		String mInFilePath = "E:/workplace/wuzhen_2011/昆仑/银保范例报文/与保险公司接口报文/续期保费缴纳请求_1204.xml";
		String mOutFilePath = "C:/Documents and Settings/ChenGB/桌面/费率测试（安徽半年一年计）/测试报文/新单交易/nxs_01_out_rateAnHui12-.xml";


		HuaXiaTestUI mTestUI = new HuaXiaTestUI(mIP, mPort);
		InputStream mIs = new FileInputStream(mInFilePath);
		byte[] mOutBytes = mTestUI.sendRequest(mFuncFlag, mIs);

		Document mOutXmlDoc = JdomUtil.build(mOutBytes);
		OutputStream mFos = new FileOutputStream(mOutFilePath);
		JdomUtil.output(mOutXmlDoc, mFos);
		mFos.flush();
		mFos.close();

		System.out.println("成功结束！");
	}

	public HuaXiaTestUI(String pIP, int pPort) {
		cIP = pIP;
		cPort = pPort;
	}

	public byte[] sendRequest(String pFuncFlag, InputStream pInputStream) throws Exception {
		cLogger.info("Socket连接" + cIP + ":" + cPort);
		Socket mSocket = new Socket(cIP, cPort);
		long mOldTimeMillis = System.currentTimeMillis();
		long mCurTimeMillis = mOldTimeMillis;
		byte[] mInBodyBytes = IOStreamUtil.toBytes(pInputStream);
		byte[] mInTotalBytes = new byte[mInBodyBytes.length + 16];
		//报文体长度
		String mInBodyLengthStr = String.valueOf(mInBodyBytes.length);
		cLogger.info("请求报文长度：" + mInBodyLengthStr);

		byte[] mInLengthBytes = mInBodyLengthStr.getBytes();
		System.arraycopy(mInLengthBytes, 0, mInTotalBytes, 8, mInLengthBytes.length);
		System.out.println("length = "+mInLengthBytes.length);
		//交易代码
		byte[] mFuncFlagBytes = pFuncFlag.getBytes();
		System.arraycopy(mFuncFlagBytes, 0, mInTotalBytes, 6, mFuncFlagBytes.length);
//
		//公司代码
		byte[] mInsuIDBytes = "NCLF10".getBytes();
		System.arraycopy(mInsuIDBytes, 0, mInTotalBytes, 0, mInsuIDBytes.length);

		System.arraycopy(mInBodyBytes, 0, mInTotalBytes, 16, mInBodyBytes.length);
		cLogger.info("发送请求报文！");
		mSocket.getOutputStream().write(mInTotalBytes);
//		mSocket.shutdownOutput();
		mCurTimeMillis = System.currentTimeMillis();
		cLogger.info("客户端请求发送完毕！耗时：" + (mCurTimeMillis - mOldTimeMillis)/1000.0 + "s");
		System.out.println();


		/**以下处理返回报文************************/
		InputStream mSocketIs = mSocket.getInputStream();
		cLogger.info("收到返回报文！");

		//处理报文头
		byte[] mOutHeadBytes = new byte[16];
		for (int tReadSize = 0; tReadSize < mOutHeadBytes.length;) {
			int tRead = mSocketIs.read(mOutHeadBytes, tReadSize, mOutHeadBytes.length-tReadSize);
			if (-1 == tRead) {
				throw new EOFException("获取报文头出错！实际读入：" + new String(mOutHeadBytes));
			}
			tReadSize += tRead;
		}
		int mOutBodyLengthInt = Integer.parseInt(new String(mOutHeadBytes, 8, 8).trim());
		cLogger.info("返回报文长度：" + mOutBodyLengthInt);
		cLogger.info("交易代码：" + new String(mOutHeadBytes, 6, 2).trim());
		cLogger.info("保险公司代码：" + new String(mOutHeadBytes, 0, 4).trim());

		//处理报文体
		byte[] mOutBodyBytes = new byte[mOutBodyLengthInt];
		for (int tReadSize = 0; tReadSize < mOutBodyBytes.length;) {
			int tRead = mSocketIs.read(mOutBodyBytes, tReadSize, mOutBodyBytes.length-tReadSize);
			if (-1 == tRead) {
				throw new EOFException("获取报文体出错！实际读入长度为：" + tReadSize);
			}
			tReadSize += tRead;
		}
		mSocket.close();
		mCurTimeMillis = System.currentTimeMillis();
		cLogger.info("客户端接收返回报文完毕！耗时：" + (mCurTimeMillis - mOldTimeMillis)/1000.0 + "s");

		return mOutBodyBytes;
	}
}