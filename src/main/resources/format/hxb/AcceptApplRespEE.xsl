<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java"
	exclude-result-prefixes="java">
	<xsl:include href="RespHead.xsl" />
	<xsl:include href="RespTransformValue.xsl" />
	<xsl:template match="/AcceptApplResp">
		
		<!-- 电子渠道 -->
		<RETURN>
			<xsl:if test="RespHead[ErrCode='0000']">
				<MAIN>
					<POLICY><xsl:value-of select="RespBody/ApplRspPolItem/PolNo" /></POLICY>
					<!-- 电子渠道:投保单号传交易流水号 -->
					<APP/>
					<ACCEPT><xsl:value-of select="java:com.sinosoft.util.DateUtil.date10To8(RespHead/BusDate)" /></ACCEPT>
					<OKFLAG>
						<xsl:call-template name="transErrCodeEE">
							<xsl:with-param name="ErrCodeEE" select="RespHead/ErrCode" />
						</xsl:call-template>
					</OKFLAG>
					<xsl:variable name="temp_PREMC" select="RespBody/ApplRspPolItem/PayAmt"/>
					<!-- 转为大写金额 -->
					<PREMC><xsl:value-of select="java:com.sinosoft.util.NumberUtil.getChnMoney($temp_PREMC)" /></PREMC>
					<PREM><xsl:value-of select="RespBody/ApplRspPolItem/PayAmt" /></PREM>
					<VALIDATE><xsl:value-of select="RespBody/ApplRspPolItem/ValiDate" /></VALIDATE>
					<INVALIDATE><xsl:value-of select="RespBody/ApplRspPolItem/InvaliDate" /></INVALIDATE>
					<PAYDATECHN></PAYDATECHN>
					<FIRSTPAYDATE></FIRSTPAYDATE>
					<PAYSEDATECHN></PAYSEDATECHN>
					<PAYYEAR></PAYYEAR>
					<ORGAN></ORGAN>
					<ORGANCODE></ORGANCODE>
					<LOC></LOC>
					<TEL></TEL>
					<ASSUM></ASSUM>
					<ZGYNO></ZGYNO>
					<ZGYNAME></ZGYNAME>
					<REVMETHOD></REVMETHOD>
					<REVAGE></REVAGE>
					<CREDITNO></CREDITNO>
					<CREDITDATE></CREDITDATE>
					<CREDITENDDATE></CREDITENDDATE>
					<CREDITSUM></CREDITSUM>
					<REMARK1></REMARK1>
					<REMARK2></REMARK2>
					<REMARK3></REMARK3>
					<REMARK4></REMARK4>
					<REMARK5></REMARK5>
				</MAIN>
				<TBR>
					<TBR_NAME></TBR_NAME>
					<TBR_SEX></TBR_SEX>
					<TBR_BIRTH></TBR_BIRTH>
					<TBR_IDTYPE></TBR_IDTYPE>
					<TBR_IDNO></TBR_IDNO>
					<TBR_IDEFFSTARTDATE></TBR_IDEFFSTARTDATE>
					<TBR_IDEFFENDDATE></TBR_IDEFFENDDATE>
					<TBR_ADDR></TBR_ADDR>
					<TBR_POSTCODE></TBR_POSTCODE>
					<TBR_TEL></TBR_TEL>
					<TBR_MOBILE></TBR_MOBILE>
					<TBR_EMAIL></TBR_EMAIL>
					<TBR_BBR_RELA></TBR_BBR_RELA>
					<TBR_OCCUTYPE></TBR_OCCUTYPE>
					<TBR_NATIVEPLACE></TBR_NATIVEPLACE>
					<TBR_REMARK1></TBR_REMARK1>
					<TBR_REMARK2></TBR_REMARK2>
					<TBR_REMARK3></TBR_REMARK3>
					<TBR_REMARK4></TBR_REMARK4>
					<TBR_REMARK5></TBR_REMARK5>
				</TBR>
				<!-- 循环项 -->
				<TBR_TELLERS>
					<TBR_TELLER>
						<TELLER_VER />
						<TELLER_CODE />
						<TELLER_CONT />
						<TELLER_REMARK />
					</TBR_TELLER>
				</TBR_TELLERS>
				<BBR>
					<BBR_NAME></BBR_NAME>
					<BBR_SEX></BBR_SEX>
					<BBR_BIRTH></BBR_BIRTH>
					<BBR_IDTYPE></BBR_IDTYPE>
					<BBR_IDNO></BBR_IDNO>
					<BBR_IDEFFSTARTDATE />
					<BBR_IDEFFENDDATE></BBR_IDEFFENDDATE>
					<BBR_ADDR></BBR_ADDR>
					<BBR_POSTCODE></BBR_POSTCODE>
					<BBR_TEL></BBR_TEL>
					<BBR_MOBILE></BBR_MOBILE>
					<BBR_EMAIL></BBR_EMAIL>
					<BBR_OCCUTYPE></BBR_OCCUTYPE>
					<BBR_AGE></BBR_AGE>
					<BBR_NATIVEPLACE></BBR_NATIVEPLACE>
					<BBR_REMARK1></BBR_REMARK1>
					<BBR_REMARK2 />
					<BBR_REMARK3 />
					<BBR_REMARK4 />
					<BBR_REMARK5 />
				</BBR>
				<!-- 循环项 -->
				<BBR_TELLERS>
					<BBR_TELLER>
						<TELLER_VER />
						<TELLER_CODE />
						<TELLER_CONT />
						<TELLER_REMARK />
					</BBR_TELLER>
				</BBR_TELLERS>
				<SYRS>
					<!-- 循环项 -->
					<SYR>
						<SYR_NAME></SYR_NAME>
						<SYR_SEX></SYR_SEX>
						<SYR_PCT></SYR_PCT>
						<SYR_BBR_RELA></SYR_BBR_RELA>
						<SYR_BIRTH></SYR_BIRTH>
						<SYR_IDTYPE></SYR_IDTYPE>
						<SYR_IDNO></SYR_IDNO>
						<SYR_IDEFFSTARTDATE></SYR_IDEFFSTARTDATE>
						<SYR_IDEFFENDDATE></SYR_IDEFFENDDATE>
						<SYR_NATIVEPLACE></SYR_NATIVEPLACE>
						<SYR_ORDER></SYR_ORDER>
						<SYR_REMARK1></SYR_REMARK1>
						<SYR_REMARK2></SYR_REMARK2>
						<SYR_REMARK3></SYR_REMARK3>
						<SYR_REMARK4></SYR_REMARK4>
						<SYR_REMARK5></SYR_REMARK5>
					</SYR>
				</SYRS>
				<PTS>
					<xsl:variable name="mainPrdId" select="RespBody/PrdRetList/PrdItemRet/PrdItem[IsMain='1']/PrdId" />
					<!-- 循环项 -->
					<xsl:for-each select="RespBody/PrdRetList/PrdItemRet">
						<PT>
							<PAYENDDATE><xsl:value-of select="java:com.sinosoft.util.DateUtil.date10To8(PrdItem/ExtItem/Ext010)" /></PAYENDDATE>
							<UNIT><xsl:value-of select="PrdItem/Units" /></UNIT>
							<AMT><xsl:value-of select="PrdItem/CovAmt" /></AMT>
							<PREM><xsl:value-of select="PrdItem/PayAmt" /></PREM>
							<ID><xsl:value-of select="PrdItem/PrdId" /></ID>
							<!-- TODO -->
							<MAINID><xsl:value-of select="$mainPrdId" /></MAINID>
							<NAME></NAME>
							<PERIOD></PERIOD>
							<COVERAGE_YEAR><xsl:value-of select="PrdItem/CovTerm" /></COVERAGE_YEAR>
							<COVERAGE_YEAR_DESC><xsl:value-of select="PrdItem/CovTerm" /></COVERAGE_YEAR_DESC>
							<PAYMETHOD>
								<xsl:call-template name="respTransPremType">
									<xsl:with-param name="PremType" select="PrdItem/PremType" />
								</xsl:call-template>
							</PAYMETHOD>
							<CHARGE_PERIOD>
								<xsl:call-template name="respTransPremTermType">
									<xsl:with-param name="PremTermType" select="PrdItem/PremTermType" />
								</xsl:call-template>
							</CHARGE_PERIOD>
							<CHARGE_YEAR><xsl:value-of select="PrdItem/PremTerm" /></CHARGE_YEAR>
							<PAYTODATE></PAYTODATE>
							<MULTIYEARFLAG></MULTIYEARFLAG>
							<YEARTYPE></YEARTYPE>
							<MULTIYEARS></MULTIYEARS>
							<PT_REMARK1></PT_REMARK1>
							<PT_REMARK2></PT_REMARK2>
							<PT_REMARK3></PT_REMARK3>
							<PT_REMARK4></PT_REMARK4>
							<PT_REMARK5></PT_REMARK5>
							<VT>
								<VTICOUNT>0</VTICOUNT>
								<FIRST_RETPCT></FIRST_RETPCT>
								<SECOND_RETPCT></SECOND_RETPCT>
								<!-- 循环项 -->
								<VTI>
									<LIVE></LIVE>
									<ILL></ILL>
									<YEAR></YEAR>
									<END></END>
									<CASH></CASH>
									<ACI></ACI>
								</VTI>
							</VT>
							<CONP>
								<CONICOUNT>0</CONICOUNT>
								<!-- 循环项 -->
								<CONI>
									<END></END>
									<CON></CON>
								</CONI>
							</CONP>
						</PT>
					</xsl:for-each>
				</PTS>
				<FILE_COUNT>0</FILE_COUNT>
				<FILE_REMARK></FILE_REMARK>
				<FILE_TEMP></FILE_TEMP>
				<!-- 循环项 -->
				<FILE_LIST>
					<FILE_PAGE></FILE_PAGE>
					<FILE_NAME></FILE_NAME>
					<FILE_REMARK></FILE_REMARK>
					<FILE_TEMP></FILE_TEMP>
					<!-- 循环项 -->
					<PAGE_LIST>
						<DETAIL_COUNT></DETAIL_COUNT>
						<DETAIL_REMARK></DETAIL_REMARK>
						<DETAIL_TEMP></DETAIL_TEMP>
						<!-- 循环项 -->
						<Detail>
							<BKDETAIL></BKDETAIL>
							<BKDETAIL></BKDETAIL>
						</Detail>
					</PAGE_LIST>
				</FILE_LIST>
				<SPEC_CONTENT>
					<CONTENT></CONTENT>
					<CONTENT></CONTENT>
					<CONTENT></CONTENT>
				</SPEC_CONTENT>
			</xsl:if>
			<xsl:if test="RespHead[ErrCode !='0000']">
				<MAIN>
					<!-- 电子渠道:投保单号传交易流水号 -->
					<APP/>
					<OKFLAG>
						<xsl:call-template name="transErrCodeEE">
							<xsl:with-param name="ErrCodeEE" select="RespHead/ErrCode" />
						</xsl:call-template>
					</OKFLAG>
					<FAILDETAIL><xsl:value-of select="RespHead/ErrMsg"/></FAILDETAIL>
				</MAIN>
			</xsl:if>
		</RETURN>
	</xsl:template>
</xsl:stylesheet>