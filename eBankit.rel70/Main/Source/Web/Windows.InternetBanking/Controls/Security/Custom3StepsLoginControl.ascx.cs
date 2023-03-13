using eBankit.Business.Entities;
using eBankit.Common.Globalization;
using eBankit.Common.InternetBanking;
using eBankit.Common.Sites;
using eBankit.UI.Controls.InternetBanking;
using System;

public partial class Custom3StepsLoginControl : InternetBankingBaseControlLogin
{
    /// <summary>
    /// Raises the <see cref="E:Init" /> event.
    /// </summary>
    /// <param name="e">The <see cref="T:System.EventArgs" /> instance containing the event data.</param>
    protected override void OnInit(EventArgs e)
    {
        this.UserName = this.txtUserName;
        this.LoginButton = this.btnLogin;
        this.Password = this.txtPassword;
        this.SecurityQuestions = this.txtSecurityQuestion;

        this.ValidationMessageControl = this.ValidationMessage;
        //this.FirstTimeMultiLoginControl = (IInternetBankingMultiLogin)this.controlQuestions;

        this.GoToSecondStepButton = this.btnGoToSecondStep;
        this.CancelSecondStepButton = this.btnCancelSecondStep;
        this.GoToThirdStepButton = this.btnGoToThirdStep;
        this.CancelThirdStepButton = this.btnCancelThirdStep;

        base.OnInit(e);
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

        if (Request.QueryString["sto"] != null && Request.QueryString["sto"].ToString().Equals("1", StringComparison.InvariantCultureIgnoreCase))
        {
            divMessage.Visible = true;
            litMessageLogin.Text = Translate.GetTransactionString("Login", "SessionTimeOutMessage");
        }

        if (!IsPostBack)
        {
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

            content2 = ContentProviderManager.Provider.GetContent(this.CurrentContext.ServiceInputHeader.Application, "MASTER", "BottomCredits", VariationHelper.GetCurrentVariationLabel(), Translate.GetTransactionString("Master", "Title"));
            if (content2 != null)
            {
                lblMasterCredits.Text = content2.ValueAsHtml;
            }

            this.linkRegister.NavigateUrl = ResolveUrl(InternetBankingSettings.Pages.Register);
            this.linkPasswordRecover.NavigateUrl = ResolveUrl(InternetBankingSettings.Pages.PasswordRecovery);
        }
    }
}
