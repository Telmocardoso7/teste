using System.Web.UI.WebControls;
using eBankit.Business.Entities;
using eBankit.UI.Controls.InternetBanking;

public partial class CustomImagesControl : BaseInternetUserControl, IEbankitImagesControl
{
    public HiddenField HasCaption
    {
        get
        {
            return hdnHasCaption;
        }
    }

    public HiddenField HasImage
    {
        get
        {
            return hdnHasImage;
        }
    }

    public ITextBoxControl ImageCaptionControl
    {
        get
        {
            return txtImageCaption;
        }
    }

    public Repeater ImagesControl
    {
        get
        {
            return rptSecurityImages;
        }
    }

    public HiddenField SelectedImageId
    {
        get
        {
            return hdnSelectedImageId;
        }
    }
}