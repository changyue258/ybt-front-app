<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java"
	exclude-result-prefixes="java">
	<xsl:include href="RespHead.xsl" />
	<xsl:include href="RespTransformValue.xsl" />
	<xsl:template match="/PrintPolicyResp">
		<!-- 柜面渠道 -->
		<Transaction>
		
			<!-- 添加响应头和响应信息 -->
			<xsl:apply-templates select="RespHead" />
			
			<Transaction_Body>
				<xsl:if test="RespHead[ErrCode='0000']">
					<PbInsuType><xsl:value-of select="RespBody/PrdRetList/PrdItemRet/PrdItem[IsMain='1']/PrdId" /></PbInsuType>
					<PiEndDate><xsl:value-of select="java:com.sinosoft.util.DateUtil.date10To8(RespBody/ApplRspPolItem/InvaliDate)" /></PiEndDate>
					<PbFinishDate></PbFinishDate>
					<LiDrawString></LiDrawString>
					<LiCashValueCount>0</LiCashValueCount>
					<Cash_List />
					<LiBonusValueCount>0</LiBonusValueCount>
					<Bonus></Bonus>
					<Bonus_List />
					<PbInsuSlipNo><xsl:value-of select="RespBody/ApplRspPolItem/PolNo" /></PbInsuSlipNo>
					<BkTotAmt><xsl:value-of select="RespBody/ApplRspPolItem/PayAmt" /></BkTotAmt>
					<LiSureRate></LiSureRate>
					<PbBrokId></PbBrokId>
					<LiBrokName></LiBrokName>
					<LiBrokGroupNo></LiBrokGroupNo>
					<BkOthName></BkOthName>
					<BkOthAddr></BkOthAddr>
					<PiCpicZipcode></PiCpicZipcode>
					<PiCpicTelno></PiCpicTelno>
					<BkFileNum><xsl:value-of select="RespBody/PrtList/PrtItem/Count" /></BkFileNum>
					
					<!-- 保单 -->
					<Detail_List>
						<BkFileDesc>请插入保单打印</BkFileDesc>
						<BkType1>3</BkType1>
						<BkVchNo><xsl:value-of select="RespBody/ApplRspPolItem/DocNo" /></BkVchNo>
						<BkRecNum><xsl:value-of select="RespBody/PrtList/PrtItem/PageItem[PageId='1']/Count" /></BkRecNum>
						<!-- 循环项 -->
							<Detail>
								<xsl:for-each select="RespBody/PrtList/PrtItem/PageItem[PageId='1']/RowDetails/RowText">
									<BkDetail1><xsl:value-of select="." /></BkDetail1>
								</xsl:for-each>
							</Detail>
					</Detail_List>
					<xsl:if test="RespBody/PrtList/PrtItem/PageItem[PageId='2']">
						<!-- 现价 -->
						<Detail_List>
							<BkFileDesc>请插入保单打印现金价值表</BkFileDesc>
							<BkType1>4</BkType1>
							<BkVchNo><xsl:value-of select="RespBody/ApplRspPolItem/DocNo" /></BkVchNo>
							<BkRecNum><xsl:value-of select="RespBody/PrtList/PrtItem/PageItem[PageId='2']/Count" /></BkRecNum>
							<!-- 循环项 -->
								<Detail>
									<xsl:for-each select="RespBody/PrtList/PrtItem/PageItem[PageId='2']/RowDetails/RowText">
										<BkDetail1><xsl:value-of select="." /></BkDetail1>
									</xsl:for-each>
								</Detail>
						</Detail_List>
					</xsl:if>
					<!-- 投保单 -->
					<Detail_List>
						<BkFileDesc>请插入投保单打印</BkFileDesc>
						<BkType1>1</BkType1>
						<BkVchNo><xsl:value-of select="RespBody/ApplRspPolItem/DocNo" /></BkVchNo>
						<BkRecNum><xsl:value-of select="RespBody/PrtList/PrtItem/PageItem[PageId='3']/Count" /></BkRecNum>
						<!-- 循环项 -->
							<Detail>
								<xsl:for-each select="RespBody/PrtList/PrtItem/PageItem[PageId='3']/RowDetails/RowText">
									<BkDetail1><xsl:value-of select="." /></BkDetail1>
								</xsl:for-each>
							</Detail>
					</Detail_List>
				</xsl:if>
			</Transaction_Body>
		</Transaction>
		
	</xsl:template>
</xsl:stylesheet>

