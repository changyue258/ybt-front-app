<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:java="http://xml.apache.org/xslt/java"
	xmlns:sxl="http://www.w3.org/1999/XSL/Transform"
	exclude-result-prefixes="java">

<xsl:template match="/INSU">
<TranData>
	<Head>
		<BaseInfo>
			<!--交易日期10位 -->
			<BankDate>
				<xsl:value-of select="java:com.sinosoft.util.DateUtil.date8To10(MAIN/BANK_DATE)" />
			</BankDate>
			<!-- 交易时间8位-->
			<BankTime>
				<xsl:value-of select="java:com.sinosoft.util.DateUtil.getCurrent8Time()" />
			</BankTime>
			<!-- 银行编码-->
			<BankCode>18</BankCode>
			<!-- 地区代码-->
			<ZoneNo>ZONENO<xsl:value-of select="MAIN/ZONENO"/></ZoneNo>
			<!--网点 -->
			<BrNo><xsl:value-of select="MAIN/BRNO"/></BrNo>
			<!-- 柜员代码-->
			<TellerNo><xsl:value-of select="MAIN/TELLERNO"/></TellerNo>
			<!-- 交易流水号-->
			<TransrNo><xsl:value-of select="MAIN/TRANSRNO"/></TransrNo>
			<!--中台交易编码 -->
			<TransactionCode>3002</TransactionCode>
			<!--银代柜员号 -->
			<SaleCode><xsl:value-of select="MAIN/TELLERNO"/></SaleCode>
			<!--银代柜员姓名 -->
			<SaleName></SaleName>
			<!-- -->
			<FunctionFlag>01</FunctionFlag>
		</BaseInfo>
	</Head>
	<Body>
		<LCCont>
			<ProposalContNo><xsl:value-of select="MAIN/APPLYNO" /></ProposalContNo>
			<!-- 投保单申请日期-->
			<PolApplyDate><xsl:value-of select="MAIN/TB_DATE" /></PolApplyDate>
			<!--销售渠道-->
			<SellType>
				<xsl:call-template name="transChannel">
					<xsl:with-param name="Channel" select="MAIN/REMARK2" />
				</xsl:call-template>
			</SellType>
			<!--银行帐户名-->
			<AccName><xsl:value-of select="MAIN/PAYNAME" /></AccName>
			<!--银行编码-->
			<AccBankCode><xsl:value-of select="MAIN/PAYNAME" /></AccBankCode>
			<!--银行帐号-->
			<BankAccNo></BankAccNo>
			<!--交费间隔-->
			<PayIntv></PayIntv>
			<!--交费方式-->
			<PayMode></PayMode>
			<!--特别约定-->
			<SpecContent></SpecContent>
			<!--单证号-->
			<PrtNo></PrtNo>
			<!--合同争议处理方式-->
			<DisputedFlag></DisputedFlag>
			<!--仲裁委员会名称-->
			<StandbyFlag1></StandbyFlag1>
			<!---->
			<StandbyFlag2></StandbyFlag2>
			<!--保单送达方式-->
			<GetPolMode></GetPolMode>
			<!--银代柜员-->
			<BankAgent></BankAgent>
			<!--代理人编码-->
			<AgentCode></AgentCode>
			<!--银代柜员姓名-->
			<BankAgentName></BankAgentName>
			<!-- 投保人信息-->
			<LCAppnt>
				<!-- 投保人名称-->
				<AppntName></AppntName>
				<!-- 投保人性别-->
				<AppntSex></AppntSex>
				<!-- 投保人出生日期10位-->
				<AppntBirthday></AppntBirthday>
				<!--证件类型 -->
				<AppntIDType></AppntIDType>
				<!--证件号码 -->
				<AppntIDNo></AppntIDNo>
				<!--有效期类型：1：非长期，2：长期-->
				<IDDateType></IDDateType>
				<!--有效期：长期传2099-12-31-->
				<IDEndDate></IDEndDate>
				<!--来源-->
				<AppntSouc></AppntSouc>
				<!-- 国籍-->
				<AppntNationality></AppntNationality>
				<!-- 省-->
				<Province></Province>
				<!--市 -->
				<City></City>
				<!-- 县/区-->
				<County></County>
				<!-- 家庭地址-->
				<HomeAddress></HomeAddress>
				<!-- 通讯电话-->
				<AppntPhone></AppntPhone>
				<!-- 单位电话-->
				<AppntOfficePhone></AppntOfficePhone>
				<!-- 手机-->
				<AppntMobile></AppntMobile>
				<!--家庭地址邮编 -->
				<HomeZipCode></HomeZipCode>
				<!-- 邮箱地址-->
				<MailAddress></MailAddress>
				<!-- 邮箱地址邮编-->
				<MailZipCode></MailZipCode>
				<!-- EMail-->
				<Email></Email>
				<!--职业类型 -->
				<JobType></JobType>
				<!-- 职业代码-->
				<JobCode></JobCode>
				<!--与被保人关系 -->
				<RelaToInsured></RelaToInsured>
				<!--收入 -->
				<Income></Income>
				<!-- -->
				<TellInfos>
					<TellInfoCount></TellInfoCount>
					<TellInfo>
						<!-- 告知版别-->
						<TellVersion></TellVersion>
						<!-- 告知编码-->
						<TellCode></TellCode>
						<!-- 告知内容-->
						<TellContent></TellContent>
					</TellInfo>
				</TellInfos>
			</LCAppnt>
			<!-- 被保人信息-->
			<LCInsureds>
				<LCInsuredCount></LCInsuredCount>
				<LCInsured>
					<Name></Name>
					<Sex></Sex>
					<Birthday></Birthday>
					<IDType></IDType>
					<IDNo></IDNo>
					<!--有效期类型：1：非长期，2：长期-->
					<IDDateType></IDDateType>
					<!--有效期：长期传2099-12-31-->
					<IDEndDate></IDEndDate>
					<!-- 国籍-->
					<Nationality></Nationality>
					<!-- 省-->
					<Province></Province>
					<!--市 -->
					<City></City>
					<!-- 县/区-->
					<County></County>
					<HomeAddress></HomeAddress>
					<JobCode></JobCode>
					<HomePhone></HomePhone>
					<InsuredMobile></InsuredMobile>
					<HomeZipCode></HomeZipCode>
					<MailAddress></MailAddress>
					<MailZipCode></MailZipCode>
					<Email></Email>
					<!-- 与主被保人关系-->
					<RelaToMain></RelaToMain>
					<!-- 与投保人关系-->
					<RelaToAppnt></RelaToAppnt>
					<TellInfos>
						<TellInfoCount></TellInfoCount>
						<TellInfo>
							<!-- 告知版别-->
							<TellVersion></TellVersion>
							<!-- 告知编码-->
							<TellCode></TellCode>
							<!-- 告知内容-->
							<TellContent></TellContent>
						</TellInfo>
					</TellInfos>
				</LCInsured>
			</LCInsureds>
			<Risks>
				<RiskCount>

				</RiskCount>
				<Risk>
					<RiskCode></RiskCode>
					<MainRiskCode></MainRiskCode>
					<!-- 险类编码-->
					<RiskType></RiskType>
					<!-- 保额，单位元  0.00-->
					<Amnt></Amnt>
					<!-- 保费，单位元  0.00-->
					<Prem></Prem>
					<Rate></Rate>
					<!-- 份数-->
					<Mult></Mult>
					<SupplementaryPrem></SupplementaryPrem>
					<!-- 交费间隔-->
					<PayIntv></PayIntv>
					<Years></Years>
					<!-- 特约内容-->
					<SpecContent></SpecContent>
					<!-- 缴费年期年龄标志-->
					<PayEndYearFlag></PayEndYearFlag>
					<!-- 缴费年期-->
					<PayEndYear></PayEndYear>
					<!-- 领取年龄年期标志-->
					<GetYearFlag></GetYearFlag>
					<!-- 领取年龄年期-->
					<GetYear></GetYear>
					<!-- 保险年龄年期标志-->
					<InsuYearFlag></InsuYearFlag>
					<!-- 保险期间-->
					<InsuYear></InsuYear>
					<!-- 自动垫交标志 ，0：正常，1：垫交-->
					<AutoPayFlag></AutoPayFlag>
					<!-- 红利金支付方式-->
					<BonusPayMode></BonusPayMode>
					<!-- 续保标志 0：人工续保，-1：自动续保，-2：非续保-->
					<RnewFlag></RnewFlag>
					<!-- 减额交清标志，0：正常，1：减额交清-->
					<SubFlag></SubFlag>
					<!-- 红利金领取方式-->
					<BonusGetMode></BonusGetMode>
					<Accounts>
						<AccountCount></AccountCount>
						<Account>
							<AccNo></AccNo>
							<AccMoney></AccMoney>
							<AccRate></AccRate>
						</Account>
					</Accounts>
					<!-- 是否体检件-->
					<HealthFlag></HealthFlag>
					<FullBonusGetMode></FullBonusGetMode>
					<FirstRate></FirstRate>
					<SureRate></SureRate>
				</Risk>
			</Risks>
			<LCBnfs>
				<LCBnfCount></LCBnfCount>
				<LCBnf>
					<!-- 受益人类别-->
					<BnfType></BnfType>
					<!-- 受益人序号-->
					<BnfNo></BnfNo>
					<!-- 受益人级别-->
					<BnfGrade></BnfGrade>
					<Name></Name>
					<Sex></Sex>
					<!-- 受益人国籍-->
					<Nationality></Nationality>
					<!-- 受益人职业-->
					<JobCode></JobCode>
					<Birthday></Birthday>
					<IDType></IDType>
					<IDNo></IDNo>
					<!-- 身份证有效期类型-->
					<IDDateType></IDDateType>
					<IDEndDate></IDEndDate>
					<Province></Province>
					<City></City>
					<Country></Country>
					<!-- 家庭地址-->
					<Address></Address>
					<Mobile></Mobile>
					<!--受益份额 -->
					<BnfLot></BnfLot>
					<!-- 与被保人关系-->
					<RelationToInsured></RelationToInsured>
				</LCBnf>
			</LCBnfs>
		</LCCont>
	</Body>
</TranData>
</xsl:template>
<!-- 委托方式（交易渠道） -->
<xsl:template name="transChannel">
	<xsl:param name="Channel" />
	<xsl:choose>
		<xsl:when test="$Channel = '0'">2</xsl:when><!-- 柜面-->
		<xsl:when test="$Channel = '1'">C</xsl:when><!-- 网银-->
		<xsl:when test="$Channel = '2'">22</xsl:when><!-- 手机银行-->
		<xsl:when test="$Channel = '3'">17</xsl:when><!-- 自助终端-->
		<xsl:otherwise></xsl:otherwise>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet>
