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

<xsl:template match="para">
  <p>
    <xsl:choose>
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

<xsl:template match="wlink">
  <xsl:element name="a">
      <xsl:attribute name="href">
          <xsl:value-of select="@target-url"/>
      </xsl:attribute>
      <xsl:value-of select="@target-url"/>
  </xsl:element>
</xsl:template>









<xsl:template match="event">
  <title>
    Event <xsl:value-of select="@id"/>
  </title>
  <xsl:apply-templates select="heading"/>
  <xsl:apply-templates select="doc-level"/>
</xsl:template>


<xsl:template match="doc-level">
<div style="padding: 5px;">
  <xsl:if test="@position = 'center'">
    <xsl:attribute name="style">
      <xsl:value-of select="'text-align:center;'" />
    </xsl:attribute>
  </xsl:if>

  <xsl:if test="doc-level">
    <xsl:for-each select="doc-level">
      <div style="padding: 5px;">
        <xsl:if test="@position = 'left'">
          <xsl:attribute name="style">
            <xsl:value-of select="'text-align:left;'" />
          </xsl:attribute>
        </xsl:if>

        <xsl:for-each select="para">
          <p>
            <xsl:if test="@type = 'text'">
              <xsl:attribute name="style">
                <xsl:value-of select="'font-style:italic;'" />
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="@type = 'comment'">
              <xsl:attribute name="style">
                <xsl:value-of select="'background-color:#cccccc; outline-offset:100px;'" />
              </xsl:attribute>
            </xsl:if>

            <xsl:if test="date">
            Date:
            </xsl:if>
            
            <xsl:value-of select="."/>
          </p>
        </xsl:for-each>

      </div>
    </xsl:for-each>
  </xsl:if>

  <xsl:if test="table">
    <table style="margin:auto; border: 1px solid;">
      <xsl:apply-templates select="table"/>
    </table>
  </xsl:if>

  <xsl:if test="para">
      <xsl:for-each select="para">
      <p>

        <xsl:if test="@type = 'unordered-list'">
          <ul>
            <xsl:for-each select="list-item">
              <li>
                <xsl:value-of select="."/>
              </li>
            </xsl:for-each>
          </ul>
        </xsl:if>

        <xsl:if test="@type = 'image'">
            <xsl:for-each select="image">
              <img>
                <xsl:attribute name="src">
                  <xsl:value-of select="@source" />
                </xsl:attribute>
                <xsl:attribute name="alt">
                  <xsl:value-of select="@description" />
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="@description" />
                </xsl:attribute>                                
              </img>
            </xsl:for-each>
        </xsl:if>

      </p>
      </xsl:for-each>
  </xsl:if>

  <xsl:if test="external-link">
    <xsl:apply-templates select="external-link"/>
  </xsl:if>

</div>
</xsl:template>

<xsl:template match="table">

  <xsl:if test="table-heading">
    <thead>
      <tr>
        <th style="color:#0000ff;">
          <xsl:value-of select="table-heading"/>
        </th>
      </tr>
    </thead>
  </xsl:if>

  <xsl:if test="table-row">
    <tbody>
      <xsl:for-each select="table-row">
        <tr>
          <xsl:if test="table-cell">
            <xsl:for-each select="table-cell">

              <td>
                <xsl:if test="@style = 'bold'">
                  <xsl:attribute name="style">
                    <xsl:value-of select="'font-weight:bold;'" />
                  </xsl:attribute>
                </xsl:if>
                <xsl:value-of select="."/>
              </td>

            </xsl:for-each>
          </xsl:if>
        </tr>
      </xsl:for-each>
    </tbody>
  </xsl:if>

</xsl:template>

<xsl:template match="external-link">
  <p>
  <xsl:element name="a">
      <xsl:attribute name="href">
          <xsl:value-of select="@source"/>
      </xsl:attribute>
      <xsl:value-of select="@source"/>
  </xsl:element>
  </p>
</xsl:template>

</xsl:stylesheet>