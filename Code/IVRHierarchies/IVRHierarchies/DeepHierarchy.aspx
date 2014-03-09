<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeepHierarchy.aspx.cs" Inherits="IVRHierarchies.DeepHierarchy" %>

<%@ Import Namespace="DatabaseIVRHierarchies" %>

<%
    DatabaseFunctions objectDatabaseFunctions = new DatabaseFunctions();
    objectDatabaseFunctions.addAnalytics((String)Session["SessionId"], (String)Session["callerId"], "DeepHierarchy.aspx", "Enter Page", null);
%>


<?xml version="1.0" encoding="UTF-8" ?>
<vxml version="2.1">
 <var name="finalContentId" />
 
<property name="inputmodes" value="dtmf"/> 
<catch event="connection.disconnect.hangup">
    <submit next="CleanUp.aspx"/>
    <exit/>
</catch>
  
   <form id="Level0">
      <field name="level0Selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
                        For <break time='100ms' /> things to wear, Press 1. <break time='300ms' />
                        For <break time='100ms' /> things to use, Press 2. <break time='300ms' />          
                        
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
            <assign name="finalContentId" expr ="level0Selection" />
             <if cond="'1' == level0Selection">
                <goto next="#ThingsYouWear" />
            <elseif cond="'2' == level0Selection"/>
                <goto next="#ThingsYouUse" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>



   <form id="ThingsYouWear">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
                        To go back to previous menu anytime,  Press 0 <break time='300ms' />
                        For <break time='100ms' /> cloths, Press 1. <break time='300ms' />
                        For <break time='100ms' /> jewelry, Press 2. <break time='300ms' />                                  
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
            <assign name="finalContentId" expr ="finalContentId + selection" />
             <if cond="'0' == selection">
                <goto next="#Level0" />
             <elseif cond="'1' == selection"/>
                <goto next="#Cloths" />
            <elseif cond="'2' == selection"/>
                <goto next="#Jewelry" />
             </if>
            <clear/>
        </filled>           
      </field>
   </form>

  <form id="ThingsYouUse">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
                        To go back to previous menu anytime,  Press 0 <break time='300ms' />
                        For <break time='100ms' /> electronics, Press 1. <break time='300ms' />
                        For <break time='100ms' /> games and toys, Press 2. <break time='300ms' />
                        For <break time='100ms' /> Utensils, Press 3. <break time='300ms' />                                  
          </audio> 
         </prompt>

         <grammar mode="dtmf" version="1.0" root="top" inputmodes="dtmf">
            <rule id="top">
                <one-of>
                    <item>0</item>
                    <item>1</item>
                    <item>2</item>
                    <item>3</item>
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
            <assign name="finalContentId" expr ="finalContentId + selection" />
             <if cond="'0' == selection">
                <goto next="#Level0" />
             <elseif cond="'1' == selection" />
                <goto next="#Electronics" />
            <elseif cond="'2' == selection"/>
                <goto next="#GamesAndToys" />
            <elseif cond="'3' == selection"/>
                <goto next="#Utensils" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>

    <form id="Cloths">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
                        To go back to previous menu anytime,  Press 0 <break time='300ms' />
                        For <break time='100ms' /> Boys and Men, Press 1. <break time='300ms' />
                        For <break time='100ms' /> Girls, Press 2. <break time='300ms' />
                        For <break time='100ms' /> Women, Press 3. <break time='300ms' />                                  
                        For <break time='100ms' /> Babies, Press 4. <break time='300ms' />                                  
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
            <assign name="finalContentId" expr ="finalContentId + selection" />
             <if cond="'0' == selection">
                <goto next="#ThingsYouWear" />
             <elseif cond="'1' == selection" />
                <goto next="#BoysAndMen" />
            <elseif cond="'2' == selection"/>
                <goto next="#Grils" />
            <elseif cond="'3' == selection"/>
                <goto next="#Women" />
            <elseif cond="'4' == selection"/>
                <goto next="#Babies" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>

 
    <form id="Jewelry">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
                        To go back to previous menu anytime,  Press 0 <break time='300ms' />
                        For <break time='100ms' /> Face and Neck, Press 1. <break time='300ms' />
                        For <break time='100ms' /> Hands, Press 2. <break time='300ms' />
                        For <break time='100ms' /> Legs, Press 3. <break time='300ms' />                                  
          </audio> 
         </prompt>

         <grammar mode="dtmf" version="1.0" root="top" inputmodes="dtmf">
            <rule id="top">
                <one-of>
                    <item>0</item>
                    <item>1</item>
                    <item>2</item>
                    <item>3</item>
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
            <assign name="finalContentId" expr ="finalContentId + selection" />
             <if cond="'0' == selection">
                <goto next="#ThingsYouWear" />
             <elseif cond="'1' == selection" />
                <goto next="#FaceAndNeck" />
            <elseif cond="'2' == selection"/>
                <goto next="#Hands" />
            <elseif cond="'3' == selection"/>
                <goto next="#Legs" />
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
                        For <break time='100ms' /> Living Room, Press 1. <break time='300ms' />
                        For <break time='100ms' /> Kitchen, Press 2. <break time='300ms' />
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
            <assign name="finalContentId" expr ="finalContentId + selection" />
             <if cond="'0' == selection">
                <goto next="#ThingsYouUse" />
             <elseif cond="'1' == selection" />
                <goto next="#LivingRoom" />
            <elseif cond="'2' == selection"/>
                <goto next="#Kitchen" />
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
                        For <break time='100ms' /> Outdoor, Press 1. <break time='300ms' />
                        For <break time='100ms' /> Indoor, Press 2. <break time='300ms' />
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
            <assign name="finalContentId" expr ="finalContentId + selection" />
             <if cond="'0' == selection">
                <goto next="#ThingsYouUse" />
             <elseif cond="'1' == selection" />
                <goto next="#Outdoor" />
            <elseif cond="'2' == selection"/>
                <goto next="#Indoor" />
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
                        For <break time='100ms' /> Cooking, Press 1. <break time='300ms' />
                        For <break time='100ms' /> Eating, Press 2. <break time='300ms' />
                        For <break time='100ms' /> Drinking, Press 3. <break time='300ms' />
          </audio> 
         </prompt>

         <grammar mode="dtmf" version="1.0" root="top" inputmodes="dtmf">
            <rule id="top">
                <one-of>
                    <item>0</item>
                    <item>1</item>
                    <item>2</item>
                    <item>3</item>
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
            <assign name="finalContentId" expr ="finalContentId + selection" />
             <if cond="'0' == selection">
                <goto next="#ThingsYouUse" />
             <elseif cond="'1' == selection" />
                <goto next="#Cooking" />
            <elseif cond="'2' == selection"/>
                <goto next="#Eating" />
            <elseif cond="'3' == selection"/>
                <goto next="#Drinking" />
           </if>
            <clear/>
        </filled>           
      </field>
   </form>



    <form id="BoysAndMen">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> Shorts, Press 1 <break time='300ms' />
            For <break time='100ms' /> Shirt, Press 2 <break time='300ms' />
            For <break time='100ms' /> Pants, Press 3 <break time='300ms' />
            For <break time='100ms' /> Vest, Press 4 <break time='300ms' />
            
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
                <goto next="#Cloths" />
             <else/>
            <assign name="selection" expr ="finalContentId + selection" />
              <submit next="Cleanup.aspx"
              method="post" namelist="selection" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>

    <form id="Girls">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> Frock, Press 1 <break time='300ms' />
            For <break time='100ms' /> Skirt, Press 2 <break time='300ms' />
            For <break time='100ms' /> Sweat Pants, Press 3 <break time='300ms' />
            For <break time='100ms' /> Skort, Press 4 <break time='300ms' />
            
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
                <goto next="#Cloths" />
             <else/>
            <assign name="selection" expr ="finalContentId + selection" />
              <submit next="Cleanup.aspx"
              method="post" namelist="selection" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>

    <form id="Women">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> Dress, Press 1 <break time='300ms' />
            For <break time='100ms' /> Blouse, Press 2 <break time='300ms' />
            For <break time='100ms' /> Slip, Press 3 <break time='300ms' />
            
          </audio> 
         </prompt>

         <grammar mode="dtmf" version="1.0" root="top" inputmodes="dtmf">
            <rule id="top">
                <one-of>
                    <item>0</item>
                    <item>1</item>
                    <item>2</item>
                    <item>3</item>
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
                <goto next="#Cloths" />
             <else/>
            <assign name="selection" expr ="finalContentId + selection" />
              <submit next="Cleanup.aspx"
              method="post" namelist="selection" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>

    <form id="Babies">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> Disposable Diapers, Press 1 <break time='300ms' />
            For <break time='100ms' /> Cloth Diapers, Press 2 <break time='300ms' />            
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
                <goto next="#Cloths" />
             <else/>
            <assign name="selection" expr ="finalContentId + selection" />
              <submit next="Cleanup.aspx"
              method="post" namelist="selection" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>

    <form id="FaceAndNeck">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> Necklace, Press 1 <break time='300ms' />
            For <break time='100ms' /> Headband, Press 2 <break time='300ms' />            
            For <break time='100ms' /> Earrings, Press 3 <break time='300ms' />
            For <break time='100ms' /> Nose Ring, Press 4 <break time='300ms' />            
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
                <goto next="#Jewelry" />
             <else/>
            <assign name="selection" expr ="finalContentId + selection" />
              <submit next="Cleanup.aspx"
              method="post" namelist="selection" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>

    <form id="Hands">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> Bangles, Press 1 <break time='300ms' />
            For <break time='100ms' /> Ring, Press 2 <break time='300ms' />            
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
                <goto next="#Jewelry" />
             <else/>
            <assign name="selection" expr ="finalContentId + selection" />
              <submit next="Cleanup.aspx"
              method="post" namelist="selection" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>


    <form id="Legs">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> Toe Rings, Press 1 <break time='300ms' />
            For <break time='100ms' /> Anklet, Press 2 <break time='300ms' />            
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
                <goto next="#Jewelry" />
             <else/>
            <assign name="selection" expr ="finalContentId + selection" />
              <submit next="Cleanup.aspx"
              method="post" namelist="selection" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>

    <form id="LivingRoom">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> TV, Press 1 <break time='300ms' />
            For <break time='100ms' /> DVD Player, Press 2 <break time='300ms' />            
            For <break time='100ms' /> Speakers, Press 3 <break time='300ms' />            
          </audio> 
         </prompt>

         <grammar mode="dtmf" version="1.0" root="top" inputmodes="dtmf">
            <rule id="top">
                <one-of>
                    <item>0</item>
                    <item>1</item>
                    <item>2</item>
                    <item>3</item>
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
                <goto next="#Electronics" />
             <else/>
            <assign name="selection" expr ="finalContentId + selection" />
              <submit next="Cleanup.aspx"
              method="post" namelist="selection" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>


    <form id="Kitchen">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> Mixer, Press 1 <break time='300ms' />
            For <break time='100ms' /> Toaster, Press 2 <break time='300ms' />            
            For <break time='100ms' /> Microwave, Press 3 <break time='300ms' />            
          </audio> 
         </prompt>

         <grammar mode="dtmf" version="1.0" root="top" inputmodes="dtmf">
            <rule id="top">
                <one-of>
                    <item>0</item>
                    <item>1</item>
                    <item>2</item>
                    <item>3</item>
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
                <goto next="#Electronics" />
             <else/>
            <assign name="selection" expr ="finalContentId + selection" />
              <submit next="Cleanup.aspx"
              method="post" namelist="selection" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>

    <form id="Outdoor">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> Cricket, Press 1 <break time='300ms' />
            For <break time='100ms' /> Football, Press 2 <break time='300ms' />            
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
                <goto next="#GamesAndToys" />
             <else/>
            <assign name="selection" expr ="finalContentId + selection" />
              <submit next="Cleanup.aspx"
              method="post" namelist="selection" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>
 
    <form id="Indoor">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> X Box, Press 1 <break time='300ms' />
            For <break time='100ms' /> Playing Cards, Press 2 <break time='300ms' />            
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
                <goto next="#GamesAndToys" />
             <else/>
            <assign name="selection" expr ="finalContentId + selection" />
              <submit next="Cleanup.aspx"
              method="post" namelist="selection" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>

   <form id="Cooking">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> Spatula, Press 1 <break time='300ms' />
            For <break time='100ms' /> Crockpot, Press 2 <break time='300ms' />            
            For <break time='100ms' /> Frying Pan, Press 3 <break time='300ms' />
            For <break time='100ms' /> Ladle, Press 4 <break time='300ms' />            
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
                <goto next="#Utensils" />
             <else/>
            <assign name="selection" expr ="finalContentId + selection" />
              <submit next="Cleanup.aspx"
              method="post" namelist="selection" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>

    <form id="Eating">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> Plate, Press 1 <break time='300ms' />
            For <break time='100ms' /> Glass, Press 2 <break time='300ms' />            
            For <break time='100ms' /> Bowl, Press 3 <break time='300ms' />
          </audio> 
         </prompt>

         <grammar mode="dtmf" version="1.0" root="top" inputmodes="dtmf">
            <rule id="top">
                <one-of>
                    <item>0</item>
                    <item>1</item>
                    <item>2</item>
                    <item>3</item>
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
                <goto next="#Utensils" />
             <else/>
            <assign name="selection" expr ="finalContentId + selection" />
              <submit next="Cleanup.aspx"
              method="post" namelist="selection" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>

    <form id="Drinking">
      <field name="selection">
         <prompt bargein="true" timeout='3s'>
         
          <audio src='http://localhost/TalenthuntPrompts/HomeMenuCase1.wav' fetchtimeout='10s'>
            To go back to previous menu anytime,  Press 0 <break time='300ms' />
            For <break time='100ms' /> Pitcher, Press 1 <break time='300ms' />
            For <break time='100ms' /> Water Bottle, Press 2 <break time='300ms' />            
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
                <goto next="#Utensils" />
             <else/>
            <assign name="selection" expr ="finalContentId + selection" />
              <submit next="Cleanup.aspx"
              method="post" namelist="selection" />
            </if>
            <clear/>
        </filled>           
      </field>
   </form>

</vxml>
