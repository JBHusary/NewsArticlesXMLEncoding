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
                    <li><a href="../j-d_say_what.html">Say What?</a></li>
                    <li><a href="../j-d_analysis_by_author.html">Analysis by Author</a></li>
                    <li><a class="active" href="../html/j-d_articles-index.html">Index of Articles Analyzed</a></li>
                </ul>
            </nav>
 
            <body>
                <div>
                    <!--lists in chronological order, by published date, and links to all the pdf documents analyzed in  jerusalem_declaration.xml-->
                    <table>
                        <tr>
                            <th>Article Title</th>
                            <th>Author</th>
                            <th>Publication Date</th>
                            <th>Desk</th>
                            <th>Wordcount</th>
                            <th>Original Link</th>
                            <th>Access Date (Online)</th>
                        </tr>
                        <xsl:for-each select="articles/article">
                            <xsl:sort select="heading/byline/article-date/date/num-day" data-type="number"/>
                            
                            <tr>
                                <td>
                                    <strong>
                                         <a>
                                             <xsl:for-each select="heading/headline">
                                                 <xsl:attribute name="href">
                                                     <xsl:value-of select="@src"/>
                                                 </xsl:attribute>
                                            <em><xsl:value-of select="sentence"/></em>
                                             </xsl:for-each>
                                         </a>
                                    </strong>
                                </td>

                                <td><xsl:value-of select="heading/byline/author"/></td>
                                <td>
                                   <xsl:for-each select="heading/byline">
                                        <xsl:apply-templates select="article-date/date"/>
                                   </xsl:for-each>
                                </td>
                                <td><xsl:value-of select="heading/desk"/></td>
                                <td><xsl:value-of select="head/wordcount"/></td>
                                <td>
                                    <a>
                                        <xsl:for-each select="head/source">
                                               <xsl:attribute name="href">
                                                   <xsl:value-of select="url"/>
                                               </xsl:attribute>
                                            <xsl:value-of select="url"/>
                                        </xsl:for-each>
                                    </a>
                                </td>
                                
                                <td>
                                    <xsl:value-of select="head/access-date/date/@dd"/>.
                                    <xsl:value-of select="head/access-date/date/@mm"/>.
                                    <xsl:value-of select="head/access-date/date/@yyyy"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
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
    

    <!--here I am trying to create conditional statements to format the values of the value attribute in the <descriptor> tag.  I want to make all text that has value='-1' to be bold and red; and all text with value='1' to be bold and green-->
     <!-- <xsl:template match="descriptor">
          <xsl:choose>
              <xsl:when test="[@value= '-1']">
                  <strong style="color:red"></strong>
              </xsl:when>
          </xsl:choose>
     </xsl:template>-->
    
    <!--<xsl:template match="headline">
            <xsl:attribute name="href">
                <xsl:value-of select="@src"/>
            </xsl:attribute>
            <xsl:value-of select="@src"/>
            </xsl:template>-->
    
 <!--<xsl:template match="@entityID">
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
