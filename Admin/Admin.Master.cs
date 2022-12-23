using RoozbehExtension.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RoozbehExtension.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null &&
                Session["UserT"] != null &&
                !SamaEntranceBL.validateToken(Session["UserId"].ToString(), Session["UserT"].ToString()))
            {
                Response.Redirect("~/Login.aspx?RetUrl="+ HttpContext.Current.Request.Url.ToString()) ;
            }
            else
            {
                lblLoggedInInfo.Text = "مدیر سیستم، خوش آمده اید.";
            }
        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
        }
    }
}