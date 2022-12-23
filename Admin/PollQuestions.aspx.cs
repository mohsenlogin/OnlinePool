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
    public partial class PollQuestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            PollQuestion question = new PollQuestion();
            question.PollRef = int.Parse( ddlPollQuestion.SelectedValue);
            question.Priority= byte.Parse( txtPriority.Text);
            question.Question = txtTitle.Text;
            question.Status = "Active";
            question.IsRequired = chkIsMandatory.Checked;
            question.CheckDuplicateAnswer = chkIsDuplicateAnswer.Checked;
            question.ChoiceTypeRef = int.Parse( ddlAnswerType.SelectedValue);
            
            if (isInEditMode && selectedQuestionId > 0)
            {
                question.Id = selectedQuestionId;
                PollBL.UpdatePollQuestion(question);
            }
            else
            {
                PollBL.InsertPollQuestion(question);
            }
            gvPollQuestions.DataBind();
        }

        protected void gvPollQuestions_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadQuestionData(int.Parse(gvPollQuestions.SelectedValue.ToString()));
        }
        private static bool isInEditMode;
        private static int selectedQuestionId;
        private void loadQuestionData(int questionId)
        {           
            isInEditMode = true;
            btnSave.Text = "ثبت تغییرات";
            selectedQuestionId = questionId;
            List<SqlParameter> param = new List<SqlParameter>();
            SqlParameter p = new SqlParameter();
            p.ParameterName = "@QuestionId";
            p.Value = questionId;
            param.Add(p);
            DataTable QuestionDataTable= DAL.DAL.selectRecords("usp_Poll_GetPollQuestionById", param);
            ddlPollQuestion.SelectedValue = QuestionDataTable.Rows[0]["PollRef"].ToString();
            txtPriority.Text = QuestionDataTable.Rows[0]["Priority"].ToString();
            txtTitle.Text = QuestionDataTable.Rows[0]["Question"].ToString();
            chkIsDuplicateAnswer.Checked = bool.Parse(QuestionDataTable.Rows[0]["CheckDuplicateAnswer"].ToString());
            chkIsMandatory.Checked = bool.Parse(QuestionDataTable.Rows[0]["IsRequired"].ToString());
            ddlAnswerType.SelectedValue = QuestionDataTable.Rows[0]["ChoiceTypeRef"].ToString();

        }

        protected void btNewQuestion_Click(object sender, EventArgs e)
        {
            isInEditMode = false;
            selectedQuestionId = 0;
            txtPriority.Text = "";
            txtTitle.Text = "";
            btnSave.Text = "ثبت سوال";
            
        }
    }
}