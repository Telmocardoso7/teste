<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProofControl.ascx.cs" Inherits="ProofControl" %>
<div class="printcmmds noprint" id="divCommds" runat="server">
    <div id="divProofMessage" runat="server" class="col-xs-5 col-sm-9 col-md-9 col-lg-9">
        <h4>
            <asp:Literal Visible="false" ID="litTitle" runat="server"></asp:Literal>
        </h4>
        <asp:Literal Visible="false" ID="litMessage" Text="<%$FrontEndResources:PrintControl,ExportMessage %>" runat="server"></asp:Literal>
        <div class="clearBoth"></div>
    </div>
    <ul class="col-lg-8 col-max">
        <li id="li_pr" runat="server" tabindex="0" onkeypress="eBankit.Presentation.ShowPrintCommands(this,3,true)" class="liProofControl">
            <img id="imgPrint" onclick="eBankit.Presentation.ShowPrintCommands(this,3,true)" style="margin: auto;" src="<%$ebSegmentFile:~/content/currenttheme/images/icon/ico_conclusion_print.png%>" runat="server" />
            <a id="a3" onclick="eBankit.Presentation.ShowPrintCommands(this,3,true)" runat="server">
                <asp:Label ID="li_pr_label" runat="server" /></a>
        </li>
        <li id="li_em" runat="server" tabindex="0" onkeyup="if(this === document.activeElement && event.keyCode== 13)eBankit.Presentation.ShowPrintCommands(this,2,true)" class="liProofControl">
            <img id="img2" onclick="eBankit.Presentation.ShowPrintCommands(this,2,true)" style="margin: auto;" src="<%$ebSegmentFile:~/content/currenttheme/images/icon/ico_conclusion_send_mail.png%>" runat="server" />
            <a id="a2" onclick="eBankit.Presentation.ShowPrintCommands(this,2,true)" runat="server">
                <asp:Label ID="li_em_label" runat="server" /></a>

            <div class="printEmailContainer" role="dialog">
                <div id="divPrintCommands_2" class="col-lg-8 col-max printbox hidden-panel">
                    <div id="closeBtnMail" class="closeBtn" onclick="eBankit.Presentation.ClosePrintCommands()" tabindex="0" onkeypress="eBankit.Presentation.ClosePrintCommands()"></div>
                    <div id="divFields">
                        <it:TextBoxControl ID="txtEmailToSend" Label="<%$FrontEndResources:PrintControl,SendMailTo %>" MaxLength="254" OnKeyPress="if (event.keyCode === 13) {eBankit.Presentation.SendEmail();}" CssClass="flRight field metro entireWidth" runat="server" Watermark="<%$FrontEndResources:PrintControl,SendMailToWatermark %>" OnBlur="eBankit.Presentation.ValidatEmail()" />
                        <div class="divButtons">
                            <button id="btnSend" type="button" class="btn btn-primary btn-margin" onclick="eBankit.Presentation.SendEmail();" onkeypress="eBankit.Presentation.SendEmail();">
                                <asp:Literal ID="Literal4" Text="<%$FrontEndResources:PrintControl,Send %>" runat="server"></asp:Literal></button>
                        </div>
                    </div>
                    <div id="divWait" class="wait" style="display: none; text-align: center; width: 100%;">
                        <img src="<%= Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("loading-blue.gif"), Utils.CacheVersionKey.Image) %>" alt="loading" />
                    </div>
                    <div id="divResult" class="result" style="display: block;">
                        <section class="content-message metro fullWidth">
                            <div id="divResultSuccess" class="alert alert-success fade in">
                                <img src="<%= Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("icon/ico_success.png"),Utils.CacheVersionKey.Image) %>" alt="" />
                                <h4 class="alert-heading"><span id="spanResultSuccess"></span></h4>
                                <div class="clearBoth"></div>
                            </div>
                            <div id="divResultError" class="alert alert-danger fade in">
                                <img src="<%= Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("icon/ico_error.png"),Utils.CacheVersionKey.Image)%>" alt="" />
                                <h4 class="alert-heading fullWidth" style="white-space: normal !important; word-wrap: normal !important;">
                                    <span id="spanResultError" class="fullWidth" style="white-space: normal; font-size: 1rem; padding-top: 12px;"></span>
                                </h4>
                                <div class="clearBoth"></div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>

        </li>
        <li id="li_ex" runat="server" onclick="eBankit.Presentation.ShowPrintCommands(this,1,true)" onkeypress="eBankit.Presentation.ShowPrintCommands(this,1,true)" tabindex="0" class="liProofControl">
            <img id="img1" style="margin: auto;" src="<%$ebSegmentFile:~/content/currenttheme/images/icon/ico_conclusion_pdf.png%>" runat="server">
            <a id="a1" runat="server">
                <asp:Label ID="li_ex_label" runat="server" /></a>

            <div id="divPrintCommands_1" class="printbox metro hidden">
                <a class="pdf" id="lnkExportToPDF" onclick="eBankit.Presentation.ExportToPdf();" runat="server">
                    <i class="icon-file-pdf" style="font-size: 2rem; color: #333;"></i>
                    <asp:Literal ID="Literal1" runat="server" Text="<%$FrontEndResources:PrintControl,PDF %>"></asp:Literal></a>
                <a id="lnkExportToExcel" class="exc" onclick="javascript:eBankit.Presentation.ExportToExcel()" runat="server">
                    <i class="icon-file-excel" style="font-size: 2rem; color: #333;"></i>
                    <asp:Literal ID="Literal2" runat="server" Text="<%$FrontEndResources:PrintControl,Excel %>"></asp:Literal></a>
                <a id="lnkExportToTxt" class="exc" onclick="javascript:eBankit.Presentation.ExportToStatementTxt()" runat="server">
                    <i class="icon-file-word" style="font-size: 2rem; color: #333;"></i>
                    <asp:Literal ID="Literal5" runat="server" Text="<%$FrontEndResources:PrintControl,Text %>"></asp:Literal></a>

            </div>

        </li>

        <li id="li_xml" runat="server" onclick="eBankit.Presentation.ShowPrintCommands(this,9,true)" onkeypress="eBankit.Presentation.ShowPrintCommands(this,9,true)" tabindex="0">
            <img id="img9" style="margin: auto;" src="<%$ebSegmentFile:~/content/currenttheme/images/icon/ico_conclusion_xml.png%>" runat="server">
            <a id="a9" runat="server">
                <asp:Label ID="li_xml_label" runat="server" /></a>
        </li>

        <li id="li_excel" runat="server" onclick="eBankit.Presentation.ShowPrintCommands(this,6,true)" onkeypress="eBankit.Presentation.ShowPrintCommands(this,6,true)" tabindex="0">
            <img id="img6" style="margin: auto;" src="<%$ebSegmentFile:~/content/currenttheme/images/icon/ico_conclusion_excel.png%>" runat="server">
            <a id="a6" runat="server">
                <asp:Label ID="li_excel_label" runat="server" /></a>
        </li>

        <li id="li_txt" runat="server" onclick="eBankit.Presentation.ShowPrintCommands(this,8,true)" onkeypress="eBankit.Presentation.ShowPrintCommands(this,8,true)" tabindex="0">
            <img id="img8" style="margin: auto;" src="<%$ebSegmentFile:~/content/currenttheme/images/icon/ico_conclusion_txt.png%>" runat="server">
            <a id="a8" runat="server">
                <asp:Label ID="li_txt_label" runat="server" /></a>
        </li>

        <li id="li_fav" runat="server" tabindex="0" onkeypress="if(this === document.activeElement && event.keyCode== 13)eBankit.Presentation.ShowPrintCommands(this,4,true)">
            <img id="img4" onclick="eBankit.Presentation.ShowPrintCommands(this,4,true)" style="margin: auto;" src="<%$ebSegmentFile:~/content/currenttheme/images/icon/ico_products_favorites.png%>" runat="server" />
            <a id="a4" onclick="eBankit.Presentation.ShowPrintCommands(this,4,true)" runat="server">
                <asp:Label ID="li_fav_label" runat="server" /></a>

            <div class="printFavContainer">
                <div id="divPrintCommands_4" class="col-lg-8 col-max printbox">
                    <div id="closeBtnFavs" class="closeBtn" onclick="eBankit.Presentation.ShowPrintCommands(this,4,true)" onkeypress="eBankit.Presentation.ShowPrintCommands(this,4,true)" tabindex="0"></div>
                    <div id="divResultFavs" class="result hidden-panel">
                        <section class="content-message metro fullWidth">
                            <div id="divResultFavsSuccess" class="alert alert-success fade in">
                                <img src="<%=Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("icon/ico_success.png"),Utils.CacheVersionKey.Image)%>" />
                                <h4 class="alert-heading">
                                    <span id="spanResultFavsSuccess" style="overflow: visible;"></span>
                                </h4>
                                <div class="clearBoth"></div>
                            </div>
                            <div id="divResultFavsError" class="alert alert-danger fade in">
                                <img src="<%=Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("icon/ico_error.png"),Utils.CacheVersionKey.Image)%>" alt="" />
                                <h4 class="alert-heading">
                                    <span id="spanResultFavsError"></span>
                                </h4>
                                <div class="clearBoth"></div>
                            </div>
                        </section>
                    </div>
                    <div id="divFieldsFavs" style="padding: 5px;">
                        <div class="row">
                            <it:TextBoxControl ID="txtFavoritName" Label="<%$FrontEndResources:PrintControl,FavoritName %>" CssClass="field metro" runat="server" Watermark="<%$FrontEndResources:PrintControl,FavoritNameWatermark %>" Width="250" />
                        </div>
                        <div class="metro"><i id="iconStar" class="icon-star-3" runat="server"></i></div>
                        <div class="clearBoth"></div>
                        <div class="divButtons">
                            <button id="btnAddFav" type="button" class="btn btn-primary btn-margin" onkeypress="eBankit.Presentation.AddFav();" onclick="eBankit.Presentation.AddFav();">
                                <asp:Literal ID="Literal3" Text="<%$FrontEndResources:PrintControl,AddFav %>" runat="server"></asp:Literal></button>
                        </div>
                    </div>
                    <div id="divWaitFavs" class="wait" style="display: none; text-align: center;">
                        <img src="<%= Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("loading-blue.gif"),Utils.CacheVersionKey.Image) %>" alt="loading" />
                    </div>
                </div>
            </div>

        </li>
        <li id="li_operations" runat="server" onclick="showTabOperationsProof();" onkeypress="showTabOperationsProof();" tabindex="0">
            <img id="img5" style="margin: auto;" src="<%$ebSegmentFile:~/content/currenttheme/images/icon/ico_products_operations_available.png%>" runat="server" />
            <a id="a5" runat="server">
                <asp:Label ID="li_operations_label" runat="server" /></a>
        </li>
        <li id="li_reuse" runat="server" onclick="eBankit.Presentation.ReuseOperation(this)" onkeypress="eBankit.Presentation.ReuseOperation(this)" tabindex="0" class="liProofControl">
            <img id="img7" style="margin: auto;" src="<%$ebSegmentFile:~/content/currenttheme/images/icon/ico_products_operations.png%>" runat="server" />
            <a id="a7" runat="server">
                <asp:Label ID="li_operationsReuse_label" runat="server" /></a>
        </li>
    </ul>
    <div class="clearBoth"></div>

    <iframe id="iframeControlProof" name="iframeControlProof" title="iframeControlProof" src="/ProofPage.aspx" height="0" width="0" style="border: 0px; visibility: hidden;"></iframe>
