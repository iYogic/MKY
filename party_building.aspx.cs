using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.SharePoint;

public partial class party_building : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected override void OnPreInit(EventArgs e)
    {
        this.MasterPageFile = SPContext.Current.Web.Url.Replace(SPContext.Current.Site.Url, "") + "/_catalogs/masterpage/mlk.master"; // SPContext.Current.Web.MasterUrl;
        base.OnPreInit(e);
    }
}