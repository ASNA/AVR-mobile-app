<%@ Page Language="AVR" MasterPageFile="~/HomeMaster.master" AutoEventWireup="false" CodeFile="Index.aspx.vr" Inherits="Index" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <%
    If (HttpContext.Current.IsDebuggingEnabled)     
    %>
    <link rel="stylesheet" href="<%=Page.ResolveUrl("~")%>assets/css/two-column-layout.css">
    <%
    Else
    %>
    <link rel="stylesheet" href="<%=Page.ResolveUrl("~")%>assets/css/two-column-layout.css">
    <%
    EndIf 
    %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

<div class="container">
   <header>
      header
   </header>

   <main>
      main
   </main>
   
   <aside>
      aside
   </aside>
   
   <footer>
      footer   
   </footer>
</div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PageScripts" Runat="Server">
</asp:Content>
