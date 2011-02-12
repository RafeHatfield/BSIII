<cfcomponent extends="fusebox5.Application" output="false">

	<!--- set application name based on the directory path --->
	<cfset this.name = "bs3Live_iv" />

	<!--- enable debugging --->
	<cfif listFind(cgi.SERVER_NAME,'local','.')>
		<cfset FUSEBOX_PARAMETERS.debug = true />
		<cfset FUSEBOX_PARAMETERS.mode = "development-full-load" />
	</cfif>

	<cfparam name="application.seoURL" default="0" />

	<cfif application.seoURL>

		<cfset FUSEBOX_PARAMETERS.queryStringStart ="/" /><!---  // default: ? --->
		<cfset FUSEBOX_PARAMETERS.queryStringSeparator ="/" /><!---  // default: & --->
		<cfset FUSEBOX_PARAMETERS.queryStringEqual = "/" /><!---  // default: = --->

	</cfif>

	<!--- force the directory in which we start to ensure CFC initialization works: --->
	<cfset FUSEBOX_CALLER_PATH = getDirectoryFromPath(getCurrentTemplatePath()) />

	<cffunction name="onApplicationStart" returntype="boolean" output="false" access="public" hint="I am executed when the application starts">

		<cfset super.onApplicationStart() />

		<!--- development --->
		<cfif listFindNoCase(cgi.SERVER_NAME,"local",".")>
			
			<cfset application.baseURL = "http://local.bsiii.local/" />
			<cfset application.DBDSN = "bsiiiDSN" />
			<cfset application.DBUserName = "sa" />
			<cfset application.DBPassword = "g3t0ut" />

			<cfset application.reservationObj = createObject( 'component', 'bsiii.com.reservation' ) />
			<cfset application.menuObj = createObject( 'component', 'bsiii.com.menu' ) />
			<cfset application.villaObj = createObject( 'component', 'bsiii.com.villa' ) />
			<cfset application.contentObj = createObject( 'component', 'bsiii.com.content' ) />
			<cfset application.imageObj = createObject( 'component', 'bsiii.com.image' ) />
			<cfset application.newsObj = createObject( 'component', 'bsiii.com.news' ) />
			<cfset application.memberObj = createObject( 'component', 'bsiii.com.member' ) />
			<cfset application.contactObj = createObject( 'component', 'bsiii.com.contact' ) />
			<cfset application.ctaObj = createObject( 'component', 'bsiii.com.cta' ) />
			<cfset application.systemObj = createObject( 'component', 'bsiii.com.system' ) />

			<cfset application.googleKey = "ABQIAAAA-QoBVtFL2SWaVJEUzeBfOhQJLuVn3Ux9oH1j6jq0GYjiiOg28hTdK3CPeawgUijlW6NAsehdK4k6RA" />

			<cfset application.online = "0" />


		<cfelseif listFindNoCase(cgi.SERVER_NAME,"asianvhm",".") AND NOT listFindNoCase(cgi.SERVER_NAME,"balisentosa",".")>

			<cfset application.baseURL = "http://www.asianvhm.com/balisentosa/" />
			<cfset application.DBDSN = "avhmDSN" />
			<cfset application.DBUserName = "avhm" />
			<cfset application.DBPassword = "myVilla5" />

			<cfset application.reservationObj = createObject( 'component', 'sentosaH197792.com.reservation' ) />
			<cfset application.menuObj = createObject( 'component', 'sentosaH197792.com.menu' ) />
			<cfset application.villaObj = createObject( 'component', 'sentosaH197792.com.villa' ) />
			<cfset application.contentObj = createObject( 'component', 'sentosaH197792.com.content' ) />
			<cfset application.imageObj = createObject( 'component', 'sentosaH197792.com.image' ) />
			<cfset application.newsObj = createObject( 'component', 'sentosaH197792.com.news' ) />
			<cfset application.memberObj = createObject( 'component', 'sentosaH197792.com.member' ) />
			<cfset application.contactObj = createObject( 'component', 'sentosaH197792.com.contact' ) />
			<cfset application.ctaObj = createObject( 'component', 'sentosaH197792.com.cta' ) />
			<cfset application.systemObj = createObject( 'component', 'sentosaH197792.com.system' ) />

			<cfset application.googleKey = "ABQIAAAA-QoBVtFL2SWaVJEUzeBfOhThXwDjVDH96rWIUZNBUUHFNxydUxRicd42qKdHfHFAPAHREPaexotF-A" />

			<cfset application.online = "0" />


		<cfelse>

		<!--- live --->
			<cfset application.baseURL = "http://www.balisentosa.com/" />
			<cfset application.DBDSN = "bSentosaDSNIII" />
			<cfset application.DBUserName = "bSentosa" />
			<cfset application.DBPassword = "mySent0sa" />

			<cfset application.reservationObj = createObject( 'component', 'sentosaH198951.com.reservation' ) />
			<cfset application.menuObj = createObject( 'component', 'sentosaH198951.com.menu' ) />
			<cfset application.villaObj = createObject( 'component', 'sentosaH198951.com.villa' ) />
			<cfset application.contentObj = createObject( 'component', 'sentosaH198951.com.content' ) />
			<cfset application.imageObj = createObject( 'component', 'sentosaH198951.com.image' ) />
			<cfset application.newsObj = createObject( 'component', 'sentosaH198951.com.news' ) />
			<cfset application.memberObj = createObject( 'component', 'sentosaH198951.com.member' ) />
			<cfset application.contactObj = createObject( 'component', 'sentosaH198951.com.contact' ) />
			<cfset application.systemObj = createObject( 'component', 'sentosaH198951.com.system' ) />
			<cfset application.ctaObj = createObject( 'component', 'sentosaH198951.com.cta' ) />

			<!--- this key is for balisentosa.asianvhm.com --->
			<!--- <cfset application.googleKey = "ABQIAAAA-QoBVtFL2SWaVJEUzeBfOhT6Z1grzXIAr9CQeNPy8sD9XSooIRQMBdAmeetYxNgvVBuf3f_8TtmraA" /> --->

			<!--- this key is for balisentosa.com --->
			 <cfset application.googleKey = "ABQIAAAA-QoBVtFL2SWaVJEUzeBfOhTS8gIRkLWfri5g5T6L0prp3QLYWBTpoQrbzNuhk3JfMOCFxzAS84ZERQ" />

			<cfset application.online = "1" />

		</cfif>

		<cfset application.flashPath = "assets/flash/" />
		<cfset application.imagePath = "assets/images/upload/" />
		<cfset application.imagePathBase = "assets/images/" />
		<cfset application.path = ExpandPath('/')>
		<cfset application.imageUploadPath = application.path & "assets\images\upload\" />
		<cfset application.flashUploadPath = application.path & "assets\flash\" />

		<cfset application.feedbackEmail = "info@balisentosa.com" />
		<cfset application.reservationEmail = "reservations@balisentosa.com" />
		<cfset application.adminEmail = "rafe@asianvhm.com" />

		<cfset application.appInitialized = true />

		<cfset application.systemSettings = application.systemObj.getSystemSettings() />
		
		<cfreturn True />

	</cffunction>

	<cffunction name="onFuseboxApplicationStart">

		<cfset super.onFuseboxApplicationStart() />

		<!--- code formerly in fusebox.appinit.cfm or the appinit global fuseaction --->
		<cfset myFusebox.getApplicationData().startTime = now() />

	</cffunction>

	<cffunction name="onRequestStart" returntype="boolean" output="false" access="public" hint="I am executed at the atart of each request">

		<cfargument name="targetPage" />

		<cfset super.onRequestStart(argumentCollection=arguments) />

		<cfif StructKeyExists(URL, "appReload")>
			<!--- reinitialise the application scope --->
			<cfset onApplicationStart() />
		</cfif>
