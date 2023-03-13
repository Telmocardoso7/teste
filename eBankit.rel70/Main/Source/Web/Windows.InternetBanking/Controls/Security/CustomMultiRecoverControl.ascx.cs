using eBankit.Business.Entities.Security;
using eBankit.Business.Entities.Security.Recover;
using eBankit.Common.Globalization;
using eBankit.Common.InternetBanking;
using eBankit.Common.InternetBanking.Services;
using eBankit.Providers.Authentication;
using eBankit.UI.Controls;
using eBankit.UI.Controls.InternetBanking;
using eBankit.UI.Web.InternetBanking;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

public partial class CustomMultiRecoverControl : InternetBankingBaseControlMultiRecover
{
        /// <summary>
        /// Raises the <see cref="E:Init" /> event.
        /// </summary>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
    protected override void OnInit(EventArgs e)
    {
        this.QuestionsUserControl = (IInternetBankingQuestionsControl)ebQuestions;
        this.Alias = txtAlias;
        this.IdentityType = ddlIdentityType;
        this.KeyValue = txtOtherKeyValue;

        base.OnInit(e);

        this.btnEnter.Click += BtnEnter_Click;

        this.NumberOfSteps = 2;
        this.ShowLastStep = false;
    }

    private void BtnEnter_Click(object sender, EventArgs e)
    {
        Response.Redirect(InternetBankingSettings.Pages.RecoverLogin, false);
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!IsPostBack)
        {
            CurrentContext.InteractionId = this.NewInteractionId;
            if (this.CurrentContext.GlobalSession != null && this.CurrentContext.GlobalSession.AllKeys.Contains("currentApplication"))
                HttpContext.Current.Items["PAPPLICATION"] = this.CurrentContext.GlobalSession.Get<string>("currentApplication");

            HttpContext.Current.Items["PSESSIONID"] = CurrentContext.SessionGUID;
            HttpContext.Current.Items["PINTERACTIONID"] = CurrentContext.InteractionId;

            this.pnStepInit.Visible = true;

            this.hdnRadio.Value = "0";

            try
            {
                System.Reflection.MethodInfo methodQuestion = typeof(ServicesDataInternetBanking).GetMethod("GetIdentityKeysCollection");
                object[] parametersArrayQuestion = null;

                parametersArrayQuestion = new object[2];
                parametersArrayQuestion[0] = this.CurrentContext;
                parametersArrayQuestion[1] = false;

                object classInstanceQuestion = Activator.CreateInstance(typeof(ServicesDataInternetBanking), null);
                var identityKyes = methodQuestion.Invoke(classInstanceQuestion, parametersArrayQuestion);
                if (identityKyes != null && identityKyes is List<RecoverIdentityKey> && ((List<RecoverIdentityKey>)identityKyes).Count > 0)
                {
                    var items = identityKyes as List<RecoverIdentityKey>;

                    ddlIdentityType.DropDown.Items.Clear();
                    ddlIdentityType.DropDown.DataSource = items;
                    ddlIdentityType.DropDown.DataValueField = "Key";
                    ddlIdentityType.DropDown.DataTextField = "Value";
                    ddlIdentityType.DropDown.DataBind();

                    ListItem selectItem = new ListItem();
                    selectItem.Text = Translate.GetTransactionString("AccountOpening", "Select");
                    selectItem.Value = "";
                    ddlIdentityType.DropDown.Items.Insert(0, selectItem);

                }
                else
                {
                    divOther.Visible = false;
                }
            }
            catch (Exception ex)
            {
                this.DisplayPageError(ex.Message);
            }
        }
        else
        {
            HttpContext.Current.Items["PSESSIONID"] = CurrentContext.SessionGUID;
            HttpContext.Current.Items["PINTERACTIONID"] = CurrentContext.InteractionId;
        }
    }

    public override void ExecuteBeforeFirstStep()
    {

    }

    public override void ExecuteBeforeStep2()
    {
        CheckUserData();
        if (!HasErrorOnExecute)
        {
            if (CheckSecurityQuestionsPasswordRecoveryEnable() && CheckIfUserHasSecurityQuestions())
            {
                LoadSecurityQuestions();
            }
            else
            {
                if (this.NumberOfSteps == 2)
                {
                    if (!HasErrorOnExecute)
                    {
                        RecoverUser();
                    }
                }
                else
                {
                    // Jump this step
                    this.CurrentStepID = this.CurrentStepID + 1;
                }
            }
        }
    }

    public override void ExecuteBeforeStep3()
    {

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
        // Send Confirmation Token
        SendConfirmationSMSToken();
    }

    public override void ExecuteOnUnloadStep2()
    {

    }

    public override void ExecuteOnUnloadStep3()
    {

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

    }

    public override RecoverData CustomGetRecoverData()
    {
        return base.GetRecoverData();
    }
}
