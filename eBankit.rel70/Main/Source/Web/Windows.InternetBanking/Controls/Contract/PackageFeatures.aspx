<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Popup.Master" CodeBehind="PackageFeatures.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.PackageFeatures" %>

<%@ Import Namespace="eBankit.Lib.ApiModel.SecurityCenter.Contracts.Contract" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="grayContainer costumer-data-container bs-head-metro" style="margin: 0;">
        <div class="packge-img img-container">
            <img id="imgPackage" src="" alt="" class="img-profile img-circle imgPackage" runat="server" />
        </div>
        <div class="package-title bs-reduced bs-head-metro">
            <h3 class="head">
                <asp:Literal ID="litPackageName" runat="server"></asp:Literal>
            </h3>
        </div>
        <div class="package-subtitle">
            <h3 class="head" style="margin: 0">
                <asp:Literal ID="litPackageDescription" runat="server"></asp:Literal>
            </h3>
        </div>
    </div>

    <div class="grid-contract-items grid-no-pagination col-xs-12">
        <it:GridViewControl ID="gvPackageFeatures" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow  no-margin" EmptyDataText="<%$FrontEndResources:PackageFeatures,NoFeatures%>"
            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVPackageFeatures_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$GenericFrontEndResources:Feature%>">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important hidden-xs" ItemStyle-CssClass="hidden-xs" HeaderText="<%$GenericFrontEndResources:ChannelInternetBanking%>">
                    <ItemTemplate>
                        <asp:Label ID="lblChannelInternetBanking" CssClass="inactive" runat="server" Text="<%$GenericFrontEndResources:No%>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important hidden-xs" ItemStyle-CssClass="hidden-xs" HeaderText="<%$GenericFrontEndResources:ChannelMobile%>">
                    <ItemTemplate>
                        <asp:Label ID="lblChannelMobile" CssClass="inactive" runat="server" Text="<%$GenericFrontEndResources:No%>" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </it:GridViewControl>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            $("img[id*='imgContractProfile'], img[id*='imgPackage'], img.imgAccount").each(function () {
                if ($(this).attr("alt") === undefined)
                    $(this).attr("alt", "");
            });
            
        });        
    </script>

</asp:Content>
