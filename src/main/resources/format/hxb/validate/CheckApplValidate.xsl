<?xml version="1.0" encoding="GBK"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">

	<xsl:include href="ReqHeadValidate.xsl" />

	<xsl:template match="/TranData">
		<rules>
			<xsl:apply-templates select="Head" />
			<xsl:apply-templates select="Body"/>
		</rules>
	</xsl:template>

	<!--交易渠道-->
	<xsl:variable name="tChanNo" select="/TranData/Body/LCCont/SellType"/>

	<xsl:template match="Body">

		<!--投保人-->
		<xsl:apply-templates select="LCCont/LCAppnt"/>
		<!--被保人-->
		<xsl:apply-templates select="LCCont/LCInsureds"/>
		<!--受益人-->
		<xsl:apply-templates select="LCCont/LCBnfs"/>
		<!--保单项-->
		<xsl:apply-templates select="PolItem"/>

	</xsl:template>

	<!-- 投保人 -->
	<xsl:template match="LCAppnt">
		<!--投保人姓名-->
		<xsl:variable name="tName" select="CustItem/Name"/>
		<!--投保人地址不能为空，且不能少于8个汉字-->
		<xsl:variable name="tAddrDetail" select="CustItem/AddrItem/AddrDetail"/>
		<!--投保人邮政编码，不能为空且长度必须为6位，且必须为数字-->
		<xsl:variable name="tPost" select="CustItem/AddrItem/Post"/>
		<!--投保人固话非空时：其长度必须为6-12位，均不得有非数字字符-->
		<xsl:variable name="tPhone" select="CustItem/PhoneItem/Phone"/>
		<!--投保人证件类型不能为空-->
		<xsl:variable name="tIdType" select="CustItem/IdType"/>
		<!--投保人移动电话不能为空，长度必须为11位，以1开头,必须全为数字-->
		<xsl:variable name="tMobile" select="CustItem/MobileItem/Mobile"/>
		<!--投保人电子邮件-->
		<xsl:variable name="tEmail" select="CustItem/EmailItem/Email"/>
		<!--年收入-->
		<xsl:variable name="tYearIncome" select="YearIncome"/>

		<!-- 非空判断 -->
		<xsl:if test="string-length($tName) = 0">
			<msg>[RETCODE=3021,ERRMSG=[]]</msg>
		</xsl:if>
		<xsl:if test="java:com.sinosoft.tools.DataCheck.checkNameLength($tName) != 'true'">
			<msg>[RETCODE=3015,ERRMSG=[]]</msg>
		</xsl:if>
		<xsl:if test="string-length($tAddrDetail) = 0">
			<msg>[RETCODE=3022,ERRMSG=[]]</msg>
		</xsl:if>
		<xsl:if test="java:com.sinosoft.tools.DataCheck.checkAddrDetail($tAddrDetail, 12, 15) != 'true'">
			<msg>[RETCODE=3016,ERRMSG=[{'12'},{'15'}]]</msg>
		</xsl:if>
		<xsl:if test="string-length($tPost) = 0">
			<msg>[RETCODE=3023,ERRMSG=[]]</msg>
		</xsl:if>
		<xsl:if test="java:com.sinosoft.tools.DataCheck.checkPost($tPost) != 'true'">
			<msg>[RETCODE=3017,ERRMSG=[]]</msg>
		</xsl:if>
		<xsl:if test="string-length($tPhone) != 0">
			<xsl:if test="java:com.sinosoft.tools.DataCheck.checkPhone($tPhone) != 'true'">
				<msg>[RETCODE=3018,ERRMSG=[]]</msg>
			</xsl:if>
		</xsl:if>
		
		<xsl:if test="string-length($tIdType) = 0">
			<msg>[RETCODE=3019,ERRMSG=[]]</msg>
		</xsl:if>

		<xsl:choose>
			<xsl:when test="string-length($tMobile) = 0">
				<msg>[RETCODE=3025,ERRMSG=[]]</msg>
			</xsl:when>
			<xsl:when test="java:com.sinosoft.tools.DataCheck.checkMobile($tMobile) != 'true'">
				<msg>[RETCODE=3020,ERRMSG=[]]</msg>
			</xsl:when>
		</xsl:choose>

		<xsl:if test="$tChanNo != 'C'">
			<!-- 非空判断 -->
			<xsl:if test="string-length($tEmail) = 0">
				<msg>[RETCODE=3026,ERRMSG=[]]</msg>
			</xsl:if>
		</xsl:if>

		<xsl:if test="string-length($tYearIncome) = 0">
			<msg>[RETCODE=3027,ERRMSG=[]]</msg>
		</xsl:if>


	</xsl:template>

	<!-- 被保人 -->
	<xsl:template match="InsList">
	
		<!-- 华夏银行电子渠道被保人项不校验 -->
		<xsl:if test="$tChanNo = 'C'">
			<!--被保人姓名-->
			<xsl:variable name="bName" select="InsItem/CustItem/Name"/>
			<!--被保人地址不能为空，且要大于6个汉字-->
			<xsl:variable name="bAddrDetail" select="InsItem/CustItem/AddrItem/AddrDetail"/>
			<!--投被保人关系不能为空-->
			<xsl:variable name="bAppRela" select="InsItem/AppRela"/>
			<!--被保人邮政编码，不能为空，且长度必须为6位，且必须为数字-->
			<xsl:variable name="bPost" select="InsItem/CustItem/AddrItem/Post"/>
			<!--被保人固话非空时：其长度不得小于6位，均不得有非数字字符-->
			<xsl:variable name="bPhone" select="InsItem/CustItem/PhoneItem/Phone"/>
			<!--投保人证件类型不能为空-->
			<xsl:variable name="bIdType" select="InsItem/CustItem/IdType"/>
			<!--被保人移动电话不能为空，长度必须为11位，以1开头,必须全为数字-->
			<xsl:variable name="bMobile" select="InsItem/CustItem/MobileItem/Mobile"/>
			<!--被保人性别-->
			<xsl:variable name="bSex" select="InsItem/CustItem/Sex"/>
	
	
	
			<!-- 非空判断 -->
			<xsl:if test="string-length($bName) = 0">
				<msg>[RETCODE=4021,ERRMSG=[]]</msg>
			</xsl:if>
			<xsl:if test="java:com.sinosoft.tools.DataCheck.checkNameLength($bName) != 'true'">
				<msg>[RETCODE=4026,ERRMSG=[]]</msg>
			</xsl:if>
			<xsl:if test="string-length($bAddrDetail) = 0 ">
				<msg>[RETCODE=4022,ERRMSG=[]]</msg>
			</xsl:if>
			<xsl:if test="java:com.sinosoft.tools.DataCheck.checkAddrDetail($bAddrDetail, 12, 15) != 'true'">
				<msg>[RETCODE=4015,ERRMSG=[{'12'},{'15'}]]</msg>
			</xsl:if>
			<xsl:if test="string-length($bPost) = 0 ">
				<msg>[RETCODE=4023,ERRMSG=[]]</msg>
			</xsl:if>
			<xsl:if test="java:com.sinosoft.tools.DataCheck.checkPost($bPost) !='true'">
				<msg>[RETCODE=4016,ERRMSG=[]]</msg>
			</xsl:if>
	
			<xsl:if test="string-length($bAppRela) = 0">
				<msg>[RETCODE=4020,ERRMSG=[]]</msg>
			</xsl:if>
			
			<xsl:if test="string-length($bPhone) != 0">
				<xsl:if test="java:com.sinosoft.tools.DataCheck.checkPhone($bPhone) != 'true'">
					<msg>[RETCODE=4017,ERRMSG=[]]</msg>
				</xsl:if>
			</xsl:if>
	
			<xsl:if test="string-length($bIdType) = 0">
				<msg>[RETCODE=4018,ERRMSG=[]]</msg>
			</xsl:if>
	
			<xsl:choose>
				<xsl:when test="string-length($bMobile) = 0">
					<msg>[RETCODE=4025,ERRMSG=[]]</msg>
				</xsl:when>
				<xsl:when test="java:com.sinosoft.tools.DataCheck.checkMobile($bMobile) != 'true'">
					<msg>[RETCODE=4019,ERRMSG=[]]</msg>
				</xsl:when>
			</xsl:choose>
	
			<xsl:choose>
				<xsl:when test="string-length($bSex) = 0">
					<msg>[RETCODE=4027,ERRMSG=[]]</msg>
				</xsl:when>
				<!--<xsl:when test="$bSex != '0' or $bSex != '1'">
					<msg>[RETCODE=4028,ERRMSG=[]]</msg>
				</xsl:when>-->
				<xsl:when test="not($bSex = '0' or $bSex = '1')">
					<msg>[RETCODE=4027,ERRMSG=[]]</msg>
				</xsl:when>
			</xsl:choose>

		</xsl:if>

	</xsl:template>


	<!-- 受益人 -->
	<xsl:template match="InsList/InsItem/BnfList">

		<!-- 华夏银行电子渠道受益人项不校验 -->
		<xsl:if test="$tChanNo = 'C'">
			<xsl:if test="Count !='0'">
				<xsl:for-each select="BnfItem">
	
				<!--受益人姓名不能为空，必须大于等于三个字符-->
				<xsl:variable name="sName" select="CustItem/Name"/>
				<!--受益人生日不能为空-->
				<xsl:variable name="sBirthday" select="CustItem/Birthday"/>
				<!--受益人与被保人关系不能为空-->
				<xsl:variable name="sInsRela" select="InsRela"/>
				<!--受益人证件类型不能为空-->
				<xsl:variable name="sIdType" select="CustItem/IdType"/>
				<!--受益人受益顺序不能为空-->
				<xsl:variable name="sBnfOrder" select="BnfOrder"/>
	
				<!-- 非空判断 -->
				<xsl:if test="string-length($sName) = 0 ">
					<msg>[RETCODE=5017,ERRMSG=[]]</msg>
				</xsl:if>
				<xsl:if test="java:com.sinosoft.tools.DataCheck.checkNameLength($sName) != 'true'">
					<msg>[RETCODE=5065,ERRMSG=[]]</msg>
				</xsl:if>
				<xsl:if test="string-length($sBirthday) = 0 ">
					<msg>[RETCODE=5066,ERRMSG=[]]</msg>
				</xsl:if>
				<xsl:if test="string-length($sInsRela) = 0 ">
					<msg>[RETCODE=5014,ERRMSG=[]]</msg>
				</xsl:if>
				<xsl:if test="string-length($sIdType) = 0">
					<msg>[RETCODE=5015,ERRMSG=[]]</msg>
				</xsl:if>
				<xsl:if test="string-length($sBnfOrder) = 0">
					<msg>[RETCODE=5016,ERRMSG=[]]</msg>
				</xsl:if>
	
				</xsl:for-each>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	
	<!-- 保单项 -->
	<xsl:template match="PolItem">
	
		<!--客户账户项 账号-->
		<xsl:variable name="pActNo" select="CusActItem/ActNo"/>
		
		<!-- 客户账户项 账号 非空判断 -->
		<xsl:if test="string-length($pActNo) = 0">
		
			<msg>[RETCODE=5071,ERRMSG=[]]</msg>
			
		</xsl:if>
		
	</xsl:template>
	
</xsl:stylesheet>