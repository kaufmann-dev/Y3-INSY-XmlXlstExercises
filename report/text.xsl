<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <magazine>
            <xsl:apply-templates select="/report"/>
        </magazine>
    </xsl:template>

    <xsl:template match="report">
        <report>
            <head>
                <authors>
                    <xsl:apply-templates select="authors/*"/>
                </authors>

                <pages>
                    <xsl:value-of select="description/pages"/>
                </pages>

                <url>
                    <xsl:value-of select="description/homepage"/>
                </url>
            </head>
            <body>
                <authors>
                    <xsl:apply-templates select="description/authors/node()">
                        <xsl:with-param name="noAuthor" select="false()"/>
                    </xsl:apply-templates>
                </authors>
                <content>
                    <xsl:value-of select="content"/>
                </content>
            </body>
        </report>
    </xsl:template>

    <xsl:template match="author|sampler">
        <xsl:param name="noAuthor"/>
        <xsl:choose>
            <xsl:when test="$noAuthor = false()">
                <author>
                    <xsl:choose>
                        <xsl:when test="name">
                            <xsl:value-of select="name"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="concat(first-name, ' ', middle-name, ' ', last-name)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </author>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="name">
                        <xsl:value-of select="name"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat(first-name, ' ', middle-name, ' ', last-name)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="description/authors/node()">
        <xsl:choose>
            <xsl:when test="self::text()">
                <xsl:value-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="Id" select="./@id"/>
                <xsl:apply-templates select="//authors/author[@id = $Id]|//authors/sampler[@id = $Id]">
                    <xsl:with-param name="noAuthor" select="true()"/>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>