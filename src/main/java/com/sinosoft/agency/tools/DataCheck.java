package com.sinosoft.agency.tools;/**
							* Created by administrator on 2018/10/11.
							*/

import org.apache.commons.lang3.StringUtils;


import java.io.UnsupportedEncodingException;
import java.util.regex.Pattern;

/**
 * @author yt
 * @ClassName DataCheck
 * @Description: 核保前置机校验规则内容
 * @date 2018/10/11
 */
public class DataCheck
{

	/**
	 * @Title: checkPost
	 * @Description: 长度必须为6位，且必须为数字
	 * @param post
	 *            邮政编码
	 */
	public static String checkPost(String post)
	{

		//编写正则
		String regEx = "^\\d{6}$";//n位的数字

		return isResult(post, regEx);

	}

	/**
	 * @Title: checkPhone
	 * @Description: 长度必须为6-12位，均不得有非数字字符
	 * @param phone
	 *            固话
	 */
	public static String checkPhone(String phone)
	{

		//编写正则
		String regEx = "^\\d{6,12}$";//m-n位的数字

		return isResult(phone, regEx);
	}

	/**
	 * @Title: checkMobile
	 * @Description: 长度必须为11位，以1开头,必须全为数字
	 * @param mobile
	 *            移动电话
	 */
	public static String checkMobile(String mobile)
	{

		//编写正则
		String regEx = "^1\\d{10}$";//以1开头,11位数字

		return isResult(mobile, regEx);
	}

	/**
	 * @Title: checkBnfOrder
	 * @Description: 是否为纯数字
	 * @param bnfOrder
	 *            受益顺序
	 */
	public static String checkBnfOrder(String bnfOrder)
	{

		//编写正则
		String regEx = "^\\d{1,}$";//至少一位及以上纯数字

		return isResult(bnfOrder, regEx);
	}

	/**
	 * @Title:
	 * @Description: 正则表达式校验
	 * @param str
	 *            验证字符串
	 * @param regEx
	 *            正则表达式 return boolean
	 */
	private static String isResult(String str, String regEx)
	{

		String result = "false";

		//去空格一下
		String prtStr = StringUtils.trimToEmpty(str);

		//Pattern是一个正则表达式经编译后的表现模式
		Pattern p = Pattern.compile(regEx);

		// 一个Matcher对象是一个状态机器，它依据Pattern对象做为匹配模式对字符串展开匹配检查。
		if (p.matcher(prtStr).matches() == true)
		{
			result = "true";
		}
		else
		{
			result = "false";
		}
		return result;
	}

	/**
	 * 
	 * @Title: checkAddrDetail
	 * @Description: 校验地址长度
	 * @param str 地址信息
	 * @param cityLen 直辖市地址长度
	 * @param provLen 省地址长度
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String checkAddrDetail(String str, int cityLen, int provLen) throws UnsupportedEncodingException
	{

		String result = "false";

		if (str.length() < 2)
		{
			return result;
		}
		
		
		String tStr = str.trim().substring(0, 2);
		
		int length = StringUtils2.calChineseCharLen(str);
		
		if ("北京".equals(tStr) || "重庆".equals(tStr) || "天津".equals(tStr) || "上海".equals(tStr))
		{
					
			if (length >= cityLen)
			{
				result = "true";
			}
			else
			{
				result = "false";
			}
		}
		else
		{
			if (length >= provLen)
			{
				result = "true";
			}
			else
			{
				result = "false";
			}
		}
		
		return result;
	}

	/**
	 * @Title: checkNameLength
	 * @Description: 必须大于等于三个字符
	 * @param str
	 *            姓名
	 */

	public static String checkNameLength(String str) throws UnsupportedEncodingException
	{

		String result = "false";

		char[] arr = str.toCharArray();
		
		int len = 0;
		
		//循环判断长度
		for(char tChar : arr)
		{
			//中文算2个长度
			if(StringUtils2.isChinese(tChar))
			{
				len = len + 2;
			}
			else
			{
				len = len + 1;
			}
		}
		
		if (len >= 3)
		{
			result = "true";
		}
		else
		{
			result = "false";
		}

		return result;
	}

}