<!--- We are currently doing a site upgrade.  Please check back shortly!
<!-- <cfdump var="#application.DBDSN#"> --><cfabort> --->

		<!--- if we are not on a development server and a www. is not prefixed into the url --->
<!--- 		<cfif not ReFind("(\.local)$", cgi.http_host) and not ReFind("^www\.", cgi.http_host)>

				<cfset urlloc = "http://www." & cgi.http_host & ReReplace(cgi.script_name, "Index\.cfm$", "") & iif(Len(Trim(cgi.query_string)), de("?"&cgi.query_string), de(""))>

				<cflocation url="#urlloc#" addtoken="no" statusCode="301" />

		</cfif> --->

		<!--- these vars are used in the layout files --->
		<cfparam name='request.styleSheetList' default='' />
		<cfparam name='request.jsList' default='' />
		<cfparam name='request.bodyParams' default='' />
		<cfparam name='request.footerJS' default='' />

		<cfset request.pathInfo = cgi.script_name & cgi.path_info />

		<cfset request.TinyMCEIncluded = "false" />
		<cfset request.url = "http://" & cgi.http_host />
		<cfset request.fullURL = request.url & cgi.script_name & "?" & cgi.query_string />

		<!--- get the page content, store it in a request var for later use --->
		<cfparam name="attributes.page" default="" />

		<cfif not len(attributes.page)>
			<cfset request.qContent = application.contentObj.getContent(fuseAction=attributes.fuseAction) />
			<cfif not request.qContent.recordCount>
				<cfset attributes.page = "home" />
				<cfset request.qContent = application.contentObj.getContent(page=attributes.page) />
			</cfif>
		<cfelse>
			<cfset request.qContent = application.contentObj.getContent(page=attributes.page) />
		</cfif>
		
		<cfset request.qContentImages = application.imageObj.getContentImagesWeb(con_id=val(request.qContent.con_id)) />

		<cfif not request.qContentImages.recordCount>
			<cfset request.qContentImages = application.contentObj.getGloryBoxesDefault(gbx_active=1, gbx_type='Image') />
		</cfif>

		<cfif len(request.qContent.con_title)>
			<cfset request.pageTitle = "Sentosa Private Villas and Spa, Bali" & ' - ' & request.qContent.con_title />
		<cfelse>
			<cfset request.pageTitle = "Sentosa Private Villas and Spa, Bali" & ' - ' & application.systemSettings.sys_pageTitle />
		</cfif>

		<cfif len(request.qContent.con_metaDescription)>
			<cfset request.metaDescription = request.qContent.con_metaDescription />
		<cfelse>
			<cfset request.metaDescription = application.systemSettings.sys_metaDescription />
		</cfif>

		<cfif len(request.qContent.con_metaKeywords)>
			<cfset request.metaKeywords = request.qContent.con_metaKeywords />
		<cfelse>
			<cfset request.metaKeywords = application.systemSettings.sys_metaKeywords />
		</cfif>

		<cfif isDefined("attributes.newsletterSave")>
			<cfset request.checkNewsLetterSave = application.contactObj.miniNewsLetterSave(attributes.newsLetterEmail) />
			<!--- <cfset request.checkNewsLetterSave = "1" /> --->
		<cfelse>
			<cfset request.checkNewsLetterSave = "0" />
		</cfif>
		
		<cfif request.checkNewsLetterSave is 1>
			<cflocation url="#request.myself#content.display&page=newsletter-thanks" />
		</cfif>

		<cfparam name="attributes.languageChange" default="" />
		
		<cfif len(attributes.languageChange) gt 0>
			<cflocation url="#attributes.languageChange#" />
		</cfif>
		
		<cfset request.GloryBoxMessage = application.contentObj.getGloryMessage() />
		
		<cfset request.fuseAction = attributes.fuseAction />
		
		<cfreturn True />

	</cffunction>

	<cffunction name="onRequestEnd" returntype="void" output="true" access="public" hint="I am executed when all pages in the request have finished processing">

		<cfargument name="targetPage" />
		<!--- Pass request to Fusebox. --->
		<cfset super.onRequestEnd(arguments.targetPage) />

	</cffunction>
	
	<cffunction name="onError">

		<cfargument name="Exception" required="true" />
		<cfargument name="EventName" type="String" required="true" />
		<!--- <cfargument name="errorTemplate" type="string" default="" required="true" /> --->
		
		<cfset var cferror = arguments.exception />
		
		<cfif application.online>
		
			<cfmail to="rafe@asianvhm.com" from="rafe@asianvhm.com" subject="Bali Sentosa Web Error" type="html">
	
				<cfoutput>
					<table width="100%" border="0" cellspacing="1" cellpadding="2">
						<tr valign="top"><td width="20%">URL</td><td>#cgi.HTTP_Referer#</td></tr>
						<tr valign="top"><td width="20%">Translated</td><td>#cgi.Path_Translated#</td></tr>
						<tr valign="top"><td width="20%">Error</td><td><cfif IsDefined("cfError.message")>#cfError.Message#<cfelse>Undefined.</cfif></td></tr>
						<cfif isDefined("cferror.rootcause.sql")><tr valign="top"><td width="20%">SQL</td><td>#cferror.rootcause.sql#</td></tr></cfif>
						<cfif isDefined("cferror.rootcause.detail") AND Len(cferror.rootcause.detail)><tr valign="top"><td width="20%">Detail</td><td>#cferror.rootcause.detail#</td></tr></cfif>
					</table>
	
					<cfdump var="#cferror#">
	
					<br><br>Dump of all CGI Variables:<br><cfdump var="#cgi#">
					<br><br>Dump of all Attributes Variables:<br><cfdump var="#attributes#">
					<br><br>Dump of all CLIENT Variables:<br><cfdump var="#client#">
					<br><br>Dump of all URL Variables:<br><cfdump var="#url#">
					<br><br>Dump of all FORM Variables:<br><cfdump var="#form#">
				</cfoutput>
	
			</cfmail>
	
			<cflocation url="/error/error.cfm" />
			
		<cfelse>
		
			<cfoutput>	
				
				<table width="100%" border="0" cellspacing="1" cellpadding="2">
					<tr valign="top"><td width="20%">URL</td><td>#cgi.HTTP_Referer#</td></tr>
					<tr valign="top"><td width="20%">Translated</td><td>#cgi.Path_Translated#</td></tr>
					<tr valign="top"><td width="20%">Error</td><td><cfif IsDefined("cfError.message")>#cfError.Message#<cfelse>Undefined.</cfif></td></tr>
					<cfif isDefined("cferror.rootcause.sql")><tr valign="top"><td width="20%">SQL</td><td>#cferror.rootcause.sql#</td></tr></cfif>
					<cfif isDefined("cferror.rootcause.detail") AND Len(cferror.rootcause.detail)><tr valign="top"><td width="20%">Detail</td><td>#cferror.rootcause.detail#</td></tr></cfif>
				</table>
				
			</cfoutput>
			
			<cfdump var="#cferror#">

			<br><br>Dump of all CGI Variables:<br><cfdump var="#cgi#">
			<br><br>Dump of all Attributes Variables:<br><cfdump var="#attributes#">
			<br><br>Dump of all CLIENT Variables:<br><cfdump var="#client#">
			<br><br>Dump of all URL Variables:<br><cfdump var="#url#">
			<br><br>Dump of all FORM Variables:<br><cfdump var="#form#">
					
		</cfif>

	</cffunction>
	
</cfcomponent>