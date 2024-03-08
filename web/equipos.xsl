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
			<xsl:variable name="entrenador" select="'Julio Velasco'"/>

			<xsl:variable name="link" select="equipo/entrenador[nombre=$entrenador]/url"/>
			<h1><a href="{$link}"><xsl:value-of select="equipo/entrenador[nombre=$entrenador]/nombre"/></a></h1>
			
			<xsl:apply-templates select="equipo[entrenador/nombre=$entrenador]"/>

		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>

</xsl:template>

<xsl:template match="equipo">

	<article class="equipos">
		<h4><xsl:value-of select="nombre"/></h4>
		<xsl:apply-templates select="jugadores/jugador">
			<xsl:sort select="@camiseta" order="ascending" data-type="number"/>
		</xsl:apply-templates>
	</article>	
</xsl:template>

<xsl:template match="jugador">
	<p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>
</xsl:template>

</xsl:stylesheet>