</div>
<asp:HiddenField ID="hdnPrntId" runat="server" />
<asp:HiddenField ID="hdnOperTypeId" runat="server" />
<asp:HiddenField ID="hdnProjectId" runat="server" />
<asp:HiddenField ID="hdnTransactionId" runat="server" />
<asp:HiddenField ID="hdnExportJSONType" runat="server" />
<asp:HiddenField ID="hdnExportFilterFields" runat="server" />
<asp:HiddenField ID="hdnIsFlowLabel" runat="server" />
<asp:HiddenField ID="hdnIsXMLExport" runat="server" />
<asp:HiddenField ID="hdnTitle" runat="server" />

<script type="text/javascript">
    $(document).ready(function () {
        var p1 = $("#<%=img1.ClientID %>");
        var p2 = $("#<%=img2.ClientID %>");
        var p3 = $("#<%=imgPrint.ClientID %>");
        var p4 = $("#<%=img4.ClientID %>");
        var p5 = $("#<%=img5.ClientID %>");
        var p6 = $("#<%=img6.ClientID %>");
        var p7 = $("#<%=img7.ClientID %>");
        var p8 = $("#<%=img8.ClientID %>");
        var p9 = $("#<%=img9.ClientID %>");

        $(p1).closest("li").on('mouseover focus', function () {
            $(p1).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_conclusion_pdf_hover.png")%>");
        });
        $(p1).closest("li").on('mouseout focusout', function () {
            $(p1).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_conclusion_pdf.png")%>");
        });

        $(p2).closest("li").on('mouseover focus', function () {
            $(p2).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_conclusion_send_mail_hover.png")%>");
        });
        $(p2).closest("li").on('mouseout focusout', function () {
            $(p2).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_conclusion_send_mail.png")%>");
        });

        $(p3).closest("li").on('mouseover focus', function () {
            $(p3).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_conclusion_print_hover.png")%>");
        });
        $(p3).closest("li").on('mouseout focusout', function () {
            $(p3).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_conclusion_print.png")%>");
        });

        $(p4).closest("li").on('mouseover focus', function () {
            $(p4).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_products_favorites_hover.png")%>");
        });
        $(p4).closest("li").on('mouseout focusout', function () {
            $(p4).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_products_favorites.png")%>");
        });

        $(p5).closest("li").on('mouseover focus', function () {
            $(p5).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_products_operations_available_hover.png")%>");
        });
        $(p5).closest("li").on('mouseout focusout', function () {
            $(p5).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_products_operations_available.png")%>");
        });

        $(p6).closest("li").on('mouseover focus', function () {
            $(p6).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_conclusion_excel_hover.png")%>");
        });
        $(p6).closest("li").on('mouseout focusout', function () {
            $(p6).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_conclusion_excel.png")%>");
        });

        $(p7).closest("li").on('mouseover focus', function () {
            $(p7).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_products_operations_hover.png")%>");
        });
        $(p7).closest("li").on('mouseout focusout', function () {
            $(p7).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_products_operations.png")%>");
        });

        $(p8).closest("li").on('mouseover focus', function () {
            $(p8).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_conclusion_txt_hover.png")%>");
        });
        $(p8).closest("li").on('mouseout focusout', function () {
            $(p8).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_conclusion_txt.png")%>");
        });

        $(p9).closest("li").on('mouseover focus', function () {
            $(p9).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_conclusion_xml_hover.png")%>");
        });
        $(p9).closest("li").on('mouseout focusout', function () {
            $(p9).attr("src", "<%=eBankit.Common.InternetBanking.InternetBankingSettings.ResolveSegmentImagePath("icon/ico_conclusion_xml.png")%>");
        });

        function disableEnterKey(e) {
            var key;

            if (window.event)
                key = window.event.keyCode;     //IE
            else
                key = e.which; //firefox

            if (key === 13) {
                SendResult.SendEmail();
            } else
                return true;
        }


        function stopRKey(evt) {
            var userAgent = navigator.userAgent.toLowerCase();
            var is_opera = /opera/.test(userAgent);
            var is_safari = /webkit/.test(userAgent);

            var evt = (evt) ? evt : ((event) ? event : null);
            if (evt.keyCode === 27) {
                SendResult.HidePrintCmds();
            }
        }

        document.onkeypress = stopRKey;


        $(document).click(function () {
            eBankit.Presentation.HidePrintCmds();
        });

        $('.printcmmds').click(function (e) {
            e.stopPropagation();
        });

        showTabOperationsProof = function (e) {

            if ($("#benefsTabContent #operations:visible").length) {
                
                $("#benefsTabContent #favorit").show();
                $(".trx-container > .col-lg-12").show();

                if ($(".trx-container > .bulk-header") !== null)
                    $(".trx-container > .bulk-header").show();
                   
                $("#benefsTabContent #operations").hide();
                $(".tabSelectorBackground .tabOperacoesDisponiveis").removeClass("tabActive");
            }
            else {
                
                $("#benefsTabContent #favorit").hide();
                $(".trx-container > .col-lg-12").hide();

                if ($(".trx-container > .bulk-header") !== null)
                    $(".trx-container > .bulk-header").hide();

                $("#benefsTabContent #operations").show();
                $(".tabSelectorBackground .tabActive").removeClass("tabActive");
                $(".tabSelectorBackground .tabOperacoesDisponiveis").addClass("tabActive");
            }
        };

        eBankit.Presentation.ReuseOperation = function (e) {
            var operId = $("#<%=this.hdnPrntId.ClientID %>").val();
            var operTypeId = $("#<%=this.hdnOperTypeId.ClientID %>").val();
            var projectId = $("#<%=this.hdnProjectId.ClientID %>").val();
            var transactionId = $("#<%=this.hdnTransactionId.ClientID %>").val();

            if (!(operTypeId == null || operTypeId.trim() === '' || transactionId == null || transactionId === '')) {
                eBankit.window.top.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=' + transactionId + projectId + '&opid=' + operId;
            }
        };

        eBankit.Presentation.EnterEvent = function (e) {
            if (e.keyCode === 13) {
                eBankit.Presentation.SendEmail();
                return false;
            }
        };

        eBankit.Presentation.ExportToPdf = function () {
            var hdnPrntId = $("#<%=this.hdnPrntId.ClientID %>").val();
            var hdnIsFlowLabel = $("#<%=this.hdnIsFlowLabel.ClientID %>").val();
            var hdnTitle = $("#<%=this.hdnTitle.ClientID %>").val();

            document.getElementById('iframeControlProof').contentWindow.GenerateDocument('<%=this.CurrentTransactionID%>', hdnPrntId, hdnIsFlowLabel, hdnTitle);
        };

        eBankit.Presentation.ExportToStatementPdf = function () {
            var hdnPrntId = $("#<%=this.hdnPrntId.ClientID %>").val();
            var hdnIsFlowLabel = $("#<%=this.hdnIsFlowLabel.ClientID %>").val();
            var hdnTitle = $("#<%=this.hdnTitle.ClientID %>").val();

            document.getElementById('iframeControlProof').contentWindow.GenerateDocumentPDF('<%=this.CurrentTransactionID%>', hdnPrntId, hdnIsFlowLabel, hdnTitle);
        };

        eBankit.Presentation.ExportToXML = function () {
            var hdnPrntId = $("#<%=this.hdnPrntId.ClientID %>").val();
            var hdnIsFlowLabel = $("#<%=this.hdnIsFlowLabel.ClientID %>").val();
            var hdnTitle = $("#<%=this.hdnTitle.ClientID %>").val();

            document.getElementById('iframeControlProof').contentWindow.GenerateDocumentXML('<%=this.CurrentTransactionID%>', hdnPrntId, hdnIsFlowLabel, hdnTitle);
        };

        eBankit.Presentation.ExportToStatementTxt = function () {
            var hdnPrntId = $("#<%=this.hdnPrntId.ClientID %>").val();
            var hdnIsFlowLabel = $("#<%=this.hdnIsFlowLabel.ClientID %>").val();
            var hdnTitle = $("#<%=this.hdnTitle.ClientID %>").val();
            document.getElementById('iframeControlProof').contentWindow.GenerateDocumentTxtStatement('<%=this.CurrentTransactionID%>', hdnPrntId, hdnIsFlowLabel, hdnTitle);
        };

        eBankit.Presentation.ExportToExcel = function () {
            var hdnExportJSONType = $("#<%=this.hdnExportJSONType.ClientID %>").val();
            document.getElementById('iframeControlProof').contentWindow.ExportDocument('<%=this.CurrentTransactionID%>', hdnExportJSONType);
        };

        eBankit.Presentation.ValidatEmail = function () {
            var email = $('#<%=txtEmailToSend.TextBoxClientID %>').val();
            if (email !== '') {
                if (!eBankit.Presentation.ValidateEmailExp(email)) {
                    eBankit.Presentation.InsertValidateMsg($('#<%=txtEmailToSend.TextBoxClientID %>'), top.eBankit.Presentation.GetResource("InvalidEmail"));
                } else {
                    eBankit.Presentation.RemoveValidateMsg($('#<%=txtEmailToSend.TextBoxClientID %>'));
                }
            } else {
                eBankit.Presentation.InsertValidateMsg($('#<%=txtEmailToSend.TextBoxClientID %>'), top.eBankit.Presentation.GetResource("RequiredEmail"));
            }
        };

        eBankit.Presentation.SendEmail = function () {
            //
            var email = $('#<%=txtEmailToSend.TextBoxClientID %>').val();

            if (email !== '') {
                if (eBankit.Presentation.ValidateEmailExp(email)) {
                    eBankit.Presentation.RemoveValidateMsg($('#<%=txtEmailToSend.TextBoxClientID %>'));
                    var divFields = $("#divFields");
                    var divWait = $("#divWait");
                    divFields.hide();
                    divWait.show();

                    var hdnPrntId = $("#<%=this.hdnPrntId.ClientID %>").val();
                    var hdnIsFlowLabel = $("#<%=this.hdnIsFlowLabel.ClientID %>").val();
                    var hdnIsXMLExport = $("#<%=this.hdnIsXMLExport.ClientID %>").val();
                    var hdnTitle = $("#<%=this.hdnTitle.ClientID %>").val();
                    document.getElementById('iframeControlProof').contentWindow.SendDocument('<%=this.CurrentTransactionID%>', hdnPrntId, hdnIsFlowLabel, hdnIsXMLExport, hdnTitle, email);
                }
                else {
                    eBankit.Presentation.InsertValidateMsg($('#<%=txtEmailToSend.TextBoxClientID %>'), top.eBankit.Presentation.GetResource("InvalidEmail"));
                }
            }
            else {
                eBankit.Presentation.InsertValidateMsg($('#<%=txtEmailToSend.TextBoxClientID %>'), top.eBankit.Presentation.GetResource("RequiredEmail"));
            }
        };

        eBankit.Presentation.AddFav = function () {
            //
            var favoritName = $('#<%=txtFavoritName.TextBoxClientID %>').val();
            if (favoritName !== '') {
                eBankit.Presentation.RemoveValidateMsg($('#<%=txtFavoritName.TextBoxClientID %>'));
                var divWait = $("#divWaitFavs");
                var divFields = $("#divFieldsFavs");

                divFields.hide();
                divWait.show();

                iframeControlProof.AddToFavorit('<%=this.CurrentTransactionID%>', favoritName);
            } else {
                eBankit.Presentation.InsertValidateMsg($('#<%=txtFavoritName.TextBoxClientID %>'), top.eBankit.Presentation.GetResource("RequiredFavoritDescription"));
            }
        };

        eBankit.Presentation.SendResult = function (id) {

            //
        };

        eBankit.Presentation.ShowInitialSreen = function (isok) {
            var divWait = $("#divWait");
            var divResult = $("#divResult");
            divWait.hide();
            divResult.show();
            if (!isok) {
                $("#divResultSuccess").hide();
                $("#divResultError").show();
                $("#spanResultError").text(top.eBankit.Presentation.GetResource("SendEmailError"));
            } else {
                $("#divResultSuccess").show();
                $("#divResultError").hide();
                $("#spanResultSuccess").text(top.eBankit.Presentation.GetResource("SendEmailSuccess"));
            }
        };

        eBankit.Presentation.ShowFavInitialSreen = function (isok) {
            var divWait = $("#divWaitFavs");
            var divResult = $("#divResultFavs");
            divWait.hide();
            divResult.show();
            if (!isok) {
                $("#divResultFavsSuccess").hide();
                $("#divResultFavsError").show();
                $("#spanResultFavsError").text(top.eBankit.Presentation.GetResource("AddFavoritErrorMessage"));
            } else {
                $("#divResultFavsSuccess").show();
                $("#divResultFavsError").hide();
                $("#spanResultFavsSuccess").text(top.eBankit.Presentation.GetResource("AddFavoritSucessMessage"));
            }
        };

        eBankit.Presentation.HidePrintCmds = function (event) {
            $(".printcmmds > .printbox").hide();
            $("#<%=li_fav.ClientID %>").removeClass("printbox_active");
            $("#<%=li_em.ClientID %>").removeClass("printbox_active");
            $("#<%=li_pr.ClientID %>").removeClass("printbox_active");
            $("#<%=li_ex.ClientID %>").removeClass("printbox_active");
            $("#<%=li_excel.ClientID %>").removeClass("printbox_active");

        };

        eBankit.Presentation.ClosePrintCommands = function () {
            $("#divPrintCommands_2").hide();
            $("#divFields").show();
            $("#divResultSuccess").hide();
            $("#divResultError").hide();
        };

        eBankit.Presentation.ShowPrintCommands = function (ob, id, click) {

            if ($("#benefsTabContent #operations:visible").length) {
                $("#benefsTabContent #favorit").show();
                $(".trx-container > .col-lg-12").show();
                $("#benefsTabContent #operations").hide();
                $(".tabSelectorBackground .tabOperacoesDisponiveis").removeClass("tabActive");
            }

            var jobj = $("#" + ob.id);

            for (var i = 1; i < 5; i++) {
                if (i !== id) {
                    $("#divPrintCommands_" + i).hide();
                }
            }

            var coords = eBankit.Presentation.GetPageCoords(eBankit.Presentation.GetElementObject("<%=divCommds.ClientID %>"));

            if (id !== 3 && id !== 1 && id !== 6 && id !== 8 && id !== 9) {
                if ($("#divPrintCommands_" + id).css("display") === "none") {
                    $("#divPrintCommands_" + id).css({
                        display: "block"
                    }).css("z-index", "8");
                    $("#divFields div:first-child > input[type='text']").focus();
                } else {
                    $("#divPrintCommands_" + id).css({
                        display: "none"
                    }).css("z-index", "8");
                }

                switch (ob.id) {
                    case "<%=li_pr.ClientID %>":
                        $("#<%=li_ex.ClientID %>").removeClass("printbox_active");
                        $("#<%=li_em.ClientID %>").removeClass("printbox_active");
                        $("#<%=li_fav.ClientID %>").removeClass("printbox_active");
                        break;
                    case "<%=li_ex.ClientID %>":
                        $("#<%=li_pr.ClientID %>").removeClass("printbox_active");
                        $("#<%=li_fav.ClientID %>").removeClass("printbox_active");
                        $("#<%=li_em.ClientID %>").removeClass("printbox_active");
                        break;
                    default:
                        if (id === 2) {
                            $("#<%=li_pr.ClientID %>").removeClass("printbox_active");
                            $("#<%=li_ex.ClientID %>").removeClass("printbox_active");
                            $("#<%=li_fav.ClientID %>").removeClass("printbox_active");
                            var divFields = $("#divFields");
                            var divWait = $("#divWait");
                            var divResult = $("#divResult");
                            divWait.hide();
                            divResult.hide();
                            divFields.show();
                        }
                        else if (id === 4) {
                            $("#<%=li_pr.ClientID %>").removeClass("printbox_active");
                            $("#<%=li_ex.ClientID %>").removeClass("printbox_active");
                            $("#<%=li_em.ClientID %>").removeClass("printbox_active");
                        }
                        break;
                }
                jobj.addClass("printbox_active");
            }

            else if (id === 1) {
                $("#<%=li_em.ClientID %>").removeClass("printbox_active");
                $("#<%=li_fav.ClientID %>").removeClass("printbox_active");
                $("#<%=li_ex.ClientID %>").removeClass("printbox_active");
                if (click) {
                    eBankit.Presentation.ExportToPdf();

                }
            }
            else if (id === 6) {
                $("#<%=li_em.ClientID %>").removeClass("printbox_active");
                $("#<%=li_fav.ClientID %>").removeClass("printbox_active");
                $("#<%=li_ex.ClientID %>").removeClass("printbox_active");
                if (click) {
                    eBankit.Presentation.ExportToExcel();
                }
            }
            else if (id === 8) {
                $("#<%=li_em.ClientID %>").removeClass("printbox_active");
                $("#<%=li_fav.ClientID %>").removeClass("printbox_active");
                $("#<%=li_ex.ClientID %>").removeClass("printbox_active");
                if (click) {
                    eBankit.Presentation.ExportToStatementTxt();
                }
            } else if (id == 9) {
                $("#<%=li_em.ClientID %>").removeClass("printbox_active");
                $("#<%=li_fav.ClientID %>").removeClass("printbox_active");
                $("#<%=li_ex.ClientID %>").removeClass("printbox_active");
                if (click) {
                    eBankit.Presentation.ExportToXML();
                }
            }
            else {
                $("#<%=li_em.ClientID %>").removeClass("printbox_active");
                $("#<%=li_fav.ClientID %>").removeClass("printbox_active");
                $("#<%=li_ex.ClientID %>").removeClass("printbox_active");
                $("#<%=li_pr.ClientID %>").removeClass("printbox_active");
                if (click) {
                    if (eBankit.browsers.isSafari) {
                        document.execCommand('print', false, null);
                    } else {
                        window.print();
                    }
                }
            }
        };
    });



</script>
