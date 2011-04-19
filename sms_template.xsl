<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>

<xsl:template match="/">
 <xsl:apply-templates select="//smses"/>
</xsl:template>

	
	<xsl:template name="replace-string">
    <xsl:param name="text"/>
    <xsl:param name="replace"/>
    <xsl:param name="with"/>
    <xsl:choose>
      <xsl:when test="contains($text,$replace)">
        <xsl:value-of select="substring-before($text,$replace)"/>
        <xsl:value-of select="$with"/>
        <xsl:call-template name="replace-string">
          <xsl:with-param name="text"
select="substring-after($text,$replace)"/>
          <xsl:with-param name="replace" select="$replace"/>
          <xsl:with-param name="with" select="$with"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>




	<xsl:template match="smses/sms">
			<xsl:variable name="addressQuotesReplaced">
			  <xsl:call-template name="replace-string"> <!-- imported template -->
				<xsl:with-param name="text" select="@address"/>
				<xsl:with-param name="replace" select="'&quot;'"/>
				<xsl:with-param name="with" select="'\&quot;'"/> <!-- select="'`'" -->
			  </xsl:call-template>
			</xsl:variable>
			
			<xsl:variable name="bodyQuotesReplaced">
			  <xsl:call-template name="replace-string"> <!-- imported template -->
				<xsl:with-param name="text" select="@body"/>
				<xsl:with-param name="replace" select="'&quot;'"/>
				<xsl:with-param name="with" select="'\&quot;'"/> <!-- select="'`'" -->
			  </xsl:call-template>
			</xsl:variable>
			
			<xsl:text> INSERT IGNORE INTO sms ( a_protocol, a_address, a_date, a_type, a_subject, a_body, a_toa, a_sc_toa, a_service_center, a_read, a_status, a_locked, a_contact_name ) VALUES ( </xsl:text>
			<xsl:value-of select="@protocol"/>
			<xsl:text>, "</xsl:text>
			<xsl:value-of select="$addressQuotesReplaced"/>
			<xsl:text>", </xsl:text>
			<xsl:value-of select="@date"/>
			<xsl:text>, </xsl:text>
			<xsl:value-of select="@type"/>
			<xsl:text>, </xsl:text>
			<xsl:value-of select="@subject"/>
			<xsl:text>, "</xsl:text>
			<xsl:value-of select="$bodyQuotesReplaced"/>
			<xsl:text>", </xsl:text>
			<xsl:value-of select="@toa"/>
			<xsl:text>, </xsl:text>
			<xsl:value-of select="@sc_toa"/>
			<xsl:text>, "</xsl:text>
			<xsl:value-of select="@service_center"/>
			<xsl:text>", </xsl:text>
			<xsl:value-of select="@read"/>
			<xsl:text>, </xsl:text>
			<xsl:value-of select="@status"/>
			<xsl:text>, </xsl:text>
			<xsl:choose>
				<xsl:when test="string-length(@locked) &lt; 1">
					<xsl:text>0</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="@locked"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text>, "</xsl:text>
			<xsl:value-of select="@contact_name"/>
			<xsl:text>" </xsl:text>
			<xsl:text>);</xsl:text>	
	</xsl:template>
</xsl:stylesheet>
