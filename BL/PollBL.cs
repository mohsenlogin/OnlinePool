using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RoozbehExtension.BL
{
    public class PollBL
    {
        public static void InsertPoll(Polls poll)
        {
            DAL.DAL.insertRecord("usp_Poll_InsertPoll", getParameters(poll));
        }
        public static void InsertPollQuestionChoice(PollQuestionChoice pollQuestionChoice)
        {
            DAL.DAL.insertRecord("usp_Poll_InsertPollQuestionChoice", getParameters(pollQuestionChoice));
        }
        private static List<SqlParameter> getParameters(PollQuestionChoice pollQuestionChoice)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            SqlParameter param = new SqlParameter("@PollQuestionRef", pollQuestionChoice.PollQuestionRef);            
            parameters.Add(param);
            parameters.Add(new SqlParameter("@Title", pollQuestionChoice.Title));
            parameters.Add(new SqlParameter("@DefaultValue", pollQuestionChoice.DefaultValue));
            parameters.Add(new SqlParameter("@Status", pollQuestionChoice.Status));                          
            return parameters;
        }
        private static List<SqlParameter> getParameters(Polls poll)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            SqlParameter param = new SqlParameter("@PollTypeRef",poll.PollTypeRef);
            param.DbType = DbType.Int32;
            parameters.Add(param);
            parameters.Add(new SqlParameter("@Title", poll.Title));
            parameters.Add(new SqlParameter("@ValidFrom", poll.ValidFrom));
            parameters.Add(new SqlParameter("@ValidTo", poll.ValidTo));
            parameters.Add(new SqlParameter("@Status", poll.Status));
            parameters.Add(new SqlParameter("@IsMandatory", poll.IsManadatory));         
            return parameters;
        }
        public static void InsertPollQuestion(PollQuestion pollQuestion)
        {
            DAL.DAL.insertRecord("usp_Poll_InsertPollQuestion", getPollQuestionParameters(pollQuestion));

        }
        public static void UpdatePollQuestion(PollQuestion pollQuestion)
        {
            DAL.DAL.insertRecord("usp_Poll_UpdatePollQuestion", getPollQuestionParameters(pollQuestion));

        }
        private static List<SqlParameter> getPollQuestionParameters(PollQuestion pollQuestion)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            SqlParameter param = new SqlParameter("@Question", pollQuestion.Question);           
            parameters.Add(param);
            parameters.Add(new SqlParameter("@Id", pollQuestion.Id));
            parameters.Add(new SqlParameter("@IsRequired", pollQuestion.IsRequired));
            parameters.Add(new SqlParameter("@PollRef", pollQuestion.PollRef));
            parameters.Add(new SqlParameter("@Priority", pollQuestion.Priority));
            parameters.Add(new SqlParameter("@ChoiceTypeRef", pollQuestion.ChoiceTypeRef));
            parameters.Add(new SqlParameter("@CheckDuplicateAnswer", pollQuestion.CheckDuplicateAnswer));
            parameters.Add(new SqlParameter("@Status", pollQuestion.Status));
            return parameters;
        }
    }
}