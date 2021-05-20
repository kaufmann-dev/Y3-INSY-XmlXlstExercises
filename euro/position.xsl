<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="xml" indent="yes"/>

    
    
    <xsl:template match="/">
        <positions>
            <position id="defense">
                <xsl:apply-templates select="//teams/team">
                    <xsl:with-param name="pos">playground</xsl:with-param>
                </xsl:apply-templates>
            </position>
            <position id="playground">
                <xsl:apply-templates select="//teams/team">
                    <xsl:with-param name="pos">playground</xsl:with-param>
                </xsl:apply-templates>
            </position>
            <position id="attack">
                <xsl:apply-templates select="//teams/team">
                    <xsl:with-param name="pos">attack</xsl:with-param>
                </xsl:apply-templates>
            </position>
        </positions>
    </xsl:template>

    <xsl:template match="team">
        <xsl:param name="pos"/>
        <team>
            <xsl:attribute name="code">
                <xsl:value-of select="nation/short-name"/>
            </xsl:attribute>

            <xsl:apply-templates select="position[@type=$pos]/player"/>
        </team>
    </xsl:template>

    <xsl:template match="player">
        <player>
            <xsl:value-of select="concat(name/first-name, ' ', name/last-name)"/>
        </player>
    </xsl:template>

</xsl:stylesheet>