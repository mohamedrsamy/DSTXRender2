<?xml version="1.0" encoding="UTF-8" ?><!-- New XSLT document created with EditiX XML Editor (http://www.editix.com) at Tue Feb 02 11:14:30 CST 2021 -->

<xsl:stylesheet version="3.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:fn="http://www.w3.org/2005/xpath-functions"
xmlns:xdt="http://www.w3.org/2005/xpath-datatypes"
xmlns:err="http://www.w3.org/2005/xqt-errors"
xmlns:DTS="www.microsoft.com/SqlServer/Dts"
xmlns:SQLTask="www.microsoft.com/sqlserver/dts/tasks/sqltask"
exclude-result-prefixes="xs xdt err fn" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

<xsl:output method="html" indent="yes" />

<xsl:template match="/">
<html lang="en"> <head> <script src="https://cdnjs.cloudflare.com/ajax/libs/mermaid/8.6.0/mermaid.min.js"></script> </head><body><div class="mermaid">

graph TB

<xsl:apply-templates select="DTS:Executable"/>
</div> </body> <script> var config = { startOnLoad:true, theme: 'forest', flowchart:{ useMaxWidth:true, htmlLabels:true } }; mermaid.initialize(config); window.mermaid.init(undefined, document.querySelectorAll('.language-mermaid')); </script></html>

</xsl:template>

<xsl:template match="DTS:Variables[DTS:Variable]">
	subgraph variables-<xsl:apply-templates select="ancestor::DTS:Executable[1]/@DTS:ObjectName"/>
	<xsl:text>&#xa;</xsl:text>
<xsl:apply-templates select="DTS:Variable"/>
	<xsl:text>&#xa;</xsl:text>
    end
</xsl:template>

<xsl:template match="DTS:ConnectionManagers[DTS:ConnectionManager]">
	subgraph Connections-<xsl:apply-templates select="ancestor::DTS:Executable[1]/@DTS:ObjectName"/>
	<xsl:text>&#xa;</xsl:text>
	<xsl:apply-templates select="DTS:ConnectionManager"/>
	<xsl:text>&#xa;</xsl:text>
	end
</xsl:template>

<xsl:template match="DTS:Variable">
	<xsl:text>&#xa;</xsl:text>
	<xsl:value-of select="@DTS:ObjectName"/>[Name= <xsl:value-of select="@DTS:ObjectName"/> Value= <xsl:value-of select="translate(DTS:VariableValue, '\_;{}. ','')"/>]
	<xsl:text>&#xa;</xsl:text>
</xsl:template>

<xsl:template match="DTS:ConnectionManager">
	<xsl:text>&#xa;</xsl:text>
	<xsl:value-of select="@DTS:ObjectName"/>[(Name= <xsl:value-of select="@DTS:ObjectName"/> Value= <xsl:value-of 	select="translate(DTS:ObjectData/DTS:ConnectionManager/@DTS:ConnectionString, '\_;{}.= &quot;','')"/>)]
    <xsl:text>&#xa;</xsl:text>
</xsl:template>


<xsl:template match="DTS:PrecedenceConstraints[DTS:PrecedenceConstraint]">

	<xsl:apply-templates select="DTS:PrecedenceConstraint"/>

</xsl:template>

<xsl:template match="DTS:PrecedenceConstraint">
	<xsl:variable name="from">
		<xsl:analyze-string select="@DTS:From" regex=".+\\(.+)$">
			<xsl:matching-substring>
				<xsl:value-of select="regex-group(1)"/>
			</xsl:matching-substring>
		</xsl:analyze-string>
	</xsl:variable>
	<xsl:variable name="to">
		<xsl:analyze-string select="@DTS:To" regex=".+\\(.+)$">
			<xsl:matching-substring>
				<xsl:value-of select="regex-group(1)"/>
			</xsl:matching-substring>
		</xsl:analyze-string>
	</xsl:variable>
	<xsl:text>&#xa;</xsl:text>
	<xsl:value-of select="translate($from, '\_ ','-')"/> --&gt;  <xsl:value-of select="translate($to, '\_ ','-')"/>
    <xsl:text>&#xa;</xsl:text>
</xsl:template>

<xsl:template match="DTS:EventHandler">
	subgraph eventhandler
	<xsl:text>&#xa;</xsl:text>
	<xsl:apply-templates select="DTS:Variables"/>
	<xsl:text>&#xa;</xsl:text>
	<xsl:apply-templates select="DTS:Executables"/>
	<xsl:text>&#xa;</xsl:text>
	end
</xsl:template>

<xsl:template match="DTS:EventHandlers[DTS:EventHandler]">
	subgraph eventhandlers
	<xsl:apply-templates select="DTS:EventHandler"/>
	end
</xsl:template>

<xsl:template match="DTS:ObjectData">
  Object Data found
</xsl:template>

<xsl:template match="DTS:Executable">

		<xsl:variable name="x">

		 <!-- <xsl:analyze-string select="@DTS:refId" regex=".+\\(.+)$">-->

		  <xsl:analyze-string select="@DTS:refId" regex="((?: &lt;=\\)[^\\]*?$)|((?: &lt;!\\)[^\\]*$)">
			  <xsl:matching-substring>
				  <xsl:value-of select="regex-group(1)"/>
			  </xsl:matching-substring>
		  </xsl:analyze-string>

		</xsl:variable>

		subgraph  <xsl:value-of select="replace(@DTS:ObjectName, ' ' , '')"/>

						<xsl:apply-templates select="DTS:Variables"/>

						<xsl:apply-templates select="DTS:ConnectionManagers"/>



						<xsl:apply-templates select="DTS:EventHandlers"/>
						<xsl:apply-templates select="DTS:ObjectData"/>

						<xsl:apply-templates select="DTS:Executables"/>

	                   <xsl:apply-templates select="DTS:PrecedenceConstraints"/>

		end
</xsl:template>


<xsl:template match="DTS:Executables">

	<xsl:apply-templates select="DTS:Executable"/>

</xsl:template>
<!-- Tags to ignore -->
<xsl:template match="DTS:DesignTimeProperties"/>
<xsl:template match="DTS:Variables[not(DTS:Variable)]"/>

</xsl:stylesheet>