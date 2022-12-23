using RoozbehExtension.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RoozbehExtension.Admin
{
    public partial class PollTypesList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            PollType pollType = new PollType();
            pollType.Title = txtTitle.Text;
            pollType.AudienceRef = int.Parse(ddlAudiences.SelectedValue);
           

            if (isInEditMode && selectedPollTypeId > 0)
            {
                pollType.Id = selectedPollTypeId;
                ////PollTypeBL.UpdatePollType(pollType);
            }
            else
            {
                ////PollTypeBL.InsertPollQuestion(pollType);
            }
            gvPolls.DataBind();
        }

        protected void btNewPollType_Click(object sender, EventArgs e)
        {
            isInEditMode = false;
            selectedPollTypeId = 0;
            txtTitle.Text = "";           
            btnSave.Text = "ثبت نوع نظر سنجی";
        }

        protected void gvPolls_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadQuestionData(int.Parse(gvPolls.SelectedValue.ToString()));
        }
        private static bool isInEditMode;
        private static int selectedPollTypeId;
        private void loadQuestionData(int pollTypeId)
        {
            
            isInEditMode = true;
            btnSave.Text = "ثبت تغییرات";
            selectedPollTypeId = pollTypeId;
            List<SqlParameter> param = new List<SqlParameter>();
            SqlParameter p = new SqlParameter();
            p.ParameterName = "@PollTypeId";
            p.Value = pollTypeId;
            param.Add(p);
            DataTable QuestionDataTable = DAL.DAL.selectRecords("usp_Poll_GetPollQuestionById", param);
            ddlAudiences.SelectedValue = QuestionDataTable.Rows[0]["PollRef"].ToString();
            txtTitle.Text = QuestionDataTable.Rows[0]["Priority"].ToString();
           
        }
    }
}