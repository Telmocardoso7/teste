<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="AccountType.ascx.cs" Inherits="eBankit.UI.Modules.Web.AccountOpening.AccountType" %>
<asp:UpdatePanel ID="updatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
    <ContentTemplate>
        
        <div id="scroolContent" class="col-xs-12 col-sm-12 col-md-11 col-lg-12 controlsShowHide content-accounts overflowHidden panel-choose content ">
            <asp:Label runat="server" class="title-product-account" Text="<%$FrontEndResources:AccountOpening,TitleStep1ChooseAcc%>"></asp:Label> 

                <asp:Repeater ID="rptAccountProducts" runat="server" OnItemDataBound="rptLoanProducts_ItemDataBound">
                    <ItemTemplate>
                        <li class="col-xs-12 col-sm-12 col-md-12 col-lg-12 accountElem" >
                            <div id="descAccount" runat="server" class="col-xs-11 col-sm-11 col-md-11 col-lg-11 clearPadding account-element">
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 account-type-image clearPadding">
                                    <asp:Image ID="divAccountProductImage" runat="server"/>
                                </div>
                                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 account-type-description">
                                    <asp:Label ID="litAccountProductName" CssClass="title-account-type" runat="server" />
                                    <asp:Label ID="AccountProductDesc" CssClass="AccountListDesc" runat="server" />
                                </div>
                            </div>
                            <div id="descAccountCheck" runat="server" class="col-xs-1 col-sm-1 col-md-1 col-lg-1 account-type-check clearPadding">
                                <div id="radioChosen" runat="server" class="circle">
                                    <div id="ifChosen" class="circle2" runat="server"></div>
                                </div>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:Label ID="Label1" runat="server" class="title-product-account" Text="<%$FrontEndResources:AccountOpening,ChooseHolderOptLbl%>"></asp:Label>
                <div style="height: 60px;" class="fullWidth col-xs-12 col-sm-12 col-md-12 col-lg-12 holdersContainer">
                    <div class="col-xs-5 col-sm-5 col-md-5 col-lg-4 Holderlbl">
                        <div id="holdersSingle" class="tickChosen lg-2 chosenNrHolders" onclick="eBankit.Presentation.AccountProductsControl.MakeTick(this);" value="0">&#10003</div>
                        <asp:Label ID="Label2" runat="server" CssClass="lblGrayHolders" Text="<%$FrontEndResources:AccountOpening,SingleHolderOptLbl%>"></asp:Label> 
                    </div>
                    <div class="col-xs-7 col-sm-7 col-md-7 col-lg-8 Holderlbl">
                        <div id="holdersMultiple" class="tickChosen lg-2" onclick="eBankit.Presentation.AccountProductsControl.MakeTick(this);" value="1"></div>
                        <asp:Label runat="server" CssClass="lblGrayHolders" Text="<%$FrontEndResources:AccountOpening,MultipleHolderOptLbl%>"></asp:Label>
                        <asp:TextBox CssClass="lg-3 txtBoxHolders inprint" Columns="3" ID="numberOfHolders" runat="server"></asp:TextBox>
                    </div>
                </div>

                <asp:HiddenField ID="hdnSelectedAccountProductId" runat="server" />
                <asp:HiddenField ID="hdnSelectedHolderOption" runat="server" />
        </div>     
    </ContentTemplate>
</asp:UpdatePanel>
<script type="text/javascript">
    
    eBankit.Presentation.AccountProductsControl = {}
    eBankit.Presentation.AccountProductsControl.PrdClk = function (elem, accountTypeId) {
        
        var hdnAccountType = $("[id*='hdnSelectedAccountProductId']");

        $(".chosen").each(function () {
            $(this).removeClass("chosen");
        });
        $(elem).addClass("chosen");

        hdnAccountType.val(accountTypeId);
    }

    eBankit.Presentation.AccountProductsControl.MakeTick = function (elem) {

        var hdnHoldersOpt = $("[id*='hdnSelectedHolderOption']");
        var HoldersNum = $("[id*='numberOfHolders']");
        
        $(".chosenNrHolders").each(function () {
            $(this).removeClass("chosenNrHolders");
            $(this).text("");
        });
        $(elem).addClass("chosenNrHolders");
        $(elem).html("&#10003");
        hdnHoldersOpt.val($(elem).attr("value"));
        if ($(elem).attr("value") == '1') {
            HoldersNum.show(); 
        }
        else {
            HoldersNum.hide();
        }
    }

    eBankit.Presentation.AccountProductsControl.SelectSingleHolder = function () {

        var HoldersNum = $("[id*='numberOfHolders']");

        $(".chosenNrHolders").each(function () {
            $(this).removeClass("chosenNrHolders");
            $(this).text("");
        });
        
        var elem = $('#holdersSingle');

        $(elem).addClass("chosenNrHolders");
        $(elem).html("&#10003");
        HoldersNum.hide();
    }

    eBankit.Presentation.AccountProductsControl.SelectMultipleHolder = function () {

        var HoldersNum = $("[id*='numberOfHolders']");

        $(".chosenNrHolders").each(function () {
            $(this).removeClass("chosenNrHolders");
            $(this).text("");
        });

        var elem = $('#holdersMultiple');

        $(elem).addClass("chosenNrHolders");
        $(elem).html("&#10003");
        HoldersNum.show();
    }

    eBankit.Presentation.AccountProductsControl.Validation = function () {
        
    }

   </script>
