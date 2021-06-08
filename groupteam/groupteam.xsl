<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <groups>
        <xsl:apply-templates select="//groups/group"/>

        </groups>
    </xsl:template>

    <xsl:template match="group">
        <group>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>

            <xsl:apply-templates select="team"/>
        </group>
    </xsl:template>

    <xsl:template match="team">
        <xsl:param name="lol" select="."/>
        <team>
            <xsl:attribute name="name">
                <xsl:value-of select="."/>
            </xsl:attribute>
            <xsl:attribute name="rounds">
                <xsl:value-of select="count(//match/team[text() = $lol]) + 1"/>
            </xsl:attribute>
            <xsl:attribute name="playercount">
                <xsl:value-of select="count(//teams/team[nation/FIFA-code/text() = $lol]/position/player)"/>
            </xsl:attribute>

            <xsl:apply-templates select="//teams/team[nation/FIFA-code/text() = $lol]/position/player"/>
        </team>
    </xsl:template>

    <xsl:template match="player">
        <player>
            <xsl:value-of select="concat(name/first-name, ' ', name/last-name)"/>
        </player>
    </xsl:template>

</xsl:stylesheet>