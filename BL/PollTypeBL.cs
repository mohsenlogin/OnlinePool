using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RoozbehExtension.BL
{
    public class PollTypeBL
    {
        public static List<PollQuestion> getQuestionsOfPoll(int pollId)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter() { ParameterName = "@PollId", Value = pollId });
            DataTable dataTable = DAL.DAL.selectRecords("", parameters);
            List<PollQuestion> pollQuestions = new List<PollQuestion>();
            PollQuestion pollQuestion = new PollQuestion();
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                pollQuestion.Question = dataTable.Rows[0]["Question"].ToString();
                pollQuestion.IsRequired = bool.Parse(dataTable.Rows[0]["IsRequired"].ToString());
                pollQuestion.Id = int.Parse(dataTable.Rows[0]["Id"].ToString());
                //pollQuestion.IsRequired = bool.Parse(dataTable.Rows[0]["IsRequired"].ToString());
                //pollQuestion.CheckDuplicateAnswer = bool.Parse(dataTable.Rows[0]["CheckDuplicateAnswer"].ToString());

                pollQuestions.Add(pollQuestion);
            }
            return pollQuestions;
        }
    }
}