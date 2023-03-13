<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SurveyTransactionControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.UserEngagementHub.SurveyTransactionControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>


<div class="survey-landing" runat="server" id="divSurvey">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max no-padding">
        <asp:UpdatePanel ID="updPanelSurvey" runat="server" UpdateMode="Always">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnClosedSurvey" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <div class="survey-landing-question">
                    <div id="divStars" class="divStars" runat="server">
                        <div id="divStarsInfo">
                            <div id="divStarsQuestion" class="divQuestion">
                                <div class="divQuestion">
                                    <asp:Label ID="lblStarsQuestion" runat="server" CssClass="questionText"></asp:Label>
                                </div>
                                <div class="divCallout">
                                    <asp:Label ID="lblStarsCallout" runat="server" CssClass="calloutText"></asp:Label>
                                </div>
                            </div>
                            <div id="divStarsResponse" class="divResponse">
                                <div id="divStarsRate">
                                    <p>
                                        <img class="stars" tabindex="0" src="/Content/Themes/ebankIT/images/user_engagement_hub/rating_star_default.png" name="star" id="star1" onclick="fillStars(1,this);" onmouseover="fillStarsHover(1,this)" onmouseout="verifyStarsSelected(this)" onkeypress="fillStarsKeyPress(1,this);" runat="server" />
                                        <img class="stars" tabindex="0" src="/Content/Themes/ebankIT/images/user_engagement_hub/rating_star_default.png" name="star" id="star2" onclick="fillStars(2,this);" onmouseover="fillStarsHover(2,this)" onmouseout="verifyStarsSelected(this)" onkeypress="fillStarsKeyPress(2,this);" runat="server" />
                                        <img class="stars" tabindex="0" src="/Content/Themes/ebankIT/images/user_engagement_hub/rating_star_default.png" name="star" id="star3" onclick="fillStars(3,this);" onmouseover="fillStarsHover(3,this)" onmouseout="verifyStarsSelected(this)" onkeypress="fillStarsKeyPress(3,this);" runat="server" />
                                        <img class="stars" tabindex="0" src="/Content/Themes/ebankIT/images/user_engagement_hub/rating_star_default.png" name="star" id="star4" onclick="fillStars(4,this);" onmouseover="fillStarsHover(4,this)" onmouseout="verifyStarsSelected(this)" onkeypress="fillStarsKeyPress(4,this);" runat="server" />
                                        <img class="stars" tabindex="0" style="float: none !important" src="/Content/Themes/ebankIT/images/user_engagement_hub/rating_star_default.png" name="star" id="star5" onclick="fillStars(5,this);" onmouseover="fillStarsHover(5,this)" onmouseout="verifyStarsSelected(this)" onkeypress="fillStarsKeyPress(5,this);" runat="server" />
                                    </p>
                                </div>
                            </div>
                            <div class="clearBoth"></div>
                            <div id="divComments" class="commentsText" runat="server">
                                <asp:Label ID="lblCommentsInfo" runat="server" Text="<%$FrontEndResources:SurveyTransaction,CommentsInfo%>" CssClass="commentsInfo"></asp:Label>
                                <asp:TextBox ID="txtStarsComments" ToolTip="<%$FrontEndResources:SurveyTransaction,CommentsInfo%>" runat="server" TextMode="MultiLine" MaxLength="250" class="commentsTextArea"></asp:TextBox>
                            </div>
                            <div id="divStarsBtnAll" class="divBtnAll">
                                <div class="divBtnClose">
                                    <asp:LinkButton ID="btnStarsClose" CssClass="btn-close" runat="server" >
                                        <asp:Literal ID="litBtnStarsClose"  runat="server"></asp:Literal>
                                    </asp:LinkButton>
                                </div>
                                <div id="divStarsBtnSubmit" class="divBtnSubmit">
                                    <asp:LinkButton ID="btnStarsSubmit" runat="server" ToolTip="<%$FrontEndResources:SurveyTransaction,btnSubmit%>" CssClass="btn-submit">
                                        <asp:Literal ID="litBtnSubmit" Text="<%$FrontEndResources:SurveyTransaction,btnSubmit%>" runat="server"></asp:Literal>
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="divThumbsUpDown" class="divThumbsUpDown" runat="server">
                        <div id="divdivThumbsUpDownInfo">
                            <div id="divThumbsUpDownText" class="divQuestion">
                                <div class="divQuestion">
                                    <asp:Label ID="lblThumbsQuestion" runat="server" CssClass="questionText"></asp:Label>
                                </div>
                                <div class="divCallout">
                                    <asp:Label ID="lblThumbsCallout" runat="server" CssClass="calloutText"></asp:Label>
                                </div>
                            </div>
                            <div id="divThumbsUpDownResponse" class="divResponse">
                                <div id="divThumbsRate">
                                    <p>
                                        <img class="thumbs" tabindex="0" src="/Content/Themes/ebankIT/images/user_engagement_hub/thumbs_up_default.png" name="thumb" id="thumb1" onclick="fillThumbs(this);" onmouseover="fillThumbsHover(this)" onmouseout="verifyThumbsSelected(this)" onkeypress="fillThumbsKeyPress(this);" runat="server" />
                                        <img class="thumbs" tabindex="0" src="/Content/Themes/ebankIT/images/user_engagement_hub/thumbs_down_default.png" name="thumb" id="thumb2" onclick="fillThumbs(this);" onmouseover="fillThumbsHover(this)" onmouseout="verifyThumbsSelected(this)" onkeypress="fillThumbsKeyPress(this);" runat="server" />
                                    </p>
                                </div>
                            </div>
                            <div class="clearBoth"></div>
                            <div id="divThumbsComments" class="commentsText" runat="server">
                                <asp:Label ID="lblThumbsComments" runat="server" Text="<%$FrontEndResources:SurveyTransaction,CommentsInfo%>" CssClass="commentsInfo"></asp:Label>
                                <asp:TextBox ID="txtThumbsComments" ToolTip="<%$FrontEndResources:SurveyTransaction,CommentsInfo%>" runat="server" TextMode="MultiLine" MaxLength="250" class="commentsTextArea"></asp:TextBox>
                            </div>
                            <div id="divThumbsBtnAll" class="divBtnAll">
                                <div class="divBtnClose">
                                    <asp:LinkButton ID="btnCloseThumbs" CssClass="btn-close" runat="server" >
                                        <asp:Literal ID="litBtnCloseThumbs"  runat="server"></asp:Literal>
                                    </asp:LinkButton>
                                </div>
                                <div id="divThumbsBtnSubmit" class="divBtnSubmit">
                                    <asp:LinkButton ID="btnSubmitThumbs" runat="server" ToolTip="<%$FrontEndResources:SurveyTransaction,btnSubmit%>" CssClass="btn-submit">
                                        <asp:Literal ID="litSubmitThumbs" Text="<%$FrontEndResources:SurveyTransaction,btnSubmit%>" runat="server"></asp:Literal>
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Button ID="btnClosedSurvey" runat="server" Style="display: none;" />
                <div class="clearBoth"></div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
<asp:Button ID="btnSubmitSurvey" runat="server" Style="display: none;" />

<div class="survey-landing-message" runat="server" id="divSurveyMessage" style="display: none;">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max no-padding">
        <div id="divMessageSuccess" runat="server" style="display: none;" class="divMessageSuccess">
            <div id="divImgSuccess" class="divImgSuccess">
                <img id="imgSuccess" src="<%$ebFile:~/Content/Themes/ebankIT/images/user_engagement_hub/warning_success.png%>" alt="" runat="server" />
            </div>
            <div id="divInfoSuccess" class="divInfoSuccess">
                <asp:Label ID="lblInfoSuccess" Text="<%$FrontEndResources:SurveyTransaction,InfoSuccess%>" runat="server"></asp:Label>
            </div>
        </div>
        <div id="divMessageError" runat="server" style="display: none;" class="divMessageError">
            <div id="divImgError" class="divImgError">
                <img id="imgError" src="<%$ebFile:~/Content/Themes/ebankIT/images/user_engagement_hub/warning_error.png%>" alt="" runat="server" />
            </div>
            <div id="divInfoError" class="divInfoError">
                <asp:Label ID="lblInfoError" Text="<%$FrontEndResources:SurveyTransaction,InfoError%>" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</div>
<asp:HiddenField ID="hdnNextSurvey" runat="server" />
<asp:HiddenField ID="hdnRate" runat="server" />
<asp:HiddenField ID="hdnResponseSurvey" runat="server" />
<asp:HiddenField ID="hdnBrowserFingerPrint" runat="server" />
<asp:HiddenField ID="hdnBrowserName" runat="server" />
<asp:HiddenField ID="hdnBrowserResolution" runat="server" />
<asp:HiddenField ID="hdnOperationSystem" runat="server" />
<asp:HiddenField ID="MinLat" runat="server" />
<asp:HiddenField ID="MinLon" runat="server" />


<link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("LandingSurvey-1.0.css".ResolveCssUrl("services/widgets"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("LandingSurvey.js".ResolveJsUrl("Services/Widgets"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("fingerprint2.js".ResolveJsUrl("services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("ua-parser.js".ResolveJsUrl("services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>

<script type="text/javascript">

    var fingerprintReport = function () {
        var d1 = new Date();
        Fingerprint2.get(
            {
                preprocessor: function (key, value) {
                    if (key == "userAgent") {
                        var parser = new UAParser(value);
                        var userAgentMinusVersion = ((typeof parser.getOS().name === "undefined") ? "" : parser.getOS().name) +
                            ((typeof parser.getOS().version === "undefined") ? "" : parser.getOS().version) + ' ' +
                            ((typeof parser.getBrowser().name === "undefined") ? "" : parser.getBrowser().name) +
                            //((typeof parser.getBrowser().major === "undefined") ? "" : parser.getBrowser().major) + ' ' +
                            ((typeof parser.getCPU().architecture === "undefined") ? "" : parser.getCPU().architecture) + ' ' +
                            ((typeof parser.getEngine().name === "undefined") ? "" : parser.getEngine().name) + ' ' +
                            ((typeof parser.getDevice().name === "undefined") ? "" : parser.getDevice().name) + ' ' +
                            ((typeof parser.getDevice().version === "undefined") ? "" : parser.getDevice().version);

                        $('#<%=hdnOperationSystem.ClientID %>').val(((typeof parser.getOS().name === "undefined") ? "" : parser.getOS().name));
                        $('#<%=hdnBrowserName.ClientID %>').val(((typeof parser.getBrowser().name === "undefined") ? "" : parser.getBrowser().name) + ((typeof parser.getBrowser().version === "undefined") ? "" : '/' + parser.getBrowser().version));
                        //var name1=parser.getResult();
                        userAgentMinusVersion = userAgentMinusVersion.trimStart().trimEnd();

                        return userAgentMinusVersion;
                    }

                    if (key == "openDatabase") {
                        if ($('#<%=MinLat.ClientID %>').val() && $('#<%=MinLon.ClientID %>').val()) {
                            return $('#<%=MinLat.ClientID %>').val() + '|' + $('#<%=MinLon.ClientID %>').val();
                        }
                        else {
                            return '';
                        }
                    }

                    return value;
                },
                excludes: {
                    //userAgent:true,
                    webdriver: true,
                    language: true,
                    colorDepth: true,
                    deviceMemory: true,
                    hardwareConcurrency: true,
                    screenResolution: true,
                    availableScreenResolution: true,
                    //timezoneOffset:true,
                    //timezone:true,
                    sessionStorage: true,
                    localStorage: true,
                    indexedDb: true,
                    addBehavior: true,
                    //openDatabase: true,
                    cpuClass: true,
                    //platform:true,
                    plugins: true,
                    canvas: true,
                    //webgl:true,
                    //webglVendorAndRenderer:true,
                    adBlock: true,
                    hasLiedLanguages: true,
                    hasLiedResolution: true,
                    hasLiedOs: true,
                    hasLiedBrowser: true,
                    touchSupport: true,
                    fonts: true,
                    audio: true,
                    pixelRatio: true,
                    doNotTrack: true,
                    fontsFlash: true,
                    enumerateDevices: true
                }
            },
            function (components) {
                var murmur = Fingerprint2.x64hash128(components.map(function (pair) { return pair.value }).join(), 31);
                $('#<%=hdnBrowserFingerPrint.ClientID %>').val(murmur);

            });
    };

    var deviceId = $('#<%=hdnBrowserFingerPrint.ClientID %>').val();
    if (!deviceId) {
        fingerprintReport();
    }

    function jsUpdateSize() {
        var widthResolution = window.innerWidth || document.documentElement.clientWidth;
        var heightResolution = window.innerHeight || document.documentElement.clientHeight;

        $('#<%=hdnBrowserResolution.ClientID %>').val(widthResolution + 'x' + heightResolution);
    };

    window.onload = jsUpdateSize;       // When the page first loads
    window.onresize = jsUpdateSize;     // When the browser changes size
</script>

