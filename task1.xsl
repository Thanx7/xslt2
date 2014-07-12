<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
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

<xsl:template match="para">
  <p>

    <xsl:choose>

    <xsl:when test="@align = 'left'">
      <xsl:attribute name="style">
        <xsl:value-of select="'text-align:left;'" />
      </xsl:attribute>

      <xsl:if test="italic">
        <xsl:attribute name="style">
          <xsl:value-of select="'font-style:italic;'" />
        </xsl:attribute>
      </xsl:if>

      <xsl:if test="bold">
        <xsl:attribute name="style">
          <xsl:value-of select="'font-weight:bold;'" />
        </xsl:attribute>
      </xsl:if>
    <xsl:value-of select="."/>
    </xsl:when>

    <xsl:when test="wlink">
      <b>
      <a href="#{@search-value}">...</a>
        <xsl:attribute name="target-url">
          <xsl:value-of select="."/>
        </xsl:attribute>
      <xsl:value-of select="."/>
      </b>
    </xsl:when>

    <xsl:when test="attachment">
      <table>
        <tr>
          <td style="border: 1px solid">
            <xsl:value-of select="."/>
          </td>
        </tr>
      </table>
    </xsl:when>

    <xsl:otherwise>
      <xsl:attribute name="style">
        <xsl:value-of select="'padding-left: 50px;'" />
      </xsl:attribute>
      <xsl:value-of select="."/>
    </xsl:otherwise>
    </xsl:choose>

  </p>
</xsl:template>

<xsl:template match="note">
  <table style="width: 100%">
    <tr>
      <td style="border: 1px solid; padding: 30px 5px; background-color: #ccffff;">
        <xsl:value-of select="."/>
      </td>
    </tr>
  </table>
</xsl:template>

<xsl:template match="unordered-list">
  <ul>
    <xsl:attribute name="style">
      <xsl:value-of select="'list-style-type: none; padding-left: 50px;'" />
    </xsl:attribute>

    <xsl:for-each select="list-item">
      <li>
        <xsl:if test="para">
          <p>
            <xsl:attribute name="style">
              <xsl:value-of select="'padding-left: 50px;'" />
            </xsl:attribute>
            <xsl:value-of select="para"/>

            <xsl:if test="unordered-list">
              <ul>
                <xsl:attribute name="style">
                  <xsl:value-of select="'list-style-type: none; padding-left: 100px;'" />
                </xsl:attribute>

                <li>
                  <xsl:value-of select="unordered-list"/>
                </li>
              </ul>
            </xsl:if>    

          </p>
        </xsl:if>
      </li>
    </xsl:for-each>

  </ul>
</xsl:template>

</xsl:stylesheet>

<!--
        <xsl:if test="unordered-list">
          <ul>
            <xsl:attribute name="style">
              <xsl:value-of select="'list-style-type: none; padding-left: 30px;'" />
            </xsl:attribute>

            <xsl:for-each select="list-item">
              <li>
                5
                <xsl:value-of select="."/>
                <xsl:if test="para">
                  <p>
                    <xsl:attribute name="style">
                      <xsl:value-of select="'padding-left: 50px;'" />
                    </xsl:attribute>
                    <xsl:value-of select="*"/>
                  </p>
                </xsl:if>                
              </li>
            </xsl:for-each>          
          </ul>
        </xsl:if>
-->