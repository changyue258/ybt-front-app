<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">
	<xsl:template match="RespHead">
		<Transaction_Header>
		    <LiBankID><xsl:value-of select="OrgId"/></LiBankID>
		    <PbInsuId/>
		    <BkPlatSeqNo><xsl:value-of select="SeqNo"/></BkPlatSeqNo>
		    <BkTxCode/>
		    <BkChnlNo/>
		    <BkBrchNo><xsl:value-of select="SubBrchId"/></BkBrchNo>
		    <BkTellerNo/>
		    <BkPlatDate	><xsl:value-of select="java:com.sinosoft.util.DateUtil.date10To8(TransDate)"/></BkPlatDate>
		    <BkPlatTime><xsl:value-of select="java:com.sinosoft.util.DateUtil.time8To6(TransTime)"/></BkPlatTime>
		    <Tran_Response>
		    	<BkOthDate><xsl:value-of select="java:com.sinosoft.util.DateUtil.date10To8(TransDate)"/></BkOthDate>
		    	<BkOthSeq><xsl:value-of select="SeqNo"/></BkOthSeq>
		    	<BkOthRetCode><xsl:call-template name="transErrCode"><xsl:with-param name="ErrCode" select="ErrCode"/></xsl:call-template></BkOthRetCode>
		    	<BkOthRetMsg><xsl:value-of select="ErrMsg"/></BkOthRetMsg>
		    </Tran_Response>
	    </Transaction_Header>
	</xsl:template>
	
	<xsl:template name="transErrCode">
	  	<xsl:param name="ErrCode"/>
	  	<xsl:choose>
	  		<xsl:when test="$ErrCode = '0000'">00000</xsl:when>
	  		<xsl:otherwise>00001</xsl:otherwise>
	  	</xsl:choose>
	 </xsl:template>
	 
</xsl:stylesheet>