<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:wkdoc="http://www.wkpublisher.com/xml-namespaces/document">

<xsl:template match="/atlas-document/wkdoc:document">
   <xsl:apply-templates/>
</xsl:template>

<xsl:template match="heading">
  <h1 style="font-weight: bold; font-size: 14px; font-family: Arial, sans-serif;">
    <xsl:value-of select="."/>
  </h1>
</xsl:template>

<xsl:template match="h1">
  <h1 style="font-weight: bold; font-size: 14px; font-family: Arial, sans-serif;">
    <xsl:value-of select="."/>
  </h1>
</xsl:template>

<xsl:template match="attachment">
  <table>
    <tr>
      <td style="font-weight: bold; border: 1px solid #000000; color: #0000ff;">
        <xsl:apply-templates/>
      </td>
    </tr>
  </table>
</xsl:template>

<xsl:template match="note">
  <table style="width: 100%">
    <tr>
      <td style="border: 1px solid; padding: 30px 5px; background-color: #ccffff;">
        <xsl:apply-templates/>
      </td>
    </tr>
  </table>
</xsl:template>

<xsl:template match="list-item">
  <li>
    <xsl:apply-templates/>
  </li>
</xsl:template>

<xsl:template match="unordered-list">
  <ul>
    <xsl:attribute name="style">
      <xsl:value-of select="'list-style-type: none; padding-left: 50px;'" />
    </xsl:attribute>

    <xsl:apply-templates/>
  </ul>
</xsl:template>

<xsl:template match="para">
  <p>
    <xsl:apply-templates/>
  </p>
</xsl:template>

<xsl:template match="italic">
  <i>
    <xsl:apply-templates/>
  </i>
</xsl:template>

<xsl:template match="bold">
  <b>
    <xsl:apply-templates/>
  </b>
</xsl:template>

<xsl:template match="wlink">
  <xsl:element name="a">
    <xsl:attribute name="href">
        <xsl:value-of select="@target-url"/>
    </xsl:attribute>
    <xsl:attribute name="style">
      <xsl:value-of select="'text-decoration: none;'" />
    </xsl:attribute>    
    <xsl:value-of select="."/>
  </xsl:element>
</xsl:template>

<xsl:template match="cite-ref">
  <b>
    <xsl:attribute name="style">
      <xsl:value-of select="'color: #0000ff;'" />
    </xsl:attribute> 
    <xsl:apply-templates/>
  </b>
</xsl:template>

</xsl:stylesheet>