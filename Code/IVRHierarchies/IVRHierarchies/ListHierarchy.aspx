<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListHierarchy.aspx.cs" Inherits="IVRHierarchies.ListHierarchy" %>
<%@ Import Namespace="DatabaseIVRHierarchies" %>

<%
    DatabaseFunctions objectDatabaseFunctions = new DatabaseFunctions();
    objectDatabaseFunctions.addAnalytics((String)Session["SessionId"], (String)Session["callerId"], "ListHierarchy.aspx", "Enter List", null);
     %>
<?xml version="1.0" encoding="UTF-8" ?>
<vxml version="2.1">
<property name="inputmodes" value="dtmf"/> 
<catch event="connection.disconnect.hangup">
    <submit next="CleanUp.aspx"/>
    <exit/>
</catch>
  
  <form id="selectContent">
       <field name="selection" type="digits?minlength=1;maxlength=2">       
        <prompt bargein="true" timeout='3s'>
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
            For <break time='100ms' /> Necklace, Press 14 <break time='300ms' />
            For <break time='100ms' /> Headband, Press 15 <break time='300ms' />
            For <break time='100ms' /> Earrrings, Press 16 <break time='300ms' />
            For <break time='100ms' /> Nose Ring, Press 17 <break time='300ms' />

            For <break time='100ms' /> Bangles, Press 18 <break time='300ms' /> 
            For <break time='100ms' /> Rings, Press 19 <break time='300ms' />

            For <break time='100ms' /> Toe Rings, Press 20 <break time='300ms' />
            For <break time='100ms' /> Anklet, Press 21 <break time='300ms' />

            For <break time='100ms' /> TV, Press 22 <break time='300ms' />
            For <break time='100ms' /> DVD Player, Press 23 <break time='300ms' />
            For <break time='100ms' /> Speakers, Press 24 <break time='300ms' />

            For <break time='100ms' /> Mixer, Press 25 <break time='300ms' />
            For <break time='100ms' /> Toaster, Press 26 <break time='300ms' /> 
            For <break time='100ms' /> Microwave, Press 27 <break time='300ms' />

            For <break time='100ms' /> Cricket, Press 28 <break time='300ms' />
            For <break time='100ms' /> Football, Press 29 <break time='300ms' />
            
            For <break time='100ms' /> X Box, Press 30 <break time='300ms' />
            For <break time='100ms' /> Playing Cards, Press 31 <break time='300ms' />

            For <break time='100ms' /> Spatula, Press 32 <break time='300ms' />
            For <break time='100ms' /> Crockpot, Press 33 <break time='300ms' />
            For <break time='100ms' /> Frying Pan, Press 34 <break time='300ms' />
            For <break time='100ms' /> Ladle, Press 35 <break time='300ms' />

            For <break time='100ms' /> Plate, Press 36 <break time='300ms' /> 
            For <break time='100ms' /> Glass, Press 37 <break time='300ms' />
            For <break time='100ms' /> Bowl, Press 38 <break time='300ms' />

            For <break time='100ms' /> Pitcher, Press 39 <break time='300ms' />
            For <break time='100ms' /> Water Bottle, Press 40 <break time='300ms' />

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