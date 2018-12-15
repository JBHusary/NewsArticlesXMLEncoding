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
                </a>Reports: Donald Trump's Declaration that Jerusalem is Israel's Capital
                   
               </div>
            </header>
            
            <nav>
                <ul>
                    <li><a href="../html/j-d_homepage.html">Home</a></li>
                    <li><a clas="active" href="../html/j-d_say-what.html">Say What?</a></li>
                    <li><a href="../html/j-d_analysis-by-author.html">Analysis by Author</a></li>
                    <li><a href="../html/j-d_articles-index.html.html">Index of Articles Analyzed</a></li>
                </ul>
            </nav>
 
            <body>
                <!--This table highlights what different leaders have commented on "the move" by Trump to declare Jerusalem as Israel's capital, it also includes the descriptions for those leaders given by the respective authors; highligting in red, negative reactions; and in green positive reactions by the respective speaker-->                        
                <div> 
                    <xsl:for-each select="articles/article">
                        <xsl:sort select="heading/byline/article-date/date/num-day" data-type="number"/>
                        <table>
                            <tr>
                                <th colspan='3' style="background-color:#004f86"><strong><em><xsl:value-of select="heading/headline"/></em></strong><br></br>
                                    by <xsl:value-of select="heading/byline/author"/><br></br>
                                    
                                    <xsl:for-each select="heading/byline">
                                        <xsl:apply-templates select="article-date/date"/>
                                    </xsl:for-each></th>
                            </tr>
                            <tr>
                                <th>Speaker</th>
                                <th>Representing</th>
                                <th>He said what?</th>
                            </tr>
                            <!--using /*/direct-quote allows me to pull out any and all direct quotes, which are children of different parent elements; I cross-referenced if I was able to get each one with ctrl+F and confirmed the number-->
                            <xsl:for-each select="bodytext/p/sentence/statement/descendant-or-self::direct-quote">
                                <tr>
                                    <!--those making direct-quotes are captured in a sibling level tag, <name> or <person>, both need to be queried to pull out who made the statement--> 
                                    <td>
                                        <xsl:choose>
                                            <xsl:when test="../person">                           
                                                <xsl:value-of select="../person"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="../name"/>   
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <!--I am trying to output the real names representing the various entityID's-->
                                    <td>
                                        <xsl:for-each select="../statement/@entityID">
                                            <!--                                       <xsl:value-of select="."/>-->
                                            <xsl:choose>
                                                <xsl:when test="@entityID='usa' "><xsl:text>United States</xsl:text></xsl:when>
                                                <!--<xsl:when test="[@entityID='sdar]'">Saudi Arabia</xsl:when>
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
                                                    <xsl:when test="@entityID='ft7'">Fatah</xsl:when>-->
                                            </xsl:choose>
                                            
                                            <xsl:apply-templates select="@entityID"/>
                                        </xsl:for-each>
                                    </td>
                                    
                                    <td>
                                        <xsl:value-of select="."/>
                                    </td>
                                    
                                </tr></xsl:for-each>
                        </table>
                    </xsl:for-each>
                </div>

                
                    
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
    
    <!--  <xsl:template match="image">
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
    </xsl:template>-the image template pulls any images and puts them into an img tag, it also pulls out the the caption and photographer information-->
    
      <xsl:template match="image">
        <div>
            <img class="image">
                <xsl:attribute name="src">
                    <xsl:value-of select="@filepath"/>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="@alt"/>
                </xsl:attribute>
            </img>
            <strong> By: <xsl:value-of select="photographer"/><br/>
            <xsl:value-of select="caption"/><br/></strong>
        </div>
    </xsl:template>
    
      <xsl:template match="descriptor">
          <xsl:choose>
              <xsl:when test="@value = '-1'">
                  <strong style="color:red"></strong>
              </xsl:when>
          </xsl:choose>
          
          
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
