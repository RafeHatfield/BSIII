<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: web --->
<!--- fuseaction: contentForm --->
<cftry>
<!--- fuseaction action="login.validateUser" --->
<cfset myFusebox.trace("Runtime","&lt;fuseaction action=""login.validateUser""/&gt;") >
<!--- do action="m_login.validateUser" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""m_login.validateUser""/&gt;") >
<cfset myFusebox.thisPhase = "preprocessFuseactions">
<cfset myFusebox.thisCircuit = "m_login">
<cfset myFusebox.thisFuseaction = "validateUser">
<cfset myFusebox.trace("Runtime","&lt;include template=""act_validateUser.cfm"" circuit=""m_login""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../login/model/act_validateUser.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 20 and right(cfcatch.MissingFileName,20) is "act_validateUser.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse act_validateUser.cfm in circuit m_login which does not exist (from fuseaction m_login.validateUser).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cfset myFusebox.thisCircuit = "login">
<cfif not ( validateUser.recordCount gt 0 )>
<!--- do action="login.form" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""login.form""/&gt;") >
<cfset myFusebox.thisFuseaction = "form">
<cfset attributes.displaymode = "nonav" />
<cfset xfa.dologin = "login.doLogin" />
<!--- do action="v_login.showLoginForm" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""v_login.showLoginForm""/&gt;") >
<cfset myFusebox.thisCircuit = "v_login">
<cfset myFusebox.thisFuseaction = "showLoginForm">
<cfsavecontent variable="content.maincontent">
<cfset myFusebox.trace("Runtime","&lt;include template=""dsp_loginForm.cfm"" circuit=""v_login""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../login/view/dsp_loginForm.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 17 and right(cfcatch.MissingFileName,17) is "dsp_loginForm.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_loginForm.cfm in circuit v_login which does not exist (from fuseaction v_login.showLoginForm).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfsavecontent>
<cfset myFusebox.thisCircuit = "login">
<cfset myFusebox.thisFuseaction = "validateUser">
</cfif>
<!--- fuseaction action="login.checkFusePermissions" --->
<cfset myFusebox.trace("Runtime","&lt;fuseaction action=""login.checkFusePermissions""/&gt;") >
<!--- do action="m_login.checkFusePermissions" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""m_login.checkFusePermissions""/&gt;") >
<cfset myFusebox.thisCircuit = "m_login">
<cfset myFusebox.thisFuseaction = "checkFusePermissions">
<cfset myFusebox.trace("Runtime","&lt;include template=""act_checkFusePermissions.cfm"" circuit=""m_login""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../login/model/act_checkFusePermissions.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 28 and right(cfcatch.MissingFileName,28) is "act_checkFusePermissions.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse act_checkFusePermissions.cfm in circuit m_login which does not exist (from fuseaction m_login.checkFusePermissions).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<!--- fuseaction action="login.permissionFunctions" --->
<cfset myFusebox.trace("Runtime","&lt;fuseaction action=""login.permissionFunctions""/&gt;") >
<!--- do action="m_login.permissionFunctions" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""m_login.permissionFunctions""/&gt;") >
<cfset myFusebox.thisFuseaction = "permissionFunctions">
<cfset myFusebox.trace("Runtime","&lt;include template=""act_permissionFunctions.cfm"" circuit=""m_login""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../login/model/act_permissionFunctions.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 27 and right(cfcatch.MissingFileName,27) is "act_permissionFunctions.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse act_permissionFunctions.cfm in circuit m_login which does not exist (from fuseaction m_login.permissionFunctions).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "web">
<cfset myFusebox.thisFuseaction = "contentForm">
<cfset xfa.saveContent = "web.contentForm" />
<cfif not isDefined("attributes.con_id")><cfset attributes.con_id = "0" /></cfif>
<cfif isDefined('attributes.save')>
<cfset application.contentObj.contentSave(argumentCollection=attributes) >
<cflocation url="#myself#web.contentList" addtoken="false">
<cfabort>
</cfif>
<cfset qContent = application.contentObj.getContent(con_id=attributes.con_id) >
<cfset qContentParents = application.contentObj.getContentParents() >
<cfset qNonMenuParents = application.contentObj.getNonMenuParents() >
<cfset qOtherContentImages = application.imageObj.getContentImages(con_id=attributes.con_id) >
<cfif (#application.systemSettings.sys_approval# is 1 AND #listFind('1,2',cookie.prf_id)#) OR #application.systemSettings.sys_approval# is 0>
<cfset NewContentApproveState = "1" />
<cfelse>
<cfset NewContentApproveState = "0" />
</cfif>
<cfif qContent.recordCount gte 1>
<cfset attributes.con_menuTitle = "#qContent.con_menuTitle#" />
<cfset attributes.con_title = "#qContent.con_title#" />
<cfset attributes.con_intro = "#qContent.con_intro#" />
<cfset attributes.con_body = "#qContent.con_body#" />
<cfset attributes.con_isMenu = "#qContent.con_isMenu#" />
<cfset attributes.con_menuArea = "#qContent.con_menuArea#" />
<cfset attributes.con_menuOrder = "#qContent.con_menuOrder#" />
<cfset attributes.con_parentID = "#qContent.con_parentID#" />
<cfset attributes.con_active = "#qContent.con_active#" />
<cfset attributes.con_type = "#qContent.con_type#" />
<cfset attributes.con_childListType = "#qContent.con_childListType#" />
<cfset attributes.con_approved = "#qContent.con_approved#" />
<cfset attributes.con_link = "#qContent.con_link#" />
<cfset attributes.con_metaDescription = "#qContent.con_metaDescription#" />
<cfset attributes.con_metaKeywords = "#qContent.con_metaKeywords#" />
<cfset attributes.con_attach1 = "#qContent.con_attach1#" />
<cfset attributes.con_attach2 = "#qContent.con_attach2#" />
<cfset attributes.con_attach3 = "#qContent.con_attach3#" />
<cfset attributes.con_attach1Desc = "#qContent.con_attach1Desc#" />
<cfset attributes.con_attach2Desc = "#qContent.con_attach2Desc#" />
<cfset attributes.con_attach3Desc = "#qContent.con_attach3Desc#" />
<cfset attributes.img_id = "#qContent.img_id#" />
<cfset attributes.img_name = "#qContent.img_name#" />
<cfset attributes.img_title = "#qContent.img_title#" />
<cfset attributes.img_altText = "#qContent.img_altText#" />
<cfelse>
<cfset attributes.con_menuTitle = "" />
<cfset attributes.con_title = "" />
<cfset attributes.con_intro = "" />
<cfset attributes.con_body = "" />
<cfset attributes.con_isMenu = "0" />
<cfset attributes.con_menuArea = "0" />
<cfset attributes.con_menuOrder = "1" />
<cfset attributes.con_parentID = "0" />
<cfset attributes.con_active = "1" />
<cfset attributes.con_type = "Content" />
<cfset attributes.con_childListType = "0" />
<cfset attributes.con_approved = "#NewContentApproveState#" />
<cfset attributes.con_link = "" />
<cfset attributes.con_metaDescription = "" />
<cfset attributes.con_metaKeywords = "" />
<cfset attributes.con_attach1 = "" />
<cfset attributes.con_attach2 = "" />
<cfset attributes.con_attach3 = "" />
<cfset attributes.con_attach1Desc = "" />
<cfset attributes.con_attach2Desc = "" />
<cfset attributes.con_attach3Desc = "" />
<cfset attributes.img_id = "" />
<cfset attributes.img_name = "" />
<cfset attributes.img_title = "" />
<cfset attributes.img_altText = "" />
</cfif>
<cfset qMenuAreas = application.menuObj.getMenuAreas() >
<cfset qGloryBoxes = application.contentObj.getGloryBoxes() >
<!--- do action="v_web.contentForm" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""v_web.contentForm""/&gt;") >
<cfset myFusebox.thisCircuit = "v_web">
<cfparam name="content.mainContent" default="">
<cfsavecontent variable="content.mainContent">
<cfoutput>#content.mainContent#</cfoutput>
<cfset myFusebox.trace("Runtime","&lt;include template=""dsp_contentForm.cfm"" circuit=""v_web""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../web/view/dsp_contentForm.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 19 and right(cfcatch.MissingFileName,19) is "dsp_contentForm.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_contentForm.cfm in circuit v_web which does not exist (from fuseaction v_web.contentForm).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfsavecontent>
<!--- fuseaction action="layout.choose" --->
<cfset myFusebox.trace("Runtime","&lt;fuseaction action=""layout.choose""/&gt;") >
<cfset myFusebox.thisPhase = "postprocessFuseactions">
<cfset myFusebox.thisCircuit = "layout">
<cfset myFusebox.thisFuseaction = "choose">
<cfif not isDefined("attributes.displayMode")><cfset attributes.displayMode = "nav" /></cfif>
<cfif attributes.displayMode eq 'nav'>
<!--- do action="m_layout.getMenu" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""m_layout.getMenu""/&gt;") >
<cfset myFusebox.thisCircuit = "m_layout">
<cfset myFusebox.thisFuseaction = "getMenu">
<cfset myFusebox.trace("Runtime","&lt;include template=""qry_getMenu.cfm"" circuit=""m_layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/model/qry_getMenu.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 15 and right(cfcatch.MissingFileName,15) is "qry_getMenu.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse qry_getMenu.cfm in circuit m_layout which does not exist (from fuseaction m_layout.getMenu).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<!--- do action="v_layout.headerBar" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""v_layout.headerBar""/&gt;") >
<cfset myFusebox.thisCircuit = "v_layout">
<cfset myFusebox.thisFuseaction = "headerBar">
<cfparam name="content.headerBar" default="">
<cfsavecontent variable="content.headerBar">
<cfoutput>#content.headerBar#</cfoutput>
<cfset myFusebox.trace("Runtime","&lt;include template=""dsp_headerBar.cfm"" circuit=""v_layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_headerBar.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 17 and right(cfcatch.MissingFileName,17) is "dsp_headerBar.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_headerBar.cfm in circuit v_layout which does not exist (from fuseaction v_layout.headerBar).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfsavecontent>
<!--- do action="v_layout.footerBar" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""v_layout.footerBar""/&gt;") >
<cfset myFusebox.thisFuseaction = "footerBar">
<cfparam name="content.footerBar" default="">
<cfsavecontent variable="content.footerBar">
<cfoutput>#content.footerBar#</cfoutput>
<cfset myFusebox.trace("Runtime","&lt;include template=""dsp_footerBar.cfm"" circuit=""v_layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_footerBar.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 17 and right(cfcatch.MissingFileName,17) is "dsp_footerBar.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_footerBar.cfm in circuit v_layout which does not exist (from fuseaction v_layout.footerBar).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfsavecontent>
<!--- do action="v_layout.mainMenu" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""v_layout.mainMenu""/&gt;") >
<cfset myFusebox.thisFuseaction = "mainMenu">
<cfparam name="content.mainMenu" default="">
<cfsavecontent variable="content.mainMenu">
<cfoutput>#content.mainMenu#</cfoutput>
<cfset myFusebox.trace("Runtime","&lt;include template=""dsp_mainMenu.cfm"" circuit=""v_layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_mainMenu.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 16 and right(cfcatch.MissingFileName,16) is "dsp_mainMenu.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_mainMenu.cfm in circuit v_layout which does not exist (from fuseaction v_layout.mainMenu).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfsavecontent>
<cfset myFusebox.thisCircuit = "layout">
<cfset myFusebox.thisFuseaction = "choose">
<cfset myFusebox.trace("Runtime","&lt;include template=""view/dsp_nav.cfm"" circuit=""layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_nav.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 16 and right(cfcatch.MissingFileName,16) is "view/dsp_nav.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse view/dsp_nav.cfm in circuit layout which does not exist (from fuseaction layout.choose).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfif>
<cfif attributes.displayMode eq 'newsletter'>
<!--- do action="m_layout.getMenu" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""m_layout.getMenu""/&gt;") >
<cfset myFusebox.thisCircuit = "m_layout">
<cfset myFusebox.thisFuseaction = "getMenu">
<cfset myFusebox.trace("Runtime","&lt;include template=""qry_getMenu.cfm"" circuit=""m_layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/model/qry_getMenu.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 15 and right(cfcatch.MissingFileName,15) is "qry_getMenu.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse qry_getMenu.cfm in circuit m_layout which does not exist (from fuseaction m_layout.getMenu).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<!--- do action="v_layout.headerBar" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""v_layout.headerBar""/&gt;") >
<cfset myFusebox.thisCircuit = "v_layout">
<cfset myFusebox.thisFuseaction = "headerBar">
<cfparam name="content.headerBar" default="">
<cfsavecontent variable="content.headerBar">
<cfoutput>#content.headerBar#</cfoutput>
<cfset myFusebox.trace("Runtime","&lt;include template=""dsp_headerBar.cfm"" circuit=""v_layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_headerBar.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 17 and right(cfcatch.MissingFileName,17) is "dsp_headerBar.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_headerBar.cfm in circuit v_layout which does not exist (from fuseaction v_layout.headerBar).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfsavecontent>
<!--- do action="v_layout.newsletterFooter" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""v_layout.newsletterFooter""/&gt;") >
<cfset myFusebox.thisFuseaction = "newsletterFooter">
<cfparam name="content.newsletterFooter" default="">
<cfsavecontent variable="content.newsletterFooter">
<cfoutput>#content.newsletterFooter#</cfoutput>
<cfset myFusebox.trace("Runtime","&lt;include template=""dsp_newsletterFooter.cfm"" circuit=""v_layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_newsletterFooter.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 24 and right(cfcatch.MissingFileName,24) is "dsp_newsletterFooter.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_newsletterFooter.cfm in circuit v_layout which does not exist (from fuseaction v_layout.newsletterFooter).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfsavecontent>
<cfset myFusebox.thisCircuit = "layout">
<cfset myFusebox.thisFuseaction = "choose">
<cfset myFusebox.trace("Runtime","&lt;include template=""view/dsp_newsletter.cfm"" circuit=""layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_newsletter.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 23 and right(cfcatch.MissingFileName,23) is "view/dsp_newsletter.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse view/dsp_newsletter.cfm in circuit layout which does not exist (from fuseaction layout.choose).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfif>
<cfif attributes.displayMode eq 'noNav'>
<!--- do action="v_layout.headerBar" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""v_layout.headerBar""/&gt;") >
<cfset myFusebox.thisCircuit = "v_layout">
<cfset myFusebox.thisFuseaction = "headerBar">
<cfparam name="content.headerBar" default="">
<cfsavecontent variable="content.headerBar">
<cfoutput>#content.headerBar#</cfoutput>
<cfset myFusebox.trace("Runtime","&lt;include template=""dsp_headerBar.cfm"" circuit=""v_layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_headerBar.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 17 and right(cfcatch.MissingFileName,17) is "dsp_headerBar.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_headerBar.cfm in circuit v_layout which does not exist (from fuseaction v_layout.headerBar).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfsavecontent>
<!--- do action="v_layout.footerBar" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""v_layout.footerBar""/&gt;") >
<cfset myFusebox.thisFuseaction = "footerBar">
<cfparam name="content.footerBar" default="">
<cfsavecontent variable="content.footerBar">
<cfoutput>#content.footerBar#</cfoutput>
<cfset myFusebox.trace("Runtime","&lt;include template=""dsp_footerBar.cfm"" circuit=""v_layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_footerBar.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 17 and right(cfcatch.MissingFileName,17) is "dsp_footerBar.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_footerBar.cfm in circuit v_layout which does not exist (from fuseaction v_layout.footerBar).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfsavecontent>
<cfset myFusebox.thisCircuit = "layout">
<cfset myFusebox.thisFuseaction = "choose">
<cfset myFusebox.trace("Runtime","&lt;include template=""view/dsp_noNav.cfm"" circuit=""layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_noNav.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 18 and right(cfcatch.MissingFileName,18) is "view/dsp_noNav.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse view/dsp_noNav.cfm in circuit layout which does not exist (from fuseaction layout.choose).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfif>
<cfif attributes.displayMode eq 'print'>
<cfset myFusebox.trace("Runtime","&lt;include template=""view/dsp_blank.cfm"" circuit=""layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_blank.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 18 and right(cfcatch.MissingFileName,18) is "view/dsp_blank.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse view/dsp_blank.cfm in circuit layout which does not exist (from fuseaction layout.choose).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfif>
<cfif attributes.displayMode eq 'docType'>
<cfif not isDefined("attributes.docType")><cfset attributes.docType = "application/vnd.ms-excel" /></cfif>
<cfif not isDefined("attributes.fileName")><cfset attributes.fileName = "index.xls" /></cfif>
<cfset myFusebox.trace("Runtime","&lt;include template=""view/dsp_docType.cfm"" circuit=""layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_docType.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 20 and right(cfcatch.MissingFileName,20) is "view/dsp_docType.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse view/dsp_docType.cfm in circuit layout which does not exist (from fuseaction layout.choose).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfif>
<cfcatch type="SecurityException">
<cfoutput>
<!DOCTYPE html PUBLIC
"-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<title>Permissions Error</title>

		<link rel="stylesheet" href="css/default.css" type="text/css" media="screen">

	</head>

	<body>
		<table width='100%' border='0' bgcolor="##ffffff">
<!--- 			<tr>
				<td>
					<div id="header">
						<a id="logo" href="/"><img src="http://graphics.suite101.com/logo_print_5.gif" alt="Suite101" title="Suite101" width="300" height="100" style="position:relative: left:5px;" /><span></span></a>
						<div id="bannerAd"><br /><br /><br /><h1>ADMIN</h1></div>
					</div>
				</td>
			</tr> --->

			<tr>
				<td>
					<h1>Sorry - you dont have permission to access this page.</h1>
				</td>
			</tr>
		</table>
	</body>
</html>
</cfoutput>
</cfcatch>
</cftry>

