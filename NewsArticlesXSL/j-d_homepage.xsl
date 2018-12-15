<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    
    <xsl:template match="/"> 
        <html> 
            <head> 
                <link rel="stylesheet" type="text/css" href="../css/jerusalem_declaration.css" />
                <title>Trump's Jerusalem Declaration</title>
            </head>
   
            
            <header>
               <div> 
                   <a href="../html/j-d_homepage.html"><img src="../images/the-guardian-logo-white.png" alt="The Guardian Logo" style="float:left;width:300px;height:158px"></img>
                   </a>
                   Reports: Donald Trump's Declaration that Jerusalem is Israel's Capital
                   
               </div>
            </header>
            
            <nav>
                <ul>
                    <li><a class="active" href="../html/j-d_homepage.html">Home</a></li>
                    <li><a href="../j-d_say_what.html">Say What?</a></li>
                    <li><a href="../j-d_analysis_by_author.html">Analysis by Author</a></li>
                    <li><a href="../html/j-d_articles-index.html">Index of Articles Analyzed</a></li>
                </ul>
            </nav>
 
            <body>
                
                <div>
                    <h3 class="heading">Home</h3>
                    <p style="font-size:1.5em">Contention and criticism regarding the role of the media in how it reports on certain issues if rife. Both sides of the divide endlessly criticize mainstream media outlets, such as The Guardian newspaper, for the how they cover one issue in particular: the seventy-year Israeli-Palestinian conflict.  The following pages use XML and XSLT to pull out the ways that the recent declaration by US President Donald Trump has been covered by <em>The Guardian</em> newspaper, as well as how leders around the world have responded to his announcement.</p>
                </div>
                
                <h3 class="heading">The articles</h3 >
               
                <xsl:for-each select="articles/article">
                    <xsl:sort select="heading/byline/article-date/date/num-day" data-type="number"/>
                     <table>
                         <tr style="margin:1em">
                        <xsl:for-each select="heading/byline">
                            <xsl:apply-templates select="article-date/date"/>
                        </xsl:for-each><br/>
                        <strong>
                            <a>
                                <xsl:for-each select="heading/headline">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="@src"/>
                                    </xsl:attribute>
                                    <em><xsl:value-of select="sentence"/></em>
                                </xsl:for-each>
                            </a>
                        </strong><br/>
                        by: 
                      <xsl:value-of select="heading/byline/author"/><br/>
                      <xsl:value-of select="bodytext/lead"/></tr>
                     </table>
                </xsl:for-each>
                
                
                
            </body>
            <footer>
                <p>&#169; All Rights Reserved  <a href="https://www.theguardian.com/uk">The Guardian</a></p>
            </footer>
        </html>
    </xsl:template>
    
<!--this template reformats the date into a more readable format; this allowed us to to correctly encode the date, where possible by year, month and day-->
    <xsl:template match="article-date/date"> 
        <xsl:value-of select="weekday/@dayOfWeek"/>,
        <xsl:value-of select="num-day"/>
        <xsl:value-of select="month"/>  
        <xsl:value-of select="year"/>
    </xsl:template>
    
    <!--the image template pulls any images and puts them into an img tag, it also pulls out the the caption and photographer information-->
   <!-- <xsl:template match="image">
        <div>
            <img class="image">
                <xsl:attribute name="src">
                    <xsl:value-of select="@filepath"/>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="@alt"/>
                </xsl:attribute>
            </img><br/>
            <strong> By: <xsl:value-of select="photographer"/><br/>
                <xsl:value-of select="caption"/><br/></strong>
            
        </div>
          
          
    </xsl:template>-->
    
    <xsl:template match="/bodytext/image">
        <div class="container">
            <img class="image">
                <xsl:attribute name="src">
                    <xsl:value-of select="@filepath"/>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="@alt"/>
                </xsl:attribute>
            </img>
            <div class="middle">
                <div class="text">
                    <strong><em><xsl:value-of select="../heading/headline/sentence"/></em> By: <xsl:value-of select="photographer"/><br/>
                <xsl:value-of select="caption"/><br/></strong></div></div>
        </div>
    </xsl:template>
    
    <!--<xsl:template match="headline">
            <xsl:attribute name="href">
                <xsl:value-of select="@src"/>
            </xsl:attribute>
            <xsl:value-of select="@src"/>
            </xsl:template>-->
  
 <!--<xsl:template match="../*/@entityID">
     <xsl:choose>
         <xsl:when test="@entityID= 'usa' ">United States</xsl:when>
         <xsl:when test="@entityID='sdar'">Saudi Arabia</xsl:when>
         <xsl:when test="@entityID='isr'"> Israel</xsl:when>
         <xsl:when test="@entityID='pal'">Palestine/Palestinians</xsl:when>
         <xsl:when test="@entityID='inco'">International Community</xsl:when>
         <xsl:when test="@entityID='turk'">Turkey</xsl:when>
         <xsl:when test="@entityID='chr'">Christian Leaders</xsl:when>
         <xsl:when test="@entityID='jor'">Jordan</xsl:when>
         <xsl:when test="@entityID='mus'">Muslim Leaders</xsl:when>
         <xsl:when test="@entityID='ioc'">Organization of Islamic Cooperation</xsl:when>
         <xsl:when test="@entityID='arb'">Arab League</xsl:when>
         <xsl:when test="@entityID='unga'">United Nations General Assemby</xsl:when>
         <xsl:when test="@entityID='unsc'">United Nations Security Council</xsl:when>
         <xsl:when test="@entityID='rus'">Russia</xsl:when>
         <xsl:when test="@entityID='ham'">Hamas</xsl:when>
         <xsl:when test="@entityID='ft7'">Fatah</xsl:when>
     </xsl:choose>
     </xsl:template>-->
  
</xsl:stylesheet>
