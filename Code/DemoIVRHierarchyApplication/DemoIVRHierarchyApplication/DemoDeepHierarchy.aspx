<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DemoDeepHierarchy.aspx.cs" Inherits="DemoIVRHierarchyApplication.DemoDeepHierarchy" %>

<?xml version="1.0" encoding="UTF-8" ?>
<vxml version="2.1">
 <var name="finalContentId" expr="'-1'" />
 
<property name="inputmodes" value="dtmf"/> 
<catch event="connection.disconnect.hangup">
    <submit next="CleanUp.aspx"/>
    <exit/>
</catch>
  

    <form id="Level0">
      <field name="level0Selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
                        For <break time='100ms' /> Mammals, Press 1. <break time='300ms' />
                        For <break time='100ms' /> Birds, Press 2. <break time='300ms' />                                  
          </audio> 
         </prompt>

         <grammar mode="dtmf" version="1.0" root="top" inputmodes="dtmf">
            <rule id="top">
                <one-of>
                    <item>1</item>
                    <item>2</item>
                </one-of>
            </rule>
         </grammar>

        <catch event="noinput nomatch">
            <reprompt />
        </catch>

         <filled namelist="level0Selection" mode="all">
            <assign name="finalContentId" expr ="finalContentId + level0Selection" />
             
             <if cond="'1' == level0Selection">
                <goto next="#Mammals" />
             <elseif cond="'2' == level0Selection"/>
                <goto next="#Birds" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>

    <form id="Mammals">
       <field name="selection" type="digits?minlength=1;maxlength=1">       
        <prompt bargein="true" timeout='3s'>
            To go back to previous menu anytime, Press 0 <break time='300ms' />
            For <break time='100ms' /> Cat, Press 1 <break time='300ms' />
            For <break time='100ms' /> Dog, Press 2 <break time='300ms' />
            For <break time='100ms' /> Sheep, Press 3 <break time='300ms' />
          
        </prompt>
          
          <noinput>
            <prompt bargein="false" >
                 <audio src='http://localhost/TalenthuntPrompts/NoID.wav' fetchtimeout="10s"> 
                    Sorry, you didn't press any number
                 </audio>
            </prompt>
           <reprompt />
         </noinput>

         <nomatch>
           <prompt bargein="false">
                <audio src='http://localhost/TalenthuntPrompts/WrongID.wav' fetchtimeout="10s"> 
                    Sorry, you pressed incorrect number!
                 </audio>
           </prompt>
           <reprompt />
         </nomatch>

         <filled namelist="selection" mode="all">
             <if cond="'0' == selection">
                <assign name="finalContentId" expr ="finalContentId + selection" />
                <goto next="#Level0" />
            <else/>
              <prompt> You selected <value expr="selection"/></prompt>
              <assign name="selection" expr ="finalContentId + selection" />
                 <submit next="CleanUp.aspx" namelist="selection"/>
        </if>
         </filled>
      </field>
   </form>


    <form id="Birds">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> Duck, Press 1 <break time='300ms' />
            For <break time='100ms' /> Chicken, Press 2 <break time='300ms' />
                        
          </audio> 
         </prompt>

         <grammar mode="dtmf" version="1.0" root="top" inputmodes="dtmf">
            <rule id="top">
                <one-of>
                    <item>0</item>
                    <item>1</item>
                    <item>2</item>
                </one-of>
            </rule>
         </grammar>

        <noinput>
            <prompt bargein="false" >
                 <audio src='http://localhost/TalenthuntPrompts/NoID.wav' fetchtimeout="10s"> 
                    Sorry, you didn't press any number
                 </audio>
            </prompt>
           <reprompt />
         </noinput>

         <nomatch>
           <prompt bargein="false">
                <audio src='http://localhost/TalenthuntPrompts/WrongID.wav' fetchtimeout="10s"> 
                    Sorry, you pressed incorrect number!
                 </audio>
           </prompt>
           <reprompt />
         </nomatch>
         <filled namelist="selection" mode="all">
             <if cond="'0' == selection">
                <assign name="finalContentId" expr ="finalContentId + selection" />
                 <goto next="#Level0" />
             <else/>
            <prompt> You selected <value expr="selection"/></prompt>
            <assign name="selection" expr ="finalContentId + selection" />
            <submit next="CleanUp.aspx" namelist="selection"/>
            </if>
            <clear/>
        </filled>           
      </field>
   </form>

</vxml>
