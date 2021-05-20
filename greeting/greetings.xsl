<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:xsk="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>


    <xsl:template match="/">
        <hallo>
            <xsl:apply-templates select="greeting"/>
        </hallo>
    </xsl:template>

    <xsl:template match="greeting">
        <xsk:value-of select="."/>
    </xsl:template>


</xsl:stylesheet>