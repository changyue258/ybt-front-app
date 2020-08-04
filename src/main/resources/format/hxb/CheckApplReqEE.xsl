<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java"
	xmlns:sxl="http://www.w3.org/1999/XSL/Transform"
	exclude-result-prefixes="java">
	<xsl:include href="ReqHead.xsl" />
	<xsl:include href="ReqTransformValue.xsl" />
	<xsl:template match="/">
	
		<!-- 电子渠道_开始 -->
		<CheckApplReq>
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
						<xsl:with-param name="ChanNo" select="INSU/MAIN/REMARK2" />
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
				<!--币种 -->
				<CurType>CNY</CurType>
				<!--投保人项——开始 -->
				<AppItem>
					<CustItem>
						<Name><xsl:value-of select="INSU/TBR/TBR_NAME" /></Name>
						<Sex>
							<xsl:call-template name="reqTransSex">
								<xsl:with-param name="Sex" select="INSU/TBR/TBR_SEX" />
							</xsl:call-template>
						</Sex>
						<Birthday><xsl:value-of select="java:com.sinosoft.util.DateUtil.date8To10(INSU/TBR/TBR_BIRTH)" /></Birthday>
						<IdType>
							<xsl:call-template name="idTypeOldToNew">
								<xsl:with-param name="IdType" select="INSU/TBR/TBR_IDTYPE" />
							</xsl:call-template>
						</IdType>
						<IdNo><xsl:value-of select="INSU/TBR/TBR_IDNO" /></IdNo>
						<IdStartDate><xsl:value-of select="java:com.sinosoft.util.DateUtil.date8To10(INSU/TBR/TBR_IDEFFSTARTDATE)" /></IdStartDate>
						<IdEndDate><xsl:value-of select="java:com.sinosoft.util.DateUtil.date8To10(INSU/TBR/TBR_IDEFFENDDATE)" /></IdEndDate>
						<Country><xsl:value-of select="INSU/TBR/TBR_NATIVEPLACE" /></Country>
						<EduDegree />
						<MarStat/>
						<Nation />
						<Work><xsl:value-of select="INSU/TBR/TBR_OCCUTYPE" /></Work>
						<WorkType />
						<Company/>
						<InsuranceFlag/>
						<AddrItem>
							<Province/>
							<City/>
							<County/>
							<AddrDetail><xsl:value-of select="INSU/TBR/TBR_ADDR" /></AddrDetail>
							<Post><xsl:value-of select="INSU/TBR/TBR_POSTCODE" /></Post>
						</AddrItem>
						<PhoneItem>
							<Section />
							<Phone><xsl:value-of select="INSU/TBR/TBR_TEL" /></Phone>
							<Extension />
						</PhoneItem>
						<MobileItem>
							<Mobile><xsl:value-of select="INSU/TBR/TBR_MOBILE" /></Mobile>
							<IsAcpMsg />
						</MobileItem>
						<EmailItem>
							<Email><xsl:value-of select="INSU/TBR/TBR_EMAIL" /></Email>
							<IsAcpEmail />
						</EmailItem>
					</CustItem>
					<Level />
					<Stature />
					<Weight />
					<YearIncome><xsl:value-of select="INSU/TBR/TBR_REMARK1" /></YearIncome>
					<HomeYearIncome></HomeYearIncome>
					<DenizenOrigin>
						<xsl:call-template name="reqDenizenOriginEE">
							<xsl:with-param name="DenizenOriginEE" select="INSU/TBR/TBR_REMARK2" />
						</xsl:call-template>
					</DenizenOrigin>
					<BudgetAmt/>
					<TencentId />
					<IsFixedIncome/>
					<!-- 是否风险评估:0 -否； 1 -是；(投保人是否进行风险承受能力测试,银保通默认为是) -->
					<IsRiskEval>1</IsRiskEval>
					<RiskLevel />
					<RevisitPhoneSel />
					<IsSign />
					<IsSameSign />
					<DrvIdType />
					<DrvIdNo />
					<ExtItem>
						<Ext001/>
						<Ext002/>
						<Ext003/>
						<Ext004/>
						<Ext005/>
						<Ext006/>
						<Ext007/>
						<Ext008/>
						<Ext009/>
						<Ext010/>
						<Ext011/>
						<Ext012/>
						<Ext013/>
						<Ext014/>
						<Ext015/>
						<Ext016/>
						<Ext017/>
						<Ext018/>
						<Ext019/>
						<Ext020/>
					</ExtItem>
				</AppItem>
				<!--被保人列表——开始 -->
				<InsList>
					<Count>1</Count>
					<InsItem>
						<InsId>1</InsId>
						<CustItem>
							<Name><xsl:value-of select="INSU/BBR/BBR_NAME" /></Name>
							<Sex>
								<xsl:call-template name="reqTransSex">
									<xsl:with-param name="Sex" select="INSU/BBR/BBR_SEX" />
								</xsl:call-template>
							</Sex>
							<Birthday>
								<xsl:value-of select="java:com.sinosoft.util.DateUtil.date8To10(INSU/BBR/BBR_BIRTH)" />
							</Birthday>
							<IdType>
								<xsl:call-template name="idTypeOldToNew">
									<xsl:with-param name="IdType" select="INSU/BBR/BBR_IDTYPE" />
								</xsl:call-template>
							</IdType>
							<IdNo><xsl:value-of select="INSU/BBR/BBR_IDNO" /></IdNo>
							<IdStartDate><xsl:value-of select="java:com.sinosoft.util.DateUtil.date8To10(INSU/BBR/BBR_IDEFFSTARTDATE)" /></IdStartDate>
							<IdEndDate><xsl:value-of select="java:com.sinosoft.util.DateUtil.date8To10(INSU/BBR/BBR_IDEFFENDDATE)" /></IdEndDate>
							<Country><xsl:value-of select="INSU/BBR/BBR_NATIVEPLACE" /></Country>
							<EduDegree />
							<MarStat/>
							<Nation />
							<Work><xsl:value-of select="INSU/BBR/BBR_OCCUTYPE" /></Work>
							<WorkType/>
							<Company/>
							<InsuranceFlag></InsuranceFlag>
							<AddrItem>
								<Province/>
								<City/>
								<County/>
								<AddrDetail><xsl:value-of select="INSU/BBR/BBR_ADDR" /></AddrDetail>
								<Post><xsl:value-of select="INSU/BBR/BBR_POSTCODE" /></Post>
							</AddrItem>
							<PhoneItem>
								<Section />
								<Phone><xsl:value-of select="INSU/BBR/BBR_TEL" /></Phone>
								<Extension />
							</PhoneItem>
							<MobileItem>
								<Mobile><xsl:value-of select="INSU/BBR/BBR_MOBILE" /></Mobile>
								<IsAcpMsg />
							</MobileItem>
							<EmailItem>
								<Email><xsl:value-of select="INSU/BBR/BBR_EMAIL" /></Email>
								<IsAcpEmail />
							</EmailItem>
						</CustItem>
						<AppRela>
							<xsl:call-template name="reqTransRela">
								<xsl:with-param name="Rela" select="INSU/TBR/TBR_BBR_RELA" />
							</xsl:call-template>
						</AppRela>
						<Stature/>
						<Weight/>
						<YearIncome/>
						<TencentId />
						<IsSign />
						<IsSameSign />
						<DrvIdType />
						<DrvIdNo />
						<OthSumCovAmt/>
						<CusActItem>
							<ActNo></ActNo>
							<ActName/>
							<IdType/>
							<IdNo/>
						</CusActItem>
						<ExtItem>
							<Ext001/>
							<Ext002/>
							<Ext003/>
							<Ext004/>
							<Ext005/>
							<Ext006/>
							<Ext007/>
							<Ext008/>
							<Ext009/>
							<Ext010/>
							<Ext011/>
							<Ext012/>
							<Ext013/>
							<Ext014/>
							<Ext015/>
							<Ext016/>
							<Ext017/>
							<Ext018/>
							<Ext019/>
							<Ext020/>
						</ExtItem>
						<!-- 受益人在发送报文只用给个<SYRS/>代表法定受益人,传给ILOG系统报文中置空 -->
						<BnfList/>
					</InsItem>
					<!--被保人项——结束 -->
				</InsList>
				<!--险种列表——开始 -->
				<PrdList>
					<Count><xsl:value-of disable-output-escaping="yes" select="count(//PRODUCT)" /></Count>
					<xsl:for-each select="INSU/PRODUCTS/PRODUCT">
						<PrdItem>
							<!-- 定义全局变量 -->
							<xsl:variable name="temp_PRODUCTID" select="PRODUCTID"/>
							<xsl:variable name="temp_MAINPRODUCTID" select="MAINPRODUCTID"/>
							<PrdId><xsl:value-of select="PRODUCTID" /></PrdId>
							<sxl:if test="$temp_PRODUCTID = $temp_MAINPRODUCTID">
								<IsMain>1</IsMain>
							</sxl:if>
							<sxl:if test="$temp_PRODUCTID != $temp_MAINPRODUCTID">
								<IsMain>0</IsMain>
							</sxl:if>
							<PrdType />
							<Units><xsl:value-of select="AMT_UNIT" /></Units>
							<!--首期缴费金额 -->
							<InitAmt><xsl:value-of select="PREMIUM" /></InitAmt>
							<!--缴费金额 -->
							<PayAmt><xsl:value-of select="PREMIUM" /></PayAmt>
							<!--缴费方式 -->
							<PremType>
								 <xsl:call-template name="reqTransPayTypeEE">
									<xsl:with-param name="PayTypeEE" select="/INSU/MAIN/PAYMETHOD" />
								</xsl:call-template>
							</PremType>
							<!--缴费年期类型 -->
							<PremTermType>
								<xsl:call-template name="reqTransPayTypeEE">
									<xsl:with-param name="PayTypeEE" select="CHARGE_PERIOD" />
								</xsl:call-template>
							</PremTermType>
							<PremTerm><xsl:value-of select="CHARGE_YEAR" /></PremTerm>
							<!-- 保险金额 -->
							<CovAmt><xsl:value-of select="AMNT" /></CovAmt>
							<CovTermType>
								<xsl:call-template name="reqTransCovTermType">
									<xsl:with-param name="CovTermType" select="COVERAGE_PERIOD" />
								</xsl:call-template>
							</CovTermType>
							<CovTerm><xsl:value-of select="COVERAGE_YEAR" /></CovTerm>
							<BonDrawMode>
								<xsl:call-template name="reqTransBonusGetMode">
									<xsl:with-param name="BonusGetMode" select="DVDMETHOD" />
								</xsl:call-template>
							</BonDrawMode>
							<BonPayMode/>
							<!--年金/生存金领取方式: -->
							<AnnDrawMode/>
							<!--领取年期类型 -->
							<DrawTermType>
								<xsl:call-template name="reqTransDrawTermTypeEE">
									<xsl:with-param name="DrawTermTypeEE" select="REVMETHOD" />
								</xsl:call-template>
							</DrawTermType>
							<DrawTerm><xsl:value-of select="REVAGE" /></DrawTerm>
							<DrawStartAge></DrawStartAge>
							<DrawEndAge />
							<ValiDate/>
							<InvaliDate/>
							<SudPrdItem>
								<LoanBargNo/>
								<LoanAmt/>
								<LoanStartDate/>
								<LoanEndDate/>
								<LoanInvNo/>
								<LoanProvDate />
							</SudPrdItem>
							<!--投联险开始 -->
							<InvPrdItem>
								<InvDateFlag/>
								<SelectAmt/>
								<IsFixInv></IsFixInv>
								<FixInvAmt></FixInvAmt>
								<FixInvStartDate></FixInvStartDate>
								<FixInvFreq></FixInvFreq>
								<!--投资账户列表-开始 -->
								<InvActList>
									<Count/>
									<InvActItem>
										<InvActNo/>
										<InvRate/>
										<AddInvRate/>
										<InvAmt/>
										<AddInvAmt />
										<InvActBal />
										<InvUnitPrice />
										<InvUnits />
									</InvActItem>
								</InvActList>
							</InvPrdItem>
							<ExtItem>
								<Ext001/>
								<Ext002/>
								<Ext003/>
								<Ext004/>
								<Ext005/>
								<Ext006/>
								<Ext007/>
								<Ext008/>
								<Ext009/>
								<Ext010/>
								<Ext011/>
								<Ext012/>
								<Ext013/>
								<Ext014/>
								<Ext015/>
								<Ext016/>
								<Ext017/>
								<Ext018/>
								<Ext019/>
								<Ext020/>
							</ExtItem>
						</PrdItem>
					</xsl:for-each>
				</PrdList>
				<!--险种列表——结束 -->
				<!--保单项——开始 -->
				<PolItem>
					<AppMode/>
					<PolApplDate><xsl:value-of select="java:com.sinosoft.util.DateUtil.date8To10(INSU/MAIN/TB_DATE)" /></PolApplDate>
					<ValiDate/>
					<AppPrintNo><xsl:value-of select="INSU/MAIN/APPLYNO" /></AppPrintNo>
					<!-- 保单印刷号 -->
					<DocNo><xsl:value-of select="INSU/MAIN/BD_PRINT_NO" /></DocNo>
					<!--总保费 -->
					<PremAmt />
					<!--总保额 -->
					<CovAmt />
					<CusActItem>
						<ActNo><xsl:value-of select="INSU/MAIN/PAYACC" /></ActNo>
						<ActName/>
						<IdType/>
						<IdNo/>
					</CusActItem>
					<RenewalAccItem>
						<CusActItem>
							<ActNo><xsl:value-of select="INSU/MAIN/PAYACC" /></ActNo>
							<ActName/>
							<IdType/>
							<IdNo/>
						</CusActItem>
					</RenewalAccItem>
					<Deliver>2</Deliver><!-- 华夏未上从报文中取值的需求，赋默认值，默认电子保单2 -->
					<PayOverSel />
					<IsSubPay />
					<SpecialClause><xsl:value-of select="INSU/MAIN/INSU_SPEC" /></SpecialClause>
					<PolNote />
					<!-- 健康告知  0否 1是  透传 -->
					<IsHealthTell><xsl:value-of select="INSU/MAIN/HEALTHTAG" /></IsHealthTell>
					<IsWorkTell/>
					<SellNo></SellNo>
					<SellName></SellName>
					<SellCertNo/>
					<IntrNo></IntrNo>
					<IntrName>=</IntrName>
					<SubBrchCertNo/>
					<!-- 续保标记透传0否1是 -->
					<PolRenFlag></PolRenFlag>
					<PreinsuranceFlag/>
					<DisputedFlag/>
					<PolPwd><xsl:value-of select="INSU/MAIN/PASSWORD" /></PolPwd>
					<ExtItem>
						<Ext001/>
						<Ext002/>
						<Ext003/>
						<Ext004/>
						<Ext005/>
						<Ext006/>
						<Ext007/>
						<Ext008/>
						<Ext009/>
						<Ext010/>
						<Ext011/>
						<Ext012/>
						<Ext013/>
						<Ext014/>
						<Ext015/>
						<Ext016/>
						<Ext017/>
						<Ext018/>
						<Ext019/>
						<Ext020/>
					</ExtItem>
				</PolItem>
			</ReqBody>
		</CheckApplReq>
		<!-- 电子渠道_结束 -->
	</xsl:template>
</xsl:stylesheet>
