<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DataListInsuranceControl.ascx.cs" Inherits="DataListInsuranceControl" %>


<asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
                      <div style="padding-top:30px;">
                <div class="insurance-title">
                    <asp:Literal ID="TitleInsurance" runat="server" Text="<%$FrontEndResources:TRX00151,PersonalInsurance%>"></asp:Literal>
                </div>
                    <div class="jakas">
                  <asp:Label runat="server" ID="collapse" Text="Collapse"></asp:Label>
                      <img id="Img3" src="<%$ebFile:~/Content/currenttheme/images/cartao.png%>" runat="server" class="jakis-obrazek" /></div>
                </div>
        <div style="width:400%; background-color:#eeeeee; height:4px; margin-left:-30%;"></div>
        <div id="panel" style="padding-top:10px;" >
                <div>
                    <div class="search-insurance-title">
                        <asp:Literal ID="Literal2" runat="server" Text="<%$FrontEndResources:TRX00151,Search%>"></asp:Literal>
                        <div class="strip"></div>
                    </div><div class="dropGniot"><asp:DropDownList runat="server" ID="ddlSearchCurrency" CssClass="dropGniot"></asp:DropDownList></div>
                </div>
            <div style="width:400%;background-color:#eeeeee;margin-left: -30%;">
                <it:FlowContainerDetail ID="FlowContainerDetail1" CssClass="insurances-title panel panel-detail title-table-insurances" runat="server" Title="">
                    <div class="table-grid-border">
                        <div class="col-lg-12 clearPadding">
                            <div class="metro">
                                <it:GridViewControl ID="gridInsurances" runat="server" ShowHeader="false" AutoGenerateColumns="false" CssClass="table hovered table-resp-to1199 noarrow insurances-grid col-lg-12" IsResponsive="true" GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="gvInsurances_RowDataBound" >
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="30%">
                                            <ItemTemplate>
                                                <div id="divAccountType" class="contentBox box-blue" runat="server">
                                                    <div class="scroll-item-top accountNameOverflow">
                                                        <h4 style="font-size: 20px;">
                                                            <asp:Literal ID="litInsuranceName" runat="server"></asp:Literal></h4>
                                                        <span class="numAcc">
                                                            <asp:Literal ID="litInsuranceNumber" runat="server" ></asp:Literal></span>
                                                        <span id="balance" class="insur-values" style="display: block;" runat="server">
                                                            
                                                            <asp:Label ID="litInsuranceMoney" runat="server" ></asp:Label>  <asp:Literal ID="litCurrency" runat="server" ></asp:Literal></span>
                                                    </div>
                                                    <div class="clearBoth"></div>
                                                    <div id="divBalance" class="scroll-item-value positive hidden" runat="server">
                                                        <h5>
                                                            <asp:Literal ID="litBalanceTitle" Text="<%$FrontEndResources:Account,BalanceTitle %>" runat="server"></asp:Literal></h5>
                                                        <h3>
                                                            <asp:Literal ID="litBalanceValue" runat="server"></asp:Literal></h3>
                                                        <div class="formatCurrency marginTop2">
                                                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="10%">
                                            <ItemTemplate>
                                                <div id="Div1" class="contentBox box-blue" runat="server">
                                                    <span class="numAcc">
                                                        <asp:Literal ID="Literal3" runat="server" Text="<%$FrontEndResources:TRX00151,StartDate%>"></asp:Literal></span>
                                                    <span class="insur-values" style="display: block;">
                                                        <asp:Literal ID="litStartDate" runat="server"></asp:Literal></span>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="30%">
                                            <ItemTemplate>
                                                <div id="Div2" class="contentBox box-blue" runat="server">
                                                    <span class="numAcc">
                                                        <asp:Literal ID="Literal4" runat="server" Text="<%$FrontEndResources:TRX00151,Periodicity%>"></asp:Literal></span>
                                                    <span class="insur-values" style="display: block;">
                                                        <asp:Literal ID="litPeriodicity" runat="server" ></asp:Literal></span>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-CssClass="visible-md visible-lg visible-sm" ItemStyle-Width="10%">
                                            <ItemTemplate>
                                                <div id="Div3" class="contentBox box-blue" runat="server">
                                                    <span class="numAcc">
                                                        <asp:Literal ID="Literal5" runat="server" Text="<%$FrontEndResources:TRX00151,State%>"></asp:Literal></span>
                                                    <span class="insur-values" style="display: block;">
                                                        <asp:Literal ID="litState" runat="server" Text="Active"></asp:Literal></span>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="5%">
                                            <ItemTemplate>
                                                <div>
                                                    <img id="Img2" src="<%$ebFile:~/Content/currenttheme/images/dashboard/ico_dashboard_payments.png%>"  class="pict-insurance-opts" runat="server" />
                                                    <span style="display: block; text-align:center;">
                                                        <asp:Literal runat="server" ID="litOptName1"  Text="<%$FrontEndResources:TRX00151,Option1%>"></asp:Literal></span>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="5%">
                                            <ItemTemplate>
                                                <div>
                                                    <img id="Img1" src="<%$ebFile:~/Content/currenttheme/images/dashboard/ico_dashboard_payments.png%>" class="pict-insurance-opts" runat="server" />
                                                    <span style="display: block; text-align:center;">
                                                        <asp:Literal ID="litOptName2" runat="server" Text="<%$FrontEndResources:TRX00151,Option2%>"></asp:Literal></span>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="5%">
                                            <ItemTemplate>                                      <div>
                                                    <img id="Img3" src="<%$ebFile:~/Content/currenttheme/images/dashboard/ico_dashboard_payments.png%>" class="pict-insurance-opts" runat="server" />
                                                    <span style="display: block; text-align:center;">
                                                        <asp:Literal runat="server" ID="litOptName3" Text="<%$FrontEndResources:TRX00151,Option3%>"></asp:Literal></span>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </it:GridViewControl>
                            </div>
                        </div>
                    </div>
                </it:FlowContainerDetail>
                </div>
            </div>
    </ContentTemplate>
</asp:UpdatePanel>
<script type="text/javascript">

    $(document).ready(function () {

        $("[id*='Img3']").click(function () {
            var btn = $(this);
           
            var panel = $(this).closest("[id*='ListInsurance_updPanel']").find("#panel");
           
            if (panel.css('display') == 'none') {
                panel.show();
            }
            else {

                panel.toggle("slow", function () {
                });
            }
        });
    });
    </script>

