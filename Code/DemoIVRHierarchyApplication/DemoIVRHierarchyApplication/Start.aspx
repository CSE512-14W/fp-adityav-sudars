<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Start.aspx.cs" Inherits="DemoIVRHierarchyApplication.Start" %>
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
          Welcome to our I V R design experiment demo. 
          For Experiment 1, Press 1. <break time='300ms' /> 
          For Experiment 2, Press 2. <break time='300ms' />
          
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
                <goto next="DemoListHierarchy.aspx" />
            <elseif cond="'2' == dtmfInput"/>
                <goto next="DemoShallowHierarchy.aspx" />
             <elseif cond="'3' == dtmfInput"/>
                <goto next="DemoDeepHierarchy.aspx" />
            </if>
           <clear/>
        </filled>
            
      </field>
   </form>
</vxml>