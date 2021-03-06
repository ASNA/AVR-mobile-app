﻿<%@ Page Language="AVR" MasterPageFile="~/HomeMaster.master" AutoEventWireup="false" CodeFile="WorkOrders.aspx.vr" Inherits="WorkOrders" Title="Untitled Page" %>
<%@ Import Namespace="System.Data" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="<%=Page.ResolveUrl("~")%>assets/css/list-two-column-with-icon.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">    
    <section>
          <section class="navigation">
              <div class="mobile-only">   
                  <asp:LinkButton ID="GotoHomeButton" cssclass="nav-button btn" runat="server"><i class="fa fa-home"></i></asp:LinkButton>
              </div>

              <div>
                <asp:LinkButton ID="ShowPrevPageButton" cssclass="nav-button btn" runat="server"><i class="fa fa-angle-left"></i></asp:LinkButton>
              </div>      

              <div>
                <asp:LinkButton ID="ShowNextPageButton" cssclass="nav-button btn" runat="server"><i class="fa fa-angle-right"></i></asp:LinkButton>
              </div>      

              <div>
                 <button  id="toggle-filter" class="nav-button btn" type="button">
                    <i class="fa fa-search"></i>
                </button>            
              </div>         

              <div class="mobile-only">
                <asp:LinkButton ID="linkbuttonLogout" cssclass="nav-button btn" runat="server"><i class="fa fa-sign-out"></i></asp:LinkButton>
              </div>      
        </section>

        <asp:Panel ID="Panel1" runat="server" DefaultButton="FilterListButton">
        <section id="filter-bar" hidden>
           <%--<input type="search" id="filter-value" placeholder="Filter on..."/>--%>

           <asp:TextBox ID="FilterValue" runat="server" placeholder="Filter on..." ClientIDMode="Static" AutoPostBack="False"></asp:TextBox>
           <asp:LinkButton hidden ID="FilterListButton" runat="server" ClientIDMode="Static">Link button2</asp:LinkButton>
        </section>
        </asp:Panel>

    </section>

<%--    <div>
        <%= *This.CurrentControl %>
        <br />
        <%= *this.DebugMessage %>
    </div>--%>

    <asp:Panel ID="FilterContainer" Visible="false" runat="server" EnableViewState="false">
        <div id="clear-filter-container" class="alert-info">        
            <asp:LinkButton ID="ClearFilter" runat="server" EnableViewState="false"></asp:LinkButton>
        </div>
    </asp:Panel>
        
    <asp:ListView ID="listviewWorkOrders" runat="server" EnableViewState="false">
            <LayoutTemplate>
                <section class="info-list">
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                </section>
            </LayoutTemplate>
            <ItemTemplate>
               <section class="info-item-container">

                   <%--Avoid Eval!--%>
                   <%-- Nope! <%# Eval("InfoList_Status") %> --%>
                   <%--https://www.codeproject.com/Articles/623516/The-Evil-of-Eval-in-ASP-NET--%>

                  <aside class="icon" data-status="<%# (Container.DataItem *As DataRowView)["InfoList_Status"] %>" 
                                      data-accountid="<%# (Container.DataItem *As DataRowView)["InfoList_AccountId"] %>"> 
                     <a href="#">
                         <i class="<%# (Container.DataItem *As DataRowView)["InfoList_IconClass"] %> change-status"></i>
                     </a>
                  </aside>
                  <section class="item">
                      <a href="showmap.aspx">
                        <div>
                            <%# (Container.DataItem *As DataRowView)["InfoList_LineInfo"] %>
                        </div>     
                      </a>  
                  </section>  
                  <section class="nav">
                      <a href="showmap.aspx">
                          <div>
                            <i style="font-size: 250%; color: gray;" 
                            class="fas fa-angle-right"></i>         
                          </div>
                        </a>
                  </section>
               </section>   
            </ItemTemplate>

        </asp:ListView>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="pageScripts" Runat="Server">
    <script src="<%=Page.ResolveUrl("~")%>assets/js/rp.ajax.js"></script>
    <script src="<%=Page.ResolveUrl("~")%>assets/js/workorders.aspx.js"></script>
</asp:Content>

