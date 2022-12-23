using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RoozbehExtension.BL
{
    public class SamaEntranceBL
    {
        public static bool registerPollQuestionAnswer(PollQuestionAnswer pollQuestionAnswer)
        {
            //if (DAL.DAL.getLastPollDateTime(poll.ip) != null)
            //{
            //    DateTime lastPollDate = (DateTime)DAL.DAL.getLastPollDateTime(poll.ip);
            //    if (DateTime.Now.Year == lastPollDate.Year &&
            //        DateTime.Now.Month == lastPollDate.Month &&
            //        DateTime.Now.Day == lastPollDate.Day &&
            //        DateTime.Now.Hour == lastPollDate.Hour &&
            //        DateTime.Now.Minute - lastPollDate.Minute > 10)
            //    {
            //        return DAL.DAL.insertPoll(poll.pollTypeRef, poll.ip);
            //    }
            //    return false;
            //}
            //else 

            return DAL.DAL.insertRecord("usp_Poll_InsertPollQuestionAnswer", getParametersOfPoll(pollQuestionAnswer));

        }
        public static bool registerPoll(Poll poll)
        {
            //if (DAL.DAL.getLastPollDateTime(poll.ip) != null)
            //{
            //    DateTime lastPollDate = (DateTime)DAL.DAL.getLastPollDateTime(poll.ip);
            //    if (DateTime.Now.Year == lastPollDate.Year &&
            //        DateTime.Now.Month == lastPollDate.Month &&
            //        DateTime.Now.Day == lastPollDate.Day &&
            //        DateTime.Now.Hour == lastPollDate.Hour &&
            //        DateTime.Now.Minute - lastPollDate.Minute > 10)
            //    {
            //        return DAL.DAL.insertPoll(poll.pollTypeRef, poll.ip);
            //    }
            //    return false;
            //}
            //else 


            return DAL.DAL.insertPoll(poll.pollTypeRef,poll.ip );
            
        }
        public static List<SqlParameter> getParametersOfPoll(PollQuestionAnswer poll)
        {
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter() { ParameterName = "@PollQuestionChoiceRef", Value = poll.PollQuestionChoiceRef });
            parameters.Add(new SqlParameter() { ParameterName = "@IpAddress", Value = poll.IpAddress });
            parameters.Add(new SqlParameter() { ParameterName = "@answer", Value = poll.answer });
            parameters.Add(new SqlParameter() { ParameterName = "@InsertDate", Value = poll.InsertDate });
            parameters.Add(new SqlParameter() { ParameterName = "@IdentityNo", Value = poll.IdentityNo });

            return parameters;
        }

        public static bool validateToken(string username, string token)
        {
            if (token == "") //todo: change logic, INPORTANT
            {
                return true;
            }
            return false;
        }
    }
}