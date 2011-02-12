<cfcomponent hint="I am the system settings function" output="false">

	<!--- Author: Rafe - Date: 10/4/2009 --->
	<cffunction name="getSystemSettings" output="false" access="public" returntype="query" hint="I return the settings for the system">

		<cfset var getSystemSettings = "" />

		<cfquery name="getSystemSettings" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT TOP(1) sys_approval, sys_buildNumber, sys_metaDescription, sys_metaKeywords, sys_pageTitle, sys_cta1, sys_cta2, sys_cta3, sys_cta4
			FROM systemSettings
			ORDER BY sys_id DESC
		</cfquery>

		<cfreturn getSystemSettings />

	</cffunction>

	<!--- Author: Rafe - Date: 10/4/2009 --->
	<cffunction name="systemSettingsSave" output="false" access="public" returntype="any" hint="I save the systems settings">

		<cfargument name="sys_approval" type="boolean" default="0" required="false" />

		<cfset var deleteSystemSettings = "" />
		<cfset var addSystemSettings = "" />

		<cftransaction>

			<cfquery name="deleteSystemSettings" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				DELETE FROM systemSettings
			</cfquery>

			<cfquery name="addSystemSettings" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				INSERT INTO systemSettings (
					sys_approval,
					sys_buildNumber,
					sys_pageTitle,
					sys_metaDescription,
					sys_metaKeywords,
					sys_cta1,
					sys_cta2,
					sys_cta3,
					sys_cta4
				) VALUES (
					<cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.sys_approval#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_decimal" value="#arguments.sys_buildNumber#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.sys_pageTitle#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.sys_metaDescription#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.sys_metaKeywords#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.sys_cta1#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.sys_cta2#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.sys_cta3#" list="false" />,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.sys_cta4#" list="false" />
				)
			</cfquery>

		</cftransaction>

	</cffunction>

	<!--- Author: Rafe - Date: 10/12/2009 --->
	<cffunction name="countrySave" output="false" access="public" returntype="any" hint="I save details for a country and return the country ID">

		<cfargument name="cou_title" type="string" default="" required="true" />

		<cfset var checkCountryExists = "" />
		<cfset var addCountry = "" />
		<cfset var countryID = "" />

		<cfquery name="checkCountryExists" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
			SELECT cou_id
			FROM country
			WHERE cou_title = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.cou_title#" list="false" />
		</cfquery>

		<cfif not checkCountryExists.recordCount>
			<cfquery name="addCountry" datasource="#application.DBDSN#" username="#application.DBUserName#" password="#application.DBPassword#">
				INSERT INTO country (
					cou_title
				) VALUES (
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.cou_title#" list="false" />
				)
				SELECT SCOPE_IDENTITY() AS countryID
			</cfquery>

			<cfset countryID = addCountry.countryID />
		<cfelse>

			<cfset countryID = checkCountryExists.cou_id />

		</cfif>

		<cfreturn countryID />

	</cffunction>

	<!--- Author: rafe - Date: 2/24/2010 --->
	<cffunction name="generateXMLSiteMap" output="false" access="public" returntype="string" hint="I generate and write the sitemap.xml file to disk, then return the xml to the page for viewing">
		
		<cfset var xmlSiteMap = "" />
		<cfset var qSiteContent = application.contentObj.getAllContent(approved=1,menuArea="1,12") />
		
		<cfset var siteMap = "" />
		
		<cfsaveContent variable="siteMap">
			<cfoutput>
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
<cfloop query="qSiteContent">
   <url>
      <loc><cfif con_type is "Content" and not len(con_fuseAction)>http://www.balisentosa.com/index.cfm?fuseaction=content.display&amp;page=#con_sanitise#<cfelseif con_type is "Content" and len(con_fuseAction)>http://www.balisentosa.com/index.cfm?fuseaction=#con_fuseAction#&amp;page=#con_sanitise#<cfelseif con_type is "Link">#con_link#</cfif></loc>
      <lastmod>#dateFormat(now(),"yyyy-mm-dd")#</lastmod>
      <changefreq>weekly</changefreq>
   </url>
</cfloop>
</urlset>
			</cfoutput>
		</cfsaveContent>
		
		<cffile action="write" file="#application.path#sitemap.xml" output="#trim(siteMap)#" />
	
		<cfsaveContent variable="xmlSiteMap">
			<cfoutput>
				<textarea style="width:600px;height: 400px">#trim(siteMap)#</textarea>
			</cfoutput>
		</cfsaveContent>
		
		<cfreturn xmlSiteMap />
		
	</cffunction>

	<cffunction name="generateExcelFromQuery" access="public" returntype="string">

		<cfargument name="myQuery" type="query" required="yes">
		<cfargument name="orderedColumnList" type="string" default="#arguments.myQuery.columnList#">
		<cfargument name="FileName" type="String" required="no" default="excelFromQuery">
		<cfargument name="IDCardsExport" required="no" default=0>

		<cfset var tmpContent = "" />
		<cfset var qryData = arguments.myQuery>
		<cfset var tabChar = chr(9)>
   		<cfset var newLine = chr(13) & chr(10)>
		<cfset var curColVal = '' />
		<cfset var i = '' />

		<cfsetting showdebugoutput="false">
		<cfprocessingdirective suppressWhiteSpace = "Yes">

			<!--- loop over query and set up in tab delims with cfsavecontent --->
			<cfsavecontent variable="tmpContent">
				<cfloop list="#arguments.orderedColumnList#" index="i">
	       	    	<cfoutput>#i##tabChar#</cfoutput>
	       		</cfloop>
	       		<cfoutput>#newLine#</cfoutput>

	       		<cfloop query="qryData">
	   	    		<cfloop list="#arguments.orderedColumnList#" index="i">
	   	        		<cfset curColVal = Evaluate("qryData." & Trim(i))>
	   	        		<cfif left(curColVal,1) is "-" and len(curColVal) gt 1>
	   	        			<cfset curColVal = right(curColVal,len(curColVal)-1) />
	   	        		</cfif>
	   	       			<cfoutput>#replace(curColVal, newLine, " ", "all")#</cfoutput>
	   	        		<cfoutput>#tabChar#</cfoutput>
	       	   		</cfloop>
	       	   		<cfoutput>#newLine#</cfoutput>
				</cfloop>
			</cfsavecontent>

			<!--- search for , if we find one .......  --->
			<!--- <cfset tmpContent = Replace(tmpContent,",","�","all")> --->
			<cfset tmpContent = Replace(tmpContent,","," ","all")>
			<!--- then replace all tabs with , --->
			<cfset tmpContent = Replace(tmpContent,tabChar,",","all")>

			<!--- write to file and push to browser --->
			<cffile action="write"
	             file="#application.downloadpath##arguments.FileName#-#dateformat(now(), 'mmddyy')#.csv"
	             output="#tmpContent#"
	             addnewline="yes">

		    <cfif arguments.IDCardsExport eq 0>

			    <cfheader name="Content-Disposition" value="filename=#arguments.FileName#-#dateformat(now(), 'mmddyy')#.csv">
				<cfcontent type="application/excel" file="#application.downloadpath##arguments.FileName#-#dateformat(now(), 'mmddyy')#.csv">

			</cfif>

		</cfprocessingdirective>
		
	</cffunction>
		
</cfcomponent>