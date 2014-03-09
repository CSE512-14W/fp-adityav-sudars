<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Start.aspx.cs" Inherits="IVRHierarchies.Start" %>
<%@ Import Namespace="DatabaseIVRHierarchies" %>

<% 
 String callerId = Request.QueryString.Get("session.CallerId");
    if (callerId != null)
    {
        if (callerId.Length <= 10)
        {
            callerId = "91" + callerId;
        }
    }
    else
        callerId="Can't Determine";

    if (null == Session["sessionId"])
    {
        Session.Add("sessionId", Request.QueryString.Get("session.SessionId"));
        Session.Add("callerId", callerId);
    }
             
        
    DatabaseFunctions objectDatabaseFunctions = new DatabaseFunctions();
    objectDatabaseFunctions.addAnalytics(Request.QueryString.Get("session.SessionId"), callerId, "Start.aspx", "Enter Experiment", null);
 
 %>

<?xml version="1.0" encoding="UTF-8" ?>
<vxml version="2.1">
<property name="inputmodes" value="dtmf"/> 
<catch event="connection.disconnect.hangup">
    <submit next="CleanUp.aspx"/>
    <exit/>
</catch>
  
   <form id="homeMenu">
      <field name="dtmfInput">
         <prompt bargein="true" timeout='3s'>
          Welcome to our I V R design experiment. 
          For Experiment 1, Press 1. <break time='300ms' /> 
          For Experiment 2, Press 2. <break time='300ms' />
          For Experiment 3, Press 3. <break time='300ms' />
            
         
         </prompt>

         <grammar mode="dtmf" version="1.0" root="top" inputmodes="dtmf">
            <rule id="top">
                <one-of>
                    <item>1</item>
                    <item>2</item>
                    <item>3</item>
                </one-of>
            </rule>
         </grammar>

        <catch event="noinput nomatch">
            <reprompt />
        </catch>

         <filled namelist="dtmfInput" mode="all">
            <if cond="'1' == dtmfInput">
                <goto next="ListHierarchy.aspx" />
            <elseif cond="'2' == dtmfInput"/>
                <goto next="ShallowHierarchy.aspx" />
             <elseif cond="'3' == dtmfInput"/>
                <goto next="DeepHierarchy.aspx" />
            </if>
           <clear/>
        </filled>
            
      </field>
   </form>
</vxml>