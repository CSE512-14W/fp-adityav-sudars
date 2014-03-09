<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CleanUp.aspx.cs" Inherits="IVRHierarchies.CleanUp" %>
<%@ Import Namespace="DatabaseIVRHierarchies" %>

<%
    String finalSelection = null; 
    try
    {
        finalSelection = (String)Request.QueryString["selection"];
     }
    catch (ArgumentOutOfRangeException)
    {
        // Do Nothing!
    }
    
    
    DatabaseFunctions objectDatabaseFunctions = new DatabaseFunctions();
    objectDatabaseFunctions.addAnalytics((String)Session["SessionId"], (String)Session["callerId"], "Cleanup.aspx", "Selection: "+finalSelection, null);
    objectDatabaseFunctions.addAnalytics((String)Session["SessionId"], (String)Session["callerId"], "Cleanup.aspx", "Exit", null);
 %>

<?xml version="1.0"?>
<vxml version="2.0">
<form>
<block>
<disconnect />
</block>
</form>
</vxml>