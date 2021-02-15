<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0" xmlns:DTS="www.microsoft.com/SqlServer/Dts"      xmlns:regexp="http://exslt.org/regular-expressions"
                extension-element-prefixes="regexp">
    <xsl:import href="regexp.xsl" />
<xsl:template match="/">
    <xsl:apply-templates/>
</xsl:template>
<xsl:template match="DTS:Executable">
    <xsl:value-of select="@DTS:CreationName"/>
    <xsl:text> newkline</xsl:text>
</xsl:template>

</xsl:stylesheet>