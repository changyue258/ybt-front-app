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

		<!--��������Ϣ-->
		<xsl:apply-templates select="AppItem"/>

		<!--������-->
		<xsl:apply-templates select="PolItem"/>

	</xsl:template>

	<!--������У�������б��о�������У��-->
	<!-- ��������Ϣ -->
	<xsl:template match="AppItem">
		<!--����-->
		<xsl:variable name="Name" select="CusItem/Name"/>
		
		<!-- �ǿ��ж� -->
		<xsl:if test="string-length($Name) = 0">
			<msg>[RETCODE=5019,ERRMSG=[]]</msg>
		</xsl:if>

	</xsl:template>

	<!-- ������ -->
	<xsl:template match="PolItem">
		<!--������-->
		<xsl:variable name="PolNo" select="PolNo"/>
		<!--�˺�-->
		<xsl:variable name="ActNo" select="CusActItem/ActNo"/>
		
		<!-- �ǿ��ж� -->
		<xsl:if test="string-length($PolNo) = 0">
			<msg>[RETCODE=5018,ERRMSG=[]]</msg>
		</xsl:if>
	
		<xsl:if test="string-length($ActNo) = 0">
			<msg>[RETCODE=5022,ERRMSG=[]]</msg>
		</xsl:if>


	</xsl:template>


</xsl:stylesheet>