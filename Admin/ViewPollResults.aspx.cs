using RoozbehExtension.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RoozbehExtension.Admin
{
    public partial class ViewPollResults : System.Web.UI.Page
    {
        protected void Page_PreLoad(object sender, EventArgs e)
        {
            if (Session["Admin"] != "9517536842")
            {
                mvViewResults.ActiveViewIndex = 0;
            }
            else
            {
                mvViewResults.ActiveViewIndex = 1;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] calcTypeTitles;
            uc_piechart.Percents = StatisticsBL.GetPersentStatistics(out calcTypeTitles);
            uc_piechart.Titles = calcTypeTitles;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text == "Admin" && txtPassword.Text == "Admin123456")
            {
                Session["Admin"] = "9517536842";
                Response.Redirect("~/Admin/ViewPollResults.aspx");
            }
        }
    }
}