<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java"
	exclude-result-prefixes="java">
	<xsl:include href="ReqHead.xsl" />
	<xsl:include href="ReqTransformValue.xsl" />
	<xsl:template match="/Transaction">
		<PrintPolicyReq>
			<ReqHead>
				<xsl:apply-templates select="Transaction_Header"/>
			</ReqHead>
			<ReqBody>
				<AppItem>
					<CustItem>
						<Name />
						<IdType />
						<IdNo />
					</CustItem>
				</AppItem>
				<!-- wangel 保单项 开始 -->
				<PolItem>
					<ApplyNo />
					<PolMode />
					<PolNo><xsl:value-of select="Transaction_Body/PbInsuSlipNo" /></PolNo>
					<DocNo><xsl:value-of select="Transaction_Body/BkVchNo" /></DocNo>
					<OldDocNo/>
					<PolPwd/>
				</PolItem>
				<!-- wangel 保单项 结束 -->
			</ReqBody>
		</PrintPolicyReq>
	</xsl:template>
</xsl:stylesheet>
