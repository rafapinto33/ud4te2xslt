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
		<link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt="Reservas" />
			<a href="tienda.xml">Tienda</a>
			<a href="equipos.xml">Equipos</a>
			<a href="partidos.xml">Partidos</a>
		</header>
		
		<main class="principal">
		
			<xsl:apply-templates select="tienda/articulo"/>

		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>

</xsl:template>	

<xsl:template match="articulo">
	<article>
		<section>
			<xsl:variable name="foto" select="@foto" />
			<img class="articulo" src="../img/{$foto}"/>
		</section>

		<section>
			<h2><xsl:value-of select="precio"/> €</h2>
			<xsl:variable name="contador" select="count(comentarios)" />
			<h3>Comentarios: <xsl:value-of select="$contador"/></h3>
			<ul>
				<xsl:apply-templates select="comentarios"/>
			</ul>
		</section>
	</article>
</xsl:template>

<xsl:template match="comentarios">
	<li><xsl:value-of select="@fecha"/>: <xsl:value-of select="."/></li>
</xsl:template>

</xsl:stylesheet>