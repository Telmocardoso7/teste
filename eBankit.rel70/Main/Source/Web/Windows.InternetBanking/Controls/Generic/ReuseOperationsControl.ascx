<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReuseOperationsControl.ascx.cs" Inherits="ReuseOperationsControl" %>

<asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
    <ContentTemplate>
        <it:FlowContainerDetail ID="flwReuseOperations" CssClass="panel panel-detail" Title="Reuse operation" runat="server">
            <div class="item-group">
                <a id="aOperation_1" href="javascript:void(0)" class="list-group-item col-lg-12 list-group-item-inner" onclick="eBankit.Presentation.SelectControl(this); return false;">
                    <div>
                        <div class="list-group-item-text list-group-item-arrow">
                            <h6>Transfer to parent account</h6>
                            <p>NIB / Account number</p>
                            <p>43546467</p>
                        </div>
                    </div>
                </a>
                <a id="aOperation_2" href="javascript:void(0)" class="list-group-item col-lg-12 list-group-item-inner" onclick="eBankit.Presentation.SelectControl(this); return false;">
                    <div>
                        <div class="list-group-item-text list-group-item-arrow">
                            <h6>Transfer to other account</h6>
                            <p>NIB / Account number</p>
                            <p>876565674</p>
                        </div>
                    </div>
                </a>
            </div>
        </it:FlowContainerDetail>
    </ContentTemplate>
</asp:UpdatePanel>
