<%@ Page Language="AVR" MasterPageFile="~/HomeMaster.master" AutoEventWireup="false" CodeFile="WorkOrders.aspx.vr" Inherits="WorkOrders" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="<%=Page.ResolveUrl("~")%>assets/css/list-two-column-with-icon.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">


    <section>
        <section class="navigation">
            <div class="mobile-only">
                <i style="font-size: 250%; color: white"
                    class="fas fa-home"></i>
            </div>
            <div>
                <i style="font-size: 250%; color: white"
                    class="fas fa-angle-left"></i>
            </div>
            <div>
                <i style="font-size: 250%; color: white"
                    class="fas fa-angle-right"></i>
            </div>
            <div class="mobile-only">
                <asp:LinkButton ID="linkbuttonLogout" runat="server">
                    <div>
                    <i style="font-size: 250%; color: white"
                       class="fas fa-sign-out-alt"></i>
                    </div>
                </asp:LinkButton>
            </div>
        </section>
    </section>

    <div>
        <a href="#" id="test-button">Click me</a>
    </div>

    <asp:ListView ID="listviewWorkOrders" runat="server" EnableViewState="false">
            <LayoutTemplate>
                <section class="info-list">
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                </section>
            </LayoutTemplate>
            <ItemTemplate>
               <section class="info-item-container">

                  <aside class="icon" data-status="<%# Eval("InfoList_Status") %>" 
                                      data-accountid="<%# Eval("InfoList_AccountId") %>"> 
                     <a href="#">
                         <i class="<%# Eval("InfoList_IconClass") %> change-status"></i>
                     </a>
                  </aside>
                  <section class="item">
                      <a href="showmap.aspx">
                        <div>
                            <%# Eval("InfoList_LineInfo") %>
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

