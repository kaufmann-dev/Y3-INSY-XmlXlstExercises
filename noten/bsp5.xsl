<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <summer-semester>
            <classes>
                <xsl:apply-templates select="//classes/class"/>
            </classes>
        </summer-semester>
    </xsl:template>

    <xsl:template match="class">
        <class>
            <xsl:attribute name="id">
                <xsl:value-of select="name"/>
            </xsl:attribute>

            <xsl:apply-templates select="student">
                <xsl:with-param name="class">
                    <xsl:value-of select="name"/>
                </xsl:with-param>
            </xsl:apply-templates>
        </class>
    </xsl:template>

    <xsl:template match="student">
        <xsl:param name="class"/>
        <xsl:param name="catalog" select="catalog-number"/>
        <student>
            <catalog-number>
                <xsl:value-of select="$catalog"/>
            </catalog-number>
            <last-name> <!-- Ich glaube das ist in der Angabe vertauscht? -->
                <xsl:value-of select="first-name"/>
            </last-name>
            <first-name> <!-- Ich habe es jedenfalls wie in der Angabe gemacht -->
                <xsl:value-of select="last-name"/>
            </first-name>
            <school-grade id="INSY">
                <xsl:value-of select="//summer-semester/class[@id = $class]/subject[@id = 'INSY']/groups/*/grades/school-grade[@id = $catalog]"/>
            </school-grade>
        </student>
    </xsl:template>

</xsl:stylesheet>