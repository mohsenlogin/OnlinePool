using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RoozbehExtension.BL
{
    public class PollQuestionChoiceBL
    {
        public static List<PollQuestionChoice> getChoicesOfQuestion(int questionId)
        {
            SqlParameter param = new SqlParameter();
            param.ParameterName = "QuestionId";
            param.Value = questionId;
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(param);
            DataTable dataTable = DAL.DAL.selectRecords("usp_Poll_GetPollQuestionsChoices", parameters);
            List<PollQuestionChoice> pollQuestionChoices = new List<PollQuestionChoice>();
            
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                for (int i = 0; i < dataTable.Rows.Count;i++ )
                {
                    PollQuestionChoice pollQuestionChoice = new PollQuestionChoice();
                    pollQuestionChoice.Title = dataTable.Rows[i]["Title"].ToString();
                    pollQuestionChoice.DefaultValue = dataTable.Rows[i]["DefaultValue"].ToString();
                    pollQuestionChoice.Id = int.Parse(dataTable.Rows[i]["Id"].ToString());
                    pollQuestionChoice.PollQuestionRef = int.Parse(dataTable.Rows[i]["PollQuestionRef"].ToString());
                    pollQuestionChoices.Add(pollQuestionChoice);
                }                
                //pollQuestion.IsRequired = bool.Parse(dataTable.Rows[0]["IsRequired"].ToString());
                //pollQuestion.CheckDuplicateAnswer = bool.Parse(dataTable.Rows[0]["CheckDuplicateAnswer"].ToString());
                               
            }
            return pollQuestionChoices;
        }
    }
}