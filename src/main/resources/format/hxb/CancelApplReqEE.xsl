<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java"
	exclude-result-prefixes="java">
	<xsl:include href="ReqHead.xsl" />
	<xsl:include href="ReqTransformValue.xsl" />
	<xsl:template match="/">
	
		<CancelApplReq>
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
				<!-- 电子渠道(上送“交易渠道”（0：柜面，1：网银，2：手机银行，3：自助终端） -->
				<ChanNo>
					<xsl:call-template name="reqTransChanNo">
						<xsl:with-param name="ChanNo" select="INSU/MAIN/PASSWORD" />
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
				<AppItem>
					<CustItem>
						<Name/>
						<IdType/>
						<IdNo/>
					</CustItem>
				</AppItem>
				<!-- wangel 保单项 开始 -->
				<PolItem>
					<PolNo><xsl:value-of select="INSU/MAIN/INSURNO" /></PolNo>
					<PayAcc></PayAcc>
					<OldSeqNo></OldSeqNo>
					<PayAmt><xsl:value-of select="INSU/MAIN/PREM" /></PayAmt>
					<PolPwd></PolPwd>
				</PolItem>
				<!-- wangel 保单项 结束 -->
			</ReqBody>
		</CancelApplReq>
		
	</xsl:template>
</xsl:stylesheet>
