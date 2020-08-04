<?xml version="1.0" encoding="GBK"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">

	<xsl:include href="ReqHeadValidate.xsl" />

	<xsl:template match="/ApplyHesCancelCntrReq">
		<rules>
			<xsl:apply-templates select="ReqHead" />
			<xsl:apply-templates select="ReqBody"/>
		</rules>
	</xsl:template>


	<xsl:template match="ReqBody">

		<!--申请人信息-->
		<xsl:apply-templates select="AppItem"/>

		<!--保单项-->
		<xsl:apply-templates select="PolItem"/>

	</xsl:template>

	<!--报文体校验内容列表中具体内容校验-->
	<!-- 申请人信息 -->
	<xsl:template match="AppItem">
		<!--姓名-->
		<xsl:variable name="Name" select="CusItem/Name"/>
		
		<!-- 非空判断 -->
		<xsl:if test="string-length($Name) = 0">
			<msg>[RETCODE=5019,ERRMSG=[]]</msg>
		</xsl:if>

	</xsl:template>

	<!-- 保单项 -->
	<xsl:template match="PolItem">
		<!--保单号-->
		<xsl:variable name="PolNo" select="PolNo"/>
		<!--账号-->
		<xsl:variable name="ActNo" select="CusActItem/ActNo"/>
		
		<!-- 非空判断 -->
		<xsl:if test="string-length($PolNo) = 0">
			<msg>[RETCODE=5018,ERRMSG=[]]</msg>
		</xsl:if>
	
		<xsl:if test="string-length($ActNo) = 0">
			<msg>[RETCODE=5022,ERRMSG=[]]</msg>
		</xsl:if>


	</xsl:template>


</xsl:stylesheet>