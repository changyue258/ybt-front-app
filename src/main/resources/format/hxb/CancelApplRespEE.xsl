<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java"
	exclude-result-prefixes="java">
	<xsl:include href="RespHead.xsl" />
	<xsl:include href="RespTransformValue.xsl" />
	<xsl:template match="/CancelApplResp">
		
		<!-- 电子渠道 -->
		<RETURN>
			<MAIN>
				<xsl:if test="RespHead[ErrCode ='0000']">
				<OKFLAG>
					<xsl:call-template name="transErrCodeEE">
						<xsl:with-param name="ErrCodeEE" select="RespHead/ErrCode" />
					</xsl:call-template>
				</OKFLAG>
				<INSURNO><xsl:value-of select="RespBody/PolItem/PolNo"/></INSURNO>
				<APPLYNO></APPLYNO>
				</xsl:if>
				<xsl:if test="RespHead[ErrCode !='0000']">
				<OKFLAG>
					<xsl:call-template name="transErrCodeEE">
						<xsl:with-param name="ErrCodeEE" select="RespHead/ErrCode" />
					</xsl:call-template>
				</OKFLAG>
				<INSURNO><xsl:value-of select="RespBody/PolItem/PolNo"/></INSURNO>
				<APPLYNO></APPLYNO>
				<FAILEDTAIL><xsl:value-of select="RespHead/ErrMsg"/></FAILEDTAIL>
				</xsl:if>
			</MAIN>
		</RETURN>
		
		
	</xsl:template>
</xsl:stylesheet>