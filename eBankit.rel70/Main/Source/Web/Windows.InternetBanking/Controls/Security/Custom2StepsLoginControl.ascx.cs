using eBankit.Business.Entities;
using eBankit.Common.Globalization;
using eBankit.Common.InternetBanking;
using eBankit.Common.Sites;
using eBankit.Lib.ApiModel.SecurityCenter.Credentials;
using eBankit.UI.Controls.InternetBanking;
using System;
using System.Collections.Generic;
using System.Configuration;

public partial class Custom2StepsLoginControl : InternetBankingBaseControlLogin
{
    /// <summary>
    /// Raises the <see cref="E:Init" /> event.
    /// </summary>
    /// <param name="e">The <see cref="T:System.EventArgs" /> instance containing the event data.</param>
    protected override void OnInit(EventArgs e)
    {
        this.UserName = this.txtUserName;
        this.Password = this.txtPassword;
        this.HardToken = this.txtHardToken;
        this.SecoundAccessCodeToken = this.txt2ndAccessCode;
        this.LoginButton = this.btnLogin;
        this.ValidationMessageControl = this.ValidationMessage;
        this.AllowMultiUserAccessCodes = bool.Parse(ConfigurationManager.AppSettings["AllowMultiUserAccessCodes"]?.ToString().ToLowerInvariant() ?? "false");

        this.GoToSecondStepButton = this.btnGoToSecondStep;
        this.CancelSecondStepButton = this.btnCancelSecondStep;
        this.CancelThirdStepButton = this.btnCancelThirdStep;
        this.Button2ndLevelLogin = this.btn2ndLevelLogin;
        this.BrowserFingerPrint = this.hdnBrowserFingerPrint;
        this.BrowserName = this.hdnBrowserName;
        this.OSystem = this.hdnOperationSystem;


        base.OnInit(e);
    }

    public override Dictionary<string, string> GetAdaptiveRequestedData()
    {
        // lat, lon

        return base.GetAdaptiveRequestedData();
    }

    public override AdaptiveConfig GetAdaptiveConfiguration()
    {
        return base.GetAdaptiveConfiguration();
    }

    /// <summary>
    /// Sets the authentication context.
    /// </summary>
    /// <returns></returns>
    public override ServiceOutputHeader SetAuthenticationContext()
    {
        return base.SetAuthenticationContext();
    }

    /// <summary>
    /// Raises the <see cref="E:Load" /> event.
    /// </summary>
    /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        divMessageRecover.Visible = false;
        divMessage.Visible = false;
        ValidationMessage.Visible = false;

        if (!IsPostBack)
        {
            if (Request.QueryString["session"] != null && Request.QueryString["session"].ToString().Equals("0", StringComparison.InvariantCultureIgnoreCase))
            {
                ValidationMessage.Visible = true;
                ValidationMessage.InnerText = Translate.GetTransactionString("Login", "SessionTerminatedProblemOccurred");
            }

            if (Request.QueryString["sto"] != null && Request.QueryString["sto"].ToString().Equals("1", StringComparison.InvariantCultureIgnoreCase))
            {
                divMessage.Visible = true;
                litMessageLogin.Text = Translate.GetTransactionString("Login", "SessionTimeOutMessage");
            }

            if (Request.QueryString["sto"] != null && Request.QueryString["sto"].ToString().Equals("2", StringComparison.InvariantCultureIgnoreCase))
            {
                divMessageRecover.Visible = true;
                litMessageLoginRecover.Text = Translate.GetTransactionString("Login", "RecoverSuccessMessage");
            }

            String ApplicationHeader = this.CurrentContext.ServiceInputHeader.Application;
            String VariationLabel = VariationHelper.GetCurrentVariationLabel();
            String WelcomeMessage = Translate.GetTransactionString("Login", "WellcomeMessage");

            var content2 = ContentProviderManager.Provider.GetContent(this.CurrentContext.ServiceInputHeader.Application, "LOGIN", "SecurityAlert", VariationHelper.GetCurrentVariationLabel(), this.Request.Url.PathAndQuery);
            if (content2 != null)
            {
                this.alert.Text = content2.ValueAsHtml;
            }

            content2 = ContentProviderManager.Provider.GetContent(ApplicationHeader, "LOGIN", "PasswordRecoverInfo", VariationLabel, WelcomeMessage);
            if (content2 != null)
            {
                litPasswordRecoverMessage.Text = content2.ValueAsHtml;
            }

            /*content2 = ContentProviderManager.Provider.GetContent(this.CurrentContext.ServiceInputHeader.Application, "MASTER", "BottomCredits", VariationHelper.GetCurrentVariationLabel(), Translate.GetTransactionString("Master", "Title"));
            if (content2 != null)
            {
                lblMasterCredits.Text = content2.ValueAsHtml;
            }*/

            this.linkRegister.NavigateUrl = ResolveUrl(InternetBankingSettings.Pages.Register);
            this.linkPasswordRecover.NavigateUrl = ResolveUrl(InternetBankingSettings.Pages.PasswordRecovery);
        }

        if (!string.IsNullOrEmpty(Lat.Value) && !string.IsNullOrEmpty(Lon.Value))
            getMins(Lat.Value, Lon.Value);

    }
}