<?xml version="1.0" encoding="utf-8"?>

<!--
Autor: Rafael Pinto Andrades
Asignatura: LMGSI
Unidad: UD 4
Tarea: Tarea evaluativa 2 - XSLT
Fecha: 2024-03-08
El objetivo de esta tarea es utilizar el lenguaje XPath y el estandar XSLT para transformar 
un sitio web de manera que obtenga los datos visualizados de un documento XML que representa 
información sobre las secciones de un Club de voleibol.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output encoding="utf-8" method="html" doctype-system="about:legacy-compat"/>

<xsl:template match="/club_voleibol">

<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="tienda.xml">Tienda</a>
			<a href="equipos.xml">Equipos</a>
			<a href="partidos.xml">Partidos</a>
		</header>
		
		<main>
			<h1>PARTIDOS</h1>
			<table>
				<tr>
					<th>PARTIDO</th>
					<th>FECHA</th>
					<th>RESULTADO</th>
				</tr>
				<xsl:apply-templates select="partido[lugar/@ciudad='Lima']">
					<xsl:sort select="fecha" order="descending"/>
				</xsl:apply-templates>
			</table>			
		</main>
		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>

</xsl:template>

<xsl:template match="partido">
	<tr>
		<td><xsl:value-of select="equipos/local"/> -  <xsl:value-of select="equipos/visitante"/></td>
		<td><xsl:value-of select="fecha" /></td>

		<xsl:variable name="puntosLocal" select="equipos/local/@puntuacion"/>
		<xsl:variable name="puntosVisitante" select="equipos/visitante/@puntuacion"/>

		<xsl:choose>
			<xsl:when test="$puntosVisitante &gt; $puntosLocal">
				<td class="azul"><xsl:value-of select="$puntosLocal"/> -  <xsl:value-of select="$puntosVisitante"/></td>
			</xsl:when>
			<xsl:otherwise>
				<td><xsl:value-of select="$puntosLocal"/> -  <xsl:value-of select="$puntosVisitante"/></td>
			</xsl:otherwise>
		</xsl:choose>
	</tr>
</xsl:template>

</xsl:stylesheet>