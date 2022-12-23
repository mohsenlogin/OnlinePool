using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RoozbehExtension.BL
{
    public class PollQuestionBL
    {
        public static List<Polls> getActivePollsInfo()
        {
            DataTable dataTable = DAL.DAL.selectRecords("usp_Poll_GetActivePolls", null);
            List<Polls> pollQuestions = new List<Polls>();
            Polls pollQuestion = new Polls();
            if (dataTable != null && dataTable.Rows.Count > 0)
            {
                pollQuestion.Title = dataTable.Rows[0]["Title"].ToString();
                pollQuestion.IsManadatory = bool.Parse(dataTable.Rows[0]["IsMandatory"].ToString());
                pollQuestion.Id = int.Parse(dataTable.Rows[0]["Id"].ToString());
                //pollQuestion.IsRequired = bool.Parse(dataTable.Rows[0]["IsRequired"].ToString());
                //pollQuestion.CheckDuplicateAnswer = bool.Parse(dataTable.Rows[0]["CheckDuplicateAnswer"].ToString());

                pollQuestions.Add(pollQuestion);
            }
            return pollQuestions;
        }
        public static List<PollQuestion> getQuestionsOfPoll(int pollId)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter(){ParameterName="@PollId",Value=pollId});
            DataTable dataTable = DAL.DAL.selectRecords("usp_Poll_GetPollQuestions", parameters);
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