using eBankit.UI.Controls.InternetBanking;
using eBankit.UI.Web.InternetBanking;
using System;
using System.Web.UI.WebControls;

public partial class CustomMultiRecoverQuestionsControl : BaseInternetUserControl, IInternetBankingQuestionsControl
{
    public Repeater QuestionsControl
    {
        get
        {
            return rptQuestions;
        }
    }
}