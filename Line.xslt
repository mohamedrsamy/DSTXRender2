<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:DTS="www.microsoft.com/SqlServer/Dts"
xmlns:SQLTask="www.microsoft.com/sqlserver/dts/tasks/sqltask"
xmlns:xmlfn="http://www.hy-vee.net/xslt/pythonxsltfunctions"

    <xsl:output method="text" indent="yes" omit-xml-declaration="yes" />

 <xsl:template match="@*">
  <xsl:attribute name="{name()}">
     <xsl:value-of select="translate(., ' ', '')" />
  </xsl:attribute>


</xsl:template>
<xsl:template match="/DTS:Executable">

	<xsl:if test= "@DTS:refId =  &quot;Package&quot;">
		```mermaid
		graph TB;
		subgraph <xsl:value-of select="normalize-space(@DTS:ObjectName)"/>_ <xsl:value-of select="normalize-space(@DTS:refId)" />



		<!-- <xsl:apply-templates select="/DTS:Executable/DTS:Variables" />


 		<xsl:apply-templates select="/DTS:Executable/DTS:ConnectionManagers" />
		<xsl:apply-templates select="/DTS:Executable/DTS:PrecedenceConstraints" />
-->


			<xsl:apply-templates/>





		end
		```
	</xsl:if>

</xsl:template>
<xsl:template match="DTS:ObjectData">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="pipeline/components">
	subgraph Components
			<xsl:apply-templates/>
	end
</xsl:template>
<xsl:template match="component">
	[<xsl:value-of select ="@name" />]
</xsl:template>

<xsl:template match="DTS:Property"/>
<!-- Variables tag that have a variable child element -->
<xsl:template match="DTS:Variables[DTS:Variable]">


		subgraph Variables_<xsl:value-of select ="parent::DTS:Executable[1]/@DTS:ObjectName" />

			<xsl:apply-templates/>

		end


</xsl:template>




<xsl:template match= "DTS:Variable" >
	<xsl:value-of select ="@DTS:ObjectName" />[Name = <xsl:value-of select ="@DTS:ObjectName" /> Value = <xsl:value-of select ="DTS:VariableValue" />]
</xsl:template>
<!-- Connectionagers tag that have a  Connection Manager Child elements  -->
<xsl:template match="DTS:ConnectionManagers[DTS:ConnectionManager]">


		subgraph ConnectionManagers
			<xsl:for-each select="DTS:ConnectionManager">
				<xsl:value-of select ="@DTS:ObjectName" />([Name = <xsl:value-of select ="@DTS:ObjectName" /> Value = <xsl:value-of select ="DTS:ObjectData/DTS:ConnectionManager/@DTS:ConnectionString" />])
			</xsl:for-each>
		End


</xsl:template>

<xsl:template match="DTS:Executable">

  			subgraph	<xsl:value-of select="@DTS:ObjectName"/>_<value-of select="xmlfn:printlink(@DTS:refId)"/>
				[<xsl:value-of select="@DTS:ExecutableType"/>]

				<xsl:apply-templates/>

			end

</xsl:template>



<xsl:template match="DTS:LoggingOptions"/>



<xsl:template match="DTS:Executables[DTS:Executable]">
		subgraph ExecutionFLow
			<xsl:apply-templates/>
		end
</xsl:template>


<xsl:template match="DTS:Variables[not(DTS:Variable)]" />

<xsl:template match="DTS:EventHandlers" />




	<xsl:template match="DTS:DesignTimeProperties" />
<xsl:template match="DTS:PrecedenceConstraints[not(DTS:PrecedenceConstraint)]" />

<xsl:template match="DTS:PrecedenceConstraints[DTS:PrecedenceConstraint]">

			<xsl:for-each select="DTS:PrecedenceConstraint">

				<xsl:value-of select ="@DTS:From" />  --> <xsl:value-of select ="@DTS:To" />
				<xsl:text>&#xa;</xsl:text>

			</xsl:for-each>

</xsl:template>

<xsl:template match="@DTS:refId">
<value-of select="xmlfn:printlink(string(@DTS:refId))"/>
</xsl:template>
</xsl:stylesheet>