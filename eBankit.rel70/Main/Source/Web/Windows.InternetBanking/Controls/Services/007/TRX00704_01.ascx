<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00704_01.ascx.cs" Inherits="TRX00704_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div id="Div1" class="panel-benef fullWidth" style="height: auto; background: rgb(247, 247, 247); border-radius: 5px; padding: 12px 0px 5px 0px;" runat="server">
        <div class="col-lg-8 col-max">
            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" style="padding-left: 5px !important;">
                <div style="margin: -3px 10px 0px -4px; width: auto; float: left;">
                    <img id="imgFavorit" src="<%$ebFile:~/content/currenttheme/images/benef_1.png %>" alt="" class="img-thumbnail img-circle" style="width: 42px; height: 42px; margin-top: 5px; padding: 0px;" runat="server" />
                     <img id="imgSharedFav" src="<%$ebFile:~/Content/currenttheme/images/icon/action/corporate/action-shared.png%>" alt="" runat="server" class="imgShareIconAbove"/>
                </div>
                <div class="favorit-first" style="padding-top: 2px;">

                    <h3 class="text-responsive-1-4" style="margin-bottom: 0px; padding-bottom: 3px;">
                        <asp:Literal ID="litName" Text='<%#Eval("Name")%>' runat="server"></asp:Literal></h3>
                    <p class="text-responsive-1">
                        <asp:Literal ID="litAmount" runat="server"></asp:Literal>
                    </p>
                </div>
            </div>

            <div class="col-xs-6 col-sm-4 col-md-4 col-lg-4" style="padding-top: 2px; text-align: center;">
                <p class="text-responsive-1-4" style="color: #666; margin-bottom: 0px; padding-bottom: 3px;">
                    <asp:Literal ID="litFavoritType" Text="<%$FrontEndResources:TRX00804,litFavoritType%>" runat="server"></asp:Literal>
                </p>
                <h3 class="favorit-center text-responsive-1-4" style="padding-bottom: 2px;">
                    <asp:Literal ID="litTypeValue" runat="server"></asp:Literal>
                </h3>
            </div>

            <div class="col-xs-6 col-sm-4 col-md-4 col-lg-4" style="padding-top: 2px; text-align: right; padding-left: 0px;">
                <p class="text-responsive-1-4" style="color: #666; margin-bottom: 0px; padding-bottom: 3px;">
                    <asp:Literal ID="litFavoritDestin" runat="server"></asp:Literal>
                </p>
                <h3 class="favorit-center text-responsive-1-4" style="padding-bottom: 2px;">
                    <asp:Literal ID="litDestinValue" runat="server"></asp:Literal>
                </h3>
            </div>
            <div class="clearBoth"></div>
        </div>
    </div>
    <div id="Div2" class="transaction-content" runat="server">
        <it:FlowInnerContainer ID="FlowInnerContainer1" Title="<%$FrontEndResources:TRX00704,BeneficiaryTitle%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
            <div class="favorit_panel">
                <asp:UpdatePanel ID="updUpload" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <div class="col-xs-12">
                            <div id="photoPanel" class="photoPanel" draggable="true" ondragstart="OnDragStart" ondrop="OnDrop" runat="server">
                                <asp:Label ID="btnSelectFile" Text="" ToolTip="<%$FrontEndResources:TRX00704,UploadImage%>" AssociatedControlID="ucAttachUploader" Style="background-color: rgb(245,245,245); border: dashed 2px #ddd; height: 305px; margin: auto; width: 100%; text-align: center; cursor: pointer;" runat="server">
                                    <img id="imgUser" alt="" src="<%$ebFile:~/content/currenttheme/images/profile_picture.png %>" style="margin-top: 8%;" onclick="OpenDialog()" runat="server" />
                                </asp:Label>
                            </div>
                            <div style="display: none">
                                <asp:FileUpload ID="ucAttachUploader" CssClass="rpt-btnimg-add" runat="server" ClientIDMode="Predictable" />
                                <asp:HiddenField ID="hiddenField" runat="server" />
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="clearBoth" style="margin-bottom: 20px;"></div>
                <it:TextBoxControlWithImage_v3 ID="txtFavoritName" CssClass="field break field_v2 field_img break" IsRequired="true" MaxLength="200" Label="<%$FrontEndResources:PrintControl,FavoritName%>" Watermark="<%$FrontEndResources:PrintControl,FavoritNameWatermark %>" HideImage="true" runat="server" />
                <asp:Panel ID="pnControls" runat="server"></asp:Panel>
            </div>
        </it:FlowInnerContainer>
    </div>
    <div class="trs_buttons">
        <div class="trs_buttons-action col-lg-8 col-max">
            
            <a id="btnBack" class="btn btn-default" style="margin-top: 10px; margin-right: 0px;" runat="server"><asp:Literal Text="<%$FrontEndResources:TRX00704,btnBack %>" runat="server"></asp:Literal></a>

            <asp:Button ID="btnSave" CssClass="btn btn-primary" Style="margin-top: 10px; margin-right: 0px;" Text="<%$FrontEndResources:TRX00704,btnSave %>" runat="server" OnClientClick="return eBankit.Presentation.TRX00704158.ValidateForm();" OnClick="btnSave_Click" />
        </div>
    </div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00704-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>

<div class="clearBoth"></div>
<asp:Button ID="btnUploadFileValidate" CssClass="hidden" runat="server" />
<asp:HiddenField ID="hdnFavId" runat="server" />
<script type="text/javascript">

    $("img[id$='imgFavorit']").attr('alt', '');
    $("img[id$='imgUser']").attr('alt', '');
    // add tabindex to label - upload picture dialog
    $("div[id$='photoPanel'] label").attr('tabindex', '0');
    // remove scroll with space key inside container and trigger click 
    $("div[id$='photoPanel'] label").keypress(function (e) {
        if (e.keyCode == 32) {
            e.preventDefault();
            e.currentTarget.click();
        }
    });

    $(function () {
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
    });

    ValidateValidFile = function () {
        var ret = false;

        if (ucAttachUploader.val() != '') {
            ret = true;
        }

        return ret;
    }

    ValidateCustom = function () {
        var ret = true;

        if (txtFavoritName.val() == '') {
            eBankit.Presentation.InsertValidateMsg_V2(txtFavoritName, top.eBankit.Presentation.GetResource("txtFavoritName"));
            ret = false;
        }
        else {
            eBankit.Presentation.RemoveValidateMsg(txtFavoritName);
        }

        return ret;
    }

    OpenDialog = function () {
        if (navigator && (navigator.userAgent.toLowerCase()).indexOf("msie") > -1 || navigator && (navigator.userAgent.toLowerCase()).indexOf(".net") > -1) {
            ucAttachUploader.click();
        }
    }

</script>
