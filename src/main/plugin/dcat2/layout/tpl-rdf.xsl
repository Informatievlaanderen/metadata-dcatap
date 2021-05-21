<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://saxon.sf.net/"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:dcat="http://www.w3.org/ns/dcat#"
                xmlns:foaf="http://xmlns.com/foaf/0.1/"
                extension-element-prefixes="saxon"
                exclude-result-prefixes="#all">
  <!--
    Create reference block to metadata record and dataset to be added in dcat:Catalog usually.
  -->
  <xsl:template match="rdf:RDF" mode="record-reference">
    <xsl:copy-of select="dcat:Catalog/dcat:record"/>
    <dcat:dataset rdf:resource="{dcat:Catalog/dcat:record/dcat:CatalogRecord/foaf:primaryTopic/@rdf:about}"/>
  </xsl:template>
  <!--
    Create metadata block with root element dcat:Dataset.
  -->
  <xsl:template match="rdf:RDF" mode="to-dcat">
    <xsl:copy-of select="dcat:Catalog/dcat:record/dcat:CatalogRecord"/>
    <xsl:copy-of select="dcat:Catalog/dcat:dataset/dcat:Dataset|dcat:Catalog/dcat:service/dcat:DataService"/>
  </xsl:template>

  <xsl:template match="rdf:RDF" mode="references"/>
  <xsl:template mode="rdf:RDF" match="gui|request|metadata"/>
</xsl:stylesheet>
