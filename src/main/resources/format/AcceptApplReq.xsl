<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java"
	exclude-result-prefixes="java">
	<xsl:include href="ReqHead.xsl" />
	<xsl:include href="ReqTransformValue.xsl" />
	<xsl:template match="/Transaction">
		<!-- 柜面渠道 -->
		<AcceptApplReq>
			<ReqHead>
				<xsl:apply-templates select="Transaction_Header"/>
			</ReqHead>
			<ReqBody>
				<CurType>CNY</CurType>
				<AppItem>
					<CusItem>
						<Name/>
						<IdType />
						<IdNo />
					</CusItem>
				</AppItem>
				<!-- wangel 保单项 开始 -->
				<PolItem>
					<OldSeqNo><xsl:value-of select="Transaction_Body/BkOthOldSeq" /></OldSeqNo>
					<ApplyNo></ApplyNo>
					<DocNo></DocNo>
					<PolMode />
					<PayAmt></PayAmt>
					<PremAmt/>
					<CovAmt />
					<PayMode />
					<PolPwd />
					<CusActItem>
						<ActNo></ActNo>
						<ActName/>
						<IdType />
						<IdNo />
					</CusActItem>
				</PolItem>
				<!-- wangel 保单项 结束 -->
			</ReqBody>
		</AcceptApplReq>
		
	</xsl:template>
</xsl:stylesheet>
