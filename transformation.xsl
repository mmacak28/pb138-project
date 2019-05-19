<?xml version = "1.0" encoding = "UTF-8"?>
<xsl:stylesheet version = "1.0"
                xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/profile">
        <html>

            <head>
                <title><xsl:apply-templates select="title"/></title>
                <meta http-equiv="Content-Style-Type" content="text/css" />
                <link rel="stylesheet" href="styling.css" type="text/css" media="screen" />
            </head>

            <body>
                
                <div class="navigation">
                    <ul>
                        <li><b><a href="index.html">HOME</a></b></li>
                        <li><a href="ACCOUNT_MANAGER_ROLE.html">ACCOUNT MANAGER</a></li>
                        <li><a href="BUSINESS_ANALYST_ROLE.html">BUSINESS ANALYST</a></li>
                        <li><a href="BUSINESS_INFORMATION_MANAGER_ROLE.html">BUSINESS INFORMATION MANAGER</a></li>
                        <li><a href="CHIEF_INFORMATION_OFFICER_(CIO)_ROLE.html">CHIEF INFORMATION OFFICER (CIO)</a></li>
                        <li><a href="DATA_ADMINISTRATOR_ROLE.html">DATA ADMINISTRATOR</a></li>
                        <li><a href="DATA_SCIENTIST_ROLE.html">DATA SCIENTIST</a></li>
                        <li><a href="DATA_SPECIALIST_ROLE.html">DATA SPECIALIST</a></li>
                        <li><a href="DEVELOPER_ROLE.html">DEVELOPER</a></li>
                        <li><a href="DEVOPS_EXPERT_ROLE.html">DEVOPS EXPERT</a></li>
                        <li><a href="DIGITAL_CONSULTANT_ROLE.html">DIGITAL CONSULTANT</a></li>
                        <li><a href="DIGITAL_EDUCATOR_ROLE.html">DIGITAL EDUCATOR</a></li>
                        <li><a href="DIGITAL_MEDIA_SPECIALIST_ROLE.html">DIGITAL MEDIA SEPCIALIST</a></li>
                        <li><a href="DIGITAL_TRANSFORMATION_LEADER_ROLE.html">DIGITAL TRANSFORMATION LEADER</a></li>
                        <li><a href="ENTERPRISE_ARCHITECT_ROLE.html">ENTERPRISE ARCHITECT</a></li>
                        <li><a href="ICT_OPERATIONS_MANAGER_ROLE.html">ICT OPERATIONS MANAGER</a></li>
                        <li><a href="INFORMATION_SECURITY_MANAGER_ROLE.html">INFORMATION SECURITY MANAGER</a></li>
                        <li><a href="INFORMATION_SECURITY_SPECIALIST_ROLE.html">INFORMATION SECURITY SPECIALIST</a></li>
                        <li><a href="NETWORK_SPECIALIST_ROLE.html">NETWORK SPECIALIST</a></li>
                        <li><a href="PRODUCT_OWNER.html">PRODUCT OWNER</a></li>
                        <li><a href="PROJECT_MANAGER_ROLE.html">PROJECT MANAGER</a></li>
                        <li><a href="QUALITY_ASSURANCE_MANAGER_ROLE.html">QUALITY ASSURANCE MANAGER</a></li>
                        <li><a href="SCRUM_MASTER_ROLE.html">SCRUM MASTER</a></li>
                        <li><a href="SERVICE_MANAGER_ROLE.html">SERVICE MANAGER</a></li>
                        <li><a href="SERVICE_SUPPORT_ROLE.html">SERVICE SUPPORT</a></li>
                        <li><a href="SOLUTION_DESIGNER_ROLE.html">SOLUTION DESIGNER</a></li>
                        <li><a href="SYSTEMS_ADMINISTRATOR_ROLE.html">SYSTEMS ADMINISTRATOR</a></li>
                        <li><a href="SYSTEMS_ANALYST_ROLE.html">SYSTEMS ANALYST</a></li>
                        <li><a href="SYSTEMS_ARCHITECT_ROLE.html">SYSTEMS ARCHITECT</a></li>
                        <li><a href="TECHNICAL_SPECIALIST_ROLE.html">TECHNICAL SPECIALIST</a></li>
                        <li><a href="TEST_SPECIALIST_ROLE.html">TEST SPECIALIST</a></li>
                    </ul>
                </div>

                <div class="main">
                    <h1>
                    <xsl:apply-templates select="title"/>
                    </h1>
                    <h2>Summary</h2>
                    <p><xsl:value-of select="summary"/></p>
                    <h2>Mission</h2>
                    <xsl:apply-templates select="mission"/>
                    <h2>Deliverables</h2>
                    <xsl:apply-templates select="deliverables"/>
                    <h2>Tasks</h2>
                    <xsl:apply-templates select="tasks"/>
                    <h2>Competences</h2>
                    <xsl:apply-templates select="competences"/>
                    <h2>Key Performance Indicator Area</h2>
                    <p><xsl:value-of select="kpi"/></p>
                </div>

            </body>

        </html>
    </xsl:template>

    <xsl:template match="title">
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="mission">
        <p><xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="deliverables">
        <xsl:apply-templates select="accountable"/>
        <xsl:apply-templates select="responsible"/>
        <xsl:apply-templates select="contributor"/>
    </xsl:template>

    <xsl:template match='accountable'>
        <h4>Accountable</h4>
        <ul>
            <xsl:apply-templates select="deliverable"/>
        </ul>
    </xsl:template>

    <xsl:template match='responsible'>
        <h4>Responsible</h4>
        <ul>
            <xsl:apply-templates select="deliverable"/>
        </ul>
    </xsl:template>

    <xsl:template match='contributor'>
        <h4>Contributor</h4>
        <ul>
            <xsl:apply-templates select="deliverable"/>
        </ul>
    </xsl:template>

    <xsl:template match="deliverable">
        <li><xsl:value-of select="."/></li>
    </xsl:template>

    <xsl:template match='tasks'>
        <ul>
            <xsl:apply-templates select="task"/>
        </ul>
    </xsl:template>

    <xsl:template match="task">
        <li><xsl:value-of select="."/></li>
    </xsl:template>

    <xsl:template match="competences">
        <table>
            <tr>
                <th>Competence</th>
                <th>Level</th>
            </tr>
            <xsl:apply-templates select="competence"/>
        </table>
    </xsl:template>

    <xsl:template match="competence">
        <tr>
            <td><xsl:value-of select="."/></td>
            <td><xsl:value-of select="./@level"/><xsl:apply-templates select="competence"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>