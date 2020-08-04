<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java"
	exclude-result-prefixes="java">
	<xsl:include href="ReqHead.xsl" />
	<xsl:include href="ReqTransformValue.xsl" />
	<xsl:template match="/">
		<ApplyHesCancelCntrReq>
			<ReqHead>
				<TransCode>
					<xsl:call-template name="reqTransCodeTem">
						<xsl:with-param name="TransCode" select="INSU/MAIN/FUNCTIONFLAG" />
					</xsl:call-template>
				</TransCode>
				<OrgType></OrgType>
				<OrgId>
					<xsl:call-template name="reqOrgId">
						<xsl:with-param name="BankCodeEE" select="INSU/MAIN/BANK_CODE" />
					</xsl:call-template>
				</OrgId>
				<BrchId></BrchId>
				<SubBrchId><xsl:value-of select="INSU/MAIN/BRNO" /></SubBrchId>
				<TransOperId><xsl:value-of select="INSU/MAIN/TELLERNO" /></TransOperId>
				<TransOperName/>
				<!-- 电子渠道 -->
				<ChanNo>
					<xsl:call-template name="reqTransChanNo">
						<xsl:with-param name="ChanNo" select="INSU/MAIN/TRANS_CHNLNO" />
					</xsl:call-template>
				</ChanNo>
				<BusDate>
					<xsl:value-of select="java:com.sinosoft.util.DateUtil.date8To10(INSU/MAIN/BANK_DATE)" />
				</BusDate>
				<SeqNo>
					<xsl:value-of select="INSU/MAIN/TRANSRNO" />
				</SeqNo>
				<TransDate>
					<xsl:value-of select="java:com.sinosoft.util.DateUtil.date8To10(INSU/MAIN/BANK_DATE)" />
				</TransDate>
				<TransTime></TransTime>
			</ReqHead>
			<ReqBody>
				<CurType>CNY</CurType>
				<AppItem>
					<CusItem>
						<Name><xsl:value-of select="INSU/MAIN/TBR_NAME" /></Name>
						<IdType/>
						<IdNo/>
					</CusItem>
				</AppItem>
				<!-- wangel 保单项 开始 -->
				<PolItem>
					<PolNo><xsl:value-of select="INSU/MAIN/INSURNO" /></PolNo>
					<PolPwd/>
					<OldSqlNo/>
					<CusActItem>
						<ActNo><xsl:value-of select="INSU/MAIN/PAYACC" /></ActNo>
						<ActName/>
						<IdType/>
						<IdNo/>
					</CusActItem>
					<PayAmt><xsl:value-of select="INSU/MAIN/PREM" /></PayAmt>
					<SurrenderReson/>
				</PolItem>
				<!-- wangel 保单项 结束 -->
			</ReqBody>
		</ApplyHesCancelCntrReq>
	</xsl:template>
</xsl:stylesheet>
