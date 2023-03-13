<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Popup.Master" CodeBehind="UploadFile.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Security.Transactions.Cart.UploadFile" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Import Namespace="eBankit.Common" %>
<%@ Import Namespace="eBankit.Common.Extensions" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderID="HeadContent">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("UploadFile-1.0.css".ResolveCssUrl("services/cart"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
               
            <div class="col-md-12 text-center" style="margin-top: 40px; margin-bottom: 30px;">

                <span id="uploadinformation" runat="server"></span>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-9 fileSelected">
                        <asp:Label ID="spanFileName" Text="<%$FrontEndResources:UploadCartFile,Hint %>" runat="server"></asp:Label>
                    </div>
                    <div class="col-sm-3 text-right">
                        <asp:Label ID="lbSelectFile" Text="<%$FrontEndResources:TRX01601,btnSelectFile %>" AssociatedControlID="ucAttachUploader" CssClass="btn uploadfile" runat="server" />
                    </div>
                </div>
            </div>
            <div class="container messageContainer">
                <asp:Label ID="errorMessage" runat="server"></asp:Label>
                <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="display: block;margin-top: 45px;">
                <div class="cart-btn-container text-center">
                    <asp:LinkButton ID="btnCancel" Name="btnCancel" Text="<%$FrontEndResources:UploadCartFile,btnCancel%>" CssClass="btn btn-secondary" OnClientClick="javascript:CloseModal();" runat="server"/>
                    <asp:Button ID="btUpload" Text="<%$FrontEndResources:JS,hdFileName %>" CssClass="btn btn-primary cartuploadlbtnupload" OnClick="btnUploadFile_Click" runat="server" />
                </div>
            </div>
           
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnUploadFileValidate" />
        </Triggers>
    </asp:UpdatePanel>
     <div class="hidden-panel">
                    <asp:FileUpload ID="ucAttachUploader" CssClass="rpt-btnimg-add" runat="server" />
                    <asp:HiddenField ID="hiddenField" EnableViewState="false" runat="server" />
                </div>
    <asp:Button ID="btnUploadFileValidate" CssClass="hidden-panel" OnClick="btnUploadFileValidate_Click" runat="server" />

    <asp:UpdatePanel ID="updDelete" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:HiddenField ID="hdnContentFile" runat="server" />
            <asp:HiddenField ID="hdnFileUploaded" runat="server" />
        </ContentTemplate>

    </asp:UpdatePanel>
       <script>
        var btnUploadFileValidate = "<%=btnUploadFileValidate.UniqueID %>";
        var hiddenField = $("#<%=hiddenField.ClientID %>");

        $(document).ready(function () {

            verifyUploadFile();


        })

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(UpdateMainPage);

        function verifyUploadFile() {
            $('input[type=file]').change(function () {
                var rowcheck = 0;
                /// Load the input into an jquery object
                var $inputFile = $(this);
                /// Set label value using control's index attribute
                var row = $inputFile.attr("index");

                var nameFile = $inputFile.val().split('\\').reverse()[0];

               hiddenField.val(nameFile);
               setTimeout('__doPostBack(btnUploadFileValidate, \'\')','');
                
            });
        }
       $("[name=btnCancel]").on("click", function (event) {
           event.preventDefault();
          eBankit.window.top.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=<%=ConfigurationManager.AppSettings["OPERATION.Key.TransactionsCart"].ToString() %><%=ConfigurationManager.AppSettings["projectId"].ToString() %>';
       });
        function UpdateMainPage() {
            var hdnUploadedFile = $("[id$=hdnFileUploaded]");

            if (hdnUploadedFile.length && hdnUploadedFile.val() === "true") {
                eBankit.window.top.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=<%=ConfigurationManager.AppSettings["OPERATION.Key.TransactionsCart"].ToString() %><%=ConfigurationManager.AppSettings["projectId"].ToString() %>&notification=1';
            }
       };

    </script>
</asp:Content>

