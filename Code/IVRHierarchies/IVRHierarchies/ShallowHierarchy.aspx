<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShallowHierarchy.aspx.cs" Inherits="IVRHierarchies.ShallowHierarchy" %>

<%@ Import Namespace="DatabaseIVRHierarchies" %>

<%
    DatabaseFunctions objectDatabaseFunctions = new DatabaseFunctions();
    objectDatabaseFunctions.addAnalytics((String)Session["SessionId"], (String)Session["callerId"], "ShallowHierarchy.aspx", "Enter Shallow", null);
%>
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
                        For <break time='100ms' /> clothes, Press 1. <break time='300ms' />
                        For <break time='100ms' /> jewelry, Press 2. <break time='300ms' />          
                        For <break time='100ms' /> electronics, Press 3. <break time='300ms' />
                        For <break time='100ms' /> games and toys, Press 4. <break time='300ms' />
                        For <break time='100ms' /> utensils, Press 5. <break time='300ms' />
                        
          </audio> 
         </prompt>

         <grammar mode="dtmf" version="1.0" root="top" inputmodes="dtmf">
            <rule id="top">
                <one-of>
                    <item>1</item>
                    <item>2</item>
                    <item>3</item>
                    <item>4</item> 
                    <item>5</item>
                </one-of>
            </rule>
         </grammar>

        <catch event="noinput nomatch">
            <reprompt />
        </catch>

         <filled namelist="level0Selection" mode="all">
            <assign name="finalContentId" expr ="finalContentId + level0Selection" />
             
             <if cond="'1' == level0Selection">
                <goto next="#Cloths" />
             <elseif cond="'2' == level0Selection"/>
                <goto next="#Jewelry" />
            <elseif cond="'3' == level0Selection"/>
                <goto next="#Electronics" />
             <elseif cond="'4' == level0Selection"/>
                <goto next="#GamesAndToys" />
             <elseif cond="'5' == level0Selection"/>
                <goto next="#Utensils" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>

    <form id="Cloths">
       <field name="selection" type="digits?minlength=1;maxlength=2">       
        <prompt bargein="true" timeout='3s'>
            To go back to previous menu anytime, Press 0 <break time='300ms' />
            For <break time='100ms' /> Shorts, Press 1 <break time='300ms' />
            For <break time='100ms' /> Shirt, Press 2 <break time='300ms' />
            For <break time='100ms' /> Pants, Press 3 <break time='300ms' />
            For <break time='100ms' /> Vest, Press 4 <break time='300ms' />

            For <break time='100ms' /> Frock, Press 5 <break time='300ms' />
            For <break time='100ms' /> Skirt, Press 6 <break time='300ms' />
            For <break time='100ms' /> Sweat Pants, Press 7 <break time='300ms' />
            For <break time='100ms' /> Skort, Press 8 <break time='300ms' />

            For <break time='100ms' /> Dress, Press 9<break time='300ms' />
            For <break time='100ms' /> Blouse, Press 10 <break time='300ms' /> 
            For <break time='100ms' /> Slip, Press 11 <break time='300ms' />

            For <break time='100ms' /> Disposable Diapers, Press 12 <break time='300ms' />
            For <break time='100ms' /> Cloth Diapers, Press 13 <break time='300ms' />
           
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


    <form id="Jewelry">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> Necklace, Press 1 <break time='300ms' />
            For <break time='100ms' /> Headband, Press 2 <break time='300ms' />
            For <break time='100ms' /> Earrrings, Press 3 <break time='300ms' />
            For <break time='100ms' /> Nose Ring, Press 4 <break time='300ms' />
            For <break time='100ms' /> Bangles, Press 5 <break time='300ms' /> 
            For <break time='100ms' /> Rings, Press 6 <break time='300ms' />
            For <break time='100ms' /> Toe Rings, Press 7 <break time='300ms' />
            For <break time='100ms' /> Anklet, Press 8 <break time='300ms' />
            
            
          </audio> 
         </prompt>

         <grammar mode="dtmf" version="1.0" root="top" inputmodes="dtmf">
            <rule id="top">
                <one-of>
                    <item>0</item>
                    <item>1</item>
                    <item>2</item>
                    <item>3</item>
                    <item>4</item> 
                    <item>5</item>
                    <item>6</item>
                    <item>7</item>
                    <item>8</item>
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


    <form id="Electronics">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> TV, Press 1 <break time='300ms' />
            For <break time='100ms' /> DVD Player, Press 2 <break time='300ms' />
            For <break time='100ms' /> Speakers, Press 3 <break time='300ms' />
            For <break time='100ms' /> Mixer, Press 4 <break time='300ms' />
            For <break time='100ms' /> Toaster, Press 5 <break time='300ms' /> 
            For <break time='100ms' /> Microwave, Press 6 <break time='300ms' />                        
            

          </audio> 
         </prompt>

         <grammar mode="dtmf" version="1.0" root="top" inputmodes="dtmf">
            <rule id="top">
                <one-of>
                    <item>0</item>
                    <item>1</item>
                    <item>2</item>
                    <item>3</item>
                    <item>4</item> 
                    <item>5</item>
                    <item>6</item>
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
    
    
    
     <form id="GamesAndToys">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> Cricket, Press 1 <break time='300ms' />
            For <break time='100ms' /> Football, Press 2 <break time='300ms' />
            For <break time='100ms' /> X Box, Press 3 <break time='300ms' />
            For <break time='100ms' /> Playing Cards, Press 4 <break time='300ms' /> 
           
            
          </audio> 
         </prompt>

         <grammar mode="dtmf" version="1.0" root="top" inputmodes="dtmf">
            <rule id="top">
                <one-of>
                    <item>0</item>
                    <item>1</item>
                    <item>2</item>
                    <item>3</item>
                    <item>4</item> 
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

    <form id="Utensils">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> Spatula, Press 1 <break time='300ms' />
            For <break time='100ms' /> Crockpot, Press 2 <break time='300ms' />
            For <break time='100ms' /> Frying Pan, Press 3 <break time='300ms' />
            For <break time='100ms' /> Ladle, Press 4 <break time='300ms' />
            For <break time='100ms' /> Plate, Press 5 <break time='300ms' /> 
            For <break time='100ms' /> Glass, Press 6 <break time='300ms' />
            For <break time='100ms' /> Bowl, Press 7 <break time='300ms' />
            For <break time='100ms' /> Pitcher, Press 8 <break time='300ms' />
            For <break time='100ms' /> Water Bottle, Press 9 <break time='300ms' />
            
          </audio> 
         </prompt>

         <grammar mode="dtmf" version="1.0" root="top" inputmodes="dtmf">
            <rule id="top">
                <one-of>
                    <item>0</item>
                    <item>1</item>
                    <item>2</item>
                    <item>3</item>
                    <item>4</item>
                    <item>5</item>
                    <item>6</item>
                    <item>7</item>
                    <item>8</item>
                    <item>9</item>
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

