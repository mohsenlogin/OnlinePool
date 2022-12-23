using RoozbehExtension.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RoozbehExtension.Admin
{
    public partial class PollResults : System.Web.UI.Page
    {
        protected void Page_PreLoad(object sender, EventArgs e)
        {
            if (Session["Admin"] != "9517536842")
            {
                //mvViewResults.ActiveViewIndex = 0;
            }
            else
            {
                //mvViewResults.ActiveViewIndex = 1;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //sdsPollQuestion.DataBind();
                int questionId;
                

                if (gnPollQuestions.SelectedValue != null && int.TryParse(gnPollQuestions.SelectedValue.ToString() , out questionId))
                {
                    string[] calcTypeTitles;
                    uc_piechart.Percents = StatisticsBL.GetStatistics(int.Parse(gnPollQuestions.SelectedValue.ToString()), out calcTypeTitles);
                    uc_piechart.Titles = calcTypeTitles;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //if (txtUsername.Text == "Admin" && txtPassword.Text == "Admin123456")
            //{
            //    Session["Admin"] = "9517536842";
            //    Response.Redirect("~/Admin/PollResults.aspx");
            //}
        }

        protected void gnPollQuestions_SelectedIndexChanged(object sender, EventArgs e)
        {
            sdsPollQuestion.DataBind();
            int questionId;
            if (gnPollQuestions.SelectedValue != null && int.TryParse(gnPollQuestions.SelectedValue.ToString(), out questionId))
            {
                string[] calcTypeTitles;
                uc_piechart.Percents = StatisticsBL.GetStatistics(int.Parse(gnPollQuestions.SelectedValue.ToString()), out calcTypeTitles);
                uc_piechart.Titles = calcTypeTitles;
            }
        }
    }
}