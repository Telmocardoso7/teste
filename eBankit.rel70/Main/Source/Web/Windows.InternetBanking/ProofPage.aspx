<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProofPage.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.ProofPage" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("jquery-3.6.0.js".ResolveJsUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("jquery-ui-1.13.js".ResolveJsUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("jquery.blockUI.js".ResolveJsUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <script type="text/javascript">
        var perform_acrobat_detection = function () {
            //
            // The returned object
            // 
            var browser_info = {
                name: null,
                acrobat: null,
                acrobat_ver: null
            };

            if (navigator && (navigator.userAgent.toLowerCase()).indexOf("chrome") > -1) browser_info.name = "chrome";
            else if (navigator && (navigator.userAgent.toLowerCase()).indexOf("msie") > -1) browser_info.name = "ie";
            else if (navigator && (navigator.userAgent.toLowerCase()).indexOf("firefox") > -1) browser_info.name = "firefox";
            else if (navigator && (navigator.userAgent.toLowerCase()).indexOf("msie") > -1) browser_info.name = "other";


            try {
                if (browser_info.name == "ie") {
                    var control = null;

                    //
                    // load the activeX control
                    //                
                    try {
                        // AcroPDF.PDF is used by version 7 and later
                        control = new ActiveXObject('AcroPDF.PDF');
                    }
                    catch (e) { }

                    if (!control) {
                        try {
                            // PDF.PdfCtrl is used by version 6 and earlier
                            control = new ActiveXObject('PDF.PdfCtrl');
                        }
                        catch (e) { }
                    }

                    if (!control) {
                        browser_info.acrobat == null;
                        return browser_info;
                    }

                    version = control.GetVersions().split(',');
                    version = version[0].split('=');
                    browser_info.acrobat = "installed";
                    browser_info.acrobat_ver = parseFloat(version[1]);
                }
                else if (browser_info.name == "chrome") {
                    for (key in navigator.plugins) {
                        if (navigator.plugins[key].name == "Chrome PDF Viewer" || navigator.plugins[key].name == "Adobe Acrobat") {
                            browser_info.acrobat = "installed";
                            browser_info.acrobat_ver = parseInt(navigator.plugins[key].version) || "Chome PDF Viewer";
                        }
                    }
                }
                //
                // NS3+, Opera3+, IE5+ Mac, Safari (support plugin array):  check for Acrobat plugin in plugin array
                //    
                else if (navigator.plugins != null) {
                    var acrobat = navigator.plugins['Adobe Acrobat'];
                    if (acrobat == null) {
                        browser_info.acrobat = null;
                        return browser_info;
                    }
                    browser_info.acrobat = "installed";
                    browser_info.acrobat_ver = parseInt(acrobat.version[0]);
                }


            }
            catch (e) {
                browser_info.acrobat_ver = null;
            }

            return browser_info;
        };

        function CallbackProof(result) {
            parent.eBankit.Presentation.ShowInitialSreen(result);
        }

        function CallbackFavorit(result) {
            parent.eBankit.Presentation.ShowFavInitialSreen(result);
        }
    </script>

