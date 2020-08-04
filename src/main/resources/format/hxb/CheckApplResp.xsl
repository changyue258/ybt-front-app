<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java"
	exclude-result-prefixes="java">
	<xsl:include href="RespHead.xsl" />
	<xsl:include href="RespTransformValue.xsl" />
	<xsl:template match="/CheckApplResp">
		<!-- 柜面渠道 -->
		<Transaction>
		
			<!-- 添加响应头和响应信息 -->
			<xsl:apply-templates select="RespHead" />
			
			<Transaction_Body>
				<xsl:if test="RespHead[ErrCode='0000']">
					<PbSlipNumb><xsl:value-of select="RespBody/PrdList/PrdItem/Units"/></PbSlipNumb>
		    		<PiStartDate><xsl:value-of select="java:com.sinosoft.util.DateUtil.date10To8(RespBody/PrdList/PrdItem/ValiDate)"/></PiStartDate>
		    		<PiEndDate><xsl:value-of select="java:com.sinosoft.util.DateUtil.date10To8(RespBody/PrdList/PrdItem/InvaliDate)"/></PiEndDate>
		    		<BkTotAmt><xsl:value-of select="RespBody/PolItem/PremAmt"/></BkTotAmt>
		    		<BkTxAmt><xsl:value-of select="RespBody/PolItem/PayAmt"/></BkTxAmt>
		    		<PbMainExp><xsl:value-of select="RespBody/PrdList/PrdItem[IsMain='1']/PayAmt"/></PbMainExp>
		    		<xsl:variable name="temp_BkNum1" select="RespBody/PrdList/Count"/>
		    		<BkNum1><xsl:value-of select="$temp_BkNum1 - 1"/></BkNum1>
	    			<Appd_List>
			    		<xsl:if test="$temp_BkNum1 &gt; 1">
							<xsl:for-each select="RespBody/PrdList/PrdItem">
								<xsl:if test="IsMain='0'">
									<Appd_Detail>
							    		<LiAppdInsuType><xsl:value-of select="PrdId"/></LiAppdInsuType>
							    		<LiAppdInsuExp><xsl:value-of select="PayAmt"/></LiAppdInsuExp>
									</Appd_Detail>
					    		</xsl:if>
				    		</xsl:for-each>
						</xsl:if>
	    			</Appd_List>
				</xsl:if>
			</Transaction_Body>
		</Transaction>
		
	</xsl:template>
</xsl:stylesheet>