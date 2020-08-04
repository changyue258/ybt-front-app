/**
 * @Package com.sinosoft.util
 * @version V1.0
 */
package com.sinosoft.agency.tools;

import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * @ClassName StringUtils2
 * @Description: 字符串工具类
 * @author cheng
 * @date 2018年12月10日 下午7:46:51
 *
 */
public class StringUtils2
{
	protected static final Logger LOG = LogManager.getLogger();
	
	/**
	 * 
	 * @Title: isChinese
	 * @Description: 判断是否汉字
	 * @param str
	 * @return
	 */
	public static boolean isChinese(char sChar)
	{
		String regEx = "[\u4e00-\u9fa5]";

		Pattern pat = Pattern.compile(regEx);

		Matcher matcher = pat.matcher(Character.toString(sChar));

		boolean reulst = false;

		if (matcher.find())
		{
			reulst = true;
		}

		return reulst;
	}

	/**
	 * 
	 * @Title: calChineseCharLen
	 * @Description: 计算汉字长度
	 * @param sStr
	 * @return
	 */
	public static int calChineseCharLen(String sStr)
	{
		int len = 0;

		if (StringUtils.isBlank(sStr))
		{
			return len;
		}

		char[] arr = sStr.toCharArray();

		for (char tChar : arr)
		{
			if (isChinese(tChar))
			{
				len++;
			}
		}

		return len;
	}

	/**
	 * 将半角转换成全角字符
	 * 
	 * @param value
	 * @return
	 */
	public static String half2Full(String value)
	{
		if (StringUtils.isBlank(value))
		{
			return "";
		}
		char[] cha = value.toCharArray();
		for (int i = 0; i < cha.length; i++)
		{
			if (cha[i] == 32)
			{
				cha[i] = (char) 12288;
			}
			else if (cha[i] < 127)
			{
				cha[i] = (char) (cha[i] + 65248);
			}
		}
		return new String(cha);
	}

	/**
	 * 将全角转换成半角字符
	 * 
	 * @param
	 * @return
	 */
	public static String full2Half(String src)
	{
		if (StringUtils.isBlank(src))
		{
			return "";
		}
		StringBuilder buf = new StringBuilder(src.length());
		char[] ca = src.toCharArray();
		for (int i = 0; i < src.length(); i++)
		{

			if (ca[i] >= (char) 65281 && ca[i] <= (char) 65375)
			{//如果位于全角区间内

				buf.append((char) (ca[i] - 65248));

			}
			else if (ca[i] == (char) 12288)
			{

				buf.append((char) ' ');

			}
			else
			{
				buf.append(ca[i]);
			}

		}

		return buf.toString();
	}
	
	/**
	 * 
	 * @Title: fileRightWithFullAngleSpace
	 * @Description: 右填充全角空格
	 * @param srcStr 源字符串
	 * @param len 填充到指定长度
	 * @return
	 */
	public static String fileRightWithFullAngleSpace(String srcStr, int len)
	{
		return fileWithFullAngleSpace(srcStr, len, false); 
	}
	
	/**
	 * 
	 * @Title: fileWithFullAngleSpace
	 * @Description: 将源字符串填充全解空格到指定长度
	 * @param srcStr 源字符串
	 * @param len 填充到指定长度
	 * @param leftAdd 填充方向：true-左填充，false-右填充
	 * @return
	 */
	public static String fileWithFullAngleSpace(String srcStr, int len, boolean leftAdd)
	{
		if (srcStr == null)
		{
			return srcStr;
		}

		//字符串长度
		int length = srcStr.length();

		int length2 = 0;

		try
		{
			//非全角字符或者汉字的字符个数
			int num = 0;

			//判断非全角字符或者汉字的字符个数
			for (char tChar : srcStr.toCharArray())
			{
				String temp = Character.toString(tChar);

				if (temp.getBytes("GBK").length == 1)
				{
					num++;
				}
			}

			//计算实际占位宽度：非全解或者汉字取2的模
			length2 = length - num / 2;
		}
		catch (UnsupportedEncodingException e)
		{
			LOG.error("不支持的字符串类型", e);
			
			return srcStr;
		}

		//填充的全角空格
		String fillStr = "　";

		//填充后的新字符串
		StringBuilder strBuilder = new StringBuilder();

		if (leftAdd)
		{
			for (int i = length2; i < len; i++)
			{
				strBuilder.append(fillStr);
			}
			strBuilder.append(srcStr);
		}
		else
		{
			strBuilder.append(srcStr);
			for (int i = length2; i < len; i++)
			{
				strBuilder.append(fillStr);
			}
		}
		return strBuilder.toString();

	}


	public static String fileWithSpaceForCash(String str,int len,boolean leftAdd){

		//判断年度或者现价长度
		int strLen  = str.length();

		String fillStr = "　";

		StringBuilder stringBuilder = new StringBuilder();

		if (leftAdd) {
			if (strLen % 2 == 0) {

				for (int i = strLen/2; i < len; i++) {
					stringBuilder.append(fillStr);
				}
				stringBuilder.append(str);
			}else {
				str = str + " ";

				for (int i = strLen/2+1;i<len;i++){

					stringBuilder.append(fillStr);
				}
				stringBuilder.append(str);

			}

		}else {

			if (strLen % 2 == 0) {

				stringBuilder.append(str);

				for (int i = strLen/2; i < len; i++) {
					stringBuilder.append(fillStr);
				}

			}else {

				str = str + " ";

				stringBuilder.append(str);

				for (int i = strLen/2+1;i<len;i++){

					stringBuilder.append(fillStr);
				}

			}

		}

		return stringBuilder.toString();
	}
}