</head>
<body>
    <form id="formPrint" runat="server">
        <it:CustomScriptManager ID="ScriptManager" runat="server" EnablePageMethods="false" EnablePartialRendering="true" EnableScriptGlobalization="false" EnableScriptLocalization="true" ScriptMode="debug" />
        <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("common-1.0.js".ResolveJsUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

        <asp:Button ID="btnPostBack" CssClass="hidden" runat="server" role="presentation" />
        <asp:Button ID="btnPostBackPDF" CssClass="hidden" runat="server" role="presentation" />
        <asp:Button ID="btnPostBackPDFDoc" CssClass="hidden" runat="server" role="presentation" />
        <asp:Button ID="btnPostBackExcel" CssClass="hidden" runat="server" role="presentation" />
        <asp:Button ID="btnPostBackXML" CssClass="hidden" runat="server" role="presentation" />

        <asp:Button ID="btnPostBackTxtStatements" CssClass="hidden" runat="server" role="presentation" />
        <asp:Button ID="btnPostBackNotAdobe" CssClass="hidden" runat="server" role="presentation" />
        <asp:Button ID="btnPostBackEmail" CssClass="hidden" runat="server" role="presentation" />
        <asp:Button ID="btnPostBackAddFav" CssClass="hidden" runat="server" role="presentation" />
        <asp:Button ID="btnPostBackDigitalDoc" CssClass="hidden" runat="server" role="presentation" />
        <asp:Button ID="btnPostBackPS2Doc" CssClass="hidden" runat="server" role="presentation" />


        <asp:Button ID="btnDownloadFile" CssClass="hidden" runat="server" OnClick="btnDownloadFile_Click" role="presentation" />


        <asp:HiddenField ID="hdnPrntJSONType" runat="server" />
        <asp:HiddenField ID="hdnPrintId" runat="server" />
        <asp:HiddenField ID="hdnTransactionId" runat="server" />
        <asp:HiddenField ID="hdnEmail" runat="server" />
        <asp:HiddenField ID="hdnFavName" runat="server" />
        <asp:HiddenField ID="hdnIsFlowLabel" runat="server" />
        <asp:HiddenField ID="hdnIsXMLExport" runat="server" />
        <asp:HiddenField ID="hdnTitle" runat="server" />
        <asp:HiddenField ID="hdnClientNumber" runat="server" />
        <asp:HiddenField ID="hdnDocumentName" runat="server" />
        <asp:HiddenField ID="hdnDigitalDocType" runat="server" />
        <asp:HiddenField ID="hdnDigitalDocDate" runat="server" />
        <asp:HiddenField ID="hdnDigitalDocName" runat="server" />
        <asp:HiddenField ID="hdnPS2DocId" runat="server" />
        <asp:HiddenField ID="hdnPS2DocName" runat="server" />
        <asp:HiddenField ID="hdnEntityDescription" ClientIDMode="Static" runat="server" />


        <script type="text/javascript">

            function GenerateDocumentAudit(iddocument) {
                debugger;
                $('#<%= hdnPrintId.ClientID %>').val(iddocument);
                $('#<%= btnDownloadFile.ClientID %>').click();
            }

            function GenerateDocument(trxid, printId, isFlowLabel, title) {
                var hdnPrintId = $("#<%=hdnPrintId.ClientID %>");
                var hdnTransactionId = $("#<%=hdnTransactionId.ClientID %>");
                var hdnIsFlowLabel = $("#<%=hdnIsFlowLabel.ClientID %>");
                var hdnTitle = $("#<%=hdnTitle.ClientID %>");
                hdnTransactionId.val(trxid);
                hdnPrintId.val(printId);
                hdnIsFlowLabel.val(isFlowLabel);
                hdnTitle.val(title);

                if (perform_acrobat_detection().acrobat !== null) {
                    $("#<%=btnPostBack.ClientID %>").click();
                }
                else {
                    $("#<%=btnPostBackNotAdobe.ClientID %>").click();
                }
            }

            function GenerateDocumentPDF(trxid, printId, isFlowLabel, title) {
                var hdnPrintId = $("#<%=hdnPrintId.ClientID %>");
                var hdnTransactionId = $("#<%=hdnTransactionId.ClientID %>");
                var hdnIsFlowLabel = $("#<%=hdnIsFlowLabel.ClientID %>");
                var hdnTitle = $("#<%=hdnTitle.ClientID %>");
                hdnTransactionId.val(trxid);
                hdnPrintId.val(printId);
                hdnIsFlowLabel.val(isFlowLabel);
                hdnTitle.val(title);

                $("#<%=btnPostBackPDF.ClientID %>").click();
            }

            function GenerateDocumentXML(trxid, printId, isFlowLabel, title) {
                var hdnPrintId = $("#<%=hdnPrintId.ClientID %>");
                var hdnTransactionId = $("#<%=hdnTransactionId.ClientID %>");
                var hdnIsFlowLabel = $("#<%=hdnIsFlowLabel.ClientID %>");
                var hdnTitle = $("#<%=hdnTitle.ClientID %>");
                hdnTransactionId.val(trxid);
                hdnPrintId.val(printId);
                hdnIsFlowLabel.val(isFlowLabel);
                hdnTitle.val(title);

                $("#<%=btnPostBackXML.ClientID %>").click();
            }

            function GenerateDocumentTxtStatement(trxid, printId, isFlowLabel, title) {

                var hdnPrintId = $("#<%=hdnPrintId.ClientID %>");
                var hdnTransactionId = $("#<%=hdnTransactionId.ClientID %>");
                var hdnIsFlowLabel = $("#<%=hdnIsFlowLabel.ClientID %>");
                var hdnTitle = $("#<%=hdnTitle.ClientID %>");
                hdnTransactionId.val(trxid);
                hdnPrintId.val(printId);
                hdnIsFlowLabel.val(isFlowLabel);
                hdnTitle.val(title);

                $("#<%=btnPostBackTxtStatements.ClientID %>").click();
            }

            function GeneratePDFDocument(docname, clientnumber) {

                var hdnClientNumber = $("#<%=hdnClientNumber.ClientID %>");
                var hdnDocumentName = $("#<%=hdnDocumentName.ClientID %>");
                hdnClientNumber.val(clientnumber);
                hdnDocumentName.val(docname);

                $("#<%=btnPostBackPDFDoc.ClientID %>").click();
            }

            function ExportDocument(trxid, typeofdata) {
                var hdnPrntJSONType = $("#<%=hdnPrntJSONType.ClientID %>");
                var hdnTransactionId = $("#<%=hdnTransactionId.ClientID %>");
                hdnTransactionId.val(trxid);
                hdnPrntJSONType.val(typeofdata);

                $("#<%=btnPostBackExcel.ClientID %>").click();
            }


            function SendDocument(trxid, printId, isFlowLabel, isXMLExport, title, email) {
                var hdnPrintId = $("#<%=hdnPrintId.ClientID %>");
                var hdnEmail = $("#<%=hdnEmail.ClientID %>");
                var hdnTransactionId = $("#<%=hdnTransactionId.ClientID %>");
                var hdnIsFlowLabel = $("#<%=hdnIsFlowLabel.ClientID %>");
                var hdnIsXMLExport = $("#<%=hdnIsXMLExport.ClientID %>");
                var hdnTitle = $("#<%=hdnTitle.ClientID %>");

                hdnIsFlowLabel.val(isFlowLabel);
                hdnIsXMLExport.val(isXMLExport);
                hdnPrintId.val(printId);
                hdnTransactionId.val(trxid);
                hdnEmail.val(email);
                hdnTitle.val(title);

                $("#<%=btnPostBackEmail.ClientID %>").click();
            }

            function AddToFavorit(trxid, name) {
                var hdnFavName = $("#<%=hdnFavName.ClientID %>");
                var hdnTransactionId = $("#<%=hdnTransactionId.ClientID %>");
                hdnTransactionId.val(trxid);
                hdnFavName.val(name);

                $("#<%=btnPostBackAddFav.ClientID %>").click();
            }

            function ExportDigitalDocument(docType, docDate, docName) {
                var hdnDigitalDocType = $("#<%=hdnDigitalDocType.ClientID %>");
                var hdnDigitalDocDate = $("#<%=hdnDigitalDocDate.ClientID %>");
                var hdnDigitalDocName = $("#<%=hdnDigitalDocName.ClientID %>");
                hdnDigitalDocType.val(docType);
                hdnDigitalDocDate.val(docDate);
                hdnDigitalDocName.val(docName);

                $("#<%=btnPostBackDigitalDoc.ClientID %>").click();
            }

            function ExportPS2File(docId, docName) {
                var hdnPS2DocId = $("#<%=hdnPS2DocId.ClientID %>");
                var hdnPS2DocName = $("#<%=hdnPS2DocName.ClientID %>");
                hdnPS2DocId.val(docId);
                hdnPS2DocName.val(docName);

                $("#<%=btnPostBackPS2Doc.ClientID %>").click();
            }

            $(document).ready(function () {
                setTimeout(function () {
                    $("#hdnEntityDescription").val($("#MainContent_TransactionMainContent_txpTransactions_ctl01_ctl01_ctl02_lbLeft", window.parent.document).parent().find("span").eq(1).text());
                }, 1200);

            });
        </script>
    </form>

</body>
</html>
