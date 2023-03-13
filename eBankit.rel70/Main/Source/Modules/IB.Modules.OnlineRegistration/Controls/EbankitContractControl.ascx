<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitContractControl.ascx.cs" Inherits="eBankit.UI.Controls.InternetBanking.EbankitContractControl" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<p class="text-responsive-1-3">
    <asp:Literal ID="litTitleUsername" runat="server" Text="<%$FrontEndResources:Register,UploadAndApprove %>"></asp:Literal>
</p>

<div class="panel-login-inputs panel-register-unlabelled">
	<div style="margin-bottom: 3%;">
        <input type="button" id="btnDownDoc" class="btn btn-primary btn-margin btn-block"  onclick="eBankit.Presentation.ExportToPdf();"/>
	</div>
    <div class="row">
        <div class="col-lg-6">
            <asp:Label ID="lbSelectFile" Text="<%$FrontEndResources:TRX01601,btnSelectFile %>" AssociatedControlID="fuDocument" CssClass="uploadfile" runat="server" ToolTip="<%$FrontEndResources:Register,ClickToSelect %>" />
        </div>
        <div class="col-lg-6">
            <asp:Button ID="btnUploadDoc" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,UploadContract %>" runat="server" ToolTip="<%$FrontEndResources:Register,UploadAndApprove %>" OnClick="btnUploadDoc_Click" />
        </div>
    </div>
	<div style="display: none">
	    <asp:FileUpload runat="server" ID="fuDocument" ClientIDMode="Predictable" AllowMultiple="false" CssClass="rpt-btnimg-add" />
        <asp:HiddenField ID="hiddenField" runat="server" />
	</div>
</div>
<asp:HiddenField ID="hddProcessNumber" runat="server" />
<asp:HiddenField ID="hddPrintButtonText" runat="server" Value="<%$FrontEndResources:Register,PrintContract %>"/>
<asp:HiddenField ID="hddLabelUploadFile" runat="server" Value="<%$FrontEndResources:TRX01601,btnSelectFile %>"/>

<iframe id="iframeDocPrint" name="iframeDocPrint" src="DocumentPrint.aspx" height="0" width="0" style="border: 0px;"></iframe>


<script>
    var fuDocument = $('#<%=fuDocument%>');

    $(document).ready(function () {
        $("#btnDownDoc").val($("#<%=hddPrintButtonText.ClientID%>").val());
        verifyUploadFile();
    });

    eBankit.Presentation.ExportToPdf = function () {
        var hdnProcNumber = $("#<%=hddProcessNumber.ClientID %>");
        document.getElementById('iframeDocPrint').contentWindow.GeneratePDFDocument(hdnProcNumber.val());
    };

    function verifyUploadFile() {
        $('input[type=file]').click(function ()
        {
            var $inputFile = $(this);
            $inputFile.val("");
            $("#<%=hiddenField.ClientID%>").val("");
            $("#<%=lbSelectFile.ClientID %>").text($("#<%=hddLabelUploadFile.ClientID%>").val());
        });


        $('input[type=file]').change(function ()
        {
            var rowcheck = 0;
            /// Load the input into an jquery object
            var $inputFile = $(this);
            /// Set label value using control's index attribute
            var row = $inputFile.attr("index");
            var nameFile = $inputFile.val().split('\\').reverse()[0];

            $("#<%=hiddenField.ClientID%>").val(nameFile);
            $("#<%=lbSelectFile.ClientID %>").text(nameFile);
        });
    }
</script>