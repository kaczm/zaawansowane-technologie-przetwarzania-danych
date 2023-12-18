<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match='/'>
        <html>
            <body>
                <h1>ZESPOŁY:</h1>
                <ol>
                    <xsl:apply-templates mode="zespoly"/>
                </ol>
                <xsl:apply-templates mode="szczegoly"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="ZESPOLY/ROW" mode="zespoly">
        <li><a href="#{NAZWA}"><xsl:value-of select="NAZWA"/></a></li>
    </xsl:template>

    <xsl:template match="ZESPOLY/ROW" mode="szczegoly">
        <b id="{NAZWA}">NAZWA: <xsl:value-of select="NAZWA"/></b><br/>
        <b>ADRES: <xsl:value-of select="ADRES"/></b><br/>
        <br/>
        <table border="1">
            <xsl:if test="count(PRACOWNICY/ROW) &gt; 0">
            <tr>
                <th>Nazwisko</th>
                <th>Etat</th>
                <th>Zatrudniony</th>
                <th>Placa pod.</th>
                <th>Szef</th>
            </tr>
            </xsl:if>
            <xsl:apply-templates select="PRACOWNICY/ROW" mode="wiersz">
                <xsl:sort select="NAZWISKO"/>
            </xsl:apply-templates>
        </table>
        <xsl:text>Liczba pracowników: </xsl:text><xsl:value-of select="count(PRACOWNICY/ROW)"/>
        <br/><br/>
    </xsl:template>

    <xsl:template match="//PRACOWNICY/ROW" mode="wiersz">
        <tr>
            <td><xsl:value-of select="NAZWISKO"/></td>
            <td><xsl:value-of select="ETAT"/></td>
            <td><xsl:value-of select="ZATRUDNIONY"/></td>
            <td><xsl:value-of select="PLACA_POD"/></td>
            <td>
                <xsl:choose>
                    <xsl:when test="ID_SZEFA != ''">
                        <xsl:value-of select="//PRACOWNICY/ROW[ID_PRAC=current()/ID_SZEFA]/NAZWISKO"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>brak</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>