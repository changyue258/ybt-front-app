<?xml version="1.0" encoding="GBK"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">

	<!--����ͷУ��START-->
	<xsl:template match="Head">
		<!--���ױ���-->
		<xsl:variable name="tTransCode" select="TransactionCode"/>
		<!--���д���-->
		<xsl:variable name="tBankCode" select="BankCode"/>
		<!--�����������-->
		<xsl:variable name="tBrNo" select="BrNo"/>
		<!--������ˮ����-->
		<xsl:variable name="tSeqNo" select="TransrNo"/>
		<!--��������-->
		<xsl:variable name="tTransDate" select="BankDate"/>
		<!-- �ǿ��ж� -->
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
	<!--����ͷУ��END-->
</xsl:stylesheet>