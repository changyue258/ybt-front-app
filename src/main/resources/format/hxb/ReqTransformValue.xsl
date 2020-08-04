<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">

	<!-- 证件类型 -->
	<xsl:template name="reqTransIdKind">
		<xsl:param name="IdKind"/>
		<xsl:choose>
			<xsl:when test="$IdKind = '51'">02</xsl:when>
			<xsl:when test="$IdKind = '52'">07</xsl:when>
			<xsl:when test="$IdKind = '53'">04</xsl:when>
			<xsl:when test="$IdKind = '55'">15</xsl:when>
			<xsl:when test="$IdKind = '68'">15</xsl:when>
			<xsl:when test="$IdKind = '69'">17</xsl:when>
			<xsl:when test="$IdKind = '76'">18</xsl:when>
			<xsl:when test="$IdKind = '99'">21</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- 币种 -->
	<xsl:template name="reqTransCurType">
		<xsl:param name="CurType"/>
		<xsl:choose>
			<xsl:when test="$CurType = '01'">CNY</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- 性别 -->
	<xsl:template name="reqTransSex">
		<xsl:param name="Sex"/>
		<xsl:choose>
			<xsl:when test="$Sex = '1'">0</xsl:when>
			<xsl:when test="$Sex = '2'">1</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- 交费方式(柜面渠道) -->
	<xsl:template name="reqTransPayType">
		<xsl:param name="PayType"/>
		<xsl:choose>
			<xsl:when test="$PayType = '-1'">I</xsl:when>
			<xsl:when test="$PayType = '0'">W</xsl:when>
			<xsl:when test="$PayType = '1'">M</xsl:when>
			<xsl:when test="$PayType = '3'">Q</xsl:when>
			<xsl:when test="$PayType = '6'">H</xsl:when>
			<xsl:when test="$PayType = '12'">Y</xsl:when>
			<xsl:otherwise>O</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- 交费方式(电子渠道) -->
	<xsl:template name="reqTransPayTypeEE">
		<xsl:param name="PayTypeEE"/>
		<xsl:choose>
			<xsl:when test="$PayTypeEE = '1'">Y</xsl:when>
			<xsl:when test="$PayTypeEE = '5'">W</xsl:when>
			<xsl:when test="$PayTypeEE = '7'">Y</xsl:when>
			<!-- 老银保通交费方式  转为新银保通交费方式 -->
			<xsl:when test="$PayTypeEE = '12'">Y</xsl:when>
			<xsl:when test="$PayTypeEE = '0'">W</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- 交费年期类型(柜面渠道) -->
	<xsl:template name="reqTransPayDueType">
		<xsl:param name="PayDueType"/>
		<xsl:choose>
			<xsl:when test="$PayDueType = '0'">W</xsl:when>
			<xsl:when test="$PayDueType = '1'">M</xsl:when>
			<xsl:when test="$PayDueType = '3'">Q</xsl:when>
			<xsl:when test="$PayDueType = '12'">Y</xsl:when>
			<xsl:when test="$PayDueType = '98'">A</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- 交费年期类型(电子渠道) -->
	<xsl:template name="reqTransPayDueTypeEE">
		<xsl:param name="PayDueTypeEE"/>
		<xsl:choose>
			<xsl:when test="$PayDueTypeEE = '1'">Y</xsl:when>
			<xsl:when test="$PayDueTypeEE = '5'">W</xsl:when>
			<xsl:when test="$PayDueTypeEE = '7'">A</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- 保险年期类型(柜面渠道) -->
	<xsl:template name="reqTransCovTermType">
		<xsl:param name="CovTermType"/>
		<xsl:choose>
			<xsl:when test="$CovTermType = '1'">L</xsl:when>
			<xsl:when test="$CovTermType = '2'">Y</xsl:when>
			<xsl:when test="$CovTermType = '3'">Q</xsl:when>
			<xsl:when test="$CovTermType = '4'">M</xsl:when>
			<xsl:when test="$CovTermType = '5'">D</xsl:when>
			<xsl:when test="$CovTermType = '6'">A</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- 保险年期类型(电子渠道) -->
	<xsl:template name="reqTransCovTermTypeEE">
		<xsl:param name="CovTermTypeEE"/>
		<xsl:choose>
			<xsl:when test="$CovTermTypeEE = '1'">L</xsl:when>
			<xsl:when test="$CovTermTypeEE = '2'">Y</xsl:when>
			<xsl:when test="$CovTermTypeEE = '3'">A</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- 红利领取方式 -->
	<xsl:template name="reqTransBonusGetMode">
		<xsl:param name="BonusGetMode"/>
		<xsl:choose>
			<xsl:when test="$BonusGetMode = '1'">01</xsl:when>
			<xsl:when test="$BonusGetMode = '2'">02</xsl:when>
			<xsl:when test="$BonusGetMode = '3'">03</xsl:when>
			<xsl:when test="$BonusGetMode = '0'">04</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- 年金/生存金领取方式(领取年期类型) -->
	<xsl:template name="reqTransAnnDrawMode">
		<xsl:param name="AnnDrawMode"/>
		<xsl:choose>
			<xsl:when test="$AnnDrawMode = '0'">02</xsl:when>
			<xsl:when test="$AnnDrawMode = '1'">03</xsl:when>
			<xsl:when test="$AnnDrawMode = '3'">04</xsl:when>
			<xsl:when test="$AnnDrawMode = '6'">05</xsl:when>
			<xsl:when test="$AnnDrawMode = '12'">06</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- 关系代码转换 -->
	<xsl:template name="reqTransRela">
		<xsl:param name="Rela"/>
		<xsl:choose>
			<xsl:when test="$Rela = '1'">01</xsl:when>
			<xsl:when test="$Rela = '2'">02</xsl:when>
			<xsl:when test="$Rela = '3'">03</xsl:when>
			<xsl:when test="$Rela = '4'">04</xsl:when>
			<xsl:when test="$Rela = '5'">05</xsl:when>
			<xsl:when test="$Rela = '6'">06</xsl:when>
			<xsl:when test="$Rela = '7'">07</xsl:when>
			<xsl:when test="$Rela = '8'">08</xsl:when>
			<xsl:when test="$Rela = '9'">09</xsl:when>
			<xsl:when test="$Rela = '10'">10</xsl:when>
			<xsl:when test="$Rela = '11'">11</xsl:when>
			<xsl:when test="$Rela = '12'">12</xsl:when>
			<xsl:when test="$Rela = '13'">13</xsl:when>
			<xsl:when test="$Rela = '14'">14</xsl:when>
			<xsl:when test="$Rela = '15'">15</xsl:when>
			<xsl:when test="$Rela = '16'">16</xsl:when>
			<xsl:when test="$Rela = '17'">17</xsl:when>
			<xsl:when test="$Rela = '18'">18</xsl:when>
			<xsl:when test="$Rela = '19'">19</xsl:when>
			<xsl:when test="$Rela = '20'">20</xsl:when>
			<xsl:when test="$Rela = '21'">21</xsl:when>
			<xsl:when test="$Rela = '22'">22</xsl:when>
			<xsl:when test="$Rela = '23'">23</xsl:when>
			<xsl:when test="$Rela = '24'">24</xsl:when>
			<xsl:when test="$Rela = '25'">25</xsl:when>
			<xsl:when test="$Rela = '26'">26</xsl:when>
			<xsl:when test="$Rela = '27'">27</xsl:when>
			<xsl:when test="$Rela = '28'">28</xsl:when>
			<xsl:when test="$Rela = '29'">29</xsl:when>
			<xsl:when test="$Rela = '30'">30</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- 居民来源(柜面渠道) -->
	<xsl:template name="reqDenizenOrigin">
		<xsl:param name="DenizenOrigin"/>
		<xsl:choose>
			<xsl:when test="$DenizenOrigin = '0'">T</xsl:when>
			<xsl:when test="$DenizenOrigin = '1'">C</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- 居民来源(电子渠道) -->
	<xsl:template name="reqDenizenOriginEE">
		<xsl:param name="DenizenOriginEE"/>
		<xsl:choose>
			<xsl:when test="$DenizenOriginEE = '1'">T</xsl:when>
			<xsl:when test="$DenizenOriginEE = '2'">C</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!--受益人类型-->
	<xsl:template name="bnfTypeCode">
		<xsl:param name="bnfTypeCodeMode"/>
		<xsl:choose>
			<xsl:when test="$bnfTypeCodeMode = '1'">01</xsl:when>
			<xsl:when test="$bnfTypeCodeMode = '2'">05</xsl:when>
			<xsl:when test="$bnfTypeCodeMode = '0'">02</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- 主附险标识 -->
	<xsl:template name="reqTransIsMain">
		<xsl:param name="IsMain"/>
		<xsl:choose>
			<xsl:when test="$IsMain = '1'">1</xsl:when>
			<xsl:when test="$IsMain = '2'">0</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- 领取年期类型/领取年期/年龄标志(柜面渠道) -->
	<xsl:template name="reqTransDrawTermType">
		<xsl:param name="DrawTermType"/>
		<xsl:choose>
			<xsl:when test="$DrawTermType = '0'">02</xsl:when>
			<xsl:when test="$DrawTermType = '1'">03</xsl:when>
			<xsl:when test="$DrawTermType = '3'">04</xsl:when>
			<xsl:when test="$DrawTermType = '6'">05</xsl:when>
			<xsl:when test="$DrawTermType = '12'">06</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- 领取年期类型/领取年期/年龄标志(电子渠道) -->
	<xsl:template name="reqTransDrawTermTypeEE">
		<xsl:param name="DrawTermTypeEE"/>
		<xsl:choose>
			<xsl:when test="$DrawTermTypeEE = '1'">03</xsl:when>
			<xsl:when test="$DrawTermTypeEE = '2'">06</xsl:when>
			<xsl:when test="$DrawTermTypeEE = '3'">02</xsl:when>
			<xsl:when test="$DrawTermTypeEE = '4'">04</xsl:when>
			<xsl:when test="$DrawTermTypeEE = '5'">05</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- 交易编码(电子渠道) -->
	<xsl:template name="reqTransCodeTem">
		<xsl:param name="TransCode" />
		<xsl:choose>
			<xsl:when test="$TransCode = '10'">01</xsl:when>
			<!-- 电子渠道需要重新核保一次 将02修改为0102 -->
			<xsl:when test="$TransCode = '11'">0102</xsl:when>
			<xsl:when test="$TransCode = '12'">03</xsl:when>
			<xsl:when test="$TransCode = '13'">12</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- 保单递送方式(电子渠道) -->
	<xsl:template name="reqTransDeliverEE">
		<xsl:param name="DeliverEE" />
		<xsl:choose>
			<xsl:when test="$DeliverEE = '2'">1</xsl:when>
			<xsl:when test="$DeliverEE = '4'">3</xsl:when>
			<xsl:when test="$DeliverEE = '1'">4</xsl:when>
			<xsl:when test="$DeliverEE = '3'">5</xsl:when>
			<xsl:otherwise>2</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- 交易渠道(电子渠道) -->
	<xsl:template name="reqTransChanNo">
		<xsl:param name="ChanNo" />
		<xsl:choose>
			<xsl:when test="$ChanNo = '0'">C</xsl:when>
			<xsl:when test="$ChanNo = '1'">E</xsl:when>
			<xsl:when test="$ChanNo = '2'">M</xsl:when>
			<xsl:when test="$ChanNo = '3'">K</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- 机构ID OrgId转换(电子渠道) -->
	<xsl:template name="reqOrgId">
		<xsl:param name="BankCodeEE" />
		<xsl:choose>
			<xsl:when test="$BankCodeEE = '16'">08</xsl:when>
			<xsl:when test="$BankCodeEE = '08'">08</xsl:when>
			<!-- 电子渠道没有hxb为了解决<agencyCode outCode="HXB">08</agencyCode> 而配置 -->
			<xsl:when test="$BankCodeEE = 'HXB'">08</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- 证件类型转换  老银保通证件类型转为新银保通证件类型 -->
	<xsl:template name="idTypeOldToNew">
		<xsl:param name="IdType" />
		<xsl:choose>
			<xsl:when test="$IdType = 'j'">19</xsl:when>
			<xsl:when test="$IdType = '0'">02</xsl:when>
			<xsl:when test="$IdType = '1'">07</xsl:when>
			<xsl:when test="$IdType = '2'">05</xsl:when>
			<xsl:when test="$IdType = '3'">08</xsl:when>
			<xsl:when test="$IdType = '4'">04</xsl:when>
			<xsl:when test="$IdType = '5'">09</xsl:when>
			<xsl:when test="$IdType = '6'">10</xsl:when>
			<xsl:when test="$IdType = '9'">20</xsl:when>
			<xsl:when test="$IdType = '7'">21</xsl:when>
			<xsl:when test="$IdType = 'a'">11</xsl:when>
			<xsl:when test="$IdType = 'b'">16</xsl:when>
			<xsl:when test="$IdType = 'c'">03</xsl:when>
			<xsl:when test="$IdType = 'd'">12</xsl:when>
			<xsl:when test="$IdType = 'e'">15</xsl:when><!-- 银行将港澳居民来往内地通行证转为e发送过来，故修改 -->
			<xsl:when test="$IdType = 'f'">17</xsl:when>
			<xsl:when test="$IdType = 'z'">21</xsl:when>
			<xsl:when test="$IdType = 'g'">13</xsl:when>
			<xsl:when test="$IdType = 'h'">14</xsl:when>
			<xsl:when test="$IdType = 'i'">18</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>