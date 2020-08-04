<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java"
	exclude-result-prefixes="java">
	<xsl:include href="RespHead.xsl" />
	<xsl:include href="RespTransformValue.xsl" />
	<xsl:template match="/CancelApplResp">
		<!-- 柜面渠道 -->
		<Transaction>
			<!-- 添加响应头和响应信息 -->
			<xsl:apply-templates select="RespHead" />
			<Transaction_Body>
				<xsl:if test="RespHead[ErrCode='0000']">
					<PbInsuType></PbInsuType>
					<PbInsuSlipNo><xsl:value-of select="RespBody/PolItem/PolNo"/></PbInsuSlipNo>
					<PbHoldName></PbHoldName>
					<LiRcgnName></LiRcgnName>
					<LiLoanValue></LiLoanValue>
					<BkAcctNo></BkAcctNo>
				</xsl:if>
			</Transaction_Body>
		</Transaction>
		
	</xsl:template>
</xsl:stylesheet>