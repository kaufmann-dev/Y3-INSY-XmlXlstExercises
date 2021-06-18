<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <summer-semester>
            <teachers>
                <xsl:apply-templates select="//teachers/teacher"/>
            </teachers>
        </summer-semester>
    </xsl:template>

    <xsl:template match="teacher">
        <teacher>
            <name>
                <xsl:value-of select="concat(last-name, ' ', first-name)"/>
            </name>
            <symbol>
                <xsl:value-of select="symbol"/>
            </symbol>
        </teacher>
    </xsl:template>

</xsl:stylesheet>

<!--for schelife mit 2 templates-->