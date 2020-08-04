<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java"
	exclude-result-prefixes="java">
	<xsl:include href="ReqHead.xsl" />
	<xsl:include href="ReqTransformValue.xsl" />
	<xsl:template match="/Transaction">
	
		<CancelApplReq>
			<ReqHead>
				<xsl:apply-templates select="Transaction_Header"/>
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
					<PolNo><xsl:value-of select="Transaction_Body/PbInsuSlipNo" /></PolNo>
					<PayAcc></PayAcc>
					<OldSeqNo><xsl:value-of select="Transaction_Body/BkOthOldSeq" /></OldSeqNo>
					<PayAmt></PayAmt>
					<PolPwd><xsl:value-of select="Transaction_Body/LiInsuSlipPWD" /></PolPwd>
				</PolItem>
				<!-- wangel 保单项 结束 -->
			</ReqBody>
		</CancelApplReq>
		
	</xsl:template>
</xsl:stylesheet>
