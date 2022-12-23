using RoozbehExtension.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RoozbehExtension.Admin
{
    public partial class PollQuestionChoices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            PollQuestionChoice  choice = new PollQuestionChoice();
            choice.Title = txtTitle.Text;
            choice.PollQuestionRef = int.Parse(ddlPollQuestion.SelectedValue);
            choice.Status = "Active";
            choice.DefaultValue = txtDefaultValue.Text;
            PollBL.InsertPollQuestionChoice(choice);
        }

        

       
    }
}