<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">
  
    <!-- 错误码(电子渠道) -->
    <xsl:template name="transErrCodeEE">
	  	<xsl:param name="ErrCodeEE"/>
	  	<xsl:choose>
	  		<xsl:when test="$ErrCodeEE = '0000'">1</xsl:when>
	  		<xsl:otherwise>0</xsl:otherwise>
	  	</xsl:choose>
	</xsl:template>
 
 	<!-- 交费方式(电子渠道) -->
	<xsl:template name="respTransPremType">
		<xsl:param name="PremType"/>
		<xsl:choose>
			<xsl:when test="$PremType = 'Y'">1</xsl:when>
			<xsl:when test="$PremType = 'W'">5</xsl:when>
			<xsl:when test="$PremType = 'A'">7</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- 交费年期类型(电子渠道) -->
	<xsl:template name="respTransPremTermType">
		<xsl:param name="PremTermType"/>
		<xsl:choose>
			<xsl:when test="$PremTermType = 'Y'">1</xsl:when>
			<xsl:when test="$PremTermType = 'W'">5</xsl:when>
			<xsl:when test="$PremTermType = 'A'">7</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
   
</xsl:stylesheet>