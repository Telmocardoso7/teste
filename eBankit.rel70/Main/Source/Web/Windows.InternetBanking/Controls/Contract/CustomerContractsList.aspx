<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="CustomerContractsList.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.CustomerContractsList" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="TransactionFeaturedContent">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:ContractsList,Title%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <%--Top disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericTop" runat="server"></asp:Literal>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="TransactionMainContent">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
        <h3 class="head">
            <asp:Literal ID="Literal1" Text="<%$FrontEndResources:ContractsList,MyContract%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <hr class="no-margin" />
    <div class="col-lg-8 col-max grid-contract-items grid-no-pagination">
        <it:GridViewControl ID="gvMyContract" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow" EmptyDataText="<%$FrontEndResources:ContractsList,NoContractFound%>"
            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVMyContract_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:ContractsList,ContractData%>">
                    <ItemTemplate>
                        <img id="imgContract" src="" alt="" class="imgUserPhoto img-table img-circlev2 img-circle" runat="server" />
                        <asp:Label ID="lblContractId" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:ContractsList,DateCreated%>">
                    <ItemTemplate>
                        <asp:Label ID="lblCreatedDate" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="formatTableData visible-md visible-lg visible-sm padding8Important" HeaderText="<%$FrontEndResources:ContractList,State%>">
                    <ItemTemplate>
                        <asp:Label ID="lblContractState" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnOpenContract" runat="server" OnClick="btnOpenContract_Click" CssClass="btn-detail-arrow" ToolTip="<%$FrontEndResources:ContractList,OpenContract%>"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </it:GridViewControl>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
        <h3 class="head">
            <asp:Literal ID="Literal2" Text="<%$FrontEndResources:ContractsList,OtherContracts%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <section class="grayContainer costumer-data-container" style="margin: 0;">
        <div class="col-lg-8 col-max text-left">
            <asp:Literal ID="litOtherContractsExp" Text="<%$FrontEndResources:ContractsList,OtherContractsExp%>" runat="server"></asp:Literal>
        </div>
    </section>
    <div class="col-lg-8 col-max grid-contract-items grid-no-pagination">
        <it:GridViewControl ID="gvOtherContracts" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow" EmptyDataText="<%$FrontEndResources:ContractsList,NoOtherContracts%>"
            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVOtherContracts_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:ContractsList,ProfileData%>">
                    <ItemTemplate>
                        <asp:Image ID="imgProfile" ImageUrl="" CssClass="imgUserPhoto img-table img-circlev2 img-circle" runat="server" />
                        <asp:Label ID="lblProfileName" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="formatTableData visible-md visible-lg visible-sm padding8Important" HeaderText="<%$FrontEndResources:ContractsList,ContractID%>">
                    <ItemTemplate>
                        <asp:Label ID="lblContractId" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:ContractsList,DateCreated%>">
                    <ItemTemplate>
                        <asp:Label ID="lblCreatedDate" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="formatTableData visible-md visible-lg visible-sm padding8Important" HeaderText="<%$FrontEndResources:ContractList,State%>">
                    <ItemTemplate>
                        <asp:Label ID="lblContractState" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-CssClass="formatTableData visible-md visible-lg visible-sm padding8Important" HeaderText="<%$FrontEndResources:ContractsList,UserRelationType%>">
                    <ItemTemplate>
                        <asp:Label ID="lblContractUserRelationType" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </it:GridViewControl>
    </div>
    <%--Bottom disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericBottom" runat="server"></asp:Literal>
    <script type="text/javascript">
        $(document).ready(function () {

            $("img[id*='imgProfile'],img[id*='imgContract']").each(function () {
                if ($(this).attr("alt") === undefined)
                    $(this).attr("alt", "");
            });
        });
    </script>
</asp:Content>
