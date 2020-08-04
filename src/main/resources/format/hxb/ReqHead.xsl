<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">
	<xsl:template match="Transaction_Header">
		<TransCode>
			<xsl:call-template name="transCodeTem">
				<xsl:with-param name="TransCode" select="BkTxCode" />
			</xsl:call-template>
		</TransCode>
		<OrgType></OrgType>
		<OrgId>
			<xsl:call-template name="OrgId">
				<xsl:with-param name="BankCode" select="LiBankID" />
			</xsl:call-template>
		</OrgId>
		<!-- 华夏银行柜面渠道地区代码取网点代码 -->
		<BrchId></BrchId>
		<SubBrchId><xsl:value-of select="BkBrchNo" /></SubBrchId>
		<TransOperId><xsl:value-of select="BkTellerNo" /></TransOperId>
		<TransOperName/>
		<ChanNo>
			<xsl:call-template name="transChannel">
				<xsl:with-param name="Channel" select="BkChnlNo" />
			</xsl:call-template>
		</ChanNo>
		<BusDate>
			<xsl:value-of select="java:com.sinosoft.util.DateUtil.date8To10(BkPlatDate)" />
		</BusDate>
		<SeqNo>
			<xsl:value-of select="BkPlatSeqNo" />
		</SeqNo>
		<TransDate>
			<xsl:value-of select="java:com.sinosoft.util.DateUtil.date8To10(BkPlatDate)" />
		</TransDate>
		<TransTime>
			<xsl:value-of select="java:com.sinosoft.util.DateUtil.time6To8(BkPlatTime)" />
		</TransTime>
	</xsl:template>

	<!-- 委托方式（交易渠道） -->
	<xsl:template name="transChannel">
		<xsl:param name="Channel" />
		<xsl:choose>
			<xsl:when test="$Channel = '00'">C</xsl:when>
			<xsl:when test="$Channel = '1'">C</xsl:when>
			<xsl:when test="$Channel = '2'">E</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- 交易编码 -->
	<xsl:template name="transCodeTem">
		<xsl:param name="TransCode" />
		<xsl:choose>
			<xsl:when test="$TransCode = 'OPR001'">01</xsl:when>
			<xsl:when test="$TransCode = 'OPR011'">02</xsl:when>
			<xsl:when test="$TransCode = 'OPR911'">03</xsl:when>
			<xsl:when test="$TransCode = 'SPE002'">04</xsl:when>
			<xsl:when test="$TransCode = '13'">12</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- OrgId转换 -->
	<xsl:template name="OrgId">
		<xsl:param name="BankCode" />
		<xsl:choose>
			<xsl:when test="$BankCode = 'HXB'">08</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>