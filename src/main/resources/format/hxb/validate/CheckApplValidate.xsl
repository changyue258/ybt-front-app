<?xml version="1.0" encoding="GBK"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java">

	<xsl:include href="ReqHeadValidate.xsl" />

	<xsl:template match="/TranData">
		<rules>
			<xsl:apply-templates select="Head" />
			<xsl:apply-templates select="Body"/>
		</rules>
	</xsl:template>

	<!--��������-->
	<xsl:variable name="tChanNo" select="/TranData/Body/LCCont/SellType"/>

	<xsl:template match="Body">

		<!--Ͷ����-->
		<xsl:apply-templates select="LCCont/LCAppnt"/>
		<!--������-->
		<xsl:apply-templates select="LCCont/LCInsureds"/>
		<!--������-->
		<xsl:apply-templates select="LCCont/LCBnfs"/>
		<!--������-->
		<xsl:apply-templates select="PolItem"/>

	</xsl:template>

	<!-- Ͷ���� -->
	<xsl:template match="LCAppnt">
		<!--Ͷ��������-->
		<xsl:variable name="tName" select="CustItem/Name"/>
		<!--Ͷ���˵�ַ����Ϊ�գ��Ҳ�������8������-->
		<xsl:variable name="tAddrDetail" select="CustItem/AddrItem/AddrDetail"/>
		<!--Ͷ�����������룬����Ϊ���ҳ��ȱ���Ϊ6λ���ұ���Ϊ����-->
		<xsl:variable name="tPost" select="CustItem/AddrItem/Post"/>
		<!--Ͷ���˹̻��ǿ�ʱ���䳤�ȱ���Ϊ6-12λ���������з������ַ�-->
		<xsl:variable name="tPhone" select="CustItem/PhoneItem/Phone"/>
		<!--Ͷ����֤�����Ͳ���Ϊ��-->
		<xsl:variable name="tIdType" select="CustItem/IdType"/>
		<!--Ͷ�����ƶ��绰����Ϊ�գ����ȱ���Ϊ11λ����1��ͷ,����ȫΪ����-->
		<xsl:variable name="tMobile" select="CustItem/MobileItem/Mobile"/>
		<!--Ͷ���˵����ʼ�-->
		<xsl:variable name="tEmail" select="CustItem/EmailItem/Email"/>
		<!--������-->
		<xsl:variable name="tYearIncome" select="YearIncome"/>

		<!-- �ǿ��ж� -->
		<xsl:if test="string-length($tName) = 0">
			<msg>[RETCODE=3021,ERRMSG=[]]</msg>
		</xsl:if>
		<xsl:if test="java:com.sinosoft.tools.DataCheck.checkNameLength($tName) != 'true'">
			<msg>[RETCODE=3015,ERRMSG=[]]</msg>
		</xsl:if>
		<xsl:if test="string-length($tAddrDetail) = 0">
			<msg>[RETCODE=3022,ERRMSG=[]]</msg>
		</xsl:if>
		<xsl:if test="java:com.sinosoft.tools.DataCheck.checkAddrDetail($tAddrDetail, 12, 15) != 'true'">
			<msg>[RETCODE=3016,ERRMSG=[{'12'},{'15'}]]</msg>
		</xsl:if>
		<xsl:if test="string-length($tPost) = 0">
			<msg>[RETCODE=3023,ERRMSG=[]]</msg>
		</xsl:if>
		<xsl:if test="java:com.sinosoft.tools.DataCheck.checkPost($tPost) != 'true'">
			<msg>[RETCODE=3017,ERRMSG=[]]</msg>
		</xsl:if>
		<xsl:if test="string-length($tPhone) != 0">
			<xsl:if test="java:com.sinosoft.tools.DataCheck.checkPhone($tPhone) != 'true'">
				<msg>[RETCODE=3018,ERRMSG=[]]</msg>
			</xsl:if>
		</xsl:if>
		
		<xsl:if test="string-length($tIdType) = 0">
			<msg>[RETCODE=3019,ERRMSG=[]]</msg>
		</xsl:if>

		<xsl:choose>
			<xsl:when test="string-length($tMobile) = 0">
				<msg>[RETCODE=3025,ERRMSG=[]]</msg>
			</xsl:when>
			<xsl:when test="java:com.sinosoft.tools.DataCheck.checkMobile($tMobile) != 'true'">
				<msg>[RETCODE=3020,ERRMSG=[]]</msg>
			</xsl:when>
		</xsl:choose>

		<xsl:if test="$tChanNo != 'C'">
			<!-- �ǿ��ж� -->
			<xsl:if test="string-length($tEmail) = 0">
				<msg>[RETCODE=3026,ERRMSG=[]]</msg>
			</xsl:if>
		</xsl:if>

		<xsl:if test="string-length($tYearIncome) = 0">
			<msg>[RETCODE=3027,ERRMSG=[]]</msg>
		</xsl:if>


	</xsl:template>

	<!-- ������ -->
	<xsl:template match="InsList">
	
		<!-- �������е��������������У�� -->
		<xsl:if test="$tChanNo = 'C'">
			<!--����������-->
			<xsl:variable name="bName" select="InsItem/CustItem/Name"/>
			<!--�����˵�ַ����Ϊ�գ���Ҫ����6������-->
			<xsl:variable name="bAddrDetail" select="InsItem/CustItem/AddrItem/AddrDetail"/>
			<!--Ͷ�����˹�ϵ����Ϊ��-->
			<xsl:variable name="bAppRela" select="InsItem/AppRela"/>
			<!--�������������룬����Ϊ�գ��ҳ��ȱ���Ϊ6λ���ұ���Ϊ����-->
			<xsl:variable name="bPost" select="InsItem/CustItem/AddrItem/Post"/>
			<!--�����˹̻��ǿ�ʱ���䳤�Ȳ���С��6λ���������з������ַ�-->
			<xsl:variable name="bPhone" select="InsItem/CustItem/PhoneItem/Phone"/>
			<!--Ͷ����֤�����Ͳ���Ϊ��-->
			<xsl:variable name="bIdType" select="InsItem/CustItem/IdType"/>
			<!--�������ƶ��绰����Ϊ�գ����ȱ���Ϊ11λ����1��ͷ,����ȫΪ����-->
			<xsl:variable name="bMobile" select="InsItem/CustItem/MobileItem/Mobile"/>
			<!--�������Ա�-->
			<xsl:variable name="bSex" select="InsItem/CustItem/Sex"/>
	
	
	
			<!-- �ǿ��ж� -->
			<xsl:if test="string-length($bName) = 0">
				<msg>[RETCODE=4021,ERRMSG=[]]</msg>
			</xsl:if>
			<xsl:if test="java:com.sinosoft.tools.DataCheck.checkNameLength($bName) != 'true'">
				<msg>[RETCODE=4026,ERRMSG=[]]</msg>
			</xsl:if>
			<xsl:if test="string-length($bAddrDetail) = 0 ">
				<msg>[RETCODE=4022,ERRMSG=[]]</msg>
			</xsl:if>
			<xsl:if test="java:com.sinosoft.tools.DataCheck.checkAddrDetail($bAddrDetail, 12, 15) != 'true'">
				<msg>[RETCODE=4015,ERRMSG=[{'12'},{'15'}]]</msg>
			</xsl:if>
			<xsl:if test="string-length($bPost) = 0 ">
				<msg>[RETCODE=4023,ERRMSG=[]]</msg>
			</xsl:if>
			<xsl:if test="java:com.sinosoft.tools.DataCheck.checkPost($bPost) !='true'">
				<msg>[RETCODE=4016,ERRMSG=[]]</msg>
			</xsl:if>
	
			<xsl:if test="string-length($bAppRela) = 0">
				<msg>[RETCODE=4020,ERRMSG=[]]</msg>
			</xsl:if>
			
			<xsl:if test="string-length($bPhone) != 0">
				<xsl:if test="java:com.sinosoft.tools.DataCheck.checkPhone($bPhone) != 'true'">
					<msg>[RETCODE=4017,ERRMSG=[]]</msg>
				</xsl:if>
			</xsl:if>
	
			<xsl:if test="string-length($bIdType) = 0">
				<msg>[RETCODE=4018,ERRMSG=[]]</msg>
			</xsl:if>
	
			<xsl:choose>
				<xsl:when test="string-length($bMobile) = 0">
					<msg>[RETCODE=4025,ERRMSG=[]]</msg>
				</xsl:when>
				<xsl:when test="java:com.sinosoft.tools.DataCheck.checkMobile($bMobile) != 'true'">
					<msg>[RETCODE=4019,ERRMSG=[]]</msg>
				</xsl:when>
			</xsl:choose>
	
			<xsl:choose>
				<xsl:when test="string-length($bSex) = 0">
					<msg>[RETCODE=4027,ERRMSG=[]]</msg>
				</xsl:when>
				<!--<xsl:when test="$bSex != '0' or $bSex != '1'">
					<msg>[RETCODE=4028,ERRMSG=[]]</msg>
				</xsl:when>-->
				<xsl:when test="not($bSex = '0' or $bSex = '1')">
					<msg>[RETCODE=4027,ERRMSG=[]]</msg>
				</xsl:when>
			</xsl:choose>

		</xsl:if>

	</xsl:template>


	<!-- ������ -->
	<xsl:template match="InsList/InsItem/BnfList">

		<!-- �������е��������������У�� -->
		<xsl:if test="$tChanNo = 'C'">
			<xsl:if test="Count !='0'">
				<xsl:for-each select="BnfItem">
	
				<!--��������������Ϊ�գ�������ڵ��������ַ�-->
				<xsl:variable name="sName" select="CustItem/Name"/>
				<!--���������ղ���Ϊ��-->
				<xsl:variable name="sBirthday" select="CustItem/Birthday"/>
				<!--�������뱻���˹�ϵ����Ϊ��-->
				<xsl:variable name="sInsRela" select="InsRela"/>
				<!--������֤�����Ͳ���Ϊ��-->
				<xsl:variable name="sIdType" select="CustItem/IdType"/>
				<!--����������˳����Ϊ��-->
				<xsl:variable name="sBnfOrder" select="BnfOrder"/>
	
				<!-- �ǿ��ж� -->
				<xsl:if test="string-length($sName) = 0 ">
					<msg>[RETCODE=5017,ERRMSG=[]]</msg>
				</xsl:if>
				<xsl:if test="java:com.sinosoft.tools.DataCheck.checkNameLength($sName) != 'true'">
					<msg>[RETCODE=5065,ERRMSG=[]]</msg>
				</xsl:if>
				<xsl:if test="string-length($sBirthday) = 0 ">
					<msg>[RETCODE=5066,ERRMSG=[]]</msg>
				</xsl:if>
				<xsl:if test="string-length($sInsRela) = 0 ">
					<msg>[RETCODE=5014,ERRMSG=[]]</msg>
				</xsl:if>
				<xsl:if test="string-length($sIdType) = 0">
					<msg>[RETCODE=5015,ERRMSG=[]]</msg>
				</xsl:if>
				<xsl:if test="string-length($sBnfOrder) = 0">
					<msg>[RETCODE=5016,ERRMSG=[]]</msg>
				</xsl:if>
	
				</xsl:for-each>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	
	<!-- ������ -->
	<xsl:template match="PolItem">
	
		<!--�ͻ��˻��� �˺�-->
		<xsl:variable name="pActNo" select="CusActItem/ActNo"/>
		
		<!-- �ͻ��˻��� �˺� �ǿ��ж� -->
		<xsl:if test="string-length($pActNo) = 0">
		
			<msg>[RETCODE=5071,ERRMSG=[]]</msg>
			
		</xsl:if>
		
	</xsl:template>
	
</xsl:stylesheet>