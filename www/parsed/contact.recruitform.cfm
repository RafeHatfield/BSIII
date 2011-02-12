<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: contact --->
<!--- fuseaction: recruitForm --->
<cftry>
<cfset myFusebox.thisPhase = "appinit">
<cfset myFusebox.thisCircuit = "contact">
<cfset myFusebox.thisFuseaction = "recruitForm">
<cfif myFusebox.applicationStart or
		not myFusebox.getApplication().applicationStarted>
	<cflock name="#application.ApplicationName#_fusebox_#FUSEBOX_APPLICATION_KEY#_appinit" type="exclusive" timeout="30">
		<cfif not myFusebox.getApplication().applicationStarted>
			<cfset myFusebox.getApplication().applicationStarted = true />
		</cfif>
	</cflock>
</cfif>
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset attributes.recruitForm = application.contactObj.displayRecruitForm() >
<cfset content.mainContent = "#attributes.recruitForm#" />
<!--- fuseaction action="layout.choose" --->
<cfset myFusebox.trace("Runtime","&lt;fuseaction action=""layout.choose""/&gt;") >
<cfset myFusebox.thisPhase = "postprocessFuseactions">
<cfset myFusebox.thisCircuit = "layout">
<cfset myFusebox.thisFuseaction = "choose">
<cfif not isDefined("attributes.displayMode")><cfset attributes.displayMode = "nav" /></cfif>
<cfif attributes.displayMode eq 'nav'>
<!--- do action="v_layout.header" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""v_layout.header""/&gt;") >
<cfset myFusebox.thisCircuit = "v_layout">
<cfset myFusebox.thisFuseaction = "header">
<cfparam name="content.header" default="">
<cfsavecontent variable="content.header">
<cfoutput>#content.header#</cfoutput>
<cfset myFusebox.trace("Runtime","&lt;include template=""dsp_header.cfm"" circuit=""v_layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_header.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 14 and right(cfcatch.MissingFileName,14) is "dsp_header.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_header.cfm in circuit v_layout which does not exist (from fuseaction v_layout.header).">
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
<!--- do action="v_layout.gloryBox" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""v_layout.gloryBox""/&gt;") >
<cfset myFusebox.thisFuseaction = "gloryBox">
<cfparam name="content.gloryBox" default="">
<cfsavecontent variable="content.gloryBox">
<cfoutput>#content.gloryBox#</cfoutput>
<cfset myFusebox.trace("Runtime","&lt;include template=""dsp_gloryBox.cfm"" circuit=""v_layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_gloryBox.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 16 and right(cfcatch.MissingFileName,16) is "dsp_gloryBox.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_gloryBox.cfm in circuit v_layout which does not exist (from fuseaction v_layout.gloryBox).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfsavecontent>
<!--- do action="v_layout.footer" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""v_layout.footer""/&gt;") >
<cfset myFusebox.thisFuseaction = "footer">
<cfparam name="content.footer" default="">
<cfsavecontent variable="content.footer">
<cfoutput>#content.footer#</cfoutput>
<cfset myFusebox.trace("Runtime","&lt;include template=""dsp_footer.cfm"" circuit=""v_layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_footer.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 14 and right(cfcatch.MissingFileName,14) is "dsp_footer.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_footer.cfm in circuit v_layout which does not exist (from fuseaction v_layout.footer).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfsavecontent>
<cfset myFusebox.thisCircuit = "layout">
<cfset myFusebox.thisFuseaction = "choose">
<cfset myFusebox.trace("Runtime","&lt;include template=""view/lay_template.cfm"" circuit=""layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/lay_template.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 21 and right(cfcatch.MissingFileName,21) is "view/lay_template.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse view/lay_template.cfm in circuit layout which does not exist (from fuseaction layout.choose).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfif>
<cfif attributes.displayMode eq 'noGlory'>
<!--- do action="v_layout.header" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""v_layout.header""/&gt;") >
<cfset myFusebox.thisCircuit = "v_layout">
<cfset myFusebox.thisFuseaction = "header">
<cfparam name="content.header" default="">
<cfsavecontent variable="content.header">
<cfoutput>#content.header#</cfoutput>
<cfset myFusebox.trace("Runtime","&lt;include template=""dsp_header.cfm"" circuit=""v_layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_header.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 14 and right(cfcatch.MissingFileName,14) is "dsp_header.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_header.cfm in circuit v_layout which does not exist (from fuseaction v_layout.header).">
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
<!--- do action="v_layout.footer" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""v_layout.footer""/&gt;") >
<cfset myFusebox.thisFuseaction = "footer">
<cfparam name="content.footer" default="">
<cfsavecontent variable="content.footer">
<cfoutput>#content.footer#</cfoutput>
<cfset myFusebox.trace("Runtime","&lt;include template=""dsp_footer.cfm"" circuit=""v_layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_footer.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 14 and right(cfcatch.MissingFileName,14) is "dsp_footer.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_footer.cfm in circuit v_layout which does not exist (from fuseaction v_layout.footer).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfsavecontent>
<cfset myFusebox.thisCircuit = "layout">
<cfset myFusebox.thisFuseaction = "choose">
<cfset myFusebox.trace("Runtime","&lt;include template=""view/lay_noGlory.cfm"" circuit=""layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/lay_noGlory.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 20 and right(cfcatch.MissingFileName,20) is "view/lay_noGlory.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse view/lay_noGlory.cfm in circuit layout which does not exist (from fuseaction layout.choose).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfif>
<cfif attributes.displayMode eq 'noNav'>
<!--- do action="v_layout.header" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""v_layout.header""/&gt;") >
<cfset myFusebox.thisCircuit = "v_layout">
<cfset myFusebox.thisFuseaction = "header">
<cfparam name="content.header" default="">
<cfsavecontent variable="content.header">
<cfoutput>#content.header#</cfoutput>
<cfset myFusebox.trace("Runtime","&lt;include template=""dsp_header.cfm"" circuit=""v_layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_header.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 14 and right(cfcatch.MissingFileName,14) is "dsp_header.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_header.cfm in circuit v_layout which does not exist (from fuseaction v_layout.header).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfsavecontent>
<!--- do action="v_layout.footer" --->
<cfset myFusebox.trace("Runtime","&lt;do action=""v_layout.footer""/&gt;") >
<cfset myFusebox.thisFuseaction = "footer">
<cfparam name="content.footer" default="">
<cfsavecontent variable="content.footer">
<cfoutput>#content.footer#</cfoutput>
<cfset myFusebox.trace("Runtime","&lt;include template=""dsp_footer.cfm"" circuit=""v_layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/dsp_footer.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 14 and right(cfcatch.MissingFileName,14) is "dsp_footer.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_footer.cfm in circuit v_layout which does not exist (from fuseaction v_layout.footer).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfsavecontent>
<cfset myFusebox.thisCircuit = "layout">
<cfset myFusebox.thisFuseaction = "choose">
<cfset myFusebox.trace("Runtime","&lt;include template=""view/lay_noNav.cfm"" circuit=""layout""/&gt;") >
<cftry>
<cfoutput><cfinclude template="../layout/view/lay_noNav.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 18 and right(cfcatch.MissingFileName,18) is "view/lay_noNav.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse view/lay_noNav.cfm in circuit layout which does not exist (from fuseaction layout.choose).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
</cfif>
<cfcatch><cfrethrow></cfcatch>
</cftry>

