<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingTransactionsControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LandingTransactionsControl" %>

<it:FlowContainerDetail CssClass="panel panel-detail panel-transaction header-small" Title="<%$FrontEndResources:Custom,PanelTransactions%>" runat="server">
    <a id="aTrx_1" href="javascript:void(0)" class="list-group-item col-lg-12 list-group-item-inner" onclick="eBankit.Presentation.SelectControl(this); return false;">
        <div class="list-group-item-text list-group-item-arrow">
            <div style="float: left; width: 65%;">
                <h6>Transfer to my...</h6>
                <p>-100,00 AKZ</p>
            </div>
            <div class="list-group-item-date"> 
                <h6>2014-01-05</h6>
            </div>
            <div class="clearBoth"></div>
        </div>
    </a>
    <a id="a2" href="javascript:void(0)" class="list-group-item col-lg-12 list-group-item-inner list-item-alternative" onclick="eBankit.Presentation.SelectControl(this); return false;">
        <div class="list-group-item-text list-group-item-arrow">
            <div style="float: left; width: 65%;">
                <h6>Transfer to my...</h6>
                <p>-1030,00 AKZ</p>
            </div>
            <div class="list-group-item-date">
                <h6>2014-01-04</h6>
            </div>
            <div class="clearBoth"></div>
        </div>
    </a>
</it:FlowContainerDetail>
