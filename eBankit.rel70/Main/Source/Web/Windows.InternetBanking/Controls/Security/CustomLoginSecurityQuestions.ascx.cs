using eBankit.Business.Entities;
using eBankit.Business.Entities.Security;
using eBankit.Common.Globalization;
using eBankit.Common.InternetBanking;
using eBankit.Common.Security.Encryption;
using eBankit.Common.Security.Encryption.Algorithms;
using eBankit.Common.Settings;
using eBankit.Common.Sites;
using eBankit.Providers.Authentication;
using eBankit.UI.Controls;
using eBankit.UI.Web.InternetBanking;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class CustomLoginSecurityQuestions : InternetBankingBaseControlMultiLogin
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        this.ValidationMessageControl = this.ValidationMessage;

        this.NumberOfSteps = 3;
        this.ShowLastStep = true;
    }

    public override void ExecuteBeforeFirstStep()
    {
        SecurityConfiguration securityConfigurations = LoadSecurityConfigurations();

        if (!securityConfigurations.questionsEnable && !securityConfigurations.QuestionsPasswordRecoveryEnable)
        {
            GoToNextStep();
        }
        else
        {
            List<QuestionGroup> securityQuestions = this.LoadSecurityQuestions();

            this.lblInfoSecurityQuestions.Text =
                string.Format(Translate.GetTransactionString("Register", "InfoSecurityQuestions"), securityQuestions.Count);

            rptQuestions.DataSource = securityQuestions;
            rptQuestions.DataBind();

            this.IsToLoadSecurityQuestions = true;
        }
    }

    public override void ExecuteBeforeStep2()
    {
        SecurityConfiguration securityConfigurations = LoadSecurityConfigurations();

        if (!securityConfigurations.imagesEnable && !securityConfigurations.imagesCaptionEnable)
        {
            GoToNextStep();
        }
        else
        {
            List<SecurityImage> images = this.LoadSecurityImages();

            this.hdnHasImage.Value = securityConfigurations.imagesEnable.ToString().ToLower();
            this.hdnHasCaption.Value = securityConfigurations.imagesCaptionEnable.ToString().ToLower();

            this.securityImagesList.Visible = securityConfigurations.imagesEnable;
            this.securityCaption.Visible = securityConfigurations.imagesCaptionEnable;

            rptSecurityImages.DataSource = images;
            rptSecurityImages.DataBind();
        }
    }

    public override void ExecuteBeforeStep3()
    {
        if (!CurrentContext.InteractionContext.Login.NeedsActivation)
        {
            string strRedirect = CreateAuthenticatedSession();
            Response.Redirect(strRedirect, false);
        }

        if (ConfiguredCredentialType == (short)eBankit.Business.Entities.Authentication.CredentialType.UserPassword)
        {
            this.divNewUsername.Visible = true;
        }
    }

    public override void ExecuteBeforeStep4()
    {

    }

    public override void ExecuteBeforeStep5()
    {

    }

    public override void ExecuteBeforeStep6()
    {

    }

    public override void ExecuteBeforeLastStep()
    {

    }

    public override void ExecuteOnUnloadStep2()
    {
        if (!CurrentContext.InteractionContext.Login.NeedsActivation)
        {
            SecurityConfiguration securityConfigurations = LoadSecurityConfigurations();

            // get security image
            Guid? selectedImageId = null;
            if (securityConfigurations.imagesEnable)
            {
                selectedImageId = Guid.Parse(this.hdnSelectedImageId.Value);
            }

            // get security caption
            string imageCaption = null;
            if (securityConfigurations.imagesCaptionEnable)
            {
                imageCaption = this.txtImageCaption.Text;
            }

            SecurityImage securityTokens = new SecurityImage();
            securityTokens.Id = selectedImageId != null ? selectedImageId.Value : default(Guid);
            securityTokens.Captcha = imageCaption;

            bool ret;
            ServiceOutputHeader output = eBankit.Common.Sites.ContactProviderManager.Provider.SetUserSecurityImageNoCredentials(this.CurrentContext.ServiceInputHeader, securityTokens, out ret);

            if (output.Status != ServiceStatus.Ok)
            {
                this.ValidationMessageControl.Visible = true;
                this.ValidationMessageControl.InnerText = output.Error.ErrorMessage;
                this.HasErrorOnExecute = true;
            }
        }
    }

    public override void ExecuteOnUnloadStep3()
    {
        try
        {
            SecurityConfiguration securityConfigurations = LoadSecurityConfigurations();

            // get security answers
            List<SecurityAnswer> securityAnswers = null;
            if (securityConfigurations.questionsEnable)
            {
                securityAnswers = new List<SecurityAnswer>();

                string[] questions = this.hdnQuestions.Value.Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
                string[] answers = this.hdnAnswers.Value.Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);

                for (int i = 0; i < answers.Count(); ++i)
                {
                    securityAnswers.Add(new SecurityAnswer
                    {
                        Answer = answers[i],
                        QuestionKey = questions[i],
                        QuestionDescription = string.Empty
                    });
                }
            }

            // get security image
            Guid? selectedImageId = null;
            if (securityConfigurations.imagesEnable)
            {
                selectedImageId = Guid.Parse(this.hdnSelectedImageId.Value);
            }

            // get security caption
            string imageCaption = null;
            if (securityConfigurations.imagesCaptionEnable)
            {
                imageCaption = this.txtImageCaption.Text;
            }

            // get username and key for UserPassword credential type
            string newusername = null;
            if (ConfiguredCredentialType == (short)eBankit.Business.Entities.Authentication.CredentialType.UserPassword)
            {
                newusername = this.txtNewUsername.Text;
            }

            AESEncryptor enc2 = (AESEncryptor)EncryptionFactory.GetEncryptor("AES");
            enc2.Password = Convert.ToBase64String(System.Text.ASCIIEncoding.ASCII.GetBytes(AppSettings.GetAppSetting("Security.Encryptor.Password", "ebankIT | Omnichannel Innovation")));
            enc2.Salt = CurrentContext.InteractionId;

            var newkey = enc2.EncryptStr(this.txtNewKey.Text);

            SecurityImage securityTokens = new SecurityImage();
            securityTokens.Id = selectedImageId != null ? selectedImageId.Value : default(Guid);
            securityTokens.Captcha = imageCaption;

            bool result;
            AuthenticationProviderManager.Provider.ActivateAndCustomizeAlias(this.CurrentContext.ServiceInputHeader, newusername, newkey, ConfiguredCredentialType, securityAnswers, securityTokens, CurrentContext.InteractionContext.SecurityContext.AliasTypeId, out result);

            if (result)
            {
                /*
                var activateAlias = AuthenticationProviderManager.Provider.ActivateUserAlias(this.CurrentContext.ServiceInputHeader, 1, out result);
                if (activateAlias != null && activateAlias.Status == eBankit.Business.Entities.ServiceStatus.Ok)
                {
                    LoginInput inLogin = new LoginInput
                    {
                        Credentials = new List<AuthCredential>()
                    };

                    inLogin.Credentials.Add(new AuthCredential()
                    {
                        CredentialType = (short)ConfiguredCredentialType,
                        Password = newkey,
                        AsPositions = false
                    });
                    inLogin.Alias = newusername;
                    inLogin.Lat = "0";
                    inLogin.Lon = "0";

                    var inLoginInfo = new LoginInfo();
                    inLoginInfo.Browser = HttpContext.Current.Request.Browser.Browser;
                    inLoginInfo.BrowserType = HttpContext.Current.Request.Browser.Type;
                    inLoginInfo.BrowserVersion = HttpContext.Current.Request.Browser.Version;
                    inLoginInfo.Machine = HttpContext.Current.Request.ServerVariables["REMOTE_HOST"];
                    inLoginInfo.Platform = HttpContext.Current.Request.Browser.Platform;
                    inLoginInfo.UserAgent = HttpContext.Current.Request.ServerVariables["HTTP_USER_AGENT"];

                    enc2.Password = Convert.ToBase64String(System.Text.ASCIIEncoding.ASCII.GetBytes(AppSettings.GetAppSetting("Security.Encryptor.Password", "ebankIT | Omnichannel Innovation")));
                    enc2.Salt = CurrentContext.InteractionId;

                    var inLoginCredential = new Credential
                    {
                        CredentialType = ConfiguredCredentialType,
                        Alias = ConfiguredCredentialType == (short)eBankit.Business.Entities.Authentication.CredentialType.UserPassword ? newusername : this.CurrentContext.Alias,
                        Password = newkey
                    };
                    eBankit.Business.Entities.Authentication.Login outLoginBanking;

                    // update new user alias on header
                    if (ConfiguredCredentialType == (short)eBankit.Business.Entities.Authentication.CredentialType.UserPassword)
                    {
                        this.CurrentContext.ServiceInputHeader.User = newusername;
                    }

                    ServiceOutputHeader loginBankingStatus = AuthenticationProviderManager.Provider.SoftLogin(this.CurrentContext.ServiceInputHeader, inLogin, out outLoginBanking);
                    if (loginBankingStatus != null && loginBankingStatus.Status == ServiceStatus.Ok)
                    {
                        foreach (var credential in inLogin.Credentials)
                        {
                            credential.Password = null;
                        }
                        this.CurrentContext.InteractionContext.Login.LoginInput = inLogin;
                        //Update Profiles with the image
                        foreach (var profile in this.CurrentContext.InteractionContext.Login.UserProfiles)
                        {
                            profile.Image = GetProfileImage(profile.CustomerDataId);
                        }


                        var profileContainer = Functions.FindControl(this.Page, "profileContainer") as HtmlGenericControl;
                        profileContainer.Visible = true;
                        this.Visible = false;

                    }
                }
                */

            }
            else
            {
                this.ValidationMessageControl.Visible = true;
                this.ValidationMessageControl.InnerText = Translate.GetTransactionString("Login", "ContactOurService");
                this.HasErrorOnExecute = true;
            }
        }
        catch (Exception)
        {
            this.ValidationMessageControl.Visible = true;
            this.ValidationMessageControl.InnerText = Translate.GetTransactionString("Login", "ContactOurService");
            this.HasErrorOnExecute = true;
        }
    }

    public override void ExecuteOnUnloadStep4()
    {

    }

    public override void ExecuteOnUnloadStep5()
    {

    }

    public override void ExecuteOnUnloadStep6()
    {

    }

    public override void Cancel()
    {
        this.Response.Redirect(InternetBankingSettings.Pages.SignIn);
    }

    public override void ExecuteOnUnloadStep1()
    {
        if (!CurrentContext.InteractionContext.Login.NeedsActivation)
        {
            // get security answers
            List<SecurityAnswer> securityAnswers = new List<SecurityAnswer>();

            string[] questions = this.hdnQuestions.Value.Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
            string[] answers = this.hdnAnswers.Value.Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);

            for (int i = 0; i < answers.Count(); ++i)
            {
                securityAnswers.Add(new SecurityAnswer
                {
                    Answer = answers[i],
                    QuestionKey = questions[i],
                    QuestionDescription = string.Empty
                });
            }

            bool ret;
            ServiceOutputHeader outputSecurityQuestions = AuthenticationProviderManager.Provider.DefineSecurityQuestions(this.CurrentContext.ServiceInputHeader, securityAnswers, out ret);

            if (outputSecurityQuestions.Status != ServiceStatus.Ok)
            {
                this.ValidationMessageControl.Visible = true;
                this.ValidationMessageControl.InnerText = outputSecurityQuestions.Error.ErrorMessage;
                this.HasErrorOnExecute = true;
            }
        }
    }

    protected void rptQuestions_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e == null)
            throw new ArgumentNullException("e");

        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem ||
            e.Item.ItemType == ListItemType.SelectedItem)
        {
            QuestionGroup col = e.Item.DataItem as QuestionGroup;

            DropDownListControl_v2 ddlQuestions = e.Item.FindControl("ddlQuestion") as DropDownListControl_v2;
            ddlQuestions.DropDown.Items.Clear();
            ddlQuestions.DropDown.DataSource = col.Items;
            ddlQuestions.DropDown.DataValueField = "Value";
            ddlQuestions.DropDown.DataTextField = "Description";
            ddlQuestions.DropDown.DataBind();

            ListItem selectItem = new ListItem();
            selectItem.Text = Translate.GetTransactionString("AccountOpening", "Select");
            selectItem.Value = "";
            ddlQuestions.DropDown.Items.Insert(0, selectItem);
        }
    }

    protected void rptSecurityImages_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e == null)
            throw new ArgumentNullException("e");

        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.SelectedItem)
        {
            SecurityImage securityImage = e.Item.DataItem as SecurityImage;
            Image imageSecurity = e.Item.FindControl("imageSecurity") as Image;
            HtmlGenericControl divSelector = e.Item.FindControl("divSelector") as HtmlGenericControl;
            HtmlGenericControl divSelectorFill = e.Item.FindControl("divSelectorFill") as HtmlGenericControl;
            imageSecurity.ImageUrl = ToBase64ImageString(securityImage.ContentType, securityImage.ImageData);
            imageSecurity.Attributes["key"] = securityImage.Id.ToString();
        }
    }

    protected string ToBase64ImageString(string contentType, byte[] filecontents)
    {
        return $"data:{contentType};base64,{Convert.ToBase64String(filecontents)}";
    }

    public virtual string GetProfileImage(Guid customerDataId)
    {
        return ContactProviderManager.Provider.GetCustomerImage(this.CurrentContext.ServiceInputHeader, customerDataId);
    }
}
