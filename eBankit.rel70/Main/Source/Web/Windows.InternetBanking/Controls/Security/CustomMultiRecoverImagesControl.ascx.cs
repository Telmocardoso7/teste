using eBankit.UI.Controls.InternetBanking;
using eBankit.UI.Web.InternetBanking;
using System;
using System.Web.UI.WebControls;

public partial class CustomMultiRecoverImagesControl : BaseInternetUserControl, IInternetBankingImagesControl
{
    public Image SecurityImage
    {
        get
        {
            return imgSecurityImage;
        }
    }

    public Label SecurityImageCaption
    {
        get
        {
            return lblSecurityImageCaption;
        }
    }
}
