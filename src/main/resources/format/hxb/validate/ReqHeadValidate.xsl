<?xml version="1.0" encoding="GBK"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">

	<!--报文头校验START-->
	<xsl:template match="Head">
		<!--交易编码-->
		<xsl:variable name="tTransCode" select="TransactionCode"/>
		<!--银行代码-->
		<xsl:variable name="tBankCode" select="BankCode"/>
		<!--银行网点代码-->
		<xsl:variable name="tBrNo" select="BrNo"/>
		<!--银行流水号码-->
		<xsl:variable name="tSeqNo" select="TransrNo"/>
		<!--交易日期-->
		<xsl:variable name="tTransDate" select="BankDate"/>
		<!-- 非空判断 -->
		<xsl:if test="string-length($tTransCode) = 0">
			<msg>[RETCODE=1118,ERRMSG=[]]</msg>
		</xsl:if>
		<xsl:if test="string-length($tBankCode) = 0">
			<msg>[RETCODE=1119,ERRMSG=[]]</msg>
		</xsl:if>
		<xsl:if test="string-length($tBrNo) = 0">
			<msg>[RETCODE=1121,ERRMSG=[]]</msg>
		</xsl:if>
		<xsl:if test="string-length($tSeqNo) = 0">
			<msg>[RETCODE=1122,ERRMSG=[]]</msg>
		</xsl:if>
		<xsl:if test="string-length($tTransDate) = 0">
			<msg>[RETCODE=1116,ERRMSG=[]]</msg>
		</xsl:if>
	</xsl:template>
	<!--报文头校验END-->
</xsl:stylesheet>