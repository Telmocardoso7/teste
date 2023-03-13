<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="EnrolmentData.ascx.cs" Inherits="eBankit.UI.Modules.Web.AccountOpening.EnrolmentData" %>

<div class="panel panel-default content">
    <div class="panel-body" style="padding-right: 0px;">
        <asp:Repeater ID="requiredDoc" runat="server" OnItemDataBound="requiredDoc_ItemDataBound">
            <HeaderTemplate>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding nMarginLeft15">
                    <div class="col-xs-8 col-sm-9 col-md-9 col-lg-9 clearPadding ">
                        <span class="documents-title" style="display: none;">
                            <asp:Label ID="DocumentsLbl" Text="<%$FrontEndResources:Subscription,DocumentInProcess %>" runat="server" /></span>
                    </div>
                    <div class="col-xs-4 col-sm-3 col-md-3 col-lg-3" style="padding-left: 0;">
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 clearPadding ">
                            <span class="documents-item" style="display: inline-block;">
                                <asp:Literal ID="litStep_1" Text="<%$FrontEndResources:AccountOpening,StateTitle %>" runat="server"></asp:Literal></span>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 clearPadding description">
                            <span class="documents-item">
                                <asp:Literal ID="Literal10" Text="<%$FrontEndResources:AccountOpening,DetailTitle %>" runat="server"></asp:Literal></span>
                        </div>
                    </div>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:HiddenField ID="docType" runat="server" />
                <asp:LinkButton ID="linkFile" runat="server"></asp:LinkButton>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" style="border-bottom: solid 1px #eaeaea;">
                    <div class="col-xs-8 col-sm-9 col-md-9 col-lg-9 clearPadding enrollment-bord" style="padding-right: 10px;">
                        <strong>
                            <asp:Label ID="lbl" runat="server" Text="" /></strong>
                        <asp:Label ID="lblNoFile" runat="server" Text="<%$FrontEndResources:Subscription,DocIsrequired %>"></asp:Label>
                    </div>
                    <div class="col-xs-4 col-sm-3 col-md-3 col-lg-3 clearPadding" style="padding: 5px 0;">
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 clearPadding " style="float: left">
                            <span id="alertPanel" runat="server"></span>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 clearPadding " style="float: left; padding-left: 10px;">
                            <span id="detail" class="detail" runat="server"></span>
                        </div>
                    </div>
                    <div class="clearBoth"></div>
                </div>
                <div class="clearBoth"></div>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</div>

<div class="panel panel-default">
    <span class="documents-title">
        <asp:Literal ID="DocumentsLbl" Text="<%$FrontEndResources:Subscription,AddDocumentToProcess %>" runat="server" />
    </span>
    <div class="panel-body" style="padding-left: 0px; padding-right: 0px;">
        <div class="col-sm-6 col-xs-12 clearPadding">

            <div id="photoPanel" class="photoPanel" draggable="true" ondragstart="OnDragStart" ondrop="OnDrop" runat="server">
                <asp:Label ID="btnSelectFile" Text="" AssociatedControlID="fuTest" Style="background-color: rgb(245,245,245); border: dashed 2px #ddd; height: 100px; margin: auto; width: 100%; text-align: center; cursor: pointer;" runat="server">
                    <img id="imgUser" alt="" src="<%$ebFile:~/Content/currenttheme/images/operations/transfers_in.png%>" style="margin-top: 8%;" runat="server" />
                    <span>
                        <asp:Literal ID="Literal12" Text="<%$FrontEndResources:Register,ClickToSelect %>" runat="server"></asp:Literal></span>
                </asp:Label>
            </div>
            <div style="display: none">
                <asp:FileUpload ID="fuTest" CssClass="rpt-btnimg-add" AllowMultiple="false" runat="server" ClientIDMode="Predictable" onchange="Javascript: CheckFile(this);return false;" />
                <asp:HiddenField ID="hiddenField" runat="server" />
            </div>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="col-sm-5 col-xs-11">
                    <asp:DropDownList ID="dropDocTypes" CssClass="drop" OnChange="ShowOther();" runat="server"></asp:DropDownList>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="col-sm-1 col-xs-1">
            <asp:ImageButton ID="uploadedFile" CssClass="upload" ImageUrl='<%$ebFile:,~/currentmodule/content/currenttheme/images/icon/ico_upload.png%>' OnClientClick="return ValidateOther();" OnClick="uploadFile_Click" runat="server" />
        </div>
        <div class="clearBoth"></div>
        <div id="divOther" class="col-xs-12" style="display: none; margin-top: 20px;" runat="server">
            <it:TextBoxControl_V2 id="txtOtherName" showlabel="true" textmode="SingleLine" label="<%$FrontEndResources:Register,OtherName %>" runat="server" watermark="<%$FrontEndResources:Register,OtherNameWatermark %>" />
        </div>
        <div class="clearBoth"></div>
    </div>
</div>
<asp:HiddenField ID="hdnInputTextField" runat="server" />
<asp:HiddenField ID="hdnPanelVisible" runat="server" />
<asp:HiddenField ID="fileExtensions" runat="server" />
<asp:HiddenField ID="maxSizeFile" runat="server" />
<script type="text/javascript">
    var isCorrect;
    function CheckFile(elem) {
         isCorrect = true;
        var maxSizeValue = $("[id *= 'maxSizeFile']").val();
        var fileExtensions = $("[id *= 'fileExtensions']").val();
        var fileName = elem.value; 
        var ext = fileName.substr(fileName.lastIndexOf('.') + 1).toLowerCase();

        if (fileExtensions != '') {
            var res = fileExtensions.split(",");
            for(var i = 0; i<res.length; i++)
            {
                res[i] = $.trim(res[i]);
            }

            if ($.inArray(ext, res) < 0) {
                isCorrect = false;
                elem.value = null;
                return ShowWarning(top.eBankit.Presentation.GetResource("badExtension"));
            }
        }

        if (parseInt(maxSizeValue) > 0 && elem.files[0].size > parseInt(maxSizeValue)) {
            isCorrect = false;
            elem.value = null;
            return ShowWarning(top.eBankit.Presentation.GetResource("badFileSize"));
        }
    }

    function ShowOther() {
        var divother = $('[id*=divOther]');
        var dropDocTypes = $('[id*=dropDocTypes]:visible');
        if (dropDocTypes.val() == '5') {
            divother.show();
        }
        else {
            divother.hide();
        }
    }

    function ValidateOther() {

        if (!isCorrect) {
            return isCorrect;
        }

        var txtOtherName = $('input[id*=txtOtherName]:visible');
        var dropDocTypes = $('[id*=dropDocTypes]:visible');

        if (txtOtherName.val() == '' && dropDocTypes.val() == '5') {
            eBankit.Presentation.InsertValidateMsg(txtOtherName, top.eBankit.Presentation.GetResource("txtOtherNameRequired"));
            return false;
        }
        else {
            eBankit.Presentation.RemoveValidateMsg(txtOtherName);
            return true;
        }
    }

    $(document).ready(function () {
        ShowOther();
        var txtOtherName = $('input[id*=txtOtherName]:visible');
        txtOtherName.val('');
    });
</script>

