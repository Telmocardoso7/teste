<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="AccountProvisioning.cs" Inherits="eBankit.UI.Modules.Web.AccountOpening.Controls.AccountProvisioning" %>

<asp:UpdatePanel ID="updatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
    <ContentTemplate>
        <div id="scroolContent" class="col-xs-12 col-sm-12 col-md-10 col-lg-12 controlsShowHide metro content-accounts overflowHidden panel-choose">
        
            <asp:Label ID="Label1" runat="server" class="title-product-account" Text="<%$FrontEndResources:AccountOpening,AccountProvisioningDescriptionAmount%>"></asp:Label>
            <div id="AmountStored" style="margin-bottom:20px" runat="server">
                <div class="metro field field_v2 break" style="padding-top: 10px;">
                    <div class="label-wrapper"></div>
                    <div class="sliderPick row">
                        <div id="sliderCollateralValueLess" class="divLess col-xs-1 col-sm-1 col-md-1 col-lg-1" onclick="RemoveAmount();">
                            <asp:Label runat="server">&#45;</asp:Label></div>
                        <div id="sliderProvisingAmount" class="divCenter col-xs-10 col-sm-10 col-md-10 col-lg-10"></div>
                        <div id="sliderCollateralValueMore" class="divMore col-xs-1 col-sm-1 col-md-1 col-lg-1" onclick="AddAmount();"><asp:Label ID="Label2" runat="server">&#43;</asp:Label></div>
                    </div>
                    <div style="clear: both;"></div>
                </div>
                <asp:TextBox ID="txtAmount" runat="server" CssClass="sliderAmountValue"></asp:TextBox>
                <div style="clear: both;"></div>
            </div>
            <asp:Label runat="server" class="title-product-account" Text="<%$FrontEndResources:AccountOpening,AccountProvisioningDepositTypeDescription%>"></asp:Label>
            
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-12">
                
                <div id="divDeposityTypeElectronicTransf" class="col-xs-12 col-sm-12 col-md-10 col-lg-4 nopadding">
                    <div data-value="0" class="tickChosen lg-2 chosenNrHolders" onclick="SelectDepositTypeByElement(this);"></div>
                    <asp:Label runat="server" CssClass="lblWayProsising" Text="<%$FrontEndResources:AccountOpening,AccountProvisioningDepositTypeElectronicTransf%>"></asp:Label>
                </div>

                <div id="divDeposityTypeATM" class="col-xs-12 col-sm-12 col-md-10 col-lg-4 nopadding">
                    <div data-value="1" class="tickChosen lg-2" onclick="SelectDepositTypeByElement(this);"></div>
                    <asp:Label runat="server" CssClass="lblWayProsising" Text="<%$FrontEndResources:AccountOpening,AccountProvisioningDepositTypeATM%>"></asp:Label>
                </div>
                
                <div id="divDeposityTypeInBranch" class="col-xs-12 col-sm-12 col-md-10 col-lg-4 nopadding">
                    <div data-value="2" class="tickChosen lg-2" onclick="SelectDepositTypeByElement(this);"></div>
                    <asp:Label runat="server" CssClass="lblWayProsising" Text="<%$FrontEndResources:AccountOpening,AccountProvisioningDepositTypeInBranch%>"></asp:Label>
                </div>
            
            </div>

            <asp:HiddenField ID="hdnDepositType" runat="server" />

        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>

<style type="text/css">

.ui-slider-range {
    background: #3BA1D1;
    width: 300px;
}

.ui-slider {
    background: url('~/Content/images/slider/increase-icon.png');
}

.ui-slider-range {
    background: none;
}

.ui-slider-handle {
    width: 1.7em;
    height: 1.7em;
}

.ui-slider-horizontal .ui-slider-handle {
    /*top: -0.55em;*/
    margin-left: -0.6em;
    background: orange;
}

.ui-state-active {
    border: none;
}

.ui-corner-all, .ui-corner-bottom, .ui-corner-right, .ui-corner-br {
    border-bottom-right-radius: 15px;
}

.ui-corner-all, .ui-corner-bottom, .ui-corner-left, .ui-corner-bl {
    border-bottom-left-radius: 15px;
}

.ui-corner-all, .ui-corner-top, .ui-corner-right, .ui-corner-tr {
    border-top-right-radius: 15px;
}

.ui-corner-all, .ui-corner-top, .ui-corner-left, .ui-corner-tl {
    border-top-left-radius: 15px;
}

.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default {
    border: none;
    background-color: orange;
}

.sliderAmountValue{
    width:100%;
    text-align:center;
    font-size:25px;
    border: solid 2px #a1a1a1;
    color:rgb(27, 129, 177);
}

#sliderProvisingAmount {
    background: url('../../Content/images/slider/slider-rail.png') 100% repeat-x;
    border: none;
}

</style>

