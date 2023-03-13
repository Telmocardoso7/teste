<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SelectedBeneficiaryControl.ascx.cs" Inherits="SelectedBeneficiaryControl" %>
 <it:FlowContainerDetail ID="flwSelBeneficiary" CssClass="panel panel-detail metro header-small panel-detail-noborder panel-small" Title="<%$FrontEndResources:Beneficiary,Title%>" runat="server">
    <div class="list-group metro">
        <div class="panel-benef">
            <a id="aBenef" href="javascript:void(0)" class="list-group-item list-group-item-inner" style="cursor:text;" runat="server">
                <div>
                    <div class="list-group-item-heading list-group-item-img">
                        <img id="imgBeneficiary" src="<%$ebFile:~/Content/currenttheme/images/default-benef.jpg%>" class="img-thumbnail img-circle" style="width: 100px; height:100px;" alt="" runat="server" />
                    </div>
                    <div class="list-group-item-text">
                        <h6 style="margin-bottom:0px;color:#820000;"><asp:Literal ID="litName" runat="server"></asp:Literal></h6>
                        <h6 style="margin-top:0px;"><asp:Literal ID="litSubTitle" runat="server"></asp:Literal></h6>
                        <p style="margin-bottom:0px;"><asp:Literal Text="<%$FrontEndResources:Beneficiary,lblNibOrAccount%>" runat="server"></asp:Literal></p>
                        <p style="font-size:1.2rem;"><asp:Literal ID="litNumber" runat="server"></asp:Literal></p>
                    </div>
                </div>
            </a>
        </div>
    </div>
</it:FlowContainerDetail>
                    