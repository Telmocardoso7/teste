<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01009_01.ascx.cs" Inherits="TRX01009_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <it:FlowInnerContainer ID="flwData" Title="<%$FrontEndResources:TRX01009,SendFile %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <it:FormRadioList_v3 ID="frlTypeFile" runat="server" CssClass="big-radioButton" LabelText="<%$FrontEndResources:TRX01009,frlTypeFile %>" RepeatDirection="Horizontal" HideLabel="false" />
                    <it:TextBoxControl_v2 ID="txtDescription" MaxLength="80" IsRequired="false" Label="<%$FrontEndResources:TRX01009,txtDescription%>" runat="server" />
                    <div class="col-xs-12 field_v2 fileUp-containerV2">
                        <div style="margin-left:35px" class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <div class="label-wrapper">
                                <asp:Label ID="btnSelectFile" runat="server" Text="" AssociatedControlID="ucAttachUploader" class="btn btn-input-file updateBtn">
                                    <asp:Literal ID="litContinue" Text="<%$FrontEndResources:TRX01105,Select %>" runat="server"></asp:Literal>
                                </asp:Label>
                                <div style="display: none">
                                    <asp:FileUpload ID="ucAttachUploader" runat="server" CssClass="rpt-btnimg-add" ClientIDMode="Predictable" />
                                    <asp:HiddenField ID="hiddenField" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div id="txtFileURL" style="margin-left:-7px" class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                            <it:TextBoxControl_v2 ID="txtFileInput" runat="server" Watermark="<%$FrontEndResources:TRX01105,WithoutFile%>" CssClass="field field-block input-field inputfile-textbox" style="margin-left:3px !important" ShowLabel="false" Enabled="false" />
                        </div>
                    </div>
                    <it:DatePickerTextBoxMetroControl_v3 ID="dtInsertDate" runat="server" Width="100px"
                        Label="<%$FrontEndResources:TRX01009,dtInsertDate%>"
                        ValidationMinDateMessage="<%$FrontEndResources:TRX00121,dtTransferDateValidationMinDateMessage %>"
                        ValidationRequiredMessage="<%$FrontEndResources:TRX00121,dtTransferDateValidationRequiredMessage %>"
                        ValidationMessage="<%$FrontEndResources:TRX00121,dtTransferDateValidationMessage %>" />
                    <it:TextBoxControl_v2 ID="txtInstructions" IsRequired="false" MaxLength="140" TextMode="MultiLine" Rows="4" Label="<%$FrontEndResources:TRX01009,txtInstructions%>" runat="server" />
                    <it:FormRadioList_v3 ID="frlNotificeEmail" runat="server" CssClass="big-radioButton" LabelText="<%$FrontEndResources:TRX01009,frlNotificeEmail %>" RepeatDirection="Horizontal" HideLabel="false" />
                    <it:TextBoxControl_v2 ID="txtEmail" MaxLength="80" IsRequired="false" Label="<%$FrontEndResources:TRX01009,txtEmail%>" runat="server" />
                </div>
            </it:FlowInnerContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Button ID="btnUploadFileValidate" Style="display: none;" runat="server" />
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01009-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
<script type="text/javascript">
    $(function () {
        $('input[type=file]').change(function () {
            __doPostBack(btnUploadFileValidate, '');
        });
    });
</script>
