
<h3>GetTimeZoneInfo Example</h3> 

<!--- This example shows the use of GetTimeZoneInfo ---> 

<cfset setLocale("en_SG") />



<cfoutput> 
#getLocale()#	
<!--- 	<cfdump var="#Server.Coldfusion.SupportedLocales#"> --->

The local date and time are #now()#. 

</cfoutput> 

 

<cfset info = GetTimeZoneInfo()> 

<cfoutput> 

<p>Total offset in seconds is #info.utcTotalOffset#.</p> 

<p>Offset in hours is #info.utcHourOffset#.</p> 

<p>Offset in minutes minus the offset in hours is 

    #info.utcMinuteOffset#.</p> 

<p>Is Daylight Savings Time in effect? #info.isDSTOn#.</p> 

</cfoutput>