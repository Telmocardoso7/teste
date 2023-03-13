<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CookieDisclaimer.ascx.cs" Inherits="CookieDisclaimer" %>

<div id="CookieDisclaimerPanel" class="CookieContainer noprint" runat="server">
    <div class="container CookieContent col-xs-12 col-sm-12 col-md-12 col-lg-12 col-max clearPadding noprint">
        <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-8 col-max clearPadding">
            <div class="col-xs-11 no-padding">
                <div class="col-xs-12 text no-padding"><%=eBankit.Common.Globalization.Translate.GetTransactionString("Cookie","Description") %></div>
            </div>
            <div class="col-xs-1 no-padding" style="padding-top: 5px !important;">
                <a class="pull-right" onclick="createCookie('ShowCookieBar', 'true', '30'); $('.CookieContainer').hide();" href="#">
                    <img alt="" src="<%$ebFile:/Content/currenttheme/images/icon/ic_delete_btn.png %>" runat="server" /></a>
            </div>
        </div>

    </div>
</div>
