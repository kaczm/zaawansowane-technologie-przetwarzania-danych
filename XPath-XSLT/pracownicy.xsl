<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match='/'>
        <PRACOWNICY>
            <xsl:apply-templates select="//PRACOWNICY/ROW">
                <xsl:sort select="ID_PRAC"/>
            </xsl:apply-templates>
        </PRACOWNICY>
    </xsl:template>

    <xsl:template match="//PRACOWNICY/ROW">
        <PRACOWNIK ID_PRAC="{ID_PRAC}" ID_ZESP="{ID_ZESP}" ID_SZEFA="{ID_SZEFA}">
            <xsl:copy-of select="current()/*[not(name()='ID_PRAC') and not(name()='ID_ZESP') and not(name()='ID_SZEFA')]"/>
        </PRACOWNIK>
    </xsl:template>
</xsl:stylesheet>