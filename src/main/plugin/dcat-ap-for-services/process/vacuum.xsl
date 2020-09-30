<?xml version="1.0" encoding="UTF-8"?>
<!--
  ~ Copyright (C) 2001-2016 Food and Agriculture Organization of the
  ~ United Nations (FAO-UN), United Nations World Food Programme (WFP)
  ~ and United Nations Environment Programme (UNEP)
  ~
  ~ This program is free software; you can redistribute it and/or modify
  ~ it under the terms of the GNU General Public License as published by
  ~ the Free Software Foundation; either version 2 of the License, or (at
  ~ your option) any later version.
  ~
  ~ This program is distributed in the hope that it will be useful, but
  ~ WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  ~ General Public License for more details.
  ~
  ~ You should have received a copy of the GNU General Public License
  ~ along with this program; if not, write to the Free Software
  ~ Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
  ~
  ~ Contact: Jeroen Ticheler - FAO - Viale delle Terme di Caracalla 2,
  ~ Rome - Italy. email: geonetwork@osgeo.org
  -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:geonet="http://www.fao.org/geonetwork"
                xmlns:gn-fn-dcat-ap-for-services="http://geonetwork-opensource.org/xsl/functions/profiles/dcat-ap-for-services"
                exclude-result-prefixes="#all"
                version="2.0">
  <xsl:import href="../../iso19139/process/process-utility.xsl"/>
  <xsl:import href="../layout/utility-vacuum.xsl"/>

  <!-- i18n information -->
  <xsl:variable name="vacuum-loc">
    <msg id="a" xml:lang="eng">Remove empty elements from this record.</msg>
    <msg id="a" xml:lang="fre">Supprimer les éléments vides de cette fiche.</msg>
  </xsl:variable>

  <xsl:template name="list-vacuum">
    <suggestion process="vacuum"/>
  </xsl:template>

  <xsl:template name="analyze-vacuum">
    <xsl:param name="root"/>

    <suggestion process="vacuum" id="{generate-id()}" category="metadata" target="metadata">
      <name><xsl:value-of select="geonet:i18n($vacuum-loc, 'a', $guiLang)"/></name>
      <operational>true</operational>
    </suggestion>
  </xsl:template>

  <xsl:template match="/">
        <xsl:copy-of select="gn-fn-dcat-ap-for-services:vacuum(.)"/>
    </xsl:template>
</xsl:stylesheet>
