<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DemoListHierarchy.aspx.cs" Inherits="DemoIVRHierarchyApplication.DemoListHierarchy" %>

<?xml version="1.0" encoding="UTF-8" ?>
<vxml version="2.1">
<property name="inputmodes" value="dtmf"/> 
<catch event="connection.disconnect.hangup">
    <submit next="CleanUp.aspx"/>
    <exit/>
</catch>
  
  <form id="selectContent">
       <field name="selection" type="digits?minlength=1;maxlength=1">       
        <prompt bargein="true" timeout='3s'>
            For <break time='100ms' /> Cat, Press 1 <break time='300ms' />
            For <break time='100ms' /> Dog, Press 2 <break time='300ms' />
            For <break time='100ms' /> Sheep, Press 3 <break time='300ms' />
            For <break time='100ms' /> Duck, Press 4 <break time='300ms' />
            For <break time='100ms' /> Chicken, Press 5 <break time='300ms' />

        </prompt>
          
          <noinput>
            <prompt bargein="false" >
                 <audio src='http://localhost/TalenthuntPrompts/NoID.wav' fetchtimeout="10s"> 
                    Sorry, you didn't press any number
                 </audio>
            </prompt>
            <reprompt/>
         </noinput>

         <nomatch>
           <prompt bargein="false">
                <audio src='http://localhost/TalenthuntPrompts/WrongID.wav' fetchtimeout="10s"> 
                   Sorry, you pressed incorrect number!
                 </audio>
           </prompt>
            <reprompt/>
         </nomatch>

         <filled namelist="selection" mode="all">
         <prompt> You selected <value expr="selection"/></prompt>
             <submit next="CleanUp.aspx" namelist="selection"/>
    <clear />
                  </filled>
      </field>
   </form>
 </vxml>