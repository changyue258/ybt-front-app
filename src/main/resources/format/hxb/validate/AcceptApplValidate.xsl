<?xml version="1.0" encoding="GBK"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">

	<xsl:include href="ReqHeadValidate.xsl" />

	<xsl:template match="/AcceptApplReq">
		<rules>
			<xsl:apply-templates select="ReqHead" />
			<xsl:apply-templates select="ReqBody"/>
		</rules>
	</xsl:template>


	<xsl:template match="ReqBody">

		<!--������У�������б�-->

	</xsl:template>

	<!--������У�������б��о�������У��-->


</xsl:stylesheet>