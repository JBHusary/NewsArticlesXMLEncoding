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
                    <li><a  href="../html/j-d_homepage.html">Home</a></li>
                    <li><a href="../j-d_say_what.html">Say What?</a></li>
                    <li><a class="active" href="../j-d_analysis_by_author.html">Analysis by Author</a></li>
                    <li><a href="../html/j-d_articles-index.html">Index of Articles Analyzed</a></li>
                </ul>
            </nav>
 
            <body>
                
                <div> 
                    <table>
                        <tr>
                            <th>Article Title</th>
                            <th>Author</th>
                            <th>Date</th>
                            <th>Article Type</th>
                            <th>Number of Sentences</th>
                            <th colspan="8">Sentence Type</th></tr>
                        <tr>
                            <td colspan="5"></td>
                            <td><strong><em>fact</em></strong></td>
                            <td><strong><em>speculation</em></strong></td>
                            <td><strong><em>observation</em></strong></td>
                            <td><strong><em>opinion</em></strong></td>
                            <td><strong><em>summary</em></strong></td>
                            <td><strong><em>query</em></strong></td>
                            <td><strong><em>statement</em></strong></td>
                            <td><strong><em>analysis</em></strong></td>
                        </tr>
                        
                        <xsl:for-each select="articles/article">
                            <xsl:sort select="heading/byline/article-date/date/num-day" data-type="number"/>
                                <tr>
                                    <td>
                                        <strong><em><xsl:value-of select="heading/headline"/></em></strong>
                                    </td>
                                    <td><xsl:value-of select="heading/byline/author"/></td>
                                    <td>
                                        <xsl:for-each select="heading/byline">
                                            <xsl:apply-templates select="article-date/date"/>
                                        </xsl:for-each>
                                    </td>
                                    <td><xsl:value-of select="./@article-type"/></td>
                                    
                                    
                                    <!--here I have pulled all the instances in which the author the article describes, in their own words, the issue and or status of Jerusalem, using the descriptor tags and respective valuses-->
                                    
                                    <td>
                                        <xsl:value-of select="count(bodytext/p/sentence/@topic)"/>  
                                    </td>
                                    
                 
                                        <td><xsl:value-of select="count(bodytext/p/sentence[@topic='fact'])"/></td>
                                        <td><xsl:value-of select="count(bodytext/p/sentence[@topic='speculation'])"/></td>
                                        <td><xsl:value-of select="count(bodytext/p/sentence[@topic='observation'])"/></td>           
                                                <td><xsl:value-of select="count(bodytext/p/sentence[@topic='opinion'])"/></td>
                                        <td><xsl:value-of select="count(bodytext/p/sentence[@topic='summary'])"/></td>
                                       <td> <xsl:value-of select="count(bodytext/p/sentence[@topic='query'])"/></td>
                                        <td><xsl:value-of select="count(bodytext/p/sentence[@topic='statement'])"/></td>
                                        <td><xsl:value-of select="count(bodytext/p/sentence[@topic='analysis'])"/></td>


                                    <!--<td>
                                        <xsl:value-of select="bodytext/p/sentence/*/person/jobtitle"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="bodytext/p/sentence/*/person/descriptor"/>
                                    </td>-->
                                    
                                </tr>                        
                        </xsl:for-each>
                    </table>
                </div>

                
<!--this table pulls out the different ways the issue of the status of Jerusalem (issueID="jer") has been described by the various authors of the analyzed articles-->
                <div> 
                    <table>
                        <tr>
                            <th>Article Title</th>
                            <th>Author</th>
                            <th>Date</th>
                            <th colspan="3">How an author characterized the Issue or status of Jerusalem</th>
                        </tr>
                        <tr>
                            <td colspan="3"></td>
                            <td><strong><em>Negatively Connotation</em></strong></td>
                            <td><strong><em>Neutral Connotation</em></strong></td>
                            <td><strong><em>Positive Connotation</em></strong></td>
                        </tr>
                        
                        <xsl:for-each select="articles/article">
                            <xsl:sort select="heading/byline/article-date/date/num-day" data-type="number"/>
                            <xsl:if test="bodytext/p/sentence/descendant-or-self::issue[@issueID='jer']">
                            
                            <tr>
                                <td>
                                    <strong><em><xsl:value-of select="heading/headline"/></em></strong>
                                </td>
                                <td><xsl:value-of select="heading/byline/author"/></td>
                                <td>
                                    <xsl:for-each select="heading/byline">
                                        <xsl:apply-templates select="article-date/date"/>
                                    </xsl:for-each>
                                </td>
                                <!--here I have pulled all the instances in which the author the article describes, in their own words, the issue and or status of Jerusalem, using the descriptor tags and respective valuses-->
                        

                                    <td>
                                    <xsl:value-of select="bodytext/p/sentence/descendant-or-self::issue[@issueID='jer']/descriptor[@value='-1']"/>
                                </td>

                                <td>
                                <xsl:value-of select="bodytext/p/sentence/descendant-or-self::issue[@issueID='jer']/descriptor[@value='0']"/>

                                </td>
                                <td>
                                <xsl:value-of select="bodytext/p/sentence/descendant-or-self::issue[@issueID='jer']/descriptor[@value='1']"/>
                                </td>

                            </tr>
                            </xsl:if>
                        </xsl:for-each>
                    </table>
                </div>
                
                <div> 
                    <table>
                        <tr>
                            <th>Article Title</th>
                            <th>Author</th>
                            <th>Date</th>
                            <th colspan="3">How the author characterizes various leaders</th></tr>
                        <tr>
                            <td colspan="3"></td>
                            <td><strong><em>World Leader</em></strong></td>
                            <td><strong><em>Jobtitle</em></strong></td>
                            <td><strong><em>Characterized as</em></strong></td>
                        </tr>
                        
                        <xsl:for-each select="articles/article">
                            <xsl:sort select="heading/byline/article-date/date/num-day" data-type="number"/>
                            <xsl:if test="bodytext/p/sentence/*/person/descriptor">
                                <tr>
                                    <td>
                                        <strong><em><xsl:value-of select="heading/headline"/></em></strong>
                                    </td>
                                    <td><xsl:value-of select="heading/byline/author"/></td>
                                    <td>
                                        <xsl:for-each select="heading/byline">
                                            <xsl:apply-templates select="article-date/date"/>
                                        </xsl:for-each>
                                    </td>

                                    <!--here I have pulled all the instances in which the author the article describes, in their own words, the issue and or status of Jerusalem, using the descriptor tags and respective valuses-->

                                     <td>
                                         <!--for some reason one of the entries is not working with the below script despite the scripting in the xml document to be the same for each, ie having only one first-level tag.  -->
                                         <xsl:value-of select="bodytext/p/sentence/*/person/fullname"/>
                                         <!--<xsl:choose>
                                             <xsl:when test="bodytext/p/sentence/*/person/fullname">                           
                                                 <xsl:value-of select="bodytext/p/sentence/*/person/fullname"/>
                                             </xsl:when>
                                             <xsl:when test="bodytext/p/sentence/*/person/firstname">                           
                                                 <xsl:value-of select="bodytext/p/sentence/*/person/firstname"/>
                                             </xsl:when>
                                         </xsl:choose>-->
                                     </td>
                                    <td>
                                        <xsl:value-of select="bodytext/p/sentence/*/person/jobtitle"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="bodytext/p/sentence/*/person/descriptor"/>
                                    </td>
                                    
                                </tr>
                            </xsl:if>
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
    
    <xsl:template match="person">
        <xsl:choose>
            <xsl:when test="./fullname">
                <xsl:value-of select="./fullname"/>
            </xsl:when>
            <xsl:when test="./firstname">
                <xsl:value-of select="./firstname"/>
            </xsl:when>
            

                <xsl:when test="../person/fullname">                           
                    <xsl:value-of select="../person/fullname"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="../name"/>   
                </xsl:otherwise>
            </xsl:choose>
    </xsl:template>
  
</xsl:stylesheet>